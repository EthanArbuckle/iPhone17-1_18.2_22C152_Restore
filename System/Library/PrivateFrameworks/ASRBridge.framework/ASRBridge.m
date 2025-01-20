void sub_2471B61BC()
{
  strcpy((char *)qword_26B128538, "RC Acceptance");
  unk_26B128546 = -4864;
}

uint64_t sub_2471B61EC(void *a1, uint64_t a2)
{
  uint64_t v5 = sub_247205EE8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_247205F18();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (void *)swift_allocObject();
  v13[2] = v2;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_2471C2158;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247200920;
  aBlock[3] = &block_descriptor_68;
  v14 = _Block_copy(aBlock);
  id v15 = v2;
  id v16 = a1;
  sub_247205EF8();
  v18[1] = MEMORY[0x263F8EE78];
  sub_2471C2254(&qword_26B128360, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1285E0);
  sub_2471C21A8();
  sub_2472062E8();
  MEMORY[0x24C54D030](0, v12, v8, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release();
}

void sub_2471B6494(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_247205C78();
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_didStopASR;
  if (*((unsigned char *)a1 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_didStopASR) != 1)
  {
    v40 = v7;
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_247205EA8();
    __swift_project_value_buffer(v18, (uint64_t)qword_26B128910);
    v19 = a1;
    v20 = sub_247205E98();
    os_log_type_t v21 = sub_247206178();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v37 = v6;
      v23 = v19;
      v24 = (uint8_t *)v22;
      uint64_t v25 = swift_slowAlloc();
      uint64_t v36 = v25;
      v38 = a2;
      uint64_t v39 = a3;
      *(_DWORD *)v24 = 136315138;
      uint64_t v42 = v25;
      v35 = v24 + 4;
      v26 = &v19[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
      uint64_t v27 = *(void *)&v19[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
      unint64_t v28 = *((void *)v26 + 1);
      swift_bridgeObjectRetain();
      uint64_t v29 = v27;
      v19 = v23;
      uint64_t v6 = v37;
      uint64_t v41 = sub_2471F3F68(v29, v28, &v42);
      a2 = v38;
      sub_2472062B8();

      a3 = v39;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v20, v21, "Going to stop ASR for requestId = %s", v24, 0xCu);
      uint64_t v30 = v36;
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v30, -1, -1);
      MEMORY[0x24C54D9C0](v24, -1, -1);
    }
    else
    {
    }
    *((unsigned char *)a1 + v10) = 1;
    if (qword_26B127C10 != -1) {
      swift_once();
    }
    uint64_t v32 = __swift_project_value_buffer(v6, (uint64_t)qword_26B1288F8);
    v33 = (void (**)(char *, uint64_t))v40;
    v40[2](v9, v32, v6);
    *(void *)(swift_allocObject() + 16) = v19;
    v34 = v19;
    sub_247205C48();
    swift_release();
    v33[1](v9, v6);
    v12 = sub_247205FC8();
    objc_msgSend(a2, sel_stopSpeechRecognitionTaskAndInvalidateWithReason_requestId_completion_, a3, v12, 0);
    goto LABEL_17;
  }
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_247205EA8();
  __swift_project_value_buffer(v11, (uint64_t)qword_26B128910);
  v40 = a1;
  v12 = sub_247205E98();
  os_log_type_t v13 = sub_247206198();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v42 = v15;
    *(_DWORD *)v14 = 136315138;
    uint64_t v16 = *(uint64_t *)((char *)v40 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId);
    unint64_t v17 = *(unint64_t *)((char *)v40 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8);
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_2471F3F68(v16, v17, &v42);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v12, v13, "ASR was already stopped for requestId = %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v15, -1, -1);
    MEMORY[0x24C54D9C0](v14, -1, -1);
LABEL_17:

    return;
  }

  v31 = v40;
}

uint64_t sub_2471B69AC(uint64_t a1)
{
  uint64_t v25 = sub_247204938();
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128708);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128350);
  uint64_t v5 = *(void *)(*(void *)(v4 - 8) + 72);
  unint64_t v6 = (*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_247206EE0;
  uint64_t v24 = v7;
  unint64_t v8 = v7 + v6;
  uint64_t v9 = *(int *)(v4 + 48);
  sub_247205BA8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  uint64_t v10 = (void *)(v8 + v9);
  uint64_t v11 = unk_26B128930;
  *uint64_t v10 = qword_26B128928;
  v10[1] = v11;
  v12 = (void *)(v8 + v5 + *(int *)(v4 + 48));
  swift_bridgeObjectRetain();
  sub_247205BF8();
  void *v12 = 0xD00000000000001ALL;
  v12[1] = 0x8000000247207B60;
  os_log_type_t v13 = (void *)(v8 + 2 * v5 + *(int *)(v4 + 48));
  sub_247205BB8();
  uint64_t v26 = 0;
  unint64_t v27 = 0xE000000000000000;
  sub_247206028();
  swift_bridgeObjectRetain();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v14 = v27;
  void *v13 = v26;
  v13[1] = v14;
  uint64_t v15 = (void *)(v8 + 3 * v5 + *(int *)(v4 + 48));
  sub_247205C38();
  uint64_t v26 = 0;
  unint64_t v27 = 0xE000000000000000;
  sub_247206028();
  uint64_t v16 = v23;
  uint64_t v17 = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v3, a1 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId, v25);
  sub_2471C2254((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v3, v17);
  sub_247206028();
  unint64_t v18 = v27;
  *uint64_t v15 = v26;
  v15[1] = v18;
  v19 = (void *)(v8 + 4 * v5 + *(int *)(v4 + 48));
  sub_247205C28();
  uint64_t v26 = 0;
  unint64_t v27 = 0xE000000000000000;
  sub_247206028();
  sub_247206028();
  sub_247206028();
  unint64_t v20 = v27;
  void *v19 = v26;
  v19[1] = v20;
  return v24;
}

void sub_2471B6D2C(id a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  unint64_t v77 = a6;
  uint64_t v73 = a4;
  uint64_t v74 = a5;
  unint64_t v9 = sub_247204938();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  v12 = (char *)v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
LABEL_38:
  }
    swift_once();
  uint64_t v13 = sub_247205EA8();
  uint64_t v76 = __swift_project_value_buffer(v13, (uint64_t)qword_26B128910);
  unint64_t v14 = sub_247205E98();
  os_log_type_t v15 = sub_247206178();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_2471B4000, v14, v15, "Received partial result", v16, 2u);
    MEMORY[0x24C54D9C0](v16, -1, -1);
  }

  uint64_t v18 = *(void *)(a3 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId);
  unint64_t v17 = *(void *)(a3 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8);
  BOOL v19 = (id)v18 == a1 && v17 == a2;
  if (!v19 && (sub_2472064A8() & 1) == 0)
  {
    swift_bridgeObjectRetain_n();
    id v31 = (id)a3;
    uint64_t v32 = sub_247205E98();
    os_log_type_t v33 = sub_247206188();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      aBlock[0] = v35;
      *(_DWORD *)uint64_t v34 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v79 = sub_2471F3F68((uint64_t)a1, a2, aBlock);
      sub_2472062B8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v34 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v79 = sub_2471F3F68(v18, v17, aBlock);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v32, v33, "Response requestId = %s does not match current requestId = %s", (uint8_t *)v34, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v35, -1, -1);
      MEMORY[0x24C54D9C0](v34, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return;
  }
  char v20 = *(unsigned char *)(a3
                 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_havePostedSpeechPartialDeliveryStartedMessage);
  uint64_t v75 = a3;
  if ((v20 & 1) == 0)
  {
    *(unsigned char *)(a3
             + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_havePostedSpeechPartialDeliveryStartedMessage) = 1;
    MEMORY[0x270FA5388]();
    v70[-2] = v21;
    id v22 = objc_allocWithZone((Class)sub_247205788());
    uint64_t v23 = sub_247205168();
    if (v23)
    {
      uint64_t v24 = (void *)v23;
      uint64_t v25 = sub_247205E98();
      os_log_type_t v26 = sub_247206178();
      if (os_log_type_enabled(v25, v26))
      {
        unint64_t v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v27 = 0;
        _os_log_impl(&dword_2471B4000, v25, v26, "Going to post speechPartialDeliveryStartedMessage", v27, 2u);
        MEMORY[0x24C54D9C0](v27, -1, -1);
      }

      __swift_project_boxed_opaque_existential_1((void *)(v75 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher), *(void *)(v75 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24));
      sub_247205A18();
      unint64_t v28 = sub_247205E98();
      os_log_type_t v29 = sub_247206178();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl(&dword_2471B4000, v28, v29, "Posted speechPartialDeliveryStartedMessage", v30, 2u);
        MEMORY[0x24C54D9C0](v30, -1, -1);
      }
      else
      {
      }
    }
    else
    {
      swift_bridgeObjectRetain_n();
      uint64_t v36 = sub_247205E98();
      os_log_type_t v37 = sub_247206188();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = (uint8_t *)swift_slowAlloc();
        uint64_t v72 = swift_slowAlloc();
        aBlock[0] = v72;
        os_log_t v71 = v36;
        uint64_t v39 = v38;
        *(_DWORD *)v38 = 136315138;
        v70[1] = v38 + 4;
        swift_bridgeObjectRetain();
        uint64_t v79 = sub_2471F3F68((uint64_t)a1, a2, aBlock);
        sub_2472062B8();
        swift_bridgeObjectRelease_n();
        os_log_t v40 = v71;
        _os_log_impl(&dword_2471B4000, v71, v37, "Failed to create speechPartialDeliveryStartedMessage for request: %s", v39, 0xCu);
        uint64_t v41 = v72;
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v41, -1, -1);
        MEMORY[0x24C54D9C0](v39, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
  }
  id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64C18]), sel_init);
  sub_247204928();
  sub_2472048F8();
  (*(void (**)(char *, unint64_t))(v10 + 8))(v12, v9);
  v43 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v42, sel_setAceId_, v43);

  a1 = v42;
  v44 = (void *)sub_247205FC8();
  objc_msgSend(a1, sel_setRefId_, v44);

  v45 = (void *)sub_247205FC8();
  objc_msgSend(a1, sel_setLanguage_, v45);

  a2 = sub_2471CAE98(0, &qword_26B1286B0);
  v46 = (void *)sub_2472060D8();
  objc_msgSend(a1, sel_setTokens_, v46);

  unint64_t v47 = v77;
  if (!(v77 >> 62))
  {
    uint64_t v48 = *(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v48) {
      goto LABEL_24;
    }
LABEL_40:
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(v75 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isCandidateRequest))
    {
      v55 = (void *)(v75
                     + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_speechPartialResultsCache);
      swift_beginAccess();
      id v56 = a1;
      MEMORY[0x24C54CF20]();
      if (*(void *)((*v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_247206118();
      }
      sub_247206128();
      sub_247206108();
      swift_endAccess();
    }
    else
    {
      id v57 = a1;
      v58 = sub_247205E98();
      os_log_type_t v59 = sub_247206178();
      if (os_log_type_enabled(v58, v59))
      {
        v60 = (uint8_t *)swift_slowAlloc();
        uint64_t v61 = swift_slowAlloc();
        aBlock[0] = v61;
        *(_DWORD *)v60 = 136315138;
        id v62 = objc_msgSend(v57, sel_tokens);
        if (v62)
        {
          v63 = v62;
          uint64_t v64 = sub_2472060E8();
        }
        else
        {
          uint64_t v64 = 0;
        }
        uint64_t v79 = v64;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B128628);
        uint64_t v65 = sub_247205FE8();
        uint64_t v79 = sub_2471F3F68(v65, v66, aBlock);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2471B4000, v58, v59, "Submitting partial text: \"%s\"", v60, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v61, -1, -1);
        MEMORY[0x24C54D9C0](v60, -1, -1);
      }
      else
      {
      }
      v67 = *(void **)(v75 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper);
      aBlock[4] = (uint64_t)sub_2471B7ABC;
      aBlock[5] = 0;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_2471DC9B8;
      aBlock[3] = (uint64_t)&block_descriptor_224;
      v68 = _Block_copy(aBlock);
      id v69 = v57;
      objc_msgSend(v67, sel_handleCommand_completion_, v69, v68);
      _Block_release(v68);
    }
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v48 = sub_2472063E8();
  if (!v48) {
    goto LABEL_40;
  }
LABEL_24:
  v12 = (char *)(v47 & 0xC000000000000001);
  a3 = 4;
  while (1)
  {
    if (v12) {
      id v50 = (id)MEMORY[0x24C54D1C0](a3 - 4, v47);
    }
    else {
      id v50 = *(id *)(v47 + 8 * a3);
    }
    v51 = v50;
    uint64_t v10 = a3 - 3;
    if (__OFADD__(a3 - 4, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    if (!objc_msgSend(v50, sel_aceToken)) {
      break;
    }
    id v52 = objc_msgSend(a1, sel_tokens);
    if (!v52) {
      goto LABEL_52;
    }
    v53 = v52;
    uint64_t v54 = sub_2472060E8();

    aBlock[0] = v54;
    MEMORY[0x24C54CF20]();
    unint64_t v9 = *(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v9 >= *(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_247206118();
    }
    sub_247206128();
    sub_247206108();
    if (aBlock[0])
    {
      v49 = (void *)sub_2472060D8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v49 = 0;
    }
    unint64_t v47 = v77;
    objc_msgSend(a1, sel_setTokens_, v49);

    ++a3;
    if (v10 == v48) {
      goto LABEL_40;
    }
  }
  __break(1u);
LABEL_52:
  __break(1u);
}

uint64_t sub_2471B7880(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388]();
  unint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *MEMORY[0x263F709E0];
  uint64_t v8 = sub_247205A38();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 104))(v6, v7, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  sub_247205998();
  swift_bridgeObjectRetain();
  sub_247205988();
  uint64_t v10 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v11 = sub_247204938();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v4, v10, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v4, 0, 1, v11);
  sub_2472059B8();
  swift_bridgeObjectRetain();
  return sub_2472059A8();
}

void sub_2471B7ABC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_2471B7BAC()
{
  v1 = (unint64_t *)(v0
                          + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_speechPartialResultsCache);
  swift_beginAccess();
  unint64_t v2 = *v1;
  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_2472063E8();
  uint64_t v3 = result;
  if (!result) {
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper);
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x24C54D1C0](v5, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      ++v5;
      aBlock[4] = sub_2471B7D54;
      aBlock[5] = 0;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_2471DC9B8;
      aBlock[3] = &block_descriptor;
      uint64_t v9 = _Block_copy(aBlock);
      id v10 = v8;
      objc_msgSend(v6, sel_handleCommand_completion_, v10, v9);
      _Block_release(v9);
    }
    while (v3 != v5);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_2471B7D54(uint64_t a1, uint64_t a2)
{
}

void sub_2471B7D60(uint64_t a1, uint64_t a2, const char *a3)
{
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_247205EA8();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B128910);
  oslog = sub_247205E98();
  os_log_type_t v5 = sub_247206178();
  if (os_log_type_enabled(oslog, v5))
  {
    unint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v6 = 0;
    _os_log_impl(&dword_2471B4000, oslog, v5, a3, v6, 2u);
    MEMORY[0x24C54D9C0](v6, -1, -1);
  }
}

void sub_2471B7E50()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isCandidateRequest) = 0;
}

uint64_t sub_2471B7EEC(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388]();
  unint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *MEMORY[0x263F709E0];
  uint64_t v10 = sub_247205A38();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_247205058();
  swift_bridgeObjectRetain();
  sub_247205048();
  uint64_t v12 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v13 = sub_247204938();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v6, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v6, 0, 1, v13);
  sub_247205088();
  swift_bridgeObjectRetain();
  sub_247205078();
  id v15 = objc_msgSend(a3, sel_lastTRPCandidateId);
  if (v15)
  {
    uint64_t v16 = v15;
    sub_247205FD8();
  }
  return sub_247205068();
}

uint64_t sub_2471B81EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v26[0] = a4;
  v26[1] = a6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C00);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *MEMORY[0x263F709E0];
  uint64_t v18 = sub_247205A38();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 104))(v16, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  sub_247205228();
  swift_bridgeObjectRetain();
  sub_2472051F8();
  uint64_t v20 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v21 = sub_247204938();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v13, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v13, 0, 1, v21);
  sub_247205258();
  swift_bridgeObjectRetain();
  sub_247205248();
  uint64_t v23 = sub_247205B68();
  uint64_t v24 = *(void *)(v23 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v10, a3, v23);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v10, 0, 1, v23);
  sub_247205238();
  swift_bridgeObjectRetain();
  sub_247205208();
  swift_bridgeObjectRetain();
  return sub_247205218();
}

uint64_t sub_2471B852C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C00);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *MEMORY[0x263F709E0];
  uint64_t v15 = sub_247205A38();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  sub_247205738();
  swift_bridgeObjectRetain();
  sub_247205718();
  uint64_t v17 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v18 = sub_247204938();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  sub_247205768();
  swift_bridgeObjectRetain();
  sub_247205758();
  uint64_t v20 = a2 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId;
  uint64_t v21 = sub_247205B68();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v7, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v7, 0, 1, v21);
  sub_247205748();
  id v23 = objc_msgSend(a3, sel_multiUserTrpCandidateId);
  if (v23)
  {
    uint64_t v24 = v23;
    sub_247205FD8();
  }
  sub_247205728();
  swift_bridgeObjectRetain();
  return sub_247205708();
}

uint64_t sub_2471B88A0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C00);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *MEMORY[0x263F709E0];
  uint64_t v15 = sub_247205A38();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  sub_2472056B8();
  swift_bridgeObjectRetain();
  sub_247205698();
  uint64_t v17 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v18 = sub_247204938();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  sub_2472056E8();
  swift_bridgeObjectRetain();
  sub_2472056D8();
  uint64_t v20 = a2 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId;
  uint64_t v21 = sub_247205B68();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v7, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v7, 0, 1, v21);
  sub_2472056C8();
  id v23 = objc_msgSend(a3, sel_multiUserTrpCandidateId);
  if (v23)
  {
    uint64_t v24 = v23;
    sub_247205FD8();
  }
  sub_2472056A8();
  swift_bridgeObjectRetain();
  return sub_247205688();
}

uint64_t sub_2471B8C8C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C00);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *MEMORY[0x263F709E0];
  uint64_t v15 = sub_247205A38();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  sub_2472054E8();
  swift_bridgeObjectRetain();
  sub_2472054B8();
  uint64_t v17 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v18 = sub_247204938();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  sub_247205518();
  swift_bridgeObjectRetain();
  sub_247205508();
  uint64_t v20 = a2 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId;
  uint64_t v21 = sub_247205B68();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v7, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v7, 0, 1, v21);
  sub_2472054F8();
  id v23 = objc_msgSend(a3, sel_trpCandidateId);
  if (v23)
  {
    uint64_t v24 = v23;
    sub_247205FD8();
  }
  sub_2472054C8();
  swift_bridgeObjectRetain();
  return sub_2472054D8();
}

uint64_t sub_2471B9000(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C00);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *MEMORY[0x263F709E0];
  uint64_t v15 = sub_247205A38();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  sub_247204D18();
  swift_bridgeObjectRetain();
  sub_247204CE8();
  uint64_t v17 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v18 = sub_247204938();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  sub_247204D48();
  swift_bridgeObjectRetain();
  sub_247204D38();
  uint64_t v20 = a2 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId;
  uint64_t v21 = sub_247205B68();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v7, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v7, 0, 1, v21);
  sub_247204D28();
  id v23 = objc_msgSend(a3, sel_trpCandidateId);
  if (v23)
  {
    uint64_t v24 = v23;
    sub_247205FD8();
  }
  sub_247204CF8();
  swift_bridgeObjectRetain();
  return sub_247204D08();
}

uint64_t sub_2471B9374(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C00);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *MEMORY[0x263F709E0];
  uint64_t v15 = sub_247205A38();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  sub_247205228();
  swift_bridgeObjectRetain();
  sub_2472051F8();
  uint64_t v17 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v18 = sub_247204938();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  sub_247205258();
  swift_bridgeObjectRetain();
  sub_247205248();
  uint64_t v20 = a2 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId;
  uint64_t v21 = sub_247205B68();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v7, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v7, 0, 1, v21);
  sub_247205238();
  id v23 = objc_msgSend(a3, sel_trpCandidateId);
  if (v23)
  {
    uint64_t v24 = v23;
    sub_247205FD8();
  }
  sub_247205208();
  swift_bridgeObjectRetain();
  return sub_247205218();
}

uint64_t sub_2471B96E8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v41 = a5;
  uint64_t v38 = a1;
  id v39 = a2;
  uint64_t v7 = sub_247204938();
  uint64_t v36 = *(void *)(v7 - 8);
  uint64_t v37 = v7;
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128708);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128350);
  uint64_t v11 = *(void *)(*(void *)(v10 - 8) + 72);
  unint64_t v12 = (*(unsigned __int8 *)(*(void *)(v10 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_247206EF0;
  uint64_t v40 = v13;
  unint64_t v14 = v13 + v12;
  uint64_t v15 = (void *)(v13 + v12 + *(int *)(v10 + 48));
  sub_247205BA8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  uint64_t v16 = unk_26B128930;
  *uint64_t v15 = qword_26B128928;
  v15[1] = v16;
  uint64_t v17 = *(int *)(v10 + 48);
  uint64_t v42 = v10;
  uint64_t v18 = (void *)(v14 + v11 + v17);
  swift_bridgeObjectRetain();
  sub_247205BF8();
  *uint64_t v18 = a3;
  v18[1] = a4;
  uint64_t v19 = (void *)(v14 + 2 * v11 + *(int *)(v42 + 48));
  sub_247205BB8();
  uint64_t v43 = 0;
  unint64_t v44 = 0xE000000000000000;
  sub_247206028();
  uint64_t v20 = v38;
  swift_bridgeObjectRetain();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v21 = v44;
  void *v19 = v43;
  v19[1] = v21;
  uint64_t v22 = (void *)(v14 + 3 * v11 + *(int *)(v42 + 48));
  sub_247205C38();
  uint64_t v43 = 0;
  unint64_t v44 = 0xE000000000000000;
  sub_247206028();
  uint64_t v24 = v36;
  uint64_t v23 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v9, v20 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId, v37);
  sub_2471C2254((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v23);
  sub_247206028();
  unint64_t v25 = v44;
  *uint64_t v22 = v43;
  v22[1] = v25;
  uint64_t v26 = v42;
  unint64_t v27 = (void *)(v14 + 4 * v11 + *(int *)(v42 + 48));
  sub_247205C28();
  uint64_t v43 = 0;
  unint64_t v44 = 0xE000000000000000;
  sub_247206028();
  sub_247206028();
  sub_247206028();
  unint64_t v28 = v44;
  *unint64_t v27 = v43;
  v27[1] = v28;
  unint64_t v29 = v14 + 5 * v11;
  sub_247205C08();
  uint64_t v43 = 0;
  unint64_t v44 = 0xE000000000000000;
  sub_247206028();
  id v30 = [v39 *v41];
  if (v30)
  {
    id v31 = v30;
    sub_247205FD8();
  }
  uint64_t v32 = (void *)(v29 + *(int *)(v26 + 48));
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v33 = v44;
  *uint64_t v32 = v43;
  v32[1] = v33;
  return v40;
}

void sub_2471B9B6C(char a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = sub_247205C78();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a3 + 16;
  sub_247206218();
  if (qword_26B128378 != -1) {
    swift_once();
  }
  id v12 = (id)qword_26B128778;
  sub_247205E58();

  swift_beginAccess();
  uint64_t v13 = MEMORY[0x24C54DA20](v11);
  if (v13)
  {
    unint64_t v14 = (char *)v13;
    if ((a1 & 1) == 0)
    {
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_247205EA8();
      __swift_project_value_buffer(v35, (uint64_t)qword_26B128910);
      uint64_t v36 = sub_247205E98();
      os_log_type_t v37 = sub_247206198();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v38 = 0;
        _os_log_impl(&dword_2471B4000, v36, v37, "Not posting StoppedListeningForSpeechContinuationMessage since myriad selection is lost", v38, 2u);
        MEMORY[0x24C54D9C0](v38, -1, -1);
      }

      if (qword_26B127C10 == -1) {
        goto LABEL_40;
      }
      goto LABEL_60;
    }
    if (*(unsigned char *)(v13 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isAssistantEngineEnabled) == 1)
    {
      MEMORY[0x270FA5388](v13);
      *(&v74 - 2) = v14;
      *(&v74 - 1) = a4;
      id v15 = objc_allocWithZone((Class)sub_2472058E8());
      uint64_t v16 = sub_247205888();
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        if (qword_26B128578 != -1) {
          swift_once();
        }
        uint64_t v74 = a4;
        uint64_t v18 = sub_247205EA8();
        __swift_project_value_buffer(v18, (uint64_t)qword_26B128910);
        uint64_t v19 = sub_247205E98();
        os_log_type_t v20 = sub_247206178();
        if (os_log_type_enabled(v19, v20))
        {
          unint64_t v21 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v21 = 0;
          _os_log_impl(&dword_2471B4000, v19, v20, "Going to post StoppedListeningForSpeechContinuationForPlannerMessage", v21, 2u);
          MEMORY[0x24C54D9C0](v21, -1, -1);
        }

        uint64_t v22 = &v14[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher];
        __swift_project_boxed_opaque_existential_1(&v14[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher], *(void *)&v14[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24]);
        uint64_t v23 = sub_247205A18();
        MEMORY[0x270FA5388](v23);
        uint64_t v24 = v74;
        *(&v74 - 2) = v14;
        *(&v74 - 1) = v24;
        id v25 = objc_allocWithZone((Class)sub_247205958());
        uint64_t v26 = sub_2472058F8();
        if (v26)
        {
          unint64_t v27 = (void *)v26;
          unint64_t v28 = sub_247205E98();
          os_log_type_t v29 = sub_247206178();
          if (os_log_type_enabled(v28, v29))
          {
            id v30 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v30 = 0;
            _os_log_impl(&dword_2471B4000, v28, v29, "Going to post RootStoppedListeningForSpeechContinuationMessage", v30, 2u);
            MEMORY[0x24C54D9C0](v30, -1, -1);
          }

          __swift_project_boxed_opaque_existential_1(v22, *((void *)v22 + 3));
          sub_247205A18();

          a4 = v74;
LABEL_39:

          if (qword_26B127C10 == -1)
          {
LABEL_40:
            uint64_t v50 = __swift_project_value_buffer(v7, (uint64_t)qword_26B1288F8);
            (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v50, v7);
            uint64_t v51 = swift_allocObject();
            *(void *)(v51 + 16) = v14;
            *(void *)(v51 + 24) = a4;
            id v52 = v14;
            id v53 = a4;
            sub_247205C48();

            swift_release();
            (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
            return;
          }
LABEL_60:
          swift_once();
          goto LABEL_40;
        }
        v55 = v14;
        id v56 = sub_247205E98();
        os_log_type_t v63 = sub_247206188();
        if (os_log_type_enabled(v56, v63))
        {
          uint64_t v64 = (uint8_t *)swift_slowAlloc();
          uint64_t v65 = swift_slowAlloc();
          uint64_t v76 = v65;
          *(_DWORD *)uint64_t v64 = 136315138;
          uint64_t v66 = *(void *)&v55[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
          unint64_t v67 = *(void *)&v55[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
          swift_bridgeObjectRetain();
          uint64_t v75 = sub_2471F3F68(v66, v67, &v76);
          sub_2472062B8();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2471B4000, v56, v63, "Failed to create RootStoppedListeningForSpeechContinuationMessage for request: %s", v64, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v65, -1, -1);
          MEMORY[0x24C54D9C0](v64, -1, -1);

LABEL_56:
          return;
        }

        goto LABEL_59;
      }
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v54 = sub_247205EA8();
      __swift_project_value_buffer(v54, (uint64_t)qword_26B128910);
      v55 = v14;
      id v56 = sub_247205E98();
      os_log_type_t v57 = sub_247206188();
      if (os_log_type_enabled(v56, v57))
      {
        v58 = (uint8_t *)swift_slowAlloc();
        uint64_t v59 = swift_slowAlloc();
        uint64_t v76 = v59;
        *(_DWORD *)v58 = 136315138;
        uint64_t v60 = *(void *)&v55[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
        unint64_t v61 = *(void *)&v55[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
        swift_bridgeObjectRetain();
        uint64_t v75 = sub_2471F3F68(v60, v61, &v76);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        id v62 = "Failed to create StoppedListeningForSpeechContinuationForPlannerMessage for request: %s";
LABEL_55:
        _os_log_impl(&dword_2471B4000, v56, v57, v62, v58, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v59, -1, -1);
        MEMORY[0x24C54D9C0](v58, -1, -1);

        goto LABEL_56;
      }
      goto LABEL_57;
    }
    MEMORY[0x270FA5388](v13);
    *(&v74 - 2) = v14;
    *(&v74 - 1) = a4;
    if (v39 == 1)
    {
      id v40 = objc_allocWithZone((Class)sub_247205978());
      uint64_t v41 = sub_247205818();
      if (!v41)
      {
        if (qword_26B128578 != -1) {
          swift_once();
        }
        uint64_t v68 = sub_247205EA8();
        __swift_project_value_buffer(v68, (uint64_t)qword_26B128910);
        v55 = v14;
        id v56 = sub_247205E98();
        os_log_type_t v57 = sub_247206188();
        if (os_log_type_enabled(v56, v57))
        {
          v58 = (uint8_t *)swift_slowAlloc();
          uint64_t v59 = swift_slowAlloc();
          uint64_t v76 = v59;
          *(_DWORD *)v58 = 136315138;
          uint64_t v69 = *(void *)&v55[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
          unint64_t v70 = *(void *)&v55[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
          swift_bridgeObjectRetain();
          uint64_t v75 = sub_2471F3F68(v69, v70, &v76);
          sub_2472062B8();

          swift_bridgeObjectRelease();
          id v62 = "Failed to create MultiUserStoppedListeningForSpeechContinuationMessage for request: %s";
          goto LABEL_55;
        }
LABEL_57:

LABEL_59:
        return;
      }
      unint64_t v27 = (void *)v41;
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v42 = sub_247205EA8();
      __swift_project_value_buffer(v42, (uint64_t)qword_26B128910);
      uint64_t v43 = sub_247205E98();
      os_log_type_t v44 = sub_247206178();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v45 = 0;
        v46 = "Going to post MultiUserStoppedListeningForSpeechContinuationMessage";
LABEL_37:
        _os_log_impl(&dword_2471B4000, v43, v44, v46, v45, 2u);
        MEMORY[0x24C54D9C0](v45, -1, -1);
      }
    }
    else
    {
      id v47 = objc_allocWithZone((Class)sub_247205878());
      uint64_t v48 = sub_247205818();
      if (!v48)
      {
        if (qword_26B128578 != -1) {
          swift_once();
        }
        uint64_t v71 = sub_247205EA8();
        __swift_project_value_buffer(v71, (uint64_t)qword_26B128910);
        v55 = v14;
        id v56 = sub_247205E98();
        os_log_type_t v57 = sub_247206188();
        if (os_log_type_enabled(v56, v57))
        {
          v58 = (uint8_t *)swift_slowAlloc();
          uint64_t v59 = swift_slowAlloc();
          uint64_t v76 = v59;
          *(_DWORD *)v58 = 136315138;
          uint64_t v72 = *(void *)&v55[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
          unint64_t v73 = *(void *)&v55[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
          swift_bridgeObjectRetain();
          uint64_t v75 = sub_2471F3F68(v72, v73, &v76);
          sub_2472062B8();

          swift_bridgeObjectRelease();
          id v62 = "Failed to create StoppedListeningForSpeechContinuationMessage for request: %s";
          goto LABEL_55;
        }
        goto LABEL_57;
      }
      unint64_t v27 = (void *)v48;
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v49 = sub_247205EA8();
      __swift_project_value_buffer(v49, (uint64_t)qword_26B128910);
      uint64_t v43 = sub_247205E98();
      os_log_type_t v44 = sub_247206178();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v45 = 0;
        v46 = "Going to post StoppedListeningForSpeechContinuationMessage";
        goto LABEL_37;
      }
    }

    __swift_project_boxed_opaque_existential_1(&v14[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher], *(void *)&v14[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24]);
    sub_247205A18();
    goto LABEL_39;
  }
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_247205EA8();
  __swift_project_value_buffer(v31, (uint64_t)qword_26B128910);
  uint64_t v32 = sub_247205E98();
  os_log_type_t v33 = sub_247206198();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl(&dword_2471B4000, v32, v33, "Not posting StoppedListeningForSpeechContinuationMessage since self is already out of scope", v34, 2u);
    MEMORY[0x24C54D9C0](v34, -1, -1);
  }
}

uint64_t sub_2471BA918(uint64_t a1, void *a2)
{
  id v34 = a2;
  uint64_t v3 = sub_247204938();
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128708);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128350);
  uint64_t v7 = *(void *)(*(void *)(v6 - 8) + 72);
  unint64_t v8 = (*(unsigned __int8 *)(*(void *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_247206EF0;
  uint64_t v35 = v9;
  unint64_t v10 = v9 + v8;
  uint64_t v11 = (void *)(v9 + v8 + *(int *)(v6 + 48));
  sub_247205BA8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  uint64_t v12 = unk_26B128930;
  *uint64_t v11 = qword_26B128928;
  v11[1] = v12;
  uint64_t v13 = (unint64_t *)(v10 + v7 + *(int *)(v6 + 48));
  swift_bridgeObjectRetain();
  sub_247205BF8();
  unint64_t *v13 = sub_2471F9458(13);
  v13[1] = v14;
  uint64_t v15 = *(int *)(v6 + 48);
  uint64_t v36 = v6;
  uint64_t v16 = (void *)(v10 + 2 * v7 + v15);
  sub_247205BB8();
  uint64_t v37 = 0;
  unint64_t v38 = 0xE000000000000000;
  sub_247206028();
  swift_bridgeObjectRetain();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v17 = v38;
  *uint64_t v16 = v37;
  v16[1] = v17;
  uint64_t v18 = (void *)(v10 + 3 * v7 + *(int *)(v36 + 48));
  sub_247205C38();
  uint64_t v37 = 0;
  unint64_t v38 = 0xE000000000000000;
  sub_247206028();
  uint64_t v20 = v32;
  uint64_t v19 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v5, a1 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId, v33);
  sub_2471C2254((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v19);
  uint64_t v21 = v36;
  sub_247206028();
  unint64_t v22 = v38;
  *uint64_t v18 = v37;
  v18[1] = v22;
  uint64_t v23 = (void *)(v10 + 4 * v7 + *(int *)(v21 + 48));
  sub_247205C28();
  uint64_t v37 = 0;
  unint64_t v38 = 0xE000000000000000;
  sub_247206028();
  sub_247206028();
  sub_247206028();
  unint64_t v24 = v38;
  void *v23 = v37;
  v23[1] = v24;
  unint64_t v25 = v10 + 5 * v7;
  sub_247205C08();
  uint64_t v37 = 0;
  unint64_t v38 = 0xE000000000000000;
  sub_247206028();
  id v26 = objc_msgSend(v34, sel_lastTRPCandidateId);
  if (v26)
  {
    unint64_t v27 = v26;
    sub_247205FD8();
  }
  unint64_t v28 = (void *)(v25 + *(int *)(v21 + 48));
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v29 = v38;
  *unint64_t v28 = v37;
  v28[1] = v29;
  return v35;
}

uint64_t sub_2471BAD1C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *MEMORY[0x263F709E0];
  uint64_t v12 = sub_247205A38();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 104))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  sub_2472058A8();
  swift_bridgeObjectRetain();
  sub_247205898();
  uint64_t v14 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v15 = sub_247204938();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v7, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v7, 0, 1, v15);
  sub_2472058D8();
  swift_bridgeObjectRetain();
  sub_2472058C8();
  id v17 = objc_msgSend(a3, sel_lastTRPCandidateId);
  if (v17)
  {
    uint64_t v18 = v17;
    sub_247205FD8();
  }
  return sub_2472058B8();
}

uint64_t sub_2471BAFA4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *MEMORY[0x263F709E0];
  uint64_t v12 = sub_247205A38();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 104))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  sub_247205918();
  swift_bridgeObjectRetain();
  sub_247205908();
  uint64_t v14 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v15 = sub_247204938();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v7, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v7, 0, 1, v15);
  sub_247205948();
  swift_bridgeObjectRetain();
  sub_247205938();
  id v17 = objc_msgSend(a3, sel_lastTRPCandidateId);
  if (v17)
  {
    uint64_t v18 = v17;
    sub_247205FD8();
  }
  return sub_247205928();
}

uint64_t sub_2471BB22C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *MEMORY[0x263F709E0];
  uint64_t v12 = sub_247205A38();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 104))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  sub_247205838();
  swift_bridgeObjectRetain();
  sub_247205828();
  uint64_t v14 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v15 = sub_247204938();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v7, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v7, 0, 1, v15);
  sub_247205868();
  swift_bridgeObjectRetain();
  sub_247205858();
  id v17 = objc_msgSend(a3, sel_lastTRPCandidateId);
  if (v17)
  {
    uint64_t v18 = v17;
    sub_247205FD8();
  }
  return sub_247205848();
}

uint64_t sub_2471BB52C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *MEMORY[0x263F709E0];
  uint64_t v10 = sub_247205A38();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_2472059E8();
  swift_bridgeObjectRetain();
  sub_2472059D8();
  uint64_t v12 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v13 = sub_247204938();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  return sub_2472059F8();
}

uint64_t sub_2471BB7AC()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128708);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128350);
  uint64_t v1 = *(void *)(*(void *)(v0 - 8) + 72);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v0 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 - 8) + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_247206EE0;
  unint64_t v4 = v3 + v2;
  uint64_t v5 = *(int *)(v0 + 48);
  sub_247205BA8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)(v4 + v5);
  uint64_t v7 = unk_26B128930;
  *uint64_t v6 = qword_26B128928;
  v6[1] = v7;
  uint64_t v8 = (void *)(v4 + v1 + *(int *)(v0 + 48));
  swift_bridgeObjectRetain();
  sub_247205BD8();
  void *v8 = 0xD000000000000033;
  v8[1] = 0x80000002472081D0;
  uint64_t v9 = (void *)(v4 + 2 * v1 + *(int *)(v0 + 48));
  sub_247205BF8();
  *uint64_t v9 = 0xD000000000000021;
  v9[1] = 0x8000000247207A60;
  uint64_t v10 = (void *)(v4 + 3 * v1 + *(int *)(v0 + 48));
  sub_247205C28();
  sub_247206028();
  sub_247206028();
  sub_247206028();
  *uint64_t v10 = 0;
  v10[1] = 0xE000000000000000;
  uint64_t v11 = (void *)(v4 + 4 * v1 + *(int *)(v0 + 48));
  sub_247205BE8();
  sub_247206028();
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  *uint64_t v11 = 0;
  v11[1] = 0xE000000000000000;
  return v3;
}

uint64_t sub_2471BBA0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v27[1] = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C00);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *MEMORY[0x263F709E0];
  uint64_t v17 = sub_247205A38();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 104))(v15, v16, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  sub_247204F28();
  swift_bridgeObjectRetain();
  sub_247204F08();
  uint64_t v19 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v20 = sub_247204938();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v12, v19, v20);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v12, 0, 1, v20);
  sub_247204F58();
  swift_bridgeObjectRetain();
  sub_247204F48();
  swift_bridgeObjectRetain();
  sub_247204EF8();
  id v22 = a5;
  sub_247204F18();
  uint64_t v23 = a2 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId;
  uint64_t v24 = sub_247205B68();
  uint64_t v25 = *(void *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v9, v23, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v9, 0, 1, v24);
  return sub_247204F38();
}

uint64_t sub_2471BBE00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v34 = a3;
  uint64_t v35 = a4;
  uint64_t v32 = a2;
  uint64_t v30 = a1;
  uint64_t v31 = sub_247204938();
  uint64_t v29 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128708);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128350);
  uint64_t v9 = *(void *)(*(void *)(v8 - 8) + 72);
  unint64_t v10 = (*(unsigned __int8 *)(*(void *)(v8 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_247206EF0;
  uint64_t v33 = v11;
  unint64_t v12 = v11 + v10;
  uint64_t v13 = *(int *)(v8 + 48);
  sub_247205BA8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  uint64_t v14 = (void *)(v12 + v13);
  uint64_t v15 = unk_26B128930;
  void *v14 = qword_26B128928;
  v14[1] = v15;
  uint64_t v16 = (void *)(v12 + v9 + *(int *)(v8 + 48));
  swift_bridgeObjectRetain();
  sub_247205BF8();
  *uint64_t v16 = 0xD00000000000001ALL;
  v16[1] = a5;
  uint64_t v17 = (void *)(v12 + 2 * v9 + *(int *)(v8 + 48));
  sub_247205BB8();
  uint64_t v37 = 0;
  unint64_t v38 = 0xE000000000000000;
  sub_247206028();
  uint64_t v18 = v30;
  swift_bridgeObjectRetain();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v19 = v38;
  *uint64_t v17 = v37;
  v17[1] = v19;
  uint64_t v20 = (void *)(v12 + 3 * v9 + *(int *)(v8 + 48));
  sub_247205C38();
  uint64_t v37 = 0;
  unint64_t v38 = 0xE000000000000000;
  sub_247206028();
  uint64_t v21 = v29;
  uint64_t v22 = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v7, v18 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId, v31);
  sub_2471C2254((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v22);
  sub_247206028();
  unint64_t v23 = v38;
  void *v20 = v37;
  v20[1] = v23;
  uint64_t v24 = (void *)(v12 + 4 * v9 + *(int *)(v8 + 48));
  sub_247205C28();
  uint64_t v37 = 0;
  unint64_t v38 = 0xE000000000000000;
  sub_247206028();
  sub_247206028();
  sub_247206028();
  unint64_t v25 = v38;
  void *v24 = v37;
  v24[1] = v25;
  id v26 = (void *)(v12 + 5 * v9 + *(int *)(v8 + 48));
  sub_247205BE8();
  uint64_t v37 = 0;
  unint64_t v38 = 0xE000000000000000;
  sub_247206028();
  uint64_t v36 = v35;
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v27 = v38;
  void *v26 = v37;
  v26[1] = v27;
  return v33;
}

uint64_t sub_2471BC1E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v36 = a4;
  uint64_t v37 = a1;
  uint64_t v34 = a3;
  uint64_t v33 = sub_247204938();
  v32[0] = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128708);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128350);
  uint64_t v8 = *(void *)(*(void *)(v7 - 8) + 72);
  unint64_t v9 = (*(unsigned __int8 *)(*(void *)(v7 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v7 - 8) + 80);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_247206F00;
  uint64_t v35 = v10;
  unint64_t v11 = v10 + v9;
  uint64_t v12 = *(int *)(v7 + 48);
  sub_247205BA8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  uint64_t v13 = (void *)(v11 + v12);
  uint64_t v14 = unk_26B128930;
  void *v13 = qword_26B128928;
  v13[1] = v14;
  uint64_t v15 = (void *)(v11 + v8 + *(int *)(v7 + 48));
  swift_bridgeObjectRetain();
  sub_247205BD8();
  uint64_t v39 = 0;
  unint64_t v40 = 0xE000000000000000;
  sub_247206348();
  sub_247206028();
  sub_247206028();
  sub_247206028();
  uint64_t v16 = v34;
  sub_247206028();
  sub_247206028();
  unint64_t v17 = v40;
  *uint64_t v15 = v39;
  v15[1] = v17;
  uint64_t v18 = (void *)(v11 + 2 * v8 + *(int *)(v7 + 48));
  sub_247205BF8();
  *uint64_t v18 = 0xD000000000000021;
  v18[1] = 0x8000000247207AB0;
  uint64_t v19 = *(int *)(v7 + 48);
  v32[1] = a2;
  uint64_t v20 = (void *)(v11 + 3 * v8 + v19);
  sub_247205BB8();
  uint64_t v39 = 0;
  unint64_t v40 = 0xE000000000000000;
  sub_247206028();
  swift_bridgeObjectRetain();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v21 = v40;
  void *v20 = v39;
  v20[1] = v21;
  uint64_t v22 = (void *)(v11 + 4 * v8 + *(int *)(v7 + 48));
  sub_247205C38();
  uint64_t v39 = 0;
  unint64_t v40 = 0xE000000000000000;
  sub_247206028();
  uint64_t v23 = v16 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v24 = v32[0];
  uint64_t v25 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v32[0] + 16))(v6, v23, v33);
  sub_2471C2254((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v25);
  sub_247206028();
  unint64_t v26 = v40;
  *uint64_t v22 = v39;
  v22[1] = v26;
  unint64_t v27 = (void *)(v11 + 5 * v8 + *(int *)(v7 + 48));
  sub_247205C28();
  uint64_t v39 = 0;
  unint64_t v40 = 0xE000000000000000;
  sub_247206028();
  sub_247206028();
  sub_247206028();
  unint64_t v28 = v40;
  *unint64_t v27 = v39;
  v27[1] = v28;
  uint64_t v29 = (void *)(v11 + 6 * v8 + *(int *)(v7 + 48));
  sub_247205BE8();
  uint64_t v39 = 0;
  unint64_t v40 = 0xE000000000000000;
  sub_247206028();
  uint64_t v38 = v36;
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v30 = v40;
  *uint64_t v29 = v39;
  v29[1] = v30;
  return v35;
}

uint64_t sub_2471BC674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = a4;
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v31 = a1;
  uint64_t v30 = sub_247204938();
  uint64_t v4 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128708);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128350);
  uint64_t v8 = *(void *)(*(void *)(v7 - 8) + 72);
  unint64_t v9 = (*(unsigned __int8 *)(*(void *)(v7 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v7 - 8) + 80);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_247206F00;
  uint64_t v34 = v10;
  unint64_t v11 = v10 + v9;
  uint64_t v12 = *(int *)(v7 + 48);
  sub_247205BA8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  uint64_t v13 = (void *)(v11 + v12);
  uint64_t v14 = unk_26B128930;
  void *v13 = qword_26B128928;
  v13[1] = v14;
  uint64_t v15 = (void *)(v11 + v8 + *(int *)(v7 + 48));
  swift_bridgeObjectRetain();
  sub_247205BD8();
  *uint64_t v15 = 0xD00000000000003FLL;
  v15[1] = 0x8000000247208120;
  uint64_t v16 = (void *)(v11 + 2 * v8 + *(int *)(v7 + 48));
  sub_247205BF8();
  *uint64_t v16 = 0xD000000000000021;
  v16[1] = 0x8000000247207AB0;
  unint64_t v17 = (void *)(v11 + 3 * v8 + *(int *)(v7 + 48));
  sub_247205BB8();
  uint64_t v37 = 0;
  unint64_t v38 = 0xE000000000000000;
  sub_247206028();
  uint64_t v18 = v31;
  swift_bridgeObjectRetain();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v19 = v38;
  *unint64_t v17 = v37;
  v17[1] = v19;
  uint64_t v20 = (void *)(v11 + 4 * v8 + *(int *)(v7 + 48));
  sub_247205C38();
  uint64_t v37 = 0;
  unint64_t v38 = 0xE000000000000000;
  sub_247206028();
  uint64_t v21 = v18 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v22 = v30;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v21, v30);
  sub_2471C2254((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v22);
  sub_247206028();
  unint64_t v23 = v38;
  void *v20 = v37;
  v20[1] = v23;
  uint64_t v24 = (void *)(v11 + 5 * v8 + *(int *)(v7 + 48));
  sub_247205C28();
  uint64_t v37 = 0;
  unint64_t v38 = 0xE000000000000000;
  sub_247206028();
  sub_247206028();
  sub_247206028();
  unint64_t v25 = v38;
  void *v24 = v37;
  v24[1] = v25;
  unint64_t v26 = (void *)(v11 + 6 * v8 + *(int *)(v7 + 48));
  sub_247205BE8();
  uint64_t v37 = 0;
  unint64_t v38 = 0xE000000000000000;
  sub_247206028();
  uint64_t v36 = v35;
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v27 = v38;
  void *v26 = v37;
  v26[1] = v27;
  return v34;
}

uint64_t sub_2471BCA88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6)
{
  v22[3] = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *MEMORY[0x263F709E0];
  uint64_t v15 = sub_247205A38();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  sub_247204E28();
  swift_bridgeObjectRetain();
  sub_247204DE8();
  uint64_t v17 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v18 = sub_247204938();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  sub_247204E48();
  swift_bridgeObjectRetain();
  sub_247204E38();
  swift_bridgeObjectRetain();
  sub_247204E18();
  sub_247204DF8();
  id v20 = a6;
  return sub_247204E08();
}

uint64_t sub_2471BCD0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *MEMORY[0x263F709E0];
  uint64_t v10 = sub_247205A38();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_247204BD8();
  swift_bridgeObjectRetain();
  sub_247204BA8();
  uint64_t v12 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v13 = sub_247204938();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  sub_247204BF8();
  swift_bridgeObjectRetain();
  sub_247204BE8();
  swift_bridgeObjectRetain();
  sub_247204BC8();
  return sub_247204BB8();
}

void sub_2471BD008()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_247205E88();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - v7;
  uint64_t v9 = *(void **)&v0[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg];
  if (!v9)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_247205EA8();
    __swift_project_value_buffer(v19, (uint64_t)qword_26B128910);
    unint64_t v40 = v0;
    id v20 = sub_247205E98();
    os_log_type_t v21 = sub_247206178();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v42 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v24 = *(uint64_t *)((char *)&v40->isa + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId);
      unint64_t v25 = *(unint64_t *)((char *)&v40[1].isa
                                + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId);
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_2471F3F68(v24, v25, &v42);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v20, v21, "No recognition candidate accepted yet for requestId: %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v23, -1, -1);
      MEMORY[0x24C54D9C0](v22, -1, -1);

      return;
    }

    goto LABEL_27;
  }
  unint64_t v40 = v9;
  uint64_t v10 = sub_2472059C8();
  uint64_t v12 = v11;

  if (v10 == *(void *)&v1[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId]
    && v12 == *(void *)&v1[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8])
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v14 = sub_2472064A8();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_247205EA8();
      __swift_project_value_buffer(v15, (uint64_t)qword_26B128910);
      os_log_t v39 = (os_log_t)sub_247205E98();
      os_log_type_t v16 = sub_247206188();
      if (os_log_type_enabled(v39, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_2471B4000, v39, v16, "ResultSelectedMessage requestId does not match current requestId", v17, 2u);
        MEMORY[0x24C54D9C0](v17, -1, -1);

        os_log_t v18 = v39;
LABEL_28:

        return;
      }

LABEL_27:
      os_log_t v18 = v40;
      goto LABEL_28;
    }
  }
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_247205EA8();
  __swift_project_value_buffer(v26, (uint64_t)qword_26B128910);
  unint64_t v27 = sub_247205E98();
  os_log_type_t v28 = sub_247206178();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_2471B4000, v27, v28, "Will wait on Myriad selection..", v29, 2u);
    MEMORY[0x24C54D9C0](v29, -1, -1);
  }

  if (qword_26B128378 != -1) {
    swift_once();
  }
  id v30 = (id)qword_26B128778;
  sub_247205E68();
  sub_247206228();
  id v31 = (id)qword_26B128778;
  sub_247205E48();

  if (qword_26B128550 != -1) {
    swift_once();
  }
  uint64_t v32 = (void *)unk_26B128540;
  os_log_t v39 = (os_log_t)qword_26B128538[0];
  uint64_t v33 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  unint64_t v34 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v35 = (v4 + v34 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v36 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v36 + v34, v6, v2);
  *(void *)(v36 + v35) = v33;
  uint64_t v37 = v40;
  *(void *)(v36 + ((v35 + 15) & 0xFFFFFFFFFFFFFFF8)) = v40;
  unint64_t v38 = v37;
  swift_retain();
  sub_2471CBC44((uint64_t)v39, v32, (uint64_t)sub_2471C286C, v36);

  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  swift_release();
}

void sub_2471BD688(char a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = sub_247205C78();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a3 + 16;
  sub_247206218();
  if (qword_26B128378 != -1) {
    swift_once();
  }
  id v12 = (id)qword_26B128778;
  sub_247205E58();

  swift_beginAccess();
  uint64_t v13 = MEMORY[0x24C54DA20](v11);
  if (!v13)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_247205EA8();
    __swift_project_value_buffer(v20, (uint64_t)qword_26B128910);
    os_log_type_t v21 = sub_247205E98();
    os_log_type_t v22 = sub_247206198();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_2471B4000, v21, v22, "Not posting ResultSelected since self is already out-of-scope", v23, 2u);
      MEMORY[0x24C54D9C0](v23, -1, -1);
    }
    goto LABEL_22;
  }
  char v14 = (char *)v13;
  if (a1)
  {
    swift_retain();
    sub_2471D1B0C(a4);
    swift_release();
    sub_247204E58();
    uint64_t v15 = swift_dynamicCastClass();
    uint64_t v17 = *(void *)&v14[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
    uint64_t v16 = *(void *)&v14[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_2472053C8();
    if (v15) {
      sub_2471CB8C4(v17, v16, v19, v18);
    }
    else {
      sub_2471CB894(v17, v16, v19, v18);
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B127C10 != -1) {
      swift_once();
    }
    uint64_t v30 = __swift_project_value_buffer(v7, (uint64_t)qword_26B1288F8);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v30, v7);
    *(void *)(swift_allocObject() + 16) = v14;
    id v31 = v14;
    sub_247205C48();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    os_log_type_t v21 = *(NSObject **)&v31[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg];
    *(void *)&v31[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg] = 0;

LABEL_22:
    return;
  }
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_247205EA8();
  __swift_project_value_buffer(v24, (uint64_t)qword_26B128910);
  unint64_t v25 = sub_247205E98();
  os_log_type_t v26 = sub_247206198();
  if (os_log_type_enabled(v25, v26))
  {
    unint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v27 = 0;
    _os_log_impl(&dword_2471B4000, v25, v26, "Not posting ResultSelected since myriad selection is lost", v27, 2u);
    MEMORY[0x24C54D9C0](v27, -1, -1);
  }

  if (qword_26B127C10 != -1) {
    swift_once();
  }
  uint64_t v28 = __swift_project_value_buffer(v7, (uint64_t)qword_26B1288F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v28, v7);
  *(void *)(swift_allocObject() + 16) = v14;
  uint64_t v29 = v14;
  sub_247205C58();

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_2471BDBBC(uint64_t a1)
{
  uint64_t v26 = sub_247204938();
  uint64_t v24 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128708);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128350);
  uint64_t v5 = *(void *)(*(void *)(v4 - 8) + 72);
  unint64_t v6 = (*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_247206EE0;
  uint64_t v25 = v7;
  unint64_t v8 = v7 + v6;
  uint64_t v9 = *(int *)(v4 + 48);
  sub_247205BA8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  uint64_t v10 = (void *)(v8 + v9);
  uint64_t v11 = unk_26B128930;
  *uint64_t v10 = qword_26B128928;
  v10[1] = v11;
  id v12 = (unint64_t *)(v8 + v5 + *(int *)(v4 + 48));
  swift_bridgeObjectRetain();
  sub_247205BF8();
  unint64_t *v12 = sub_2471F9458(13);
  v12[1] = v13;
  char v14 = (void *)(v8 + 2 * v5 + *(int *)(v4 + 48));
  sub_247205BB8();
  uint64_t v27 = 0;
  unint64_t v28 = 0xE000000000000000;
  sub_247206028();
  swift_bridgeObjectRetain();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v15 = v28;
  void *v14 = v27;
  v14[1] = v15;
  uint64_t v16 = (void *)(v8 + 3 * v5 + *(int *)(v4 + 48));
  sub_247205C38();
  uint64_t v27 = 0;
  unint64_t v28 = 0xE000000000000000;
  sub_247206028();
  uint64_t v17 = v24;
  uint64_t v18 = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v3, a1 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId, v26);
  sub_2471C2254((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v3, v18);
  sub_247206028();
  unint64_t v19 = v28;
  *uint64_t v16 = v27;
  v16[1] = v19;
  uint64_t v20 = (void *)(v8 + 4 * v5 + *(int *)(v4 + 48));
  sub_247205C28();
  uint64_t v27 = 0;
  unint64_t v28 = 0xE000000000000000;
  sub_247206028();
  sub_247206028();
  sub_247206028();
  unint64_t v21 = v28;
  void *v20 = v27;
  v20[1] = v21;
  return v25;
}

uint64_t sub_2471BDF2C()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128708);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128350);
  uint64_t v1 = *(void *)(*(void *)(v0 - 8) + 72);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v0 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 - 8) + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_247206F10;
  unint64_t v4 = v3 + v2;
  uint64_t v5 = *(int *)(v0 + 48);
  sub_247205BA8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  unint64_t v6 = (void *)(v4 + v5);
  uint64_t v7 = unk_26B128930;
  *unint64_t v6 = qword_26B128928;
  v6[1] = v7;
  unint64_t v8 = (void *)(v4 + v1 + *(int *)(v0 + 48));
  swift_bridgeObjectRetain();
  sub_247205BF8();
  void *v8 = 0xD000000000000027;
  v8[1] = 0x8000000247207AE0;
  uint64_t v9 = (void *)(v4 + 2 * v1 + *(int *)(v0 + 48));
  sub_247205C28();
  sub_247206028();
  sub_247206028();
  sub_247206028();
  *uint64_t v9 = 0;
  v9[1] = 0xE000000000000000;
  return v3;
}

void sub_2471BE0E8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = sub_247205EA8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v5, (uint64_t)qword_26B128910);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  id v10 = a3;
  id v11 = a2;
  id v12 = v10;
  id v13 = a2;
  char v14 = sub_247205E98();
  int v15 = sub_247206178();
  if (os_log_type_enabled(v14, (os_log_type_t)v15))
  {
    int v33 = v15;
    os_log_t v34 = v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v36 = v32;
    *(_DWORD *)uint64_t v16 = 136315650;
    id v17 = objc_msgSend(v12, sel_aceId);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v31 = v5;
      uint64_t v19 = sub_247205FD8();
      unint64_t v21 = v20;

      uint64_t v35 = sub_2471F3F68(v19, v21, &v36);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2080;
      id v22 = objc_msgSend(v12, sel_refId);
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = sub_247205FD8();
        unint64_t v26 = v25;

        uint64_t v35 = sub_2471F3F68(v24, v26, &v36);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v16 + 22) = 2080;
        uint64_t v35 = (uint64_t)a2;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B128758);
        uint64_t v27 = sub_247206298();
        uint64_t v35 = sub_2471F3F68(v27, v28, &v36);
        sub_2472062B8();
        swift_bridgeObjectRelease();

        os_log_t v29 = v34;
        _os_log_impl(&dword_2471B4000, v34, (os_log_type_t)v33, "Sent voiceIdScoreCard to server with aceId: %s and refId:%s, error: %s", (uint8_t *)v16, 0x20u);
        uint64_t v30 = v32;
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v30, -1, -1);
        MEMORY[0x24C54D9C0](v16, -1, -1);

        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v31);
        return;
      }
    }
    else
    {

      __break(1u);
    }

    __break(1u);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_2471BE4BC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *MEMORY[0x263F709E0];
  uint64_t v12 = sub_247205A38();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 104))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  sub_247204DB8();
  swift_bridgeObjectRetain();
  sub_247204DA8();
  uint64_t v14 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v15 = sub_247204938();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v7, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v7, 0, 1, v15);
  sub_247204D98();
  swift_bridgeObjectRetain();
  sub_247204D88();
  id v17 = a3;
  return sub_247204D78();
}

id sub_2471BE708(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = &v21[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = *MEMORY[0x263F709E0];
  uint64_t v12 = sub_247205A38();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v13 + 104))(v10, v11, v12);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  sub_247205128();
  swift_bridgeObjectRetain();
  sub_2472050E8();
  uint64_t v14 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v15 = sub_247204938();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v16 + 16))(v7, v14, v15);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v16 + 56))(v7, 0, 1, v15);
  sub_247205148();
  swift_bridgeObjectRetain();
  sub_247205138();
  id v17 = a3;
  sub_247205108();
  objc_msgSend(v17, sel_userIdentityClassification);
  sub_247205118();
  id result = objc_msgSend(v17, sel_spIdKnownUserScores);
  if (result)
  {
    uint64_t v19 = result;
    sub_2471CAE98(0, (unint64_t *)&unk_26B128690);
    uint64_t v20 = sub_247205F68();

    sub_2471C233C(v20);
    swift_bridgeObjectRelease();
    return (id)sub_2472050F8();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2471BEC5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v33 = sub_247204938();
  uint64_t v31 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128708);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128350);
  uint64_t v9 = *(void *)(*(void *)(v8 - 8) + 72);
  unint64_t v10 = (*(unsigned __int8 *)(*(void *)(v8 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_247206EF0;
  uint64_t v32 = v11;
  unint64_t v12 = v11 + v10;
  uint64_t v13 = *(int *)(v8 + 48);
  sub_247205BA8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  uint64_t v14 = (void *)(v12 + v13);
  uint64_t v15 = unk_26B128930;
  void *v14 = qword_26B128928;
  v14[1] = v15;
  uint64_t v16 = (void *)(v12 + v9 + *(int *)(v8 + 48));
  swift_bridgeObjectRetain();
  sub_247205BD8();
  uint64_t v36 = 0;
  unint64_t v37 = 0xE000000000000000;
  sub_247206348();
  sub_247206028();
  uint64_t v34 = a1;
  uint64_t v35 = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269240F70);
  sub_247205FE8();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  uint64_t v17 = *(void *)(a3 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId);
  v30[1] = *(void *)(a3 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8);
  v30[2] = v17;
  sub_247206028();
  sub_247206028();
  unint64_t v18 = v37;
  *uint64_t v16 = v36;
  v16[1] = v18;
  uint64_t v19 = (void *)(v12 + 2 * v9 + *(int *)(v8 + 48));
  sub_247205BF8();
  void *v19 = 0xD00000000000001ELL;
  v19[1] = 0x8000000247207B10;
  uint64_t v20 = (void *)(v12 + 3 * v9 + *(int *)(v8 + 48));
  sub_247205BB8();
  uint64_t v36 = 0;
  unint64_t v37 = 0xE000000000000000;
  sub_247206028();
  swift_bridgeObjectRetain();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v21 = v37;
  void *v20 = v36;
  v20[1] = v21;
  id v22 = (void *)(v12 + 4 * v9 + *(int *)(v8 + 48));
  sub_247205C38();
  uint64_t v36 = 0;
  unint64_t v37 = 0xE000000000000000;
  sub_247206028();
  uint64_t v23 = a3 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v24 = v31;
  uint64_t v25 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v7, v23, v33);
  sub_2471C2254((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v25);
  sub_247206028();
  unint64_t v26 = v37;
  *id v22 = v36;
  v22[1] = v26;
  uint64_t v27 = (void *)(v12 + 5 * v9 + *(int *)(v8 + 48));
  sub_247205C28();
  uint64_t v36 = 0;
  unint64_t v37 = 0xE000000000000000;
  sub_247206028();
  sub_247206028();
  sub_247206028();
  unint64_t v28 = v37;
  *uint64_t v27 = v36;
  v27[1] = v28;
  return v32;
}

uint64_t sub_2471BF0A0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v35 = a4;
  uint64_t v36 = a5;
  uint64_t v33 = a3;
  uint64_t v30 = a1;
  uint64_t v6 = sub_247204938();
  uint64_t v31 = *(void *)(v6 - 8);
  uint64_t v32 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128708);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128350);
  uint64_t v10 = *(void *)(*(void *)(v9 - 8) + 72);
  unint64_t v11 = (*(unsigned __int8 *)(*(void *)(v9 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_247206EF0;
  uint64_t v34 = v12;
  unint64_t v13 = v12 + v11;
  uint64_t v14 = (void *)(v12 + v11 + *(int *)(v9 + 48));
  sub_247205BA8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  uint64_t v15 = unk_26B128930;
  void *v14 = qword_26B128928;
  v14[1] = v15;
  swift_bridgeObjectRetain();
  sub_247205BD8();
  uint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  sub_247206348();
  sub_247206028();
  if ((a2 & 1) == 0)
  {
    uint64_t v37 = v30;
    sub_2471CADBC();
    sub_2472062D8();
  }
  uint64_t v16 = (void *)(v13 + v10 + *(int *)(v9 + 48));
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v17 = v39;
  *uint64_t v16 = v38;
  v16[1] = v17;
  unint64_t v18 = (void *)(v13 + 2 * v10 + *(int *)(v9 + 48));
  sub_247205BF8();
  *unint64_t v18 = 0xD00000000000001ELL;
  v18[1] = 0x8000000247207B10;
  uint64_t v19 = (void *)(v13 + 3 * v10 + *(int *)(v9 + 48));
  sub_247205BB8();
  uint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  sub_247206028();
  uint64_t v20 = v33;
  swift_bridgeObjectRetain();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v21 = v39;
  void *v19 = v38;
  v19[1] = v21;
  id v22 = (void *)(v13 + 4 * v10 + *(int *)(v9 + 48));
  sub_247205C38();
  uint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  sub_247206028();
  uint64_t v23 = v20 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v25 = v31;
  uint64_t v24 = v32;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v8, v23, v32);
  sub_2471C2254((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v24);
  sub_247206028();
  unint64_t v26 = v39;
  *id v22 = v38;
  v22[1] = v26;
  sub_247205C28();
  uint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  sub_247206028();
  uint64_t v27 = (void *)(v13 + 5 * v10 + *(int *)(v9 + 48));
  swift_bridgeObjectRetain();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v28 = v39;
  *uint64_t v27 = v38;
  v27[1] = v28;
  return v34;
}

uint64_t sub_2471BF4E0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, int a6, uint64_t a7, uint64_t a8)
{
  int v45 = a6;
  unint64_t v39 = a5;
  uint64_t v42 = a3;
  id v43 = a4;
  uint64_t v41 = a2;
  uint64_t v40 = sub_247204938();
  uint64_t v11 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  unint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128708);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128350);
  uint64_t v15 = *(void *)(*(void *)(v14 - 8) + 72);
  unint64_t v16 = (*(unsigned __int8 *)(*(void *)(v14 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v14 - 8) + 80);
  uint64_t v17 = v14;
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_247206F20;
  uint64_t v44 = v18;
  unint64_t v19 = v18 + v16;
  uint64_t v20 = (void *)(v18 + v16 + *(int *)(v17 + 48));
  sub_247205BA8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  uint64_t v21 = unk_26B128930;
  void *v20 = qword_26B128928;
  v20[1] = v21;
  id v22 = (void *)(v19 + v15 + *(int *)(v17 + 48));
  swift_bridgeObjectRetain();
  sub_247205BD8();
  *id v22 = a7;
  v22[1] = a8;
  uint64_t v23 = (void *)(v19 + 2 * v15 + *(int *)(v17 + 48));
  sub_247205BF8();
  void *v23 = 0xD000000000000025;
  v23[1] = 0x8000000247207B30;
  uint64_t v24 = (void *)(v19 + 3 * v15 + *(int *)(v17 + 48));
  sub_247205BB8();
  uint64_t v48 = 0;
  unint64_t v49 = 0xE000000000000000;
  sub_247206028();
  uint64_t v46 = v17;
  swift_bridgeObjectRetain();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v25 = v49;
  void *v24 = v48;
  v24[1] = v25;
  unint64_t v26 = (void *)(v19 + 4 * v15 + *(int *)(v46 + 48));
  sub_247205C38();
  uint64_t v48 = 0;
  unint64_t v49 = 0xE000000000000000;
  sub_247206028();
  uint64_t v27 = a1 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v28 = v40;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v27, v40);
  sub_2471C2254((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v28);
  sub_247206028();
  unint64_t v29 = v49;
  void *v26 = v48;
  v26[1] = v29;
  sub_247205C28();
  uint64_t v48 = 0;
  unint64_t v49 = 0xE000000000000000;
  sub_247206028();
  uint64_t v30 = (void *)(v19 + 5 * v15 + *(int *)(v46 + 48));
  swift_bridgeObjectRetain();
  sub_247206028();
  uint64_t v31 = v46;
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v32 = v49;
  *uint64_t v30 = v48;
  v30[1] = v32;
  uint64_t v33 = (void *)(v19 + 6 * v15 + *(int *)(v31 + 48));
  sub_247205C18();
  uint64_t v48 = 0;
  unint64_t v49 = 0xE000000000000000;
  sub_247206028();
  id v47 = objc_msgSend(v43, sel_code);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v34 = v49;
  *uint64_t v33 = v48;
  v33[1] = v34;
  sub_247205BC8();
  uint64_t v48 = 0;
  unint64_t v49 = 0xE000000000000000;
  sub_247206028();
  if ((v45 & 1) == 0)
  {
    id v47 = v39;
    sub_2471CADBC();
    sub_2472062D8();
  }
  uint64_t v35 = (void *)(v19 - v15 + 8 * v15 + *(int *)(v31 + 48));
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v36 = v49;
  void *v35 = v48;
  v35[1] = v36;
  return v44;
}

uint64_t sub_2471BF9AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  int v47 = a6;
  uint64_t v38 = a5;
  uint64_t v44 = a3;
  uint64_t v45 = a4;
  uint64_t v43 = sub_247204938();
  uint64_t v41 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v42 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128708);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128350);
  uint64_t v10 = *(void *)(*(void *)(v9 - 8) + 72);
  unint64_t v11 = (*(unsigned __int8 *)(*(void *)(v9 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_247206F20;
  uint64_t v46 = v12;
  unint64_t v13 = v12 + v11;
  uint64_t v14 = (void *)(v12 + v11 + *(int *)(v9 + 48));
  sub_247205BA8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  uint64_t v15 = unk_26B128930;
  void *v14 = qword_26B128928;
  v14[1] = v15;
  swift_bridgeObjectRetain();
  sub_247205BD8();
  uint64_t v49 = 0;
  unint64_t v50 = 0xE000000000000000;
  sub_247206348();
  sub_247206028();
  id v48 = objc_msgSend(a1, sel_code);
  sub_247206478();
  id v40 = a1;
  sub_247206028();
  swift_bridgeObjectRelease();
  unint64_t v16 = (void *)(v13 + v10 + *(int *)(v9 + 48));
  sub_247206028();
  id v17 = objc_msgSend(a1, sel_description);
  sub_247205FD8();

  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v18 = v50;
  *unint64_t v16 = v49;
  v16[1] = v18;
  unint64_t v19 = (void *)(v13 + 2 * v10 + *(int *)(v9 + 48));
  sub_247205BF8();
  void *v19 = 0xD000000000000025;
  v19[1] = 0x8000000247207B30;
  uint64_t v39 = v10;
  uint64_t v20 = (void *)(v13 + 3 * v10 + *(int *)(v9 + 48));
  sub_247205BB8();
  uint64_t v49 = 0;
  unint64_t v50 = 0xE000000000000000;
  sub_247206028();
  swift_bridgeObjectRetain();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v21 = v50;
  void *v20 = v49;
  v20[1] = v21;
  uint64_t v22 = 4 * v10;
  uint64_t v23 = (void *)(v13 + 4 * v10 + *(int *)(v9 + 48));
  sub_247205C38();
  uint64_t v49 = 0;
  unint64_t v50 = 0xE000000000000000;
  sub_247206028();
  uint64_t v24 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v25 = v41;
  unint64_t v26 = v42;
  uint64_t v27 = v43;
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v42, v24, v43);
  sub_2471C2254((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  sub_247206028();
  unint64_t v28 = v50;
  void *v23 = v49;
  v23[1] = v28;
  uint64_t v29 = v39;
  sub_247205C28();
  uint64_t v49 = 0;
  unint64_t v50 = 0xE000000000000000;
  sub_247206028();
  uint64_t v30 = (void *)(v13 + v22 + v29 + *(int *)(v9 + 48));
  swift_bridgeObjectRetain();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v31 = v50;
  *uint64_t v30 = v49;
  v30[1] = v31;
  unint64_t v32 = (void *)(v13 + 6 * v29 + *(int *)(v9 + 48));
  sub_247205C18();
  uint64_t v49 = 0;
  unint64_t v50 = 0xE000000000000000;
  sub_247206028();
  id v48 = objc_msgSend(v40, sel_code);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v33 = v50;
  *unint64_t v32 = v49;
  v32[1] = v33;
  sub_247205BC8();
  uint64_t v49 = 0;
  unint64_t v50 = 0xE000000000000000;
  sub_247206028();
  if ((v47 & 1) == 0)
  {
    id v48 = v38;
    sub_2471CADBC();
    sub_2472062D8();
  }
  unint64_t v34 = (void *)(v13 - v29 + 8 * v29 + *(int *)(v9 + 48));
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v35 = v50;
  void *v34 = v49;
  v34[1] = v35;
  return v46;
}

void sub_2471BFF58(void *a1)
{
  if (a1)
  {
    unint64_t v2 = (void *)sub_247205FC8();
    objc_msgSend(a1, sel_setMultiUserTrpCandidateId_, v2);

    sub_2471CAE98(0, &qword_269240F68);
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_2472060D8();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setTrpCandidateList_, v3);

    id v4 = (id)sub_247205FC8();
    objc_msgSend(a1, sel_setRequestId_, v4);
  }
}

void sub_2471C0058(void *a1)
{
  if (a1)
  {
    unint64_t v2 = (void *)sub_247205FC8();
    objc_msgSend(a1, sel_setLastTRPCandidateId_, v2);

    id v3 = (id)sub_247205FC8();
    objc_msgSend(a1, sel_setRequestId_, v3);
  }
}

id sub_2471C0100(void *a1, uint64_t a2, uint8_t *a3, NSObject *a4)
{
  uint64_t v5 = v4;
  id v59 = a1;
  os_log_t v60 = a4;
  uint64_t v8 = sub_247204938();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = 0;
  char v69 = 1;
  if ((v5[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isCandidateRequest] & 1) != 0
    || v5[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isFFRequest] == 1)
  {
    uint64_t v68 = 30;
    char v69 = 0;
  }
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28678]), sel_init);
  id v13 = objc_allocWithZone(MEMORY[0x263F28648]);
  id v14 = v12;
  id v15 = objc_msgSend(v13, sel_init);
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28668]), sel_initWithRecognition_rawRecognition_audioAnalytics_isFinal_utteranceStart_, v14, v14, v15, 0, 0.0);

  if (!v16)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_247205EA8();
    __swift_project_value_buffer(v35, (uint64_t)qword_26B128910);
    unint64_t v36 = sub_247205E98();
    os_log_type_t v37 = sub_247206188();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl(&dword_2471B4000, v36, v37, "Failed to create speechPackage", v38, 2u);
      MEMORY[0x24C54D9C0](v38, -1, -1);

      return 0;
    }

LABEL_22:
    return 0;
  }
  os_log_type_t v57 = a3;
  id v58 = v14;
  sub_247204928();
  uint64_t v17 = sub_2472048F8();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = v17;
  v20[3] = v19;
  v20[4] = v5;
  v20[5] = v16;
  v20[6] = &v68;
  id v21 = objc_allocWithZone(MEMORY[0x263F70E58]);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = sub_2471C2778;
  *(void *)(v22 + 24) = v20;
  uint64_t v66 = sub_2471C2798;
  uint64_t v67 = v22;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v63 = 1107296256;
  uint64_t v64 = sub_2471C2020;
  uint64_t v65 = &block_descriptor_112;
  uint64_t v23 = _Block_copy(&aBlock);
  uint64_t v24 = v5;
  id v25 = v16;
  swift_release();
  id v26 = objc_msgSend(v21, sel_initWithBuilder_, v23);
  _Block_release(v23);
  if (!v26)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_247205EA8();
    __swift_project_value_buffer(v39, (uint64_t)qword_26B128910);
    id v40 = sub_247205E98();
    os_log_type_t v41 = sub_247206188();
    BOOL v42 = os_log_type_enabled(v40, v41);
    id v14 = v58;
    if (v42)
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl(&dword_2471B4000, v40, v41, "Could not create fabricated TCUPackage", v43, 2u);
      MEMORY[0x24C54D9C0](v43, -1, -1);
      swift_release();

      return 0;
    }
    swift_release();

    goto LABEL_22;
  }
  id v56 = v25;
  uint64_t v27 = (void *)swift_allocObject();
  void v27[2] = v59;
  v27[3] = a2;
  v27[4] = v24;
  v27[5] = v26;
  os_log_t v28 = v60;
  v27[6] = v57;
  v27[7] = v28;
  id v29 = objc_allocWithZone(MEMORY[0x263F70E60]);
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = sub_2471C2810;
  *(void *)(v30 + 24) = v27;
  uint64_t v66 = sub_2471CAFE4;
  uint64_t v67 = v30;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v63 = 1107296256;
  uint64_t v64 = sub_2471C2020;
  uint64_t v65 = &block_descriptor_121;
  unint64_t v31 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  unint64_t v32 = v24;
  swift_bridgeObjectRetain();
  id v33 = v26;
  swift_release();
  id v34 = objc_msgSend(v29, (SEL)&selRef_spIdKnownUserScores, v31);
  _Block_release(v31);
  if (!v34)
  {
    id v44 = v58;
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_247205EA8();
    __swift_project_value_buffer(v45, (uint64_t)qword_26B128910);
    uint64_t v46 = v32;
    int v47 = sub_247205E98();
    os_log_type_t v48 = sub_247206188();
    os_log_t v60 = v47;
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      uint64_t aBlock = v50;
      *(_DWORD *)uint64_t v49 = 136315138;
      os_log_type_t v57 = v49 + 4;
      id v59 = v33;
      uint64_t v51 = v44;
      uint64_t v53 = *(void *)&v46[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
      unint64_t v52 = *(void *)&v46[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
      swift_bridgeObjectRetain();
      uint64_t v61 = sub_2471F3F68(v53, v52, &aBlock);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      os_log_t v54 = v60;
      _os_log_impl(&dword_2471B4000, v60, v48, "Failed to create fabricated TRPCandidate for request: %s", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v50, -1, -1);
      MEMORY[0x24C54D9C0](v49, -1, -1);
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
    }
    return 0;
  }
  swift_release();
  swift_release();

  return v34;
}

id sub_2471C0898(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = (void *)sub_247205FC8();
    objc_msgSend(v8, sel_setTcuId_, v9);

    uint64_t v10 = (void *)sub_247205FC8();
    objc_msgSend(v8, sel_setRequestId_, v10);

    id result = objc_msgSend(v8, sel_setSpeechPackage_, a5);
    if ((a6[1] & 1) == 0)
    {
      uint64_t v11 = *a6;
      return objc_msgSend(v8, sel_setSpeechEvent_, v11);
    }
  }
  return result;
}

void sub_2471C0984(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  if (a1)
  {
    uint64_t v10 = (void *)sub_247205FC8();
    objc_msgSend(a1, sel_setTrpCandidateId_, v10);

    uint64_t v11 = (void *)sub_247205FC8();
    objc_msgSend(a1, sel_setRequestId_, v11);

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128740);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_247206F30;
    *(void *)(v12 + 32) = a5;
    uint64_t v17 = v12;
    sub_247206108();
    sub_2471CAE98(0, &qword_26B128648);
    id v13 = a5;
    id v14 = (void *)sub_2472060D8();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setTcuList_, v14);

    if (a7) {
      uint64_t v15 = sub_247205FC8();
    }
    else {
      uint64_t v15 = 0;
    }
    objc_msgSend(a1, sel_setUserId_, v15, v17);
  }
}

void sub_2471C0AFC(int a1, int a2, id a3)
{
  id v5 = objc_msgSend(a3, sel_description);
  sub_247205FD8();

  id v6 = objc_allocWithZone(MEMORY[0x263F64820]);
  uint64_t v7 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, sel_initWithReason_, v7);

  if (v8)
  {
    objc_msgSend(v8, sel_setErrorCode_, objc_msgSend(a3, sel_code));
    id v9 = v8;
    uint64_t v10 = (void *)sub_247205FC8();
    objc_msgSend(v9, sel_setRefId_, v10);

    uint64_t v11 = *(void **)(v3 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper);
    aBlock[4] = sub_2471C0D94;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2471DC9B8;
    aBlock[3] = &block_descriptor_103;
    uint64_t v12 = _Block_copy(aBlock);
    id v13 = v9;
    objc_msgSend(v11, sel_handleCommand_completion_, v13, v12);
    _Block_release(v12);
  }
  else
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_247205EA8();
    __swift_project_value_buffer(v14, (uint64_t)qword_26B128910);
    oslog = sub_247205E98();
    os_log_type_t v15 = sub_247206188();
    if (os_log_type_enabled(oslog, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_2471B4000, oslog, v15, "Could not create CommandFailed to fail the request, request will likely timeout", v16, 2u);
      MEMORY[0x24C54D9C0](v16, -1, -1);
    }
  }
}

void sub_2471C0D94(uint64_t a1, void *a2)
{
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_247205EA8();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B128910);
  id v4 = a2;
  id v5 = a2;
  oslog = sub_247205E98();
  os_log_type_t v6 = sub_247206188();
  if (os_log_type_enabled(oslog, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v12 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B128758);
    uint64_t v9 = sub_247206298();
    sub_2471F3F68(v9, v10, &v12);
    sub_2472062B8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2471B4000, oslog, v6, "Sent CommandFailed to fail the request with error %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v8, -1, -1);
    MEMORY[0x24C54D9C0](v7, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_2471C0F80()
{
  if (*((unsigned char *)p_aBlock + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isRMVEnabled) != 1)
  {
    if (AFIsATV() && (sub_247205E28(), uint64_t v19 = v18, swift_bridgeObjectRelease(), !v19))
    {
      uint64_t v57 = sub_247205E38();
      if (v58)
      {
        uint64_t v59 = v57;
        uint64_t v60 = v58;
        if (qword_26B128578 != -1) {
          swift_once();
        }
        uint64_t v61 = sub_247205EA8();
        __swift_project_value_buffer(v61, (uint64_t)qword_26B128910);
        id v62 = sub_247205E98();
        os_log_type_t v63 = sub_247206198();
        if (os_log_type_enabled(v62, v63))
        {
          uint64_t v64 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v64 = 0;
          _os_log_impl(&dword_2471B4000, v62, v63, "Generating default user voice ID score card", v64, 2u);
          MEMORY[0x24C54D9C0](v64, -1, -1);
        }

        uint64_t v65 = swift_allocObject();
        *(void *)(v65 + 16) = v59;
        *(void *)(v65 + 24) = v60;
        id v66 = objc_allocWithZone(MEMORY[0x263F286D8]);
        uint64_t v67 = swift_allocObject();
        *(void *)(v67 + 16) = sub_2471C2308;
        *(void *)(v67 + 24) = v65;
        v81 = sub_2471CAFE4;
        uint64_t v82 = v67;
        uint64_t aBlock = (void *)MEMORY[0x263EF8330];
        uint64_t v78 = 1107296256;
        uint64_t v68 = &block_descriptor_90;
LABEL_64:
        uint64_t v79 = sub_2471C2020;
        v80 = v68;
        uint64_t v72 = _Block_copy(&aBlock);
        swift_release();
        id v28 = objc_msgSend(v66, sel_initWithBuilder_, v72);
        _Block_release(v72);
        goto LABEL_65;
      }
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v69 = sub_247205EA8();
      __swift_project_value_buffer(v69, (uint64_t)qword_26B128910);
      uint64_t v51 = p_aBlock;
      unint64_t v52 = sub_247205E98();
      os_log_type_t v53 = sub_247206188();
      if (os_log_type_enabled(v52, v53))
      {
        os_log_t v54 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)os_log_t v54 = 67109120;
        LODWORD(aBlock) = 0;
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v20 = sub_247205E28();
      if (v21)
      {
        uint64_t v22 = v20;
        uint64_t v23 = v21;
        uint64_t v24 = swift_allocObject();
        *(void *)(v24 + 16) = v22;
        *(void *)(v24 + 24) = v23;
        id v25 = objc_allocWithZone(MEMORY[0x263F286D8]);
        uint64_t v26 = swift_allocObject();
        *(void *)(v26 + 16) = sub_2471C22D4;
        *(void *)(v26 + 24) = v24;
        v81 = sub_2471CAFE4;
        uint64_t v82 = v26;
        uint64_t aBlock = (void *)MEMORY[0x263EF8330];
        uint64_t v78 = 1107296256;
        uint64_t v79 = sub_2471C2020;
        v80 = &block_descriptor_80;
        uint64_t v27 = _Block_copy(&aBlock);
        swift_release();
        id v28 = objc_msgSend(v25, sel_initWithBuilder_, v27);
        _Block_release(v27);
LABEL_65:
        swift_release();
        return (uint64_t)v28;
      }
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v56 = sub_247205EA8();
      __swift_project_value_buffer(v56, (uint64_t)qword_26B128910);
      uint64_t v51 = p_aBlock;
      unint64_t v52 = sub_247205E98();
      os_log_type_t v53 = sub_247206188();
      if (os_log_type_enabled(v52, v53))
      {
        os_log_t v54 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)os_log_t v54 = 67109120;
        LODWORD(aBlock) = 0;
        sub_2472062B8();

        v55 = "Primary user is missing from homemebers list when RMV=%{BOOL}d";
        goto LABEL_44;
      }
    }
LABEL_55:

    return 0;
  }
  unint64_t v1 = *(void *)((char *)p_aBlock + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_homeMembers);
  uint64_t v2 = sub_247205E38();
  if (v3)
  {
    uint64_t v75 = v3;
    uint64_t v76 = v2;
    if (v1 >> 62) {
      goto LABEL_60;
    }
    uint64_t v4 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v4)
    {
LABEL_61:
      swift_bridgeObjectRelease();
      id v29 = (void *)MEMORY[0x263F8EE78];
      unint64_t v1 = *(void *)(MEMORY[0x263F8EE78] + 16);
      if (v1) {
        goto LABEL_21;
      }
LABEL_62:
      unint64_t v31 = (void *)MEMORY[0x263F8EE80];
LABEL_63:
      swift_bridgeObjectRelease();
      unint64_t v70 = (void *)swift_allocObject();
      void v70[2] = v31;
      v70[3] = v76;
      v70[4] = v75;
      id v66 = objc_allocWithZone(MEMORY[0x263F286D8]);
      uint64_t v71 = swift_allocObject();
      *(void *)(v71 + 16) = sub_2471C25A4;
      *(void *)(v71 + 24) = v70;
      v81 = sub_2471CAFE4;
      uint64_t v82 = v71;
      uint64_t aBlock = (void *)MEMORY[0x263EF8330];
      uint64_t v78 = 1107296256;
      uint64_t v68 = &block_descriptor_100;
      goto LABEL_64;
    }
LABEL_5:
    uint64_t aBlock = (void *)MEMORY[0x263F8EE78];
    p_uint64_t aBlock = &aBlock;
    sub_2471C2544(0, v4 & ~(v4 >> 63), 0);
    if ((v4 & 0x8000000000000000) == 0)
    {
      uint64_t v5 = 0;
      os_log_type_t v6 = aBlock;
      do
      {
        if (v4 == v5)
        {
          __break(1u);
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
LABEL_60:
          swift_bridgeObjectRetain();
          uint64_t v4 = sub_2472063E8();
          if (!v4) {
            goto LABEL_61;
          }
          goto LABEL_5;
        }
        uint64_t v7 = v6;
        if ((v1 & 0xC000000000000001) != 0) {
          id v8 = (id)MEMORY[0x24C54D1C0](v5, v1);
        }
        else {
          id v8 = *(id *)(v1 + 8 * v5 + 32);
        }
        uint64_t v9 = v8;
        id v10 = objc_msgSend(v8, sel_sharedUserId, v74);
        if (!v10)
        {
          __break(1u);
LABEL_70:
          uint64_t result = sub_2472064B8();
          __break(1u);
          return result;
        }
        uint64_t v11 = v10;
        uint64_t v12 = sub_247205FD8();
        uint64_t v14 = v13;

        os_log_type_t v6 = v7;
        uint64_t aBlock = v7;
        unint64_t v15 = v7[2];
        unint64_t v16 = v6[3];
        if (v15 >= v16 >> 1)
        {
          sub_2471C2544(v16 > 1, v15 + 1, 1);
          os_log_type_t v6 = aBlock;
        }
        ++v5;
        v6[2] = v15 + 1;
        uint64_t v17 = &v6[2 * v15];
        v17[4] = v12;
        v17[5] = v14;
      }
      while (v4 != v5);
      id v29 = v6;
      swift_bridgeObjectRelease();
      unint64_t v1 = v29[2];
      if (v1)
      {
LABEL_21:
        sub_2471CAE98(0, (unint64_t *)&unk_26B128690);
        swift_bridgeObjectRetain();
        uint64_t v74 = v29;
        uint64_t v30 = v29 + 5;
        unint64_t v31 = (void *)MEMORY[0x263F8EE80];
        while (1)
        {
          uint64_t v35 = *(v30 - 1);
          uint64_t v34 = *v30;
          swift_bridgeObjectRetain_n();
          uint64_t v36 = sub_247206268();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t aBlock = v31;
          unint64_t v39 = sub_2471FC8B8(v35, v34);
          uint64_t v40 = v31[2];
          BOOL v41 = (v38 & 1) == 0;
          uint64_t v42 = v40 + v41;
          if (__OFADD__(v40, v41)) {
            goto LABEL_58;
          }
          char v43 = v38;
          if (v31[3] >= v42)
          {
            if (isUniquelyReferenced_nonNull_native)
            {
              unint64_t v31 = aBlock;
              if ((v38 & 1) == 0) {
                goto LABEL_31;
              }
            }
            else
            {
              sub_2471FF6E4();
              unint64_t v31 = aBlock;
              if ((v43 & 1) == 0) {
                goto LABEL_31;
              }
            }
          }
          else
          {
            sub_2471FCEEC(v42, isUniquelyReferenced_nonNull_native);
            unint64_t v44 = sub_2471FC8B8(v35, v34);
            if ((v43 & 1) != (v45 & 1)) {
              goto LABEL_70;
            }
            unint64_t v39 = v44;
            unint64_t v31 = aBlock;
            if ((v43 & 1) == 0)
            {
LABEL_31:
              v31[(v39 >> 6) + 8] |= 1 << v39;
              uint64_t v46 = (uint64_t *)(v31[6] + 16 * v39);
              uint64_t *v46 = v35;
              v46[1] = v34;
              *(void *)(v31[7] + 8 * v39) = v36;
              uint64_t v47 = v31[2];
              BOOL v48 = __OFADD__(v47, 1);
              uint64_t v49 = v47 + 1;
              if (v48) {
                goto LABEL_59;
              }
              v31[2] = v49;
              swift_bridgeObjectRetain();
              goto LABEL_23;
            }
          }
          uint64_t v32 = v31[7];
          id v33 = *(void **)(v32 + 8 * v39);
          *(void *)(v32 + 8 * v39) = v36;

LABEL_23:
          v30 += 2;
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          if (!--v1)
          {
            swift_bridgeObjectRelease();
            goto LABEL_63;
          }
        }
      }
      goto LABEL_62;
    }
    __break(1u);
  }
  else if (qword_26B128578 == -1)
  {
    goto LABEL_37;
  }
  swift_once();
LABEL_37:
  uint64_t v50 = sub_247205EA8();
  __swift_project_value_buffer(v50, (uint64_t)qword_26B128910);
  uint64_t v51 = p_aBlock;
  unint64_t v52 = sub_247205E98();
  os_log_type_t v53 = sub_247206188();
  if (!os_log_type_enabled(v52, v53)) {
    goto LABEL_55;
  }
  os_log_t v54 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)os_log_t v54 = 67109120;
  LODWORD(aBlock) = 1;
LABEL_39:
  sub_2472062B8();

  v55 = "Unknown user missing from homemebers list when RMV=%{BOOL}d";
LABEL_44:
  _os_log_impl(&dword_2471B4000, v52, v53, v55, v54, 8u);
  MEMORY[0x24C54D9C0](v54, -1, -1);

  return 0;
}

id sub_2471C190C(id result)
{
  if (result)
  {
    unint64_t v1 = result;
    sub_2471CAE98(0, (unint64_t *)&unk_26B128690);
    uint64_t v2 = (void *)sub_247206268();
    objc_msgSend(v1, sel_setSpIdAudioProcessedDuration_, v2);

    uint64_t v3 = (void *)sub_247206268();
    objc_msgSend(v1, sel_setSpIdUnknownUserScore_, v3);

    uint64_t v4 = (void *)sub_247205F58();
    objc_msgSend(v1, sel_setSpIdKnownUserScores_, v4);

    uint64_t v5 = (void *)sub_247206268();
    objc_msgSend(v1, sel_setSpIdUserScoresVersion_, v5);

    objc_msgSend(v1, sel_setSpIdScoreThresholdingType_, 0);
    objc_msgSend(v1, sel_setSpIdAssetVersion_, 0);
    os_log_type_t v6 = (void *)sub_247205FC8();
    objc_msgSend(v1, sel_setUserClassified_, v6);

    return objc_msgSend(v1, sel_setUserIdentityClassification_, 0);
  }
  return result;
}

id sub_2471C1A80(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (result)
  {
    id v8 = result;
    sub_2471CAE98(0, (unint64_t *)&unk_26B128690);
    uint64_t v9 = (void *)sub_247206268();
    objc_msgSend(v8, sel_setSpIdAudioProcessedDuration_, v9);

    id v10 = (void *)sub_247206268();
    objc_msgSend(v8, sel_setSpIdUnknownUserScore_, v10);

    __swift_instantiateConcreteTypeFromMangledName(&qword_26B128720);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247206F40;
    *(void *)(inited + 32) = a2;
    *(void *)(inited + 40) = a3;
    swift_bridgeObjectRetain();
    *(void *)(inited + 48) = sub_247206268();
    sub_2471EC830(inited);
    uint64_t v12 = (void *)sub_247205F58();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setSpIdKnownUserScores_, v12);

    uint64_t v13 = (void *)sub_247206268();
    objc_msgSend(v8, sel_setSpIdUserScoresVersion_, v13);

    objc_msgSend(v8, sel_setSpIdScoreThresholdingType_, 0);
    objc_msgSend(v8, sel_setSpIdAssetVersion_, 0);
    uint64_t v14 = (void *)sub_247205FC8();
    objc_msgSend(v8, sel_setUserClassified_, v14);

    return objc_msgSend(v8, sel_setUserIdentityClassification_, a5);
  }
  return result;
}

uint64_t sub_2471C1C48()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_myriadMonitor);
  uint64_t v1 = v0 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId;
  uint64_t v2 = sub_247205B68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_sessionState);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_immutableSessionState);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

id sub_2471C1D44()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AssistantSpeechRecognizerResponseHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2471C1E7C()
{
  return type metadata accessor for AssistantSpeechRecognizerResponseHandler();
}

uint64_t type metadata accessor for AssistantSpeechRecognizerResponseHandler()
{
  uint64_t result = qword_26B128560;
  if (!qword_26B128560) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2471C1ED0()
{
  uint64_t result = sub_247205B68();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

void sub_2471C1FC4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  id v4 = a2;
  v3(a2);
}

uint64_t sub_2471C2024(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2471C2118()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2471C2158()
{
  sub_2471B6494(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32));
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

unint64_t sub_2471C21A8()
{
  unint64_t result = qword_26B1285F0;
  if (!qword_26B1285F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26B1285E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1285F0);
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

uint64_t sub_2471C224C()
{
  return sub_2471B69AC(*(void *)(v0 + 16));
}

uint64_t sub_2471C2254(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2471C229C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_2471C22D4(void *a1)
{
  return sub_2471C1A80(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), 100, 4);
}

uint64_t sub_2471C22F8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_2471C2308(void *a1)
{
  return sub_2471C1A80(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), 0, 0);
}

uint64_t sub_2471C232C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void *sub_2471C233C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269240F80);
  uint64_t result = (void *)sub_2472063F8();
  uint64_t v3 = result;
  int64_t v4 = 0;
  uint64_t v26 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v6 = a1 + 64;
  uint64_t v5 = v7;
  uint64_t v8 = 1 << *(unsigned char *)(v6 - 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v5;
  int64_t v25 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = (char *)(result + 8);
  if ((v9 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v12 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v12 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v4 << 6))
  {
    uint64_t v17 = (uint64_t *)(*(void *)(v26 + 48) + 16 * i);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = *(void **)(*(void *)(v26 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    uint64_t result = objc_msgSend(v20, sel_integerValue);
    *(void *)&v11[(i >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << i;
    uint64_t v21 = (void *)(v3[6] + 16 * i);
    *uint64_t v21 = v19;
    v21[1] = v18;
    *(void *)(v3[7] + 8 * i) = result;
    uint64_t v22 = v3[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v24;
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v14 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_24;
    }
    if (v14 >= v25) {
      return v3;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v4;
    if (!v15)
    {
      int64_t v4 = v14 + 1;
      if (v14 + 1 >= v25) {
        return v3;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v4);
      if (!v15)
      {
        int64_t v4 = v14 + 2;
        if (v14 + 2 >= v25) {
          return v3;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v4);
        if (!v15) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v10 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v25) {
    return v3;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v4 = v16;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v4 >= v25) {
      return v3;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v4);
    ++v16;
    if (v15) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2471C2544(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2471C25C0(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_2471C2564()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

id sub_2471C25A4(id result)
{
  return sub_2471C190C(result);
}

uint64_t sub_2471C25B0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2471C25C0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B128718);
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
  int64_t v14 = a4 + 32;
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
  uint64_t result = sub_247206428();
  __break(1u);
  return result;
}

uint64_t sub_2471C2730()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

id sub_2471C2778(void *a1)
{
  return sub_2471C0898(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(uint64_t **)(v1 + 48));
}

uint64_t sub_2471C2788()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2471C2798()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2471C27C0()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_2471C2810(void *a1)
{
  sub_2471C0984(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t sub_2471C2820()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2471C2830()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2471C286C(uint64_t a1)
{
  return sub_2471CAA20(a1, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_2471BD688);
}

uint64_t sub_2471C2884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = sub_247205EE8();
  uint64_t v23 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_247205F18();
  uint64_t v14 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388]();
  int64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void *)&v5[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_requestQueue];
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a1;
  v17[3] = a2;
  v17[4] = v5;
  v17[5] = a3;
  v17[6] = a4;
  v17[7] = a5;
  aBlock[4] = sub_2471CAE80;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247200920;
  aBlock[3] = &block_descriptor_221;
  uint64_t v18 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  uint64_t v19 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_247205EF8();
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_2471C2254(&qword_26B128360, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1285E0);
  sub_2471C21A8();
  sub_2472062E8();
  MEMORY[0x24C54D030](0, v16, v13, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v11);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v22);
  return swift_release();
}

void sub_2471C2B58(uint64_t a1, unint64_t a2)
{
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_247205EA8();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B128910);
  unint64_t v6 = sub_247205E98();
  os_log_type_t v7 = sub_247206178();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_2471B4000, v6, v7, "Received final result", v8, 2u);
    MEMORY[0x24C54D9C0](v8, -1, -1);
  }

  uint64_t v10 = *(void *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
  unint64_t v9 = *(void *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
  BOOL v11 = v10 == a1 && v9 == a2;
  if (!v11 && (sub_2472064A8() & 1) == 0)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v12 = v2;
    uint64_t v13 = sub_247205E98();
    os_log_type_t v14 = sub_247206188();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = v16;
      *(_DWORD *)uint64_t v15 = 136315394;
      swift_bridgeObjectRetain();
      sub_2471F3F68(a1, a2, &v17);
      sub_2472062B8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v15 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_2471F3F68(v10, v9, &v17);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v13, v14, "Response requestId = %s does not match current requestId = %s", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v16, -1, -1);
      MEMORY[0x24C54D9C0](v15, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

void sub_2471C2E10(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_247205C78();
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  os_log_type_t v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_247205EA8();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B128910);
  unint64_t v9 = sub_247205E98();
  os_log_type_t v10 = sub_247206178();
  if (os_log_type_enabled(v9, v10))
  {
    BOOL v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v11 = 0;
    _os_log_impl(&dword_2471B4000, v9, v10, "Received TRPDetected.", v11, 2u);
    MEMORY[0x24C54D9C0](v11, -1, -1);
  }

  if (v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMedocEnabled] != 1)
  {
    os_log_t v44 = (os_log_t)sub_247205E98();
    os_log_type_t v22 = sub_247206188();
    if (os_log_type_enabled(v44, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      uint64_t v24 = "Received TRPDetected from CoreSpeech when Medoc is not enabled.";
      goto LABEL_16;
    }
LABEL_17:
    os_log_t v25 = v44;

    return;
  }
  id v12 = objc_msgSend(a1, sel_requestId);
  if (!v12)
  {
LABEL_12:
    os_log_t v44 = (os_log_t)sub_247205E98();
    os_log_type_t v22 = sub_247206178();
    if (os_log_type_enabled(v44, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      uint64_t v24 = "TRPDetected requestId does not match current requestId";
LABEL_16:
      _os_log_impl(&dword_2471B4000, v44, v22, v24, v23, 2u);
      MEMORY[0x24C54D9C0](v23, -1, -1);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  uint64_t v13 = v12;
  uint64_t v14 = sub_247205FD8();
  uint64_t v16 = v15;

  uint64_t v18 = *(void *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
  uint64_t v17 = *(NSObject **)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
  if (v14 == v18 && v16 == v17)
  {
    uint64_t v21 = swift_bridgeObjectRelease();
  }
  else
  {
    char v20 = sub_2472064A8();
    uint64_t v21 = swift_bridgeObjectRelease();
    if ((v20 & 1) == 0) {
      goto LABEL_12;
    }
  }
  os_log_t v44 = v17;
  MEMORY[0x270FA5388](v21);
  *(&v43 - 2) = (uint64_t)v2;
  *(&v43 - 1) = (uint64_t)a1;
  if (v26 == 1)
  {
    id v27 = objc_allocWithZone((Class)sub_2472055D8());
    uint64_t v28 = sub_247205038();
    if (!v28)
    {
      id v29 = v2;
      uint64_t v30 = sub_247205E98();
      os_log_type_t v31 = sub_247206188();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = (uint8_t *)swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        uint64_t v46 = v33;
        *(_DWORD *)uint64_t v32 = 136315138;
        os_log_t v34 = v44;
        swift_bridgeObjectRetain();
        uint64_t v45 = sub_2471F3F68(v18, (unint64_t)v34, &v46);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        uint64_t v35 = "Failed to create MultiUserSpeechStopDetectedMessage for request: %s";
LABEL_31:
        _os_log_impl(&dword_2471B4000, v30, v31, v35, v32, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v33, -1, -1);
        MEMORY[0x24C54D9C0](v32, -1, -1);

        return;
      }
      goto LABEL_32;
    }
  }
  else
  {
    id v36 = objc_allocWithZone((Class)sub_247205098());
    uint64_t v28 = sub_247205038();
    if (!v28)
    {
      id v29 = v2;
      uint64_t v30 = sub_247205E98();
      os_log_type_t v31 = sub_247206188();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = (uint8_t *)swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        uint64_t v46 = v33;
        *(_DWORD *)uint64_t v32 = 136315138;
        os_log_t v42 = v44;
        swift_bridgeObjectRetain();
        uint64_t v45 = sub_2471F3F68(v18, (unint64_t)v42, &v46);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        uint64_t v35 = "Failed to create SpeechStopDetectedMessage for request: %s";
        goto LABEL_31;
      }
LABEL_32:

      return;
    }
  }
  os_log_type_t v37 = (void *)v28;
  __swift_project_boxed_opaque_existential_1(&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher], *(void *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24]);
  sub_247205A18();

  if (qword_26B127C10 != -1) {
    swift_once();
  }
  uint64_t v38 = __swift_project_value_buffer(v4, (uint64_t)qword_26B1288F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v38, v4);
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = v2;
  *(void *)(v39 + 24) = a1;
  uint64_t v40 = v2;
  id v41 = a1;
  sub_247205C48();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_2471C3494(NSObject *a1)
{
  uint64_t v159 = sub_247205B68();
  v160 = *(NSObject **)(v159 - 8);
  MEMORY[0x270FA5388](v159);
  v162 = ((char *)&v147 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = (char *)sub_247205EA8();
  unint64_t v5 = *((void *)v4 - 1);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v163 = (uint64_t)&v147 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  os_log_type_t v10 = (char *)&v147 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (uint64_t)&v147 - v11;
  if (qword_26B128578 != -1) {
LABEL_80:
  }
    swift_once();
  uint64_t v13 = __swift_project_value_buffer((uint64_t)v4, (uint64_t)qword_26B128910);
  uint64_t v14 = *(char **)(v5 + 16);
  uint64_t v166 = v13;
  v167 = v14;
  v168 = (char *)(v5 + 16);
  ((void (*)(uint64_t))v14)(v12);
  uint64_t v15 = a1;
  uint64_t v16 = sub_247205E98();
  uint64_t v17 = sub_247206178();
  if (os_log_type_enabled(v16, (os_log_type_t)v17))
  {
    unint64_t v161 = (unint64_t)v10;
    unint64_t v169 = v5;
    v164 = v4;
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(void *)&long long v170 = v19;
    *(_DWORD *)uint64_t v18 = 136315138;
    id v20 = [v15 multiUserTrpCandidateId];
    if (!v20)
    {
LABEL_102:

      __break(1u);
LABEL_103:

      __break(1u);
      goto LABEL_104;
    }
    uint64_t v21 = v20;
    uint64_t v22 = sub_247205FD8();
    unint64_t v24 = v23;

    v174[0] = sub_2471F3F68(v22, v24, (uint64_t *)&v170);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v16, (os_log_type_t)v17, "Received MultiUserTRPCandidate with top level trpId: %s.", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v19, -1, -1);
    MEMORY[0x24C54D9C0](v18, -1, -1);

    unint64_t v5 = v169;
    os_log_t v25 = *(void (**)(uint64_t, char *))(v169 + 8);
    uint64_t v4 = v164;
    v25(v12, v164);
    os_log_type_t v10 = (char *)v161;
  }
  else
  {

    os_log_t v25 = *(void (**)(uint64_t, char *))(v5 + 8);
    v25(v12, v4);
  }
  uint64_t v17 = v165;
  if (v165[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMUXEnabled] != 1)
  {
    uint64_t v32 = sub_247205E98();
    os_log_type_t v33 = sub_247206188();
    if (!os_log_type_enabled(v32, v33))
    {
LABEL_14:

      return;
    }
    os_log_t v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_t v34 = 0;
    _os_log_impl(&dword_2471B4000, v32, v33, "MultiUserTRPCandidate received from ASR but Multi User is NOT enabled. Will ignore this message.", v34, 2u);
    uint64_t v35 = v34;
LABEL_13:
    MEMORY[0x24C54D9C0](v35, -1, -1);
    goto LABEL_14;
  }
  id v26 = [v15 requestId];
  if (!v26) {
    goto LABEL_22;
  }
  id v27 = v26;
  uint64_t v28 = sub_247205FD8();
  uint64_t v30 = v29;

  unint64_t v31 = *(unint64_t *)((char *)&v17[1].isa + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId);
  uint64_t v156 = *(uint64_t *)((char *)&v17->isa + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId);
  if (v28 == v156 && v30 == v31)
  {
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  char v36 = sub_2472064A8();
  swift_bridgeObjectRelease();
  if ((v36 & 1) == 0)
  {
LABEL_22:
    uint64_t v53 = v163;
    ((void (*)(uint64_t, uint64_t, char *))v167)(v163, v166, v4);
    os_log_t v54 = v15;
    v55 = v17;
    uint64_t v17 = v54;
    uint64_t v1 = v55;
    uint64_t v56 = sub_247205E98();
    os_log_type_t v57 = sub_247206178();
    if (!os_log_type_enabled(v56, v57))
    {

      v25(v53, v4);
      return;
    }
    v157 = v25;
    unint64_t v169 = v5;
    v164 = v4;
    uint64_t v58 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(void *)&long long v170 = v15;
    *(_DWORD *)uint64_t v58 = 136315394;
    id v59 = [v17 requestId];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = sub_247205FD8();
      unint64_t v63 = v62;

      v174[0] = sub_2471F3F68(v61, v63, (uint64_t *)&v170);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v58 + 12) = 2080;
      uint64_t v64 = *(void *)&v1[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
      unint64_t v65 = *(void *)&v1[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
      swift_bridgeObjectRetain();
      v174[0] = sub_2471F3F68(v64, v65, (uint64_t *)&v170);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v56, v57, "MultiUserTRPCandidate requestId = %s does not match current requestId = %s.", (uint8_t *)v58, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v15, -1, -1);
      MEMORY[0x24C54D9C0](v58, -1, -1);

      v157(v163, v164);
      return;
    }
    goto LABEL_103;
  }
LABEL_16:
  unint64_t v155 = v31;
  id v37 = [v15 trpCandidateList];
  if (!v37)
  {
    id v66 = v17;
    uint64_t v32 = sub_247205E98();
    os_log_type_t v67 = sub_247206188();
    if (!os_log_type_enabled(v32, v67))
    {

      return;
    }
    uint64_t v68 = (uint8_t *)swift_slowAlloc();
    uint64_t v69 = swift_slowAlloc();
    *(void *)&long long v170 = v69;
    *(_DWORD *)uint64_t v68 = 136315138;
    unint64_t v70 = v155;
    swift_bridgeObjectRetain();
    v174[0] = sub_2471F3F68(v156, v70, (uint64_t *)&v170);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v32, v67, "Received MultiUserTRPCandidate with nil trpCandidateList for request: %s.", v68, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v69, -1, -1);
    uint64_t v35 = v68;
    goto LABEL_13;
  }
  uint64_t v38 = v37;
  v157 = v25;
  unint64_t v169 = v5;
  sub_2471CAE98(0, &qword_269240F68);
  unint64_t v39 = sub_2472060E8();

  ((void (*)(char *, uint64_t, char *))v167)(v10, v166, v4);
  uint64_t v40 = v15;
  swift_bridgeObjectRetain_n();
  uint64_t v15 = v40;
  uint64_t v12 = (uint64_t)v10;
  id v41 = sub_247205E98();
  os_log_type_t v42 = sub_247206178();
  BOOL v43 = os_log_type_enabled(v41, v42);
  uint64_t v1 = (char *)&loc_247206000;
  unint64_t v44 = v39 >> 62;
  unint64_t v158 = v39;
  v148 = v15;
  if (!v43)
  {

    swift_bridgeObjectRelease_n();
    v157(v12, v4);
    uint64_t v15 = v162;
    goto LABEL_29;
  }
  unint64_t v161 = v12;
  v164 = v4;
  uint64_t v12 = swift_slowAlloc();
  uint64_t v45 = swift_slowAlloc();
  *(void *)&long long v170 = v45;
  *(_DWORD *)uint64_t v12 = 136315394;
  id v46 = [v15 multiUserTrpCandidateId];
  if (!v46)
  {
LABEL_104:

    swift_bridgeObjectRelease();
    __break(1u);
    return;
  }
  uint64_t v47 = v46;
  uint64_t v48 = sub_247205FD8();
  unint64_t v50 = v49;

  v174[0] = sub_2471F3F68(v48, v50, (uint64_t *)&v170);
  sub_2472062B8();

  swift_bridgeObjectRelease();
  *(_WORD *)(v12 + 12) = 2048;
  unint64_t v39 = v158;
  if (v44)
  {
    swift_bridgeObjectRetain();
    uint64_t v51 = sub_2472063E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v51 = *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v52 = v164;
  swift_bridgeObjectRelease();
  v174[0] = v51;
  sub_2472062B8();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_2471B4000, v41, v42, "Received MultiUserTRPCandidate with trpCandidateId: %s with %ld entries.", (uint8_t *)v12, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x24C54D9C0](v45, -1, -1);
  MEMORY[0x24C54D9C0](v12, -1, -1);

  v157(v161, v52);
  uint64_t v17 = v165;
  uint64_t v15 = v162;
  uint64_t v1 = (unsigned char *)&loc_247206000;
LABEL_29:
  unint64_t v176 = sub_2471EC824(MEMORY[0x263F8EE78]);
  if (v44)
  {
LABEL_83:
    swift_bridgeObjectRetain();
    a1 = sub_2472063E8();
    swift_bridgeObjectRelease();
    if (a1) {
      goto LABEL_31;
    }
LABEL_84:
    uint64_t v127 = swift_bridgeObjectRelease();
    MEMORY[0x270FA5388](v127);
    v128 = v148;
    *(&v147 - 4) = (uint64_t)v17;
    *(&v147 - 3) = (uint64_t)v128;
    *(&v147 - 2) = (uint64_t)&v176;
    if (v129 == 1)
    {
      id v130 = objc_allocWithZone((Class)sub_2472057C8());
      uint64_t v131 = sub_2472057B8();
      if (v131)
      {
        v132 = (void *)v131;
        v133 = sub_247205E98();
        os_log_type_t v134 = sub_247206178();
        if (os_log_type_enabled(v133, v134))
        {
          v135 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v135 = 0;
          v136 = "Posting MultiUserRootTRPCandidateRequestMessage.";
LABEL_91:
          _os_log_impl(&dword_2471B4000, v133, v134, v136, v135, 2u);
          MEMORY[0x24C54D9C0](v135, -1, -1);
          goto LABEL_92;
        }
        goto LABEL_92;
      }
      v139 = v17;
      v140 = sub_247205E98();
      os_log_type_t v141 = sub_247206188();
      if (os_log_type_enabled(v140, v141))
      {
        v142 = (uint8_t *)swift_slowAlloc();
        uint64_t v143 = swift_slowAlloc();
        *(void *)&long long v170 = v143;
        *(_DWORD *)v142 = 136315138;
        unint64_t v144 = v155;
        swift_bridgeObjectRetain();
        v174[0] = sub_2471F3F68(v156, v144, (uint64_t *)&v170);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        v145 = "receivedMultiUserTRPCandidate: Failed to create MultiUserRootTRPCandidateRequestMessage for request: %s.";
LABEL_97:
        _os_log_impl(&dword_2471B4000, v140, v141, v145, v142, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v143, -1, -1);
        MEMORY[0x24C54D9C0](v142, -1, -1);

        goto LABEL_99;
      }
    }
    else
    {
      id v137 = objc_allocWithZone((Class)sub_2472056F8());
      uint64_t v138 = sub_247205678();
      if (v138)
      {
        v132 = (void *)v138;
        v133 = sub_247205E98();
        os_log_type_t v134 = sub_247206178();
        if (os_log_type_enabled(v133, v134))
        {
          v135 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v135 = 0;
          v136 = "Posting MultiUserTRPCandidateRequestMessage.";
          goto LABEL_91;
        }
LABEL_92:

        __swift_project_boxed_opaque_existential_1((Class *)((char *)&v17->isa + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher), *(uint64_t *)((char *)&v17[3].isa + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher));
        sub_247205A18();

        goto LABEL_99;
      }
      v139 = v17;
      v140 = sub_247205E98();
      os_log_type_t v141 = sub_247206188();
      if (os_log_type_enabled(v140, v141))
      {
        v142 = (uint8_t *)swift_slowAlloc();
        uint64_t v143 = swift_slowAlloc();
        *(void *)&long long v170 = v143;
        *(_DWORD *)v142 = 136315138;
        unint64_t v146 = v155;
        swift_bridgeObjectRetain();
        v174[0] = sub_2471F3F68(v156, v146, (uint64_t *)&v170);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        v145 = "receivedMultiUserTRPCandidate: Failed to create MultiUserTRPCandidateRequestMessage for request: %s.";
        goto LABEL_97;
      }
    }

    goto LABEL_99;
  }
  a1 = *(NSObject **)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!a1) {
    goto LABEL_84;
  }
LABEL_31:
  unint64_t v5 = 0;
  v167 = (char *)v17 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_sessionState;
  unint64_t v169 = (unint64_t)v17
       + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_immutableSessionState;
  unint64_t v161 = v158 & 0xC000000000000001;
  uint64_t v153 = v158 & 0xFFFFFFFFFFFFFF8;
  unint64_t v152 = v158 + 32;
  uint64_t v4 = (char *)&v170 + 8;
  v154 = (void (**)(id, uint64_t))&v160[1];
  *(void *)&long long v71 = 136315138;
  long long v151 = v71;
  uint64_t v150 = MEMORY[0x263F8EE58] + 8;
  *(void *)&long long v71 = *((void *)v1 + 468);
  long long v149 = v71;
  uint64_t v72 = &off_265208000;
  v160 = a1;
  v168 = (char *)&v170 + 8;
  while (1)
  {
    if (v161)
    {
      uint64_t v74 = (char *)MEMORY[0x24C54D1C0](v5, v158);
    }
    else
    {
      if (v5 >= *(void *)(v153 + 16))
      {
        __break(1u);
LABEL_82:
        __break(1u);
        goto LABEL_83;
      }
      uint64_t v74 = (char *)*(id *)(v152 + 8 * v5);
    }
    os_log_type_t v10 = v74;
    if (__OFADD__(v5++, 1))
    {
      __break(1u);
      goto LABEL_80;
    }
    id v76 = objc_msgSend(v74, sel_trpCandidateId);
    if (!v76)
    {
      uint64_t v1 = v17;
      a1 = sub_247205E98();
      os_log_type_t v104 = sub_247206188();
      uint64_t v12 = v104;
      if (os_log_type_enabled(a1, v104))
      {
        v105 = v10;
        uint64_t v106 = swift_slowAlloc();
        uint64_t v107 = swift_slowAlloc();
        *(void *)&long long v170 = v107;
        *(_DWORD *)uint64_t v106 = v151;
        unint64_t v108 = v155;
        swift_bridgeObjectRetain();
        *(void *)(v106 + 4) = sub_2471F3F68(v156, v108, (uint64_t *)&v170);

        uint64_t v4 = v168;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2471B4000, a1, (os_log_type_t)v12, "receivedMultiUserTRPCandidate: Failed to create TRPCandidateRequestMessage for request: %s as trpCandidateId was not populated in the TRPCandidate. This can have serious side effects.", (uint8_t *)v106, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v107, -1, -1);
        MEMORY[0x24C54D9C0](v106, -1, -1);

        uint64_t v72 = &off_265208000;
      }
      else
      {
      }
      unint64_t v73 = v160;
      goto LABEL_34;
    }
    unint64_t v77 = v76;
    uint64_t v163 = sub_247205FD8();
    unint64_t v79 = v78;

    id v80 = objc_msgSend(v10, sel_userId);
    v164 = v10;
    if (!v80)
    {
      uint64_t v1 = v17;
      swift_bridgeObjectRetain();
      uint64_t v12 = v166;
      a1 = sub_247205E98();
      os_log_type_t v109 = sub_247206188();
      if (os_log_type_enabled(a1, v109))
      {
        uint64_t v12 = swift_slowAlloc();
        uint64_t v110 = swift_slowAlloc();
        *(void *)&long long v170 = v110;
        *(_DWORD *)uint64_t v12 = v149;
        unint64_t v111 = v79;
        unint64_t v112 = v155;
        swift_bridgeObjectRetain();
        *(void *)(v12 + 4) = sub_2471F3F68(v156, v112, (uint64_t *)&v170);

        swift_bridgeObjectRelease();
        *(_WORD *)(v12 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v12 + 14) = sub_2471F3F68(v163, v111, (uint64_t *)&v170);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2471B4000, a1, v109, "receivedMultiUserTRPCandidate: Failed to create TRPCandidateRequestMessage for request: %s as userId was not populated for the TRPCandidate: %s. This can have serious side effects.", (uint8_t *)v12, 0x16u);
        swift_arrayDestroy();
        uint64_t v113 = v110;
        uint64_t v15 = v162;
        MEMORY[0x24C54D9C0](v113, -1, -1);
        MEMORY[0x24C54D9C0](v12, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }

      unint64_t v73 = v160;
      uint64_t v4 = v168;
      goto LABEL_34;
    }
    v81 = v80;
    sub_247205FD8();
    uint64_t v1 = v82;

    sub_247205B48();
    v175 = (void *)MEMORY[0x263F8EE78];
    id v83 = objc_msgSend(v10, sel_tcuList);
    if (!v83)
    {
      __break(1u);
      goto LABEL_102;
    }
    uint64_t v12 = (uint64_t)v83;
    v157 = (void (*)(uint64_t, char *))v5;
    sub_2471CAE98(0, &qword_26B128648);
    uint64_t v84 = sub_2472060E8();

    if ((unint64_t)v84 >> 62)
    {
      if (v84 < 0) {
        uint64_t v12 = v84;
      }
      else {
        uint64_t v12 = v84 & 0xFFFFFFFFFFFFFF8;
      }
      swift_bridgeObjectRetain();
      uint64_t v85 = sub_2472063E8();
      swift_bridgeObjectRelease();
      if (!v85) {
        goto LABEL_72;
      }
    }
    else
    {
      uint64_t v85 = *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v85) {
        goto LABEL_72;
      }
    }
    if (v85 < 1) {
      goto LABEL_82;
    }
    uint64_t v86 = 0;
    unint64_t v87 = v79;
    do
    {
      if ((v84 & 0xC000000000000001) != 0) {
        id v91 = (id)MEMORY[0x24C54D1C0](v86, v84);
      }
      else {
        id v91 = *(id *)(v84 + 8 * v86 + 32);
      }
      v92 = v91;
      id v93 = [v91 (SEL)v72[252]];
      if (v93)
      {

        *(void *)&long long v170 = v92;
        sub_2471CA8E4(v169, (uint64_t)v4);
        v94 = v175;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v94 = sub_2471CE3E4(0, v94[2] + 1, 1, v94);
        }
        unint64_t v96 = v94[2];
        unint64_t v95 = v94[3];
        if (v96 >= v95 >> 1) {
          v94 = sub_2471CE3E4((void *)(v95 > 1), v96 + 1, 1, v94);
        }
        v94[2] = v96 + 1;
        v88 = &v94[6 * v96];
        long long v89 = v170;
        long long v90 = v172;
        v88[3] = v171;
        v88[4] = v90;
        v88[2] = v89;
        v175 = v94;
      }
      else
      {
        sub_2471CA8E4((uint64_t)v167, (uint64_t)v174);
        __swift_project_boxed_opaque_existential_1(v174, v174[3]);
        id v97 = v92;
        uint64_t v4 = v168;
        sub_247205B18();
        *(void *)&long long v170 = v97;
        sub_2471CA8BC(&v173, (uint64_t)v4);
        v98 = v175;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v98 = sub_2471CE3E4(0, v98[2] + 1, 1, v98);
        }
        unint64_t v100 = v98[2];
        unint64_t v99 = v98[3];
        if (v100 >= v99 >> 1) {
          v98 = sub_2471CE3E4((void *)(v99 > 1), v100 + 1, 1, v98);
        }
        v98[2] = v100 + 1;
        v101 = &v98[6 * v100];
        long long v102 = v170;
        long long v103 = v172;
        v101[3] = v171;
        v101[4] = v103;
        v101[2] = v102;

        v175 = v98;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
        uint64_t v72 = &off_265208000;
      }
      ++v86;
      unint64_t v79 = v87;
    }
    while (v85 != v86);
LABEL_72:
    uint64_t v114 = swift_bridgeObjectRelease();
    MEMORY[0x270FA5388](v114);
    uint64_t v17 = v165;
    uint64_t v15 = v162;
    *(&v147 - 6) = (uint64_t)v165;
    *(&v147 - 5) = (uint64_t)v15;
    *(&v147 - 4) = v163;
    *(&v147 - 3) = v79;
    *(&v147 - 2) = (uint64_t)&v175;
    id v115 = objc_allocWithZone((Class)sub_247205268());
    uint64_t v116 = sub_2472051E8();
    swift_bridgeObjectRelease();
    if (!v116) {
      break;
    }
    uint64_t v1 = (char *)sub_247205B58();
    uint64_t v118 = v117;
    unint64_t v119 = v176;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v170 = v119;
    unint64_t v176 = 0x8000000000000000;
    uint64_t v12 = (uint64_t)&v170;
    sub_2471FE8FC(v116, (uint64_t)v1, v118, isUniquelyReferenced_nonNull_native);
    a1 = v176;
    unint64_t v176 = v170;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*v154)(v15, v159);
    swift_bridgeObjectRelease();
    unint64_t v73 = v160;
    unint64_t v5 = (unint64_t)v157;
LABEL_34:
    if (v5 == v73) {
      goto LABEL_84;
    }
  }
  swift_bridgeObjectRelease();
  v121 = v17;
  v122 = sub_247205E98();
  os_log_type_t v123 = sub_247206188();
  if (os_log_type_enabled(v122, v123))
  {
    v124 = (uint8_t *)swift_slowAlloc();
    uint64_t v125 = swift_slowAlloc();
    *(void *)&long long v170 = v125;
    *(_DWORD *)v124 = v151;
    unint64_t v126 = v155;
    swift_bridgeObjectRetain();
    v174[0] = sub_2471F3F68(v156, v126, (uint64_t *)&v170);
    uint64_t v15 = v162;
    sub_2472062B8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v122, v123, "receivedMultiUserTRPCandidate: Failed to create TRPCandidateRequestMessage for request: %s.", v124, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v125, -1, -1);
    MEMORY[0x24C54D9C0](v124, -1, -1);
  }
  else
  {
  }
  (*v154)(v15, v159);
  swift_bridgeObjectRelease();
LABEL_99:
  swift_bridgeObjectRelease();
}

void sub_2471C4D34(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_247205C78();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v122 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_247205EA8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v122 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v122 - v13;
  if (v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMedocEnabled] == 1)
  {
    uint64_t v127 = v7;
    uint64_t v128 = v5;
    uint64_t v129 = v4;
    id v15 = objc_msgSend(a1, sel_requestId);
    if (!v15)
    {
LABEL_8:
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v23 = __swift_project_value_buffer(v8, (uint64_t)qword_26B128910);
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v23, v8);
      id v24 = a1;
      os_log_t v25 = v2;
      uint64_t v26 = v9;
      id v27 = v24;
      uint64_t v2 = v25;
      uint64_t v28 = sub_247205E98();
      int v29 = sub_247206178();
      if (!os_log_type_enabled(v28, (os_log_type_t)v29))
      {

        (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v8);
        return;
      }
      LODWORD(v129) = v29;
      os_log_t v130 = (os_log_t)v26;
      uint64_t v30 = swift_slowAlloc();
      uint64_t v128 = swift_slowAlloc();
      *(void *)&long long v131 = v128;
      *(_DWORD *)uint64_t v30 = 136315394;
      id v31 = objc_msgSend(v27, sel_requestId);
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = sub_247205FD8();
        unint64_t v35 = v34;

        v135[0] = sub_2471F3F68(v33, v35, (uint64_t *)&v131);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v30 + 12) = 2080;
        uint64_t v36 = *(void *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
        unint64_t v37 = *(void *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
        swift_bridgeObjectRetain();
        v135[0] = sub_2471F3F68(v36, v37, (uint64_t *)&v131);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2471B4000, v28, (os_log_type_t)v129, "TRPCandidate requestId = %s does not match current requestId = %s", (uint8_t *)v30, 0x16u);
        uint64_t v38 = v128;
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v38, -1, -1);
        MEMORY[0x24C54D9C0](v30, -1, -1);

        ((void (*)(char *, uint64_t))v130[1].isa)(v12, v8);
        return;
      }
      goto LABEL_77;
    }
    uint64_t v16 = v15;
    uint64_t v17 = sub_247205FD8();
    uint64_t v19 = v18;

    uint64_t v20 = *(void *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
    BOOL v21 = v17 == v20 && v19 == *(void *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
    unint64_t v124 = *(void *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
    uint64_t v123 = v20;
    if (v21)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v22 = sub_2472064A8();
      swift_bridgeObjectRelease();
      if ((v22 & 1) == 0) {
        goto LABEL_8;
      }
    }
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v42 = __swift_project_value_buffer(v8, (uint64_t)qword_26B128910);
    BOOL v43 = *(void (**)(char *))(v9 + 16);
    v122[1] = v42;
    v43(v14);
    unint64_t v44 = a1;
    uint64_t v45 = sub_247205E98();
    os_log_type_t v46 = sub_247206178();
    BOOL v47 = os_log_type_enabled(v45, v46);
    unint64_t v126 = v2;
    uint64_t v125 = v44;
    if (v47)
    {
      os_log_t v130 = (os_log_t)v9;
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      id v27 = (id)swift_slowAlloc();
      *(void *)&long long v131 = v27;
      *(_DWORD *)uint64_t v48 = 136315138;
      id v49 = objc_msgSend(v44, sel_trpCandidateId);
      if (!v49)
      {
LABEL_78:

        __break(1u);
        goto LABEL_79;
      }
      unint64_t v50 = v49;
      uint64_t v51 = sub_247205FD8();
      uint64_t v2 = v52;

      v135[0] = sub_2471F3F68(v51, (unint64_t)v2, (uint64_t *)&v131);
      sub_2472062B8();
      unint64_t v44 = v125;

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v45, v46, "Received TRPCandidatePackage with trpCandidateId: %s", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v27, -1, -1);
      MEMORY[0x24C54D9C0](v48, -1, -1);

      ((void (*)(char *, uint64_t))v130[1].isa)(v14, v8);
    }
    else
    {

      uint64_t v53 = *(void (**)(char *, uint64_t))(v9 + 8);
      id v27 = (id)(v9 + 8);
      v53(v14, v8);
    }
    v136[0] = MEMORY[0x263F8EE78];
    id v54 = objc_msgSend(v44, sel_tcuList);
    if (!v54)
    {
      __break(1u);
LABEL_77:

      __break(1u);
      goto LABEL_78;
    }
    v55 = v54;
    sub_2471CAE98(0, &qword_26B128648);
    unint64_t v56 = sub_2472060E8();

    if (v56 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_2472063E8();
      swift_bridgeObjectRelease();
      if (!v57) {
        goto LABEL_49;
      }
    }
    else
    {
      uint64_t v57 = *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v57) {
        goto LABEL_49;
      }
    }
    if (v57 < 1)
    {
      __break(1u);
LABEL_75:
      swift_once();
LABEL_63:
      uint64_t v101 = v129;
      uint64_t v102 = __swift_project_value_buffer(v129, (uint64_t)qword_26B1288F8);
      long long v103 = v127;
      uint64_t v104 = v128;
      (*(void (**)(char *, uint64_t, uint64_t))(v128 + 16))(v127, v102, v101);
      uint64_t v105 = swift_allocObject();
      *(void *)(v105 + 16) = v44;
      *(void *)(v105 + 24) = v27;
      id v106 = v27;
      uint64_t v107 = v44;
      sub_247205C48();
      swift_release();
      (*(void (**)(char *, uint64_t))(v104 + 8))(v103, v101);
LABEL_73:
      swift_bridgeObjectRelease();
      return;
    }
    uint64_t v58 = 0;
    os_log_t v130 = (os_log_t)&v126[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_sessionState];
    uint64_t v59 = (uint64_t)&v126[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_immutableSessionState];
    do
    {
      if ((v56 & 0xC000000000000001) != 0) {
        id v63 = (id)MEMORY[0x24C54D1C0](v58, v56);
      }
      else {
        id v63 = *(id *)(v56 + 8 * v58 + 32);
      }
      uint64_t v64 = v63;
      id v65 = objc_msgSend(v63, sel_prevTCUIds);
      if (v65)
      {

        *(void *)&long long v131 = v64;
        sub_2471CA8E4(v59, (uint64_t)&v131 + 8);
        id v66 = (void *)v136[0];
        id v67 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v66 = sub_2471CE3E4(0, v66[2] + 1, 1, v66);
        }
        unint64_t v69 = v66[2];
        unint64_t v68 = v66[3];
        if (v69 >= v68 >> 1) {
          id v66 = sub_2471CE3E4((void *)(v68 > 1), v69 + 1, 1, v66);
        }
        v66[2] = v69 + 1;
        uint64_t v60 = &v66[6 * v69];
        long long v61 = v131;
        long long v62 = v133;
        v60[3] = v132;
        v60[4] = v62;
        v60[2] = v61;

        v136[0] = v66;
      }
      else
      {
        sub_2471CA8E4((uint64_t)v130, (uint64_t)v135);
        __swift_project_boxed_opaque_existential_1(v135, v135[3]);
        id v70 = v64;
        sub_247205B18();
        *(void *)&long long v131 = v70;
        sub_2471CA8BC(&v134, (uint64_t)&v131 + 8);
        long long v71 = (void *)v136[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          long long v71 = sub_2471CE3E4(0, v71[2] + 1, 1, v71);
        }
        unint64_t v73 = v71[2];
        unint64_t v72 = v71[3];
        if (v73 >= v72 >> 1) {
          long long v71 = sub_2471CE3E4((void *)(v72 > 1), v73 + 1, 1, v71);
        }
        v71[2] = v73 + 1;
        uint64_t v74 = &v71[6 * v73];
        long long v75 = v131;
        long long v76 = v133;
        v74[3] = v132;
        v74[4] = v76;
        v74[2] = v75;

        v136[0] = v71;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v135);
      }
      ++v58;
    }
    while (v57 != v58);
LABEL_49:
    uint64_t v77 = swift_bridgeObjectRelease();
    unint64_t v44 = v126;
    MEMORY[0x270FA5388](v77);
    id v27 = v125;
    v122[-4] = v44;
    v122[-3] = v27;
    v122[-2] = v136;
    if (v78 == 1)
    {
      id v79 = objc_allocWithZone((Class)sub_247205528());
      uint64_t v80 = sub_2472054A8();
      v81 = &off_265208000;
      if (v80)
      {
        uint64_t v82 = (void *)v80;
        id v83 = sub_247205E98();
        os_log_type_t v84 = sub_247206178();
        if (os_log_type_enabled(v83, v84))
        {
          uint64_t v85 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v85 = 0;
          _os_log_impl(&dword_2471B4000, v83, v84, "Going to post TRPCandidateForPlannerMessage", v85, 2u);
          MEMORY[0x24C54D9C0](v85, -1, -1);
        }

        uint64_t v86 = &v44[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher];
        __swift_project_boxed_opaque_existential_1(&v44[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher], *(void *)&v44[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24]);
        uint64_t v87 = sub_247205A18();
        MEMORY[0x270FA5388](v87);
        v122[-4] = v44;
        v122[-3] = v27;
        v122[-2] = v136;
        id v88 = objc_allocWithZone((Class)sub_247204D58());
        uint64_t v89 = sub_247204CD8();
        if (!v89)
        {
          uint64_t v116 = v44;
          uint64_t v117 = sub_247205E98();
          os_log_type_t v118 = sub_247206188();
          if (os_log_type_enabled(v117, v118))
          {
            unint64_t v119 = (uint8_t *)swift_slowAlloc();
            uint64_t v120 = swift_slowAlloc();
            *(void *)&long long v131 = v120;
            *(_DWORD *)unint64_t v119 = 136315138;
            unint64_t v121 = v124;
            swift_bridgeObjectRetain();
            v135[0] = sub_2471F3F68(v123, v121, (uint64_t *)&v131);
            sub_2472062B8();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2471B4000, v117, v118, "Failed to create RootTRPCandidateMessage for request: %s", v119, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24C54D9C0](v120, -1, -1);
            MEMORY[0x24C54D9C0](v119, -1, -1);
          }
          else
          {
          }
          goto LABEL_73;
        }
        long long v90 = (void *)v89;
        id v91 = sub_247205E98();
        os_log_type_t v92 = sub_247206178();
        if (os_log_type_enabled(v91, v92))
        {
          id v93 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v93 = 0;
          _os_log_impl(&dword_2471B4000, v91, v92, "Going to post RootTRPCandidateMessage", v93, 2u);
          MEMORY[0x24C54D9C0](v93, -1, -1);
        }

        __swift_project_boxed_opaque_existential_1(v86, *((void *)v86 + 3));
        sub_247205A18();

LABEL_61:
        id v99 = [v27 (SEL)v81[249]];
        if (!v99)
        {
LABEL_79:
          __break(1u);
          return;
        }
        unint64_t v100 = v99;
        sub_247205FD8();

        sub_2471CB9CC();
        swift_bridgeObjectRelease();
        if (qword_26B127C10 == -1) {
          goto LABEL_63;
        }
        goto LABEL_75;
      }
      unint64_t v108 = v44;
      os_log_type_t v109 = sub_247205E98();
      os_log_type_t v110 = sub_247206188();
      if (os_log_type_enabled(v109, v110))
      {
        unint64_t v111 = (uint8_t *)swift_slowAlloc();
        uint64_t v112 = swift_slowAlloc();
        *(void *)&long long v131 = v112;
        *(_DWORD *)unint64_t v111 = 136315138;
        unint64_t v113 = v124;
        swift_bridgeObjectRetain();
        v135[0] = sub_2471F3F68(v123, v113, (uint64_t *)&v131);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        uint64_t v114 = "Failed to create TRPCandidateForPlannerMessage for request: %s";
LABEL_68:
        _os_log_impl(&dword_2471B4000, v109, v110, v114, v111, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v112, -1, -1);
        MEMORY[0x24C54D9C0](v111, -1, -1);

        goto LABEL_73;
      }
    }
    else
    {
      id v94 = objc_allocWithZone((Class)sub_247205268());
      uint64_t v95 = sub_2472051E8();
      v81 = &off_265208000;
      if (v95)
      {
        long long v90 = (void *)v95;
        unint64_t v96 = sub_247205E98();
        os_log_type_t v97 = sub_247206178();
        if (os_log_type_enabled(v96, v97))
        {
          v98 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v98 = 0;
          _os_log_impl(&dword_2471B4000, v96, v97, "Going to post TRPCandidateMessage", v98, 2u);
          MEMORY[0x24C54D9C0](v98, -1, -1);
        }

        __swift_project_boxed_opaque_existential_1(&v44[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher], *(void *)&v44[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24]);
        sub_247205A18();
        goto LABEL_61;
      }
      unint64_t v108 = v44;
      os_log_type_t v109 = sub_247205E98();
      os_log_type_t v110 = sub_247206188();
      if (os_log_type_enabled(v109, v110))
      {
        unint64_t v111 = (uint8_t *)swift_slowAlloc();
        uint64_t v112 = swift_slowAlloc();
        *(void *)&long long v131 = v112;
        *(_DWORD *)unint64_t v111 = 136315138;
        unint64_t v115 = v124;
        swift_bridgeObjectRetain();
        v135[0] = sub_2471F3F68(v123, v115, (uint64_t *)&v131);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        uint64_t v114 = "Failed to create TRPCandidateRequestMessage for request: %s";
        goto LABEL_68;
      }
    }

    goto LABEL_73;
  }
  if (qword_26B128578 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v8, (uint64_t)qword_26B128910);
  os_log_t v130 = (os_log_t)sub_247205E98();
  os_log_type_t v39 = sub_247206188();
  if (os_log_type_enabled(v130, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v40 = 0;
    _os_log_impl(&dword_2471B4000, v130, v39, "Received TRPCandidate Medoc is not enabled. Ignoring.", v40, 2u);
    MEMORY[0x24C54D9C0](v40, -1, -1);
  }
  os_log_t v41 = v130;
}

uint64_t sub_2471C5EAC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2471C5EE4()
{
  return sub_2471BDBBC(*(void *)(v0 + 16));
}

uint64_t sub_2471C5EEC()
{
  return sub_2471BDF2C();
}

void sub_2471C5EF4(void *a1)
{
  uint64_t v3 = sub_247205E88();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v54 - v7;
  uint64_t v9 = sub_247205EA8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*((unsigned char *)&v1->isa + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMedocEnabled) != 1)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v9, (uint64_t)qword_26B128910);
    os_log_t v63 = (os_log_t)sub_247205E98();
    os_log_type_t v20 = sub_247206188();
    if (!os_log_type_enabled(v63, v20)) {
      goto LABEL_17;
    }
    BOOL v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v21 = 0;
    char v22 = "Received ContinuityEnd when Medoc is not enabled.";
    goto LABEL_16;
  }
  uint64_t v60 = v8;
  long long v61 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = v4;
  os_log_t v63 = v1;
  id v13 = objc_msgSend(a1, sel_requestId);
  if (!v13)
  {
LABEL_8:
    if (qword_26B128578 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v9, (uint64_t)qword_26B128910);
    os_log_t v63 = (os_log_t)sub_247205E98();
    os_log_type_t v20 = sub_247206198();
    if (!os_log_type_enabled(v63, v20)) {
      goto LABEL_17;
    }
    BOOL v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v21 = 0;
    char v22 = "ContinuityEnd requestId does not match current requestId";
LABEL_16:
    _os_log_impl(&dword_2471B4000, v63, v20, v22, v21, 2u);
    MEMORY[0x24C54D9C0](v21, -1, -1);
LABEL_17:
    os_log_t v23 = v63;

    return;
  }
  uint64_t v14 = v13;
  id v15 = (objc_class *)sub_247205FD8();
  uint64_t v17 = v16;

  if (v15 == *(objc_class **)((char *)&v63->isa + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId)
    && v17 == *(objc_class **)((char *)&v63[1].isa
                             + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v19 = sub_2472064A8();
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0) {
      goto LABEL_8;
    }
  }
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v24 = __swift_project_value_buffer(v9, (uint64_t)qword_26B128910);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v24, v9);
  id v25 = a1;
  uint64_t v26 = sub_247205E98();
  int v27 = sub_247206178();
  BOOL v28 = os_log_type_enabled(v26, (os_log_type_t)v27);
  id v58 = v25;
  uint64_t v59 = v3;
  if (v28)
  {
    int v56 = v27;
    uint64_t v57 = v24;
    int v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v55 = swift_slowAlloc();
    uint64_t v65 = v55;
    *(_DWORD *)int v29 = 136315138;
    id v30 = objc_msgSend(v25, sel_lastTRPCandidateId);
    id v31 = v25;
    if (!v30)
    {

      __break(1u);
      return;
    }
    uint64_t v32 = v30;
    id v54 = v29 + 4;
    uint64_t v33 = sub_247205FD8();
    unint64_t v35 = v34;

    uint64_t v64 = sub_2471F3F68(v33, v35, &v65);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v26, (os_log_type_t)v56, "Received ContinuityEnd with lastTRPCandidateId: %s", v29, 0xCu);
    uint64_t v36 = v55;
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v36, -1, -1);
    MEMORY[0x24C54D9C0](v29, -1, -1);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  unint64_t v37 = sub_247205E98();
  os_log_type_t v38 = sub_247206178();
  BOOL v39 = os_log_type_enabled(v37, v38);
  uint64_t v40 = v62;
  if (v39)
  {
    os_log_t v41 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_t v41 = 0;
    _os_log_impl(&dword_2471B4000, v37, v38, "Will wait on Myriad selection..", v41, 2u);
    MEMORY[0x24C54D9C0](v41, -1, -1);
  }

  if (qword_26B128378 != -1) {
    swift_once();
  }
  id v42 = (id)qword_26B128778;
  BOOL v43 = v60;
  sub_247205E68();
  sub_247206228();
  id v44 = (id)qword_26B128778;
  sub_247205E48();

  if (qword_26B128550 != -1) {
    swift_once();
  }
  uint64_t v45 = (void *)unk_26B128540;
  uint64_t v57 = qword_26B128538[0];
  uint64_t v46 = swift_allocObject();
  swift_unknownObjectWeakInit();
  BOOL v47 = v61;
  uint64_t v48 = v59;
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v61, v43, v59);
  unint64_t v49 = (*(unsigned __int8 *)(v40 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  unint64_t v50 = (v5 + v49 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v51 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v40 + 32))(v51 + v49, v47, v48);
  *(void *)(v51 + v50) = v46;
  unint64_t v52 = v58;
  *(void *)(v51 + ((v50 + 15) & 0xFFFFFFFFFFFFFFF8)) = v58;
  id v53 = v52;
  swift_retain();
  sub_2471CBC44(v57, v45, (uint64_t)sub_2471CAA08, v51);
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v43, v48);
  swift_release();
}

void sub_2471C66BC(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_247204938();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_247205EA8();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B128910);
  uint64_t v9 = sub_247205E98();
  os_log_type_t v10 = sub_247206178();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_2471B4000, v9, v10, "Received requestAttentionAssetDownload", v11, 2u);
    MEMORY[0x24C54D9C0](v11, -1, -1);
  }

  if (a1)
  {
    MEMORY[0x270FA5388](v12);
    *(&v29 - 2) = v2;
    id v13 = objc_allocWithZone((Class)sub_247205808());
    uint64_t v14 = sub_247205638();
    if (v14)
    {
      id v15 = (char *)v14;
      uint64_t v16 = sub_247205E98();
      os_log_type_t v17 = sub_247206178();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_2471B4000, v16, v17, "Going to post MagusAttentionAssetDownloadRequestedMessage", v18, 2u);
        MEMORY[0x24C54D9C0](v18, -1, -1);
      }

      __swift_project_boxed_opaque_existential_1(&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher], *(void *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24]);
      sub_247205A18();
    }
    else
    {
      id v15 = v2;
      char v22 = sub_247205E98();
      os_log_type_t v23 = sub_247206188();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        os_log_t v30 = (os_log_t)swift_slowAlloc();
        os_log_t v32 = v30;
        *(_DWORD *)uint64_t v24 = 136315138;
        int v29 = v24 + 4;
        (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, &v15[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId], v4);
        sub_2471C2254((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
        uint64_t v25 = sub_247206478();
        unint64_t v27 = v26;
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        uint64_t v31 = sub_2471F3F68(v25, v27, (uint64_t *)&v32);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2471B4000, v22, v23, "Failed to create MagusAttentionAssetDownloadRequestedMessage for session: %s", v24, 0xCu);
        os_log_t v28 = v30;
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v28, -1, -1);
        MEMORY[0x24C54D9C0](v24, -1, -1);

        return;
      }
    }
  }
  else
  {
    os_log_t v30 = (os_log_t)sub_247205E98();
    os_log_type_t v19 = sub_247206178();
    if (os_log_type_enabled(v30, v19))
    {
      os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v20 = 67109120;
      LODWORD(v32) = 0;
      sub_2472062B8();
      _os_log_impl(&dword_2471B4000, v30, v19, "requestDownload = %{BOOL}d, returning.", v20, 8u);
      MEMORY[0x24C54D9C0](v20, -1, -1);
    }
    else
    {
      os_log_t v21 = v30;
    }
  }
}

void sub_2471C6BC8(uint64_t a1, unint64_t a2, NSObject *a3, uint64_t a4, double a5)
{
  uint64_t v6 = v5;
  os_log_t v51 = a3;
  uint64_t v11 = sub_247205C78();
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v5[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMedocEnabled])
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_247205EA8();
    __swift_project_value_buffer(v15, (uint64_t)qword_26B128910);
    os_log_t v51 = (os_log_t)sub_247205E98();
    os_log_type_t v16 = sub_247206188();
    if (os_log_type_enabled(v51, v16))
    {
      os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v17 = 0;
      _os_log_impl(&dword_2471B4000, v51, v16, "Received Eager RC in Medoc flow. Ignoring.", v17, 2u);
      MEMORY[0x24C54D9C0](v17, -1, -1);
    }
    os_log_t v18 = v51;
  }
  else
  {
    uint64_t v49 = v12;
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_247205EA8();
    __swift_project_value_buffer(v19, (uint64_t)qword_26B128910);
    os_log_type_t v20 = sub_247205E98();
    os_log_type_t v21 = sub_247206178();
    BOOL v22 = os_log_type_enabled(v20, v21);
    uint64_t v50 = a1;
    if (v22)
    {
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 134218240;
      double v53 = *(double *)&v51;
      sub_2472062B8();
      *(_WORD *)(v23 + 12) = 2048;
      double v53 = a5;
      a1 = v50;
      sub_2472062B8();
      _os_log_impl(&dword_2471B4000, v20, v21, "Received eager recognition candidate rcId:%lu processedDuration: %f", (uint8_t *)v23, 0x16u);
      MEMORY[0x24C54D9C0](v23, -1, -1);
    }

    BOOL v24 = *(void *)&v6[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId] == a1
       && *(void *)&v6[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8] == a2;
    if (v24 || (sub_2472064A8() & 1) != 0)
    {
      double v53 = *(double *)&v51;
      uint64_t v25 = sub_247206478();
      uint64_t v27 = v26;
      uint64_t v28 = MEMORY[0x270FA5388](v25);
      *(&v48 - 4) = (uint64_t)v6;
      *(&v48 - 3) = v28;
      *(&v48 - 2) = v29;
      *(&v48 - 1) = a4;
      id v30 = objc_allocWithZone((Class)sub_247204F68());
      uint64_t v31 = sub_247204EE8();
      if (v31)
      {
        os_log_t v32 = v31;
        uint64_t v33 = v50;
        sub_2471CB87C(v50, a2, v25, v27);
        swift_bridgeObjectRelease();
        if (qword_26B127C10 != -1) {
          swift_once();
        }
        uint64_t v34 = __swift_project_value_buffer(v11, (uint64_t)qword_26B1288F8);
        uint64_t v35 = v49;
        (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v14, v34, v11);
        uint64_t v36 = (void *)swift_allocObject();
        v36[2] = v6;
        v36[3] = v33;
        os_log_t v37 = v51;
        v36[4] = a2;
        v36[5] = v37;
        v6;
        swift_bridgeObjectRetain();
        sub_247205C48();
        swift_release();
        (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v11);
        sub_2471D1170(v32);

        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain_n();
        os_log_type_t v38 = sub_247205E98();
        os_log_type_t v39 = sub_247206188();
        if (os_log_type_enabled(v38, v39))
        {
          uint64_t v40 = (uint8_t *)swift_slowAlloc();
          uint64_t v41 = swift_slowAlloc();
          double v53 = *(double *)&v41;
          *(_DWORD *)uint64_t v40 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v52 = sub_2471F3F68(v50, a2, (uint64_t *)&v53);
          sub_2472062B8();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2471B4000, v38, v39, "Failed to create AsrResultCandidateMessage for request: %s", v40, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v41, -1, -1);
          MEMORY[0x24C54D9C0](v40, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
      }
    }
    else
    {
      id v42 = sub_247205E98();
      os_log_type_t v43 = sub_247206188();
      if (os_log_type_enabled(v42, v43))
      {
        id v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v44 = 0;
        _os_log_impl(&dword_2471B4000, v42, v43, "Response requestId does not match current requestId", v44, 2u);
        MEMORY[0x24C54D9C0](v44, -1, -1);
      }

      if (qword_26B127C10 != -1) {
        swift_once();
      }
      uint64_t v45 = __swift_project_value_buffer(v11, (uint64_t)qword_26B1288F8);
      uint64_t v46 = v49;
      (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v14, v45, v11);
      BOOL v47 = (void *)swift_allocObject();
      v47[2] = v50;
      v47[3] = a2;
      v47[4] = v51;
      swift_bridgeObjectRetain();
      sub_247205C58();
      swift_release();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v14, v11);
    }
  }
}

void sub_2471C7308(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5 = v4;
  LODWORD(v79) = a4;
  uint64_t v82 = a3;
  uint64_t v8 = sub_247205C78();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v81 = (char *)&v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_247205E88();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_247205EA8();
  uint64_t v80 = __swift_project_value_buffer(v15, (uint64_t)qword_26B128910);
  os_log_type_t v16 = sub_247205E98();
  os_log_type_t v17 = sub_247206178();
  if (os_log_type_enabled(v16, v17))
  {
    os_log_t v18 = (uint8_t *)swift_slowAlloc();
    int v78 = (void (*)(char *, uint64_t, uint64_t))v11;
    uint64_t v19 = v5;
    uint64_t v20 = v9;
    uint64_t v21 = v8;
    BOOL v22 = v18;
    *(_DWORD *)os_log_t v18 = 134217984;
    uint64_t v84 = v82;
    sub_2472062B8();
    _os_log_impl(&dword_2471B4000, v16, v17, "Received recognition candidate accepted for rcId:%lu", v22, 0xCu);
    uint64_t v23 = v22;
    uint64_t v8 = v21;
    uint64_t v9 = v20;
    uint64_t v5 = v19;
    uint64_t v11 = (uint64_t)v78;
    MEMORY[0x24C54D9C0](v23, -1, -1);
  }

  sub_247206238();
  if (qword_26B128378 != -1) {
    swift_once();
  }
  id v24 = (id)qword_26B128778;
  sub_247205E78();
  sub_247205E58();

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (qword_26B127C10 != -1) {
    swift_once();
  }
  uint64_t v25 = __swift_project_value_buffer(v8, (uint64_t)qword_26B1288F8);
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v27 = v81;
  v26(v81, v25, v8);
  uint64_t v28 = (void *)swift_allocObject();
  v28[2] = v5;
  v28[3] = a1;
  uint64_t v29 = v82;
  v28[4] = a2;
  v28[5] = v29;
  id v30 = v5;
  swift_bridgeObjectRetain();
  sub_247205C48();
  swift_release();
  uint64_t v31 = *(void (**)(char *, uint64_t))(v9 + 8);
  v31(v27, v8);
  if ((*(void *)&v30[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId] != a1
     || *(void *)&v30[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8] != a2)
    && (sub_2472064A8() & 1) == 0)
  {
    id v79 = v31;
    BOOL v47 = sub_247205E98();
    os_log_type_t v48 = sub_247206188();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      int v78 = v26;
      uint64_t v50 = v8;
      os_log_t v51 = v49;
      *(_WORD *)uint64_t v49 = 0;
      _os_log_impl(&dword_2471B4000, v47, v48, "Response requestId does not match current requestId", v49, 2u);
      uint64_t v52 = v51;
      uint64_t v8 = v50;
      uint64_t v26 = v78;
      MEMORY[0x24C54D9C0](v52, -1, -1);
    }

    double v53 = v81;
    v26(v81, v25, v8);
    id v54 = (void *)swift_allocObject();
    v54[2] = a1;
    v54[3] = a2;
    uint64_t v55 = v82;
    v54[4] = v30;
    v54[5] = v55;
    int v56 = v30;
    swift_bridgeObjectRetain();
    goto LABEL_25;
  }
  int v78 = v26;
  uint64_t v84 = v82;
  uint64_t v32 = sub_247206478();
  uint64_t v34 = v33;
  if (v30[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMUXEnabled] != 1)
  {
    uint64_t v43 = MEMORY[0x270FA5388](v32);
    *(&v77 - 4) = (uint64_t)v30;
    *(&v77 - 3) = v43;
    *(&v77 - 2) = v34;
    *((unsigned char *)&v77 - 8) = v79 & 1;
    id v44 = objc_allocWithZone((Class)sub_247204B98());
    uint64_t v45 = sub_247204B88();
    swift_bridgeObjectRelease();
    if (!v45)
    {
      swift_bridgeObjectRetain_n();
      os_log_t v63 = sub_247205E98();
      os_log_type_t v64 = sub_247206188();
      if (os_log_type_enabled(v63, v64))
      {
        uint64_t v65 = a1;
        id v66 = (uint8_t *)swift_slowAlloc();
        uint64_t v67 = swift_slowAlloc();
        uint64_t v84 = v67;
        *(_DWORD *)id v66 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v83 = sub_2471F3F68(v65, a2, &v84);
        sub_2472062B8();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2471B4000, v63, v64, "Failed to create ResultSelectedMessage for request: %s", v66, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v67, -1, -1);
        MEMORY[0x24C54D9C0](v66, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      return;
    }
    uint64_t v46 = *(void **)&v30[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg];
    *(void *)&v30[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg] = v45;
LABEL_30:

    sub_2471BD008();
    return;
  }
  uint64_t v77 = v8;
  uint64_t v35 = *(void **)&v30[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard];
  if (!v35)
  {
    id v79 = v31;
    swift_bridgeObjectRelease();
    uint64_t v57 = sub_247205E98();
    os_log_type_t v58 = sub_247206188();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v59 = 0;
      _os_log_impl(&dword_2471B4000, v57, v58, "Voice id card is nil. This is due to malformed homemembers list", v59, 2u);
      MEMORY[0x24C54D9C0](v59, -1, -1);
    }

    double v53 = v81;
    uint64_t v8 = v77;
    v78(v81, v25, v77);
    uint64_t v60 = (void *)swift_allocObject();
    v60[2] = v30;
    v60[3] = a1;
    uint64_t v61 = v82;
    v60[4] = a2;
    v60[5] = v61;
    uint64_t v62 = v30;
    swift_bridgeObjectRetain();
LABEL_25:
    sub_247205C58();
    swift_release();
    v79(v53, v8);
    return;
  }
  uint64_t v36 = a1;
  if (v30[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isIdentityScoreConsumptionEnabled] != 1)
  {
    uint64_t v68 = MEMORY[0x270FA5388](v32);
    *(&v77 - 6) = (uint64_t)v30;
    *(&v77 - 5) = v68;
    *(&v77 - 4) = v34;
    *((unsigned char *)&v77 - 24) = v69;
    *(&v77 - 2) = (uint64_t)v35;
    objc_allocWithZone((Class)sub_247204E58());
    id v70 = v35;
    uint64_t v40 = (void *)sub_247204DD8();
    swift_bridgeObjectRelease();
    unint64_t v41 = 0x80000002472080D0;
    if (!v40)
    {
      uint64_t v42 = 0xD000000000000018;
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  uint64_t v37 = MEMORY[0x270FA5388](v32);
  *(&v77 - 4) = (uint64_t)v30;
  *(&v77 - 3) = v37;
  *(&v77 - 2) = v34;
  *((unsigned char *)&v77 - 8) = v38;
  objc_allocWithZone((Class)sub_247205668());
  id v39 = v35;
  uint64_t v40 = (void *)sub_247204B88();
  swift_bridgeObjectRelease();
  unint64_t v41 = 0x80000002472080F0;
  if (v40)
  {
LABEL_29:
    id v71 = v40;
    swift_bridgeObjectRelease();
    uint64_t v46 = *(void **)&v30[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg];
    *(void *)&v30[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg] = v40;

    goto LABEL_30;
  }
  uint64_t v42 = 0xD000000000000023;
LABEL_33:
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  unint64_t v72 = sub_247205E98();
  unint64_t v73 = a2;
  os_log_type_t v74 = sub_247206188();
  if (os_log_type_enabled(v72, v74))
  {
    uint64_t v75 = swift_slowAlloc();
    uint64_t v76 = swift_slowAlloc();
    uint64_t v84 = v76;
    *(_DWORD *)uint64_t v75 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v83 = sub_2471F3F68(v42, v41, &v84);
    sub_2472062B8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v75 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v83 = sub_2471F3F68(v36, v73, &v84);
    sub_2472062B8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2471B4000, v72, v74, "Failed to create %s for request: %s", (uint8_t *)v75, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v76, -1, -1);
    MEMORY[0x24C54D9C0](v75, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

void sub_2471C7E04(void *a1)
{
  uint64_t v2 = v1;
  void aBlock[6] = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_247204938();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_247205EA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_26B128910);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  id v13 = a1;
  uint64_t v14 = sub_247205E98();
  int v63 = sub_247206178();
  if (!os_log_type_enabled(v14, (os_log_type_t)v63))
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
LABEL_13:
    v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_hasfirstVoiceIdScoreCardArrived] = 1;
    id v30 = *(void **)&v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard];
    *(void *)&v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard] = v13;
    id v31 = v13;

    if (v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isUOS] == 1)
    {
      id v33 = (id)sub_2472061F8();
      sub_247204928();
      sub_2472048F8();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      uint64_t v34 = (void *)sub_247205FC8();
      swift_bridgeObjectRelease();
      objc_msgSend(v33, sel_setAceId_, v34);

      id v35 = v33;
      uint64_t v36 = (void *)sub_247205FC8();
      objc_msgSend(v35, sel_setRefId_, v36);

      uint64_t v37 = *(void **)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper];
      uint64_t v38 = swift_allocObject();
      *(void *)(v38 + 16) = v35;
      aBlock[4] = (uint64_t)sub_2471CAE20;
      aBlock[5] = v38;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_2471DC9B8;
      aBlock[3] = (uint64_t)&block_descriptor_215;
      id v39 = _Block_copy(aBlock);
      id v40 = v35;
      swift_release();
      objc_msgSend(v37, sel_handleCommand_completion_, v40, v39);
      _Block_release(v39);
    }
    if ((v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isIdentityScoreConsumptionEnabled] & 1) != 0
      || v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isIdentityBridgeInstrumentationEnabled] == 1)
    {
      MEMORY[0x270FA5388](v32);
      *(&v54 - 2) = (uint64_t)v2;
      *(&v54 - 1) = (uint64_t)v31;
      id v41 = objc_allocWithZone((Class)sub_247204DC8());
      uint64_t v42 = sub_247204D68();
      if (!v42)
      {
        uint64_t v43 = v2;
        id v44 = sub_247205E98();
        os_log_type_t v45 = sub_247206188();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = (uint8_t *)swift_slowAlloc();
          uint64_t v47 = swift_slowAlloc();
          aBlock[0] = v47;
          *(_DWORD *)uint64_t v46 = 136315138;
          uint64_t v48 = *(void *)&v43[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
          unint64_t v49 = *(void *)&v43[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
          swift_bridgeObjectRetain();
          uint64_t v64 = sub_2471F3F68(v48, v49, aBlock);
          sub_2472062B8();

          swift_bridgeObjectRelease();
          uint64_t v50 = "Failed to create VoiceIdScoreCardMessage for request: %s";
LABEL_24:
          _os_log_impl(&dword_2471B4000, v44, v45, v50, v46, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v47, -1, -1);
          MEMORY[0x24C54D9C0](v46, -1, -1);

          return;
        }
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      MEMORY[0x270FA5388](v32);
      *(&v54 - 2) = (uint64_t)v2;
      *(&v54 - 1) = (uint64_t)v31;
      id v51 = objc_allocWithZone((Class)sub_247205158());
      uint64_t v42 = sub_2472050D8();
      if (!v42)
      {
        uint64_t v43 = v2;
        id v44 = sub_247205E98();
        os_log_type_t v45 = sub_247206188();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = (uint8_t *)swift_slowAlloc();
          uint64_t v47 = swift_slowAlloc();
          aBlock[0] = v47;
          *(_DWORD *)uint64_t v46 = 136315138;
          uint64_t v52 = *(void *)&v43[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
          unint64_t v53 = *(void *)&v43[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
          swift_bridgeObjectRetain();
          uint64_t v64 = sub_2471F3F68(v52, v53, aBlock);
          sub_2472062B8();

          swift_bridgeObjectRelease();
          uint64_t v50 = "Failed to create UserIdentificationMessage for request: %s";
          goto LABEL_24;
        }
        goto LABEL_25;
      }
    }
    uint64_t v43 = (char *)v42;
    __swift_project_boxed_opaque_existential_1(&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher], *(void *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24]);
    sub_247205A18();
LABEL_26:

    return;
  }
  os_log_t v56 = v14;
  uint64_t v57 = v9;
  uint64_t v54 = v8;
  os_log_type_t v58 = v7;
  uint64_t v59 = v5;
  uint64_t v60 = v4;
  uint64_t v61 = v12;
  uint64_t v15 = swift_slowAlloc();
  uint64_t v62 = (void *)swift_slowAlloc();
  uint64_t v55 = swift_slowAlloc();
  aBlock[0] = v55;
  *(_DWORD *)uint64_t v15 = 136315906;
  id v16 = objc_msgSend(v13, sel_spIdKnownUserScores);
  if (v16)
  {
    os_log_type_t v17 = v16;
    sub_2471CAE98(0, (unint64_t *)&unk_26B128690);
    sub_247205F68();

    uint64_t v18 = sub_247205F78();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v64 = sub_2471F3F68(v18, v20, aBlock);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2112;
    id v21 = objc_msgSend(v13, sel_spIdUnknownUserScore);
    id v22 = v21;
    if (v21) {
      uint64_t v64 = (uint64_t)v21;
    }
    else {
      uint64_t v64 = 0;
    }
    sub_2472062B8();
    *uint64_t v62 = v22;

    *(_WORD *)(v15 + 22) = 2048;
    id v23 = objc_msgSend(v13, sel_userIdentityClassification);

    uint64_t v64 = (uint64_t)v23;
    sub_2472062B8();

    *(_WORD *)(v15 + 32) = 2112;
    id v24 = objc_msgSend(v13, sel_spIdAudioProcessedDuration);
    id v25 = v24;
    uint64_t v4 = v60;
    if (v24) {
      uint64_t v64 = (uint64_t)v24;
    }
    else {
      uint64_t v64 = 0;
    }
    sub_2472062B8();
    uint64_t v26 = v54;
    uint64_t v27 = v62;
    v62[1] = v25;

    os_log_t v28 = v56;
    _os_log_impl(&dword_2471B4000, v56, (os_log_type_t)v63, "Received voiceIdScoreCard.\nKnownUserScores=%s, UnknownUserScore=%@, UserClassification=%ld, Audio Duration= %@", (uint8_t *)v15, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v27, -1, -1);
    uint64_t v29 = v55;
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v29, -1, -1);
    MEMORY[0x24C54D9C0](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v57 + 8))(v11, v26);
    uint64_t v7 = v58;
    uint64_t v5 = v59;
    goto LABEL_13;
  }

  __break(1u);
}

void sub_2471C8824()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_247204938();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  os_log_type_t v110 = (char *)&v104 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v104 - v6;
  sub_247204928();
  unint64_t v108 = (void *)sub_2472048F8();
  uint64_t v9 = v8;
  uint64_t v10 = *(void (**)(char *, void *))(v3 + 8);
  uint64_t v112 = (void *)(v3 + 8);
  unint64_t v113 = (void *)v2;
  unint64_t v111 = v10;
  v10(v7, (void *)v2);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28678]), sel_init);
  id v12 = objc_allocWithZone(MEMORY[0x263F28648]);
  id v13 = (char *)v11;
  id v14 = objc_msgSend(v12, sel_init);
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28668]), sel_initWithRecognition_rawRecognition_audioAnalytics_isFinal_utteranceStart_, v13, v13, v14, 0, 0.0);

  if (!v15)
  {
    swift_bridgeObjectRelease();
    if (qword_26B128578 != -1) {
LABEL_37:
    }
      swift_once();
    uint64_t v34 = sub_247205EA8();
    __swift_project_value_buffer(v34, (uint64_t)qword_26B128910);
    id v35 = sub_247205E98();
    os_log_type_t v36 = sub_247206188();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_2471B4000, v35, v36, "Failed to create speechPackage", v37, 2u);
      MEMORY[0x24C54D9C0](v37, -1, -1);

      return;
    }

    goto LABEL_33;
  }
  id v106 = v15;
  uint64_t v107 = v9;
  if (v1[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMUXEnabled] != 1)
  {
    uint64_t v38 = v107;
    id v39 = v108;
    id v40 = sub_2471C0100(v108, v107, 0, 0);
    if (v40)
    {
      id v41 = v40;
      uint64_t v105 = v13;
      sub_2471C4D34(v40);

      uint64_t v114 = 0;
      uint64_t v112 = 0;
      goto LABEL_41;
    }
    swift_bridgeObjectRelease();
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_247205EA8();
    __swift_project_value_buffer(v42, (uint64_t)qword_26B128910);
    uint64_t v43 = v1;
    id v44 = sub_247205E98();
    os_log_type_t v45 = sub_247206188();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      uint64_t aBlock = v47;
      *(_DWORD *)uint64_t v46 = 136315138;
      uint64_t v48 = *(void *)&v43[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
      unint64_t v49 = *(void *)&v43[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
      swift_bridgeObjectRetain();
      uint64_t v122 = sub_2471F3F68(v48, v49, &aBlock);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v44, v45, "Failed to create fabricated TRPCandidate for request: %s", v46, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v47, -1, -1);
      MEMORY[0x24C54D9C0](v46, -1, -1);

      return;
    }

LABEL_33:
    return;
  }
  uint64_t v105 = v13;
  uint64_t v122 = MEMORY[0x263F8EE78];
  unint64_t v16 = *(void *)&v1[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_homeMembers];
  if (!(v16 >> 62))
  {
    uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v17) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_2472063E8();
  if (!v17)
  {
LABEL_39:
    swift_bridgeObjectRelease();
    uint64_t v59 = (void *)swift_allocObject();
    uint64_t v38 = v107;
    v59[2] = v108;
    v59[3] = v38;
    v59[4] = &v122;
    v59[5] = v1;
    id v60 = objc_allocWithZone(MEMORY[0x263F70E50]);
    uint64_t v61 = swift_allocObject();
    *(void *)(v61 + 16) = sub_2471CA844;
    *(void *)(v61 + 24) = v59;
    uint64_t v120 = sub_2471CAFE4;
    uint64_t v121 = v61;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v117 = 1107296256;
    os_log_type_t v118 = sub_2471C1FC4;
    unint64_t v119 = &block_descriptor_175;
    uint64_t v62 = _Block_copy(&aBlock);
    int v63 = v1;
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v64 = objc_msgSend(v60, sel_initWithBuilder_, v62);
    _Block_release(v62);
    if (!v64)
    {
      swift_bridgeObjectRelease();
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v86 = sub_247205EA8();
      __swift_project_value_buffer(v86, (uint64_t)qword_26B128910);
      uint64_t v87 = v63;
      id v88 = sub_247205E98();
      os_log_type_t v89 = sub_247206188();
      if (os_log_type_enabled(v88, v89))
      {
        long long v90 = (uint8_t *)swift_slowAlloc();
        uint64_t v91 = swift_slowAlloc();
        uint64_t aBlock = v91;
        *(_DWORD *)long long v90 = 136315138;
        uint64_t v92 = *(void *)&v87[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
        unint64_t v93 = *(void *)&v87[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
        swift_bridgeObjectRetain();
        uint64_t v115 = sub_2471F3F68(v92, v93, &aBlock);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2471B4000, v88, v89, "Failed to create fabricated MultiUserTRPCandidate for request: %s", v90, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v91, -1, -1);
        MEMORY[0x24C54D9C0](v90, -1, -1);

        id v94 = (char *)v106;
      }
      else
      {

        id v94 = v105;
      }

      swift_release();
      swift_bridgeObjectRelease();
      return;
    }
    uint64_t v112 = v59;
    sub_2471C3494(v64);

    swift_bridgeObjectRelease();
    uint64_t v114 = sub_2471CA844;
    id v39 = v108;
LABEL_41:
    uint64_t v65 = (void *)swift_allocObject();
    v65[2] = v39;
    v65[3] = v38;
    v65[4] = v1;
    id v66 = objc_allocWithZone(MEMORY[0x263F70E68]);
    uint64_t v67 = swift_allocObject();
    *(void *)(v67 + 16) = sub_2471CA7AC;
    *(void *)(v67 + 24) = v65;
    unint64_t v113 = v65;
    uint64_t v120 = sub_2471CAFE4;
    uint64_t v121 = v67;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v117 = 1107296256;
    os_log_type_t v118 = (void (*)(uint64_t, void *))sub_2471C2020;
    unint64_t v119 = &block_descriptor_157;
    uint64_t v68 = _Block_copy(&aBlock);
    char v69 = v1;
    swift_bridgeObjectRetain();
    swift_release();
    id v70 = objc_msgSend(v66, sel_initWithBuilder_, v68);
    _Block_release(v68);
    if (v70)
    {
      sub_2471C2E10(v70);
      id v71 = (void *)swift_allocObject();
      v71[2] = v39;
      v71[3] = v38;
      v71[4] = v69;
      id v72 = objc_allocWithZone(MEMORY[0x263F70E48]);
      uint64_t v73 = swift_allocObject();
      *(void *)(v73 + 16) = sub_2471CAF58;
      *(void *)(v73 + 24) = v71;
      uint64_t v120 = sub_2471CAFE4;
      uint64_t v121 = v73;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v117 = 1107296256;
      os_log_type_t v118 = (void (*)(uint64_t, void *))sub_2471C2020;
      unint64_t v119 = &block_descriptor_166;
      os_log_type_t v74 = _Block_copy(&aBlock);
      uint64_t v75 = v69;
      swift_release();
      id v76 = objc_msgSend(v72, sel_initWithBuilder_, v74);
      _Block_release(v74);
      if (v76)
      {
        sub_2471C5EF4(v76);
      }
      else
      {
        if (qword_26B128578 != -1) {
          swift_once();
        }
        uint64_t v95 = sub_247205EA8();
        __swift_project_value_buffer(v95, (uint64_t)qword_26B128910);
        unint64_t v96 = v75;
        os_log_type_t v97 = sub_247205E98();
        os_log_type_t v98 = sub_247206188();
        if (os_log_type_enabled(v97, v98))
        {
          id v99 = (uint8_t *)swift_slowAlloc();
          uint64_t v100 = swift_slowAlloc();
          uint64_t aBlock = v100;
          *(_DWORD *)id v99 = 136315138;
          unint64_t v111 = (void (*)(char *, void *))(v99 + 4);
          uint64_t v101 = *(void *)&v96[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
          unint64_t v102 = *(void *)&v96[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
          swift_bridgeObjectRetain();
          uint64_t v122 = sub_2471F3F68(v101, v102, &aBlock);
          sub_2472062B8();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2471B4000, v97, v98, "Failed to create fabricated ContinuityEnd for request: %s", v99, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v100, -1, -1);
          MEMORY[0x24C54D9C0](v99, -1, -1);

          long long v103 = (char *)v106;
        }
        else
        {

          long long v103 = v105;
        }
      }
      sub_2471CA7DC((uint64_t)v114);
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v77 = sub_247205EA8();
      __swift_project_value_buffer(v77, (uint64_t)qword_26B128910);
      int v78 = v69;
      id v79 = sub_247205E98();
      os_log_type_t v80 = sub_247206188();
      if (os_log_type_enabled(v79, v80))
      {
        v81 = (uint8_t *)swift_slowAlloc();
        uint64_t v82 = swift_slowAlloc();
        uint64_t aBlock = v82;
        *(_DWORD *)v81 = 136315138;
        uint64_t v84 = *(void *)&v78[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
        unint64_t v83 = *(void *)&v78[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
        swift_bridgeObjectRetain();
        uint64_t v122 = sub_2471F3F68(v84, v83, &aBlock);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2471B4000, v79, v80, "Failed to create fabricated TRPDetected for request: %s", v81, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v82, -1, -1);
        MEMORY[0x24C54D9C0](v81, -1, -1);

        uint64_t v85 = (char *)v106;
      }
      else
      {

        uint64_t v85 = v105;
      }

      sub_2471CA7DC((uint64_t)v114);
    }
    swift_release();
    return;
  }
LABEL_5:
  unint64_t v109 = v16 & 0xC000000000000001;
  uint64_t v18 = 4;
  while (1)
  {
    if (v109) {
      unint64_t v19 = (void (*)(void *))MEMORY[0x24C54D1C0](v18 - 4, v16);
    }
    else {
      unint64_t v19 = (void (*)(void *))*(id *)(v16 + 8 * v18);
    }
    uint64_t v114 = v19;
    uint64_t v20 = v18 - 3;
    if (__OFADD__(v18 - 4, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v21 = v16;
    id v13 = v1;
    id v22 = v110;
    sub_247204928();
    id v23 = (void *)sub_2472048F8();
    uint64_t v25 = v24;
    v111(v22, v113);
    id v26 = objc_msgSend(v114, sel_sharedUserId);
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = sub_247205FD8();
      id v30 = v29;
    }
    else
    {
      uint64_t v28 = 0;
      id v30 = 0;
    }
    unint64_t v16 = v21;
    id v31 = (uint8_t *)v28;
    uint64_t v1 = v13;
    id v32 = sub_2471C0100(v23, v25, v31, v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v32) {
      break;
    }
    id v33 = v32;
    MEMORY[0x24C54CF20]();
    if (*(void *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_247206118();
    }
    sub_247206128();
    sub_247206108();

    ++v18;
    if (v20 == v17) {
      goto LABEL_39;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v50 = sub_247205EA8();
  __swift_project_value_buffer(v50, (uint64_t)qword_26B128910);
  id v51 = v13;
  uint64_t v52 = sub_247205E98();
  os_log_type_t v53 = sub_247206188();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    uint64_t v55 = swift_slowAlloc();
    uint64_t aBlock = v55;
    *(_DWORD *)uint64_t v54 = 136315138;
    uint64_t v56 = *(void *)&v51[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
    unint64_t v57 = *(void *)&v51[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
    swift_bridgeObjectRetain();
    uint64_t v115 = sub_2471F3F68(v56, v57, &aBlock);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v52, v53, "Failed to create fabricated UserLevel TRPCandidate for request: %s", v54, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v55, -1, -1);
    MEMORY[0x24C54D9C0](v54, -1, -1);

    os_log_type_t v58 = v114;
  }
  else
  {

    os_log_type_t v58 = (void (*)(void *))v105;
  }

  swift_bridgeObjectRelease();
}

void sub_2471C9878(uint64_t a1, unint64_t a2)
{
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28678]), sel_init);
  id v5 = objc_allocWithZone(MEMORY[0x263F28648]);
  uint64_t v6 = v4;
  id v7 = objc_msgSend(v5, sel_init);
  oslog = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28668]), sel_initWithRecognition_rawRecognition_audioAnalytics_isFinal_utteranceStart_, v6, v6, v7, 0, 0.0);

  if (oslog)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_247205EA8();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B128910);
    uint64_t v9 = sub_247205E98();
    os_log_type_t v10 = sub_247206178();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_2471B4000, v9, v10, "Calling delegate callback with fabricated SpeechPackage", v11, 2u);
      MEMORY[0x24C54D9C0](v11, -1, -1);
    }

    sub_2471C6BC8(a1, a2, 0, (uint64_t)oslog, 0.0);
    id v12 = sub_247205E98();
    os_log_type_t v13 = sub_247206178();
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_2471B4000, v12, v13, "Calling delegate callback with accept for fabricated SpeechPackage", v14, 2u);
      MEMORY[0x24C54D9C0](v14, -1, -1);
    }

    sub_2471C7308(a1, a2, 0, 0);
    goto LABEL_13;
  }
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_247205EA8();
  __swift_project_value_buffer(v15, (uint64_t)qword_26B128910);
  oslog = sub_247205E98();
  os_log_type_t v16 = sub_247206188();
  if (os_log_type_enabled(oslog, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_2471B4000, oslog, v16, "Failed to create speechPackage", v17, 2u);
    MEMORY[0x24C54D9C0](v17, -1, -1);
LABEL_13:
    uint64_t v18 = v6;
    goto LABEL_14;
  }
  uint64_t v18 = oslog;
  oslog = v6;
LABEL_14:
}

void sub_2471C9B78(char *a1, uint64_t a2, void *a3, void *a4, int a5, NSObject *a6)
{
  id v7 = v6;
  os_log_t v88 = a6;
  os_log_type_t v89 = a4;
  int v90 = a5;
  uint64_t v11 = sub_247205C78();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3
    && ((uint64_t v15 = *(void *)&v7[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId],
         unint64_t v16 = *(void *)&v7[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8],
         v15 == a2)
      ? (BOOL v17 = v16 == (void)a3)
      : (BOOL v17 = 0),
        v17 || (sub_2472064A8() & 1) != 0))
  {
    uint64_t v85 = a1;
    id v86 = a3;
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_247205EA8();
    uint64_t v82 = __swift_project_value_buffer(v18, (uint64_t)qword_26B128910);
    unint64_t v19 = sub_247205E98();
    os_log_type_t v20 = sub_247206178();
    BOOL v21 = os_log_type_enabled(v19, v20);
    unint64_t v83 = v16;
    uint64_t v84 = v15;
    uint64_t v87 = a2;
    if (v21)
    {
      id v22 = (uint8_t *)swift_slowAlloc();
      id v23 = (void *)swift_slowAlloc();
      v81 = v14;
      *(_DWORD *)id v22 = 136315138;
      v95[0] = v23;
      id v91 = v89;
      char v92 = v90 & 1;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128660);
      uint64_t v24 = sub_247206298();
      id v91 = (id)sub_2471F3F68(v24, v25, (uint64_t *)v95);
      id v14 = v81;
      sub_2472062B8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v19, v20, "Received didCompletionRecognitionWithStatistics with endpointMode: %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v23, -1, -1);
      MEMORY[0x24C54D9C0](v22, -1, -1);
    }

    id v26 = v86;
    sub_2471B61EC(v85, 0);
    if (qword_26B127C10 != -1) {
      swift_once();
    }
    uint64_t v27 = __swift_project_value_buffer(v11, (uint64_t)qword_26B1288F8);
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    v28(v14, v27, v11);
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v89;
    *(unsigned char *)(v29 + 24) = v90 & 1;
    uint64_t v30 = v87;
    *(void *)(v29 + 32) = v7;
    *(void *)(v29 + 40) = v30;
    *(void *)(v29 + 48) = v26;
    uint64_t v85 = v7;
    swift_bridgeObjectRetain();
    sub_247205C48();
    swift_release();
    id v31 = *(void (**)(char *, uint64_t))(v12 + 8);
    v31(v14, v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B128758);
    if (v88)
    {
      v81 = (char *)v31;
      id v91 = v88;
      id v32 = v88;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B128750);
      sub_2471CAE98(0, &qword_26B128688);
      if (swift_dynamicCast())
      {
        id v33 = v95[0];
        if (objc_msgSend(v95[0], sel_code) == (id)1110)
        {
          v28(v14, v27, v11);
          uint64_t v34 = swift_allocObject();
          id v35 = v85;
          uint64_t v36 = v87;
          *(void *)(v34 + 16) = v85;
          *(void *)(v34 + 24) = v36;
          *(void *)(v34 + 32) = v26;
          *(void *)(v34 + 40) = v33;
          *(void *)(v34 + 48) = v89;
          *(unsigned char *)(v34 + 56) = v90 & 1;
          uint64_t v37 = v35;
          swift_bridgeObjectRetain();
          id v38 = v33;
          sub_247205C58();
          swift_release();
          ((void (*)(char *, uint64_t))v81)(v14, v11);
          if (v37[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMedocEnabled] == 1) {
            sub_2471C8824();
          }
          else {
            sub_2471C9878(v84, v83);
          }
        }
        else if (objc_msgSend(v33, sel_code) == (id)1101 || objc_msgSend(v33, sel_code) == (id)1107)
        {
          uint64_t v46 = sub_247205E98();
          os_log_type_t v47 = sub_247206188();
          if (os_log_type_enabled(v46, v47))
          {
            uint64_t v48 = v11;
            unint64_t v49 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)unint64_t v49 = 0;
            _os_log_impl(&dword_2471B4000, v46, v47, "embeddedspeech probably crashed, failing current request", v49, 2u);
            uint64_t v50 = v49;
            uint64_t v11 = v48;
            id v26 = v86;
            MEMORY[0x24C54D9C0](v50, -1, -1);
          }

          v28(v14, v27, v11);
          uint64_t v51 = swift_allocObject();
          uint64_t v52 = v85;
          uint64_t v53 = v87;
          *(void *)(v51 + 16) = v85;
          *(void *)(v51 + 24) = v53;
          *(void *)(v51 + 32) = v26;
          *(void *)(v51 + 40) = v33;
          *(void *)(v51 + 48) = v89;
          *(unsigned char *)(v51 + 56) = v90 & 1;
          v52;
          swift_bridgeObjectRetain();
          uint64_t v54 = v14;
          id v55 = v33;
          sub_247205C58();
          swift_release();
          ((void (*)(char *, uint64_t))v81)(v54, v11);
          sub_2471C0AFC(v84, v83, v55);
        }
        else
        {
          id v86 = v33;
          uint64_t v56 = sub_247205E98();
          os_log_type_t v57 = sub_247206188();
          int v58 = v57;
          os_log_t v88 = v56;
          if (os_log_type_enabled(v56, v57))
          {
            uint64_t v59 = swift_slowAlloc();
            uint64_t v82 = v11;
            uint64_t v60 = v59;
            uint64_t v80 = swift_slowAlloc();
            uint64_t v94 = v80;
            *(_DWORD *)uint64_t v60 = 134218242;
            uint64_t v78 = v60 + 4;
            id v61 = v86;
            id v93 = objc_msgSend(v86, sel_code);
            id v79 = &v94;
            sub_2472062B8();
            *(_WORD *)(v60 + 12) = 2080;
            uint64_t v77 = v60 + 14;
            id v62 = objc_msgSend(v61, sel_description);
            uint64_t v63 = sub_247205FD8();
            LODWORD(v78) = v58;
            uint64_t v64 = v63;
            unint64_t v76 = v65;

            uint64_t v66 = v64;
            id v67 = v86;
            id v93 = (id)sub_2471F3F68(v66, v76, &v94);
            sub_2472062B8();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2471B4000, v88, (os_log_type_t)v78, "Received ASR error %ld %s but not taking any action", (uint8_t *)v60, 0x16u);
            uint64_t v68 = v80;
            swift_arrayDestroy();
            MEMORY[0x24C54D9C0](v68, -1, -1);
            uint64_t v69 = v60;
            uint64_t v11 = v82;
            MEMORY[0x24C54D9C0](v69, -1, -1);
          }
          else
          {

            id v67 = v86;
          }
          v28(v14, v27, v11);
          uint64_t v70 = swift_allocObject();
          id v71 = v85;
          *(void *)(v70 + 16) = v67;
          *(void *)(v70 + 24) = v71;
          *(void *)(v70 + 32) = v87;
          *(void *)(v70 + 40) = v26;
          *(void *)(v70 + 48) = v89;
          *(unsigned char *)(v70 + 56) = v90 & 1;
          id v72 = v71;
          swift_bridgeObjectRetain();
          id v73 = v67;
          sub_247205C58();
          swift_release();
          ((void (*)(char *, uint64_t))v81)(v14, v11);
        }
        uint64_t v74 = (uint64_t)objc_msgSend(v33, sel_code);
        if (v74 < (uint64_t)0xFFFFFFFF80000000)
        {
          __break(1u);
        }
        else if (v74 <= 0x7FFFFFFF)
        {
          sub_2471CB5D8(v74);

          return;
        }
        __break(1u);
      }
      sub_247206498();
      __break(1u);
    }
  }
  else
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_247205EA8();
    __swift_project_value_buffer(v39, (uint64_t)qword_26B128910);
    id v40 = sub_247205E98();
    os_log_type_t v41 = sub_247206188();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_2471B4000, v40, v41, "Response requestId does not match current requestId", v42, 2u);
      MEMORY[0x24C54D9C0](v42, -1, -1);
    }

    if (qword_26B127C10 != -1) {
      swift_once();
    }
    uint64_t v43 = __swift_project_value_buffer(v11, (uint64_t)qword_26B1288F8);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v43, v11);
    id v44 = (void *)swift_allocObject();
    v44[2] = a2;
    v44[3] = a3;
    v44[4] = v7;
    swift_bridgeObjectRetain();
    os_log_type_t v45 = v7;
    sub_247205C58();
    swift_release();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_2471CA628()
{
  return objectdestroy_135Tm(40);
}

uint64_t sub_2471CA630()
{
  return sub_2471BEC5C(v0[2], v0[3], v0[4]);
}

uint64_t sub_2471CA63C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2471CA67C()
{
  return sub_2471BF0A0(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_2471CA690()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 57, 7);
}

uint64_t sub_2471CA6D8()
{
  return sub_2471BF9AC(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void **)(v0 + 48), *(unsigned __int8 *)(v0 + 56));
}

uint64_t sub_2471CA6F0()
{
  return sub_2471CA774(0xD000000000000038, 0x8000000247208240);
}

uint64_t objectdestroy_144Tm()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 57, 7);
}

uint64_t sub_2471CA758()
{
  return sub_2471CA774(0xD000000000000029, 0x8000000247208210);
}

uint64_t sub_2471CA774(uint64_t a1, uint64_t a2)
{
  return sub_2471BF4E0(*(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void **)(v2 + 40), *(void **)(v2 + 48), *(unsigned __int8 *)(v2 + 56), a1, a2);
}

uint64_t sub_2471CA7A4()
{
  return objectdestroy_135Tm(40);
}

void sub_2471CA7AC(void *a1)
{
}

uint64_t sub_2471CA7CC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2471CA7DC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2471CA7EC()
{
  return objectdestroy_135Tm(40);
}

uint64_t sub_2471CA7F4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2471CA804()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_2471CA844(void *a1)
{
}

uint64_t sub_2471CA850()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2471CA860(uint64_t a1)
{
  return sub_2471B88A0(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2471CA8B0(uint64_t a1)
{
  return sub_2471B852C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2471CA8BC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2471CA8D4(uint64_t a1)
{
  return sub_2471B81EC(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_2471CA8E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t objectdestroy_126Tm()
{
  uint64_t v1 = sub_247205E88();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t sub_2471CAA08(uint64_t a1)
{
  return sub_2471CAA20(a1, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_2471B9B6C);
}

uint64_t sub_2471CAA20(uint64_t a1, uint64_t (*a2)(uint64_t, unint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(sub_247205E88() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v2 + v6);
  uint64_t v8 = *(void *)(v2 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  return a2(a1, v2 + v5, v7, v8);
}

uint64_t sub_2471CAADC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2471CAB1C()
{
  return sub_2471BA918(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_2471CAB24()
{
  return sub_2471B96E8(*(void *)(v0 + 16), *(void **)(v0 + 24), 0xD00000000000002ELL, 0x8000000247207BA0, (SEL *)&selRef_lastTRPCandidateId);
}

uint64_t sub_2471CAB60(uint64_t a1)
{
  return sub_2471BB22C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2471CAB68(uint64_t a1)
{
  return sub_2471BAD1C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2471CAB70(uint64_t a1)
{
  return sub_2471BAFA4(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2471CAB78(uint64_t a1)
{
  return sub_2471B7EEC(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2471CAB80()
{
  return sub_2471B96E8(*(void *)(v0 + 16), *(void **)(v0 + 24), 0xD00000000000001BLL, 0x8000000247207B80, (SEL *)&selRef_lastTRPCandidateId);
}

uint64_t sub_2471CABBC(uint64_t a1)
{
  return sub_2471B9374(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2471CABC8()
{
  return sub_2471B96E8(*(void *)(v0 + 16), *(void **)(v0 + 24), 0xD000000000000018, 0x8000000247207BD0, (SEL *)&selRef_trpCandidateId);
}

uint64_t sub_2471CAC04(uint64_t a1)
{
  return sub_2471B8C8C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2471CAC10(uint64_t a1)
{
  return sub_2471B9000(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2471CAC20()
{
  return sub_2471BBE00(v0[2], v0[3], v0[4], v0[5], 0x8000000247207A90);
}

uint64_t sub_2471CAC50()
{
  return objectdestroy_135Tm(48);
}

uint64_t objectdestroy_135Tm(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_2471CACA4()
{
  return sub_2471BC1E4(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_2471CACB0(uint64_t a1)
{
  return sub_2471BCD0C(a1, *(void *)(v1 + 16));
}

uint64_t sub_2471CACD8()
{
  return sub_2471BC674(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_2471CACE4(uint64_t a1)
{
  return sub_2471BCA88(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(unsigned __int8 *)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t sub_2471CACF8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2471CAD30()
{
  return sub_2471BB7AC();
}

uint64_t sub_2471CAD3C(uint64_t a1)
{
  return sub_2471BBA0C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t objectdestroy_193Tm()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2471CAD8C()
{
  return sub_2471BBE00(v0[2], v0[3], v0[4], v0[5], 0x8000000247207A40);
}

unint64_t sub_2471CADBC()
{
  unint64_t result = qword_26B1285D8;
  if (!qword_26B1285D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1285D8);
  }
  return result;
}

id sub_2471CAE10(uint64_t a1)
{
  return sub_2471BE708(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2471CAE18(uint64_t a1)
{
  return sub_2471BE4BC(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

void sub_2471CAE20(uint64_t a1, void *a2)
{
  sub_2471BE0E8(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_2471CAE28(uint64_t a1)
{
  return sub_2471BB52C(a1, *(void *)(v1 + 16));
}

uint64_t sub_2471CAE30()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_2471CAE80()
{
  sub_2471B6D2C(*(id *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_2471CAE90(uint64_t a1)
{
  return sub_2471B7880(a1, *(void *)(v1 + 16));
}

uint64_t sub_2471CAE98(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for AFEndpointMode(uint64_t a1)
{
}

void type metadata accessor for AFSpeechEvent(uint64_t a1)
{
}

void type metadata accessor for LBLocalSpeechRecognizerStopReason(uint64_t a1)
{
}

void sub_2471CAF10(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_2471CAFF0()
{
  type metadata accessor for ASRBridgeInstrumentationUtil();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = objc_msgSend(self, sel_sharedStream);
  sub_247205DB8();
  swift_allocObject();
  uint64_t result = sub_247205DA8();
  *(void *)(v0 + 24) = result;
  qword_26B128770 = v0;
  return result;
}

void sub_2471CB06C(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E848]), sel_init);
  if (v20)
  {
    if (a1 > 6) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = dword_24720709C[a1];
    }
    objc_msgSend(v20, sel_setTaskType_, v7);
  }
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E830]), sel_init);
  objc_msgSend(v19, sel_setStartedOrChanged_, v20);
  uint64_t v8 = (void *)sub_247205D88();
  if (v8)
  {
    uint64_t v9 = v8;
    objc_msgSend(v8, sel_setAsrBridgeContext_, v19);
    objc_msgSend(*(id *)(v2 + 16), sel_emitMessage_, v9);
    os_log_type_t v10 = (void *)sub_247205D68();
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = objc_msgSend(v10, sel_captureSnapshot);

      if (v12)
      {
        id v13 = objc_msgSend(self, sel_context);
        if (v13)
        {
          id v14 = v13;
          sub_2472048E8();
          uint64_t v15 = sub_247204938();
          uint64_t v16 = *(void *)(v15 - 8);
          BOOL v17 = 0;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v6, 1, v15) != 1)
          {
            BOOL v17 = (void *)sub_247204908();
            (*(void (**)(char *, uint64_t))(v16 + 8))(v6, v15);
          }
          objc_msgSend(v12, sel_logWithEventContext_requestIdentifier_, v14, v17);
        }
        else
        {
          __break(1u);
        }
        return;
      }
    }

    id v18 = v20;
  }
  else
  {

    id v18 = v19;
  }
}

void sub_2471CB330()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E838]), sel_init);
  if (v16) {
    objc_msgSend(v16, sel_setExists_, 1);
  }
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E830]), sel_init);
  objc_msgSend(v15, sel_setEnded_, v16);
  uint64_t v4 = (void *)sub_247205D88();
  if (v4)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, sel_setAsrBridgeContext_, v15);
    objc_msgSend(*(id *)(v0 + 16), sel_emitMessage_, v5);
    unint64_t v6 = (void *)sub_247205D68();
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = objc_msgSend(v6, sel_captureSnapshot);

      if (v8)
      {
        id v9 = objc_msgSend(self, sel_context);
        if (v9)
        {
          os_log_type_t v10 = v9;
          sub_2472048E8();
          uint64_t v11 = sub_247204938();
          uint64_t v12 = *(void *)(v11 - 8);
          id v13 = 0;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v3, 1, v11) != 1)
          {
            id v13 = (void *)sub_247204908();
            (*(void (**)(char *, uint64_t))(v12 + 8))(v3, v11);
          }
          objc_msgSend(v8, sel_logWithEventContext_requestIdentifier_, v10, v13);
        }
        else
        {
          __break(1u);
        }
        return;
      }
    }

    id v14 = v16;
  }
  else
  {

    id v14 = v15;
  }
}

void sub_2471CB5D8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E840]), sel_init);
  objc_msgSend(v19, sel_setError_, a1);
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E830]), sel_init);
  objc_msgSend(v18, sel_setFailed_, v19);
  uint64_t v7 = (void *)sub_247205D88();
  if (v7)
  {
    id v8 = v7;
    objc_msgSend(v7, sel_setAsrBridgeContext_, v18);
    objc_msgSend(*(id *)(v2 + 16), sel_emitMessage_, v8);
    id v9 = (void *)sub_247205D68();
    if (v9)
    {
      os_log_type_t v10 = v9;
      id v11 = objc_msgSend(v9, sel_captureSnapshot);

      if (v11)
      {
        id v12 = objc_msgSend(self, sel_context);
        if (v12)
        {
          id v13 = v12;
          sub_2472048E8();
          uint64_t v14 = sub_247204938();
          uint64_t v15 = *(void *)(v14 - 8);
          id v16 = 0;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v6, 1, v14) != 1)
          {
            id v16 = (void *)sub_247204908();
            (*(void (**)(char *, uint64_t))(v15 + 8))(v6, v14);
          }
          objc_msgSend(v11, sel_logWithEventContext_requestIdentifier_, v13, v16);
        }
        else
        {
          __break(1u);
        }
        return;
      }
    }

    id v17 = v19;
  }
  else
  {

    id v17 = v18;
  }
}

void sub_2471CB87C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_2471CB894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_2471CB8AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_2471CB8C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_2471CB8DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, Class *a5, uint64_t a6, SEL *a7)
{
  uint64_t v9 = v7;
  id v13 = objc_msgSend(objc_allocWithZone(*a5), sel_init);
  if (v13) {
    objc_msgSend(v13, sel_setExists_, 1);
  }
  os_log_type_t v10 = (void *)sub_247205D88();
  if (v10)
  {
    id v11 = v10;
    objc_msgSend(v10, *a7, v13);
    objc_msgSend(*(id *)(v9 + 16), sel_emitMessage_, v11);

    id v12 = v11;
  }
  else
  {
    id v12 = v13;
  }
}

void sub_2471CB9CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_247205D78();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E920]), sel_init);
    id v7 = v4;
    if (v4)
    {
      id v5 = v4;
      unint64_t v6 = (void *)sub_247205D98();
      objc_msgSend(v5, sel_setTrpId_, v6);

      id v4 = v7;
    }
    objc_msgSend(v3, sel_setTrpCandidateReceived_, v4);
    objc_msgSend(*(id *)(v1 + 16), sel_emitMessage_, v3);
  }
}

uint64_t sub_2471CBAD4()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for ASRBridgeInstrumentationUtil()
{
  return self;
}

id sub_2471CBB38()
{
  id result = objc_msgSend(self, sel_sharedMonitor);
  qword_269241640 = (uint64_t)result;
  return result;
}

double sub_2471CBB74()
{
  double result = 0.0;
  xmmword_26B1287E0 = 0u;
  *(_OWORD *)algn_26B1287F0 = 0u;
  return result;
}

id sub_2471CBB88()
{
  id result = objc_msgSend(self, sel_isSCDAFrameworkEnabled);
  byte_26B128800 = (char)result;
  return result;
}

uint64_t sub_2471CBBBC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_2471CBC10()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for MyriadDecisionMonitor()
{
  return self;
}

void sub_2471CBC44(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (qword_26B1284C0 != -1) {
    swift_once();
  }
  if (byte_26B128800 == 1)
  {
    id v7 = objc_msgSend(self, sel_sharedMonitor);
    if (a2) {
      a2 = (void *)sub_247205FC8();
    }
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a3;
    *(void *)(v8 + 24) = a4;
    id v18 = sub_2471CC054;
    uint64_t v19 = v8;
    id aBlock = (id)MEMORY[0x263EF8330];
    uint64_t v15 = 1107296256;
    id v16 = sub_2471CBBBC;
    id v17 = &block_descriptor_9;
    uint64_t v9 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_waitForMyriadDecisionForReason_withCompletion_, a2, v9);
    _Block_release(v9);

    if (qword_26B1284B8 != -1) {
      swift_once();
    }
    id v17 = (void *)sub_2471CBFAC();
    id aBlock = v7;
    swift_beginAccess();
    id v10 = v7;
    sub_2471CBFEC((uint64_t)&aBlock, (uint64_t)&xmmword_26B1287E0);
    swift_endAccess();
  }
  else
  {
    if (qword_269240CB0 != -1) {
      swift_once();
    }
    id v11 = (void *)qword_269241640;
    if (a2) {
      a2 = (void *)sub_247205FC8();
    }
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a3;
    *(void *)(v12 + 24) = a4;
    id v18 = sub_2471CBF6C;
    uint64_t v19 = v12;
    id aBlock = (id)MEMORY[0x263EF8330];
    uint64_t v15 = 1107296256;
    id v16 = sub_2471CBBBC;
    id v17 = &block_descriptor_0;
    id v13 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v11, sel_waitForMyriadDecisionForReason_withCompletion_, a2, v13);
    _Block_release(v13);
  }
}

uint64_t sub_2471CBF34()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2471CBF6C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

unint64_t sub_2471CBFAC()
{
  unint64_t result = qword_26B128630;
  if (!qword_26B128630)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B128630);
  }
  return result;
}

uint64_t sub_2471CBFEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B128760);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2471CC064()
{
  uint64_t result = AFIsHorseman();
  byte_26B128768 = result;
  return result;
}

id sub_2471CC084()
{
  id result = objc_msgSend(self, sel_sharedPreferences);
  qword_26B128808 = (uint64_t)result;
  return result;
}

uint64_t sub_2471CC0C0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  id v55 = a2;
  uint64_t v94 = sub_247205B98();
  uint64_t v3 = *(void *)(v94 - 8);
  MEMORY[0x270FA5388](v94);
  id v93 = (char *)v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_247204968();
  uint64_t v75 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_247204988();
  uint64_t v8 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  v81 = (char *)v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_2472049F8();
  uint64_t v10 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  id v79 = (char *)v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2472049B8();
  uint64_t v59 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_247204AB8();
  uint64_t v15 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  id v61 = (char *)v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_247204A98();
  uint64_t v69 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  uint64_t v70 = (char *)v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *a1;
  uint64_t v19 = a1[1];
  if (!*a1)
  {
    os_log_type_t v97 = (void *)MEMORY[0x263F8EE78];
LABEL_32:
    uint64_t v53 = swift_bridgeObjectRetain();
    uint64_t result = sub_2471CE61C(v53);
    void *v55 = v97;
    return result;
  }
  uint64_t v68 = *(void *)(v18 + 16);
  if (!v68)
  {
    uint64_t v24 = (void *)MEMORY[0x263F8EE78];
LABEL_31:
    os_log_type_t v97 = v24;
    goto LABEL_32;
  }
  v54[1] = v19;
  uint64_t v65 = v18 + ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80));
  uint64_t v64 = v69 + 16;
  id v67 = (void (**)(char *, uint64_t))(v69 + 8);
  uint64_t v60 = (void (**)(char *, uint64_t))(v15 + 8);
  uint64_t v20 = v3;
  uint64_t v21 = v59 + 16;
  unint64_t v76 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v77 = (void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v92 = v75 + 16;
  int v90 = (void (**)(char *, uint64_t))(v75 + 8);
  id v91 = (void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v85 = (void (**)(char *, uint64_t))(v59 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v23 = 0;
  uint64_t v24 = (void *)MEMORY[0x263F8EE78];
  *(void *)&long long v25 = 136315138;
  long long v58 = v25;
  unint64_t v57 = 0x8000000247208410;
  uint64_t v56 = MEMORY[0x263F8EE58] + 8;
  uint64_t v95 = v7;
  id v26 = v70;
  uint64_t v74 = v12;
  id v73 = v14;
  uint64_t v66 = result;
  uint64_t v78 = v21;
  while (v23 < *(void *)(result + 16))
  {
    uint64_t v27 = *(void *)(v69 + 72);
    unint64_t v71 = v23;
    (*(void (**)(char *, unint64_t, uint64_t))(v69 + 16))(v26, v65 + v27 * v23, v72);
    if (sub_247204A48())
    {
      uint64_t v28 = v61;
      sub_247204A28();
      uint64_t v29 = sub_247204AA8();
      (*v60)(v28, v62);
      uint64_t v30 = *(void *)(v29 + 16);
      if (v30)
      {
        unint64_t v88 = v29 + ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80));
        uint64_t v31 = *(void *)(v59 + 72);
        id v86 = *(void (**)(char *, unint64_t, uint64_t))(v59 + 16);
        uint64_t v87 = v31;
        uint64_t v63 = v29;
        swift_bridgeObjectRetain();
        uint64_t v32 = 0;
        uint64_t v83 = v30;
        do
        {
          uint64_t v89 = v32;
          v86(v14, v88 + v87 * v32, v12);
          if (sub_247204998())
          {
            id v33 = v79;
            sub_2472049A8();
            uint64_t v34 = v81;
            sub_2472049E8();
            (*v77)(v33, v80);
            uint64_t v35 = sub_247204978();
            (*v76)(v34, v82);
            uint64_t v36 = *(void *)(v35 + 16);
            if (v36)
            {
              unint64_t v37 = v35 + ((*(unsigned __int8 *)(v75 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80));
              uint64_t v96 = *(void *)(v75 + 72);
              id v38 = *(void (**)(char *, unint64_t, uint64_t))(v75 + 16);
              uint64_t v84 = v35;
              swift_bridgeObjectRetain();
              do
              {
                uint64_t v39 = v5;
                v38(v7, v37, v5);
                id v40 = v93;
                sub_247204958();
                uint64_t v41 = sub_247205B88();
                uint64_t v43 = v42;
                (*v91)(v40, v94);
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  uint64_t v24 = sub_2471CE50C(0, v24[2] + 1, 1, v24);
                }
                unint64_t v45 = v24[2];
                unint64_t v44 = v24[3];
                if (v45 >= v44 >> 1) {
                  uint64_t v24 = sub_2471CE50C((void *)(v44 > 1), v45 + 1, 1, v24);
                }
                v24[2] = v45 + 1;
                uint64_t v46 = &v24[2 * v45];
                v46[4] = v41;
                v46[5] = v43;
                id v7 = v95;
                uint64_t v5 = v39;
                (*v90)(v95, v39);
                v37 += v96;
                --v36;
              }
              while (v36);
              swift_bridgeObjectRelease_n();
              uint64_t v12 = v74;
              uint64_t v14 = v73;
            }
            else
            {
              swift_bridgeObjectRelease();
            }
            uint64_t v30 = v83;
          }
          uint64_t v32 = v89 + 1;
          (*v85)(v14, v12);
        }
        while (v32 != v30);
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v47 = sub_247205EA8();
      __swift_project_value_buffer(v47, (uint64_t)qword_26B128910);
      uint64_t v48 = sub_247205E98();
      os_log_type_t v49 = sub_247206178();
      if (os_log_type_enabled(v48, v49))
      {
        uint64_t v50 = swift_slowAlloc();
        uint64_t v51 = swift_slowAlloc();
        os_log_type_t v97 = (void *)v51;
        *(_DWORD *)uint64_t v50 = v58;
        *(void *)(v50 + 4) = sub_2471F3F68(0xD000000000000021, v57, (uint64_t *)&v97);
        _os_log_impl(&dword_2471B4000, v48, v49, "Not updating jitProfile for SDA: %s", (uint8_t *)v50, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v51, -1, -1);
        uint64_t v52 = v50;
        id v7 = v95;
        MEMORY[0x24C54D9C0](v52, -1, -1);
      }
    }
    id v26 = v70;
    (*v67)(v70, v72);
    unint64_t v23 = v71 + 1;
    uint64_t result = v66;
    if (v71 + 1 == v68)
    {
      swift_bridgeObjectRelease();
      goto LABEL_31;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2471CCA94()
{
  uint64_t v0 = sub_247205EC8();
  __swift_allocate_value_buffer(v0, qword_26B128810);
  *(void *)__swift_project_value_buffer(v0, (uint64_t)qword_26B128810) = 800;
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);
  return v1();
}

uint64_t sub_2471CCB24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
  {
    sub_2471D0F3C();
    uint64_t v2 = sub_2472060E8();
  }
  swift_retain();
  v3(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2471CCB9C(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(BOOL))
{
  if (!a1) {
    goto LABEL_17;
  }
  uint64_t v9 = a1 & 0xFFFFFFFFFFFFFF8;
  if (!(a1 >> 62))
  {
    uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_2472063E8();
  if (!result)
  {
LABEL_16:
    swift_bridgeObjectRelease();
LABEL_17:
    long long v30 = 0u;
    long long v31 = 0u;
    goto LABEL_18;
  }
LABEL_4:
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v12 = (id)MEMORY[0x24C54D1C0](0, a1);
  }
  else
  {
    if (!*(void *)(v9 + 16))
    {
      __break(1u);
      return result;
    }
    id v12 = *(id *)(a1 + 32);
  }
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v13, sel_serializedContextByKey);

  if (!v14) {
    goto LABEL_17;
  }
  uint64_t v15 = sub_247205F68();

  uint64_t v16 = sub_247205FD8();
  if (*(void *)(v15 + 16) && (unint64_t v18 = sub_2471FC8B8(v16, v17), (v19 & 1) != 0))
  {
    sub_2471D0F8C(*(void *)(v15 + 56) + 32 * v18, (uint64_t)&v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((void *)&v31 + 1))
    {
      sub_2471D0F7C(&v30, v32);
      id v20 = objc_allocWithZone(MEMORY[0x263F28450]);
      __swift_project_boxed_opaque_existential_1(v32, v33);
      id v21 = objc_msgSend(v20, sel_initWithSerializedBackingStore_, sub_247206488());
      swift_unknownObjectRelease();
      if (objc_msgSend(v21, sel_callState))
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);

        BOOL v34 = 1;
      }
      else
      {
        unsigned __int8 v22 = objc_msgSend(v21, sel_callState);

        __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
        BOOL v34 = (v22 & 2) != 0;
      }
      goto LABEL_19;
    }
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_18:
  sub_2471D10A4((uint64_t)&v30, &qword_26B128760);
  BOOL v34 = 0;
LABEL_19:
  sub_247206218();
  if (qword_26B128378 != -1) {
    swift_once();
  }
  id v23 = (id)qword_26B128778;
  sub_247205E58();

  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_247205EA8();
  __swift_project_value_buffer(v24, (uint64_t)qword_26B128910);
  BOOL v25 = v34;
  swift_bridgeObjectRetain_n();
  id v26 = sub_247205E98();
  os_log_type_t v27 = sub_247206178();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    v32[0] = v29;
    *(_DWORD *)uint64_t v28 = 67109378;
    LODWORD(v30) = v25;
    sub_2472062B8();
    *(_WORD *)(v28 + 8) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&long long v30 = sub_2471F3F68(a3, a4, v32);
    sub_2472062B8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2471B4000, v26, v27, "Retrieved isUserOnPhoneCall status: %{BOOL}d for requestId: %s", (uint8_t *)v28, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v29, -1, -1);
    MEMORY[0x24C54D9C0](v28, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  return a5(v34);
}

uint64_t sub_2471CD014(char a1)
{
  if (a1) {
    return 0x4879616C70736964;
  }
  else {
    return 0xD000000000000010;
  }
}

BOOL sub_2471CD058(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2471CD070()
{
  return sub_247206528();
}

uint64_t sub_2471CD0B8()
{
  return sub_247206518();
}

uint64_t sub_2471CD0E4()
{
  return sub_247206528();
}

uint64_t sub_2471CD128()
{
  return sub_2471CD014(*v0);
}

uint64_t sub_2471CD130@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2471D0B00(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2471CD158()
{
  return 0;
}

void sub_2471CD164(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2471CD170(uint64_t a1)
{
  unint64_t v2 = sub_2471CD3F4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2471CD1AC(uint64_t a1)
{
  unint64_t v2 = sub_2471CD3F4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t JitGrammarInput.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C70);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v10 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2471CD3F4();
  sub_247206548();
  uint64_t v12 = v8;
  char v11 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C28);
  sub_2471CD6CC((unint64_t *)&unk_26B127C30, (unint64_t *)&unk_26B127BF0);
  sub_247206458();
  if (!v2)
  {
    uint64_t v12 = v10;
    char v11 = 1;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B127C40);
    sub_2471CD790(&qword_26B1285F8);
    sub_247206468();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_2471CD3F4()
{
  unint64_t result = qword_26B127C08;
  if (!qword_26B127C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B127C08);
  }
  return result;
}

uint64_t JitGrammarInput.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269241060);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2471CD3F4();
  sub_247206538();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C28);
  char v13 = 0;
  sub_2471CD6CC(&qword_269241068, &qword_269241070);
  sub_247206438();
  uint64_t v9 = v14;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B127C40);
  char v13 = 1;
  sub_2471CD790(&qword_269241078);
  swift_bridgeObjectRetain();
  sub_247206448();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v10 = v14;
  *a2 = v9;
  a2[1] = v10;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2471CD6CC(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B127C28);
    sub_2471CD74C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2471CD74C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_247204A98();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2471CD790(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26B127C40);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2471CD7F4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return JitGrammarInput.init(from:)(a1, a2);
}

uint64_t sub_2471CD80C(void *a1)
{
  return JitGrammarInput.encode(to:)(a1);
}

uint64_t sub_2471CD824()
{
  return 1;
}

uint64_t sub_2471CD82C()
{
  return sub_247206528();
}

uint64_t sub_2471CD870()
{
  return sub_247206518();
}

uint64_t sub_2471CD898()
{
  return sub_247206528();
}

uint64_t sub_2471CD8DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2471D0C00(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_2471CD908(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2471CD914(uint64_t a1)
{
  unint64_t v2 = sub_2471CDB04();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2471CD950(uint64_t a1)
{
  unint64_t v2 = sub_2471CDB04();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t JitGrammarOutput.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C78);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2471CDB04();
  sub_247206548();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B127C40);
  sub_2471CD790(&qword_26B1285F8);
  sub_247206468();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2471CDB04()
{
  unint64_t result = qword_26B1283A8;
  if (!qword_26B1283A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1283A8);
  }
  return result;
}

uint64_t JitGrammarOutput.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269241080);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2471CDB04();
  sub_247206538();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B127C40);
    sub_2471CD790(&qword_269241078);
    sub_247206448();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2471CDCF0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return JitGrammarOutput.init(from:)(a1, a2);
}

uint64_t sub_2471CDD08(void *a1)
{
  return JitGrammarOutput.encode(to:)(a1);
}

uint64_t destroy for JitGrammarInput()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s9ASRBridge15JitGrammarInputVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for JitGrammarInput(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_OWORD *assignWithTake for JitGrammarInput(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JitGrammarInput(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JitGrammarInput(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JitGrammarInput()
{
  return &type metadata for JitGrammarInput;
}

ValueMetadata *type metadata accessor for JitGrammarOutput()
{
  return &type metadata for JitGrammarOutput;
}

uint64_t getEnumTagSinglePayload for JitGrammarOutput.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for JitGrammarOutput.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2471CDFDCLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2471CE004()
{
  return 0;
}

ValueMetadata *type metadata accessor for JitGrammarOutput.CodingKeys()
{
  return &type metadata for JitGrammarOutput.CodingKeys;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for JitGrammarInput.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for JitGrammarInput.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2471CE188);
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

uint64_t sub_2471CE1B0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2471CE1B8(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for JitGrammarInput.CodingKeys()
{
  return &type metadata for JitGrammarInput.CodingKeys;
}

unint64_t sub_2471CE1D8()
{
  unint64_t result = qword_269241088;
  if (!qword_269241088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269241088);
  }
  return result;
}

unint64_t sub_2471CE230()
{
  unint64_t result = qword_269241090;
  if (!qword_269241090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269241090);
  }
  return result;
}

unint64_t sub_2471CE288()
{
  unint64_t result = qword_26B1283B8;
  if (!qword_26B1283B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1283B8);
  }
  return result;
}

unint64_t sub_2471CE2E0()
{
  unint64_t result = qword_26B1283B0;
  if (!qword_26B1283B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1283B0);
  }
  return result;
}

unint64_t sub_2471CE338()
{
  unint64_t result = qword_26B128388;
  if (!qword_26B128388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B128388);
  }
  return result;
}

unint64_t sub_2471CE390()
{
  unint64_t result = qword_26B128380;
  if (!qword_26B128380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B128380);
  }
  return result;
}

void *sub_2471CE3E4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B128728);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2471CE774(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2471CE50C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B128718);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      char v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      char v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2471CF14C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2471CE61C(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  int v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  int v3 = sub_2471CE50C(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_247206428();
  __break(1u);
  return result;
}

uint64_t sub_2471CE774(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128650);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_247206428();
  __break(1u);
  return result;
}

uint64_t sub_2471CE884(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247204A98();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_247204A18();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  int64_t v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282E0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  int64_t v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v56 - v16;
  sub_2471D103C(a2, (uint64_t)&v56 - v16);
  uint64_t v57 = a1;
  if (a1)
  {
    int v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v17, 1, v8);
    sub_2471D10A4((uint64_t)v17, (uint64_t *)&unk_26B1282E0);
    if (v18 != 1)
    {
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_247205EA8();
      __swift_project_value_buffer(v19, (uint64_t)qword_26B128910);
      id v20 = sub_247205E98();
      os_log_type_t v21 = sub_247206188();
      if (os_log_type_enabled(v20, v21))
      {
        unsigned __int8 v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v56 = v11;
        id v23 = v22;
        *(_WORD *)unsigned __int8 v22 = 0;
        _os_log_impl(&dword_2471B4000, v20, v21, "Both LegacyNLContext and SystemDialogActs are present for this request", v22, 2u);
        uint64_t v24 = v23;
        int64_t v11 = v56;
        MEMORY[0x24C54D9C0](v24, -1, -1);
      }
    }
  }
  else
  {
    sub_2471D10A4((uint64_t)v17, (uint64_t *)&unk_26B1282E0);
  }
  sub_2471D103C(a2, (uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v15, 1, v8) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v15, v8);
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_247205EA8();
    __swift_project_value_buffer(v38, (uint64_t)qword_26B128910);
    uint64_t v39 = sub_247205E98();
    os_log_type_t v40 = sub_247206178();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_2471B4000, v39, v40, "LegacyNLContext is present, ignoring SystemDialogActs", v41, 2u);
      MEMORY[0x24C54D9C0](v41, -1, -1);
    }

    if (sub_247204A08())
    {
      if (qword_26B1284E8 != -1) {
        swift_once();
      }
      if (byte_26B128768) {
        uint64_t v42 = 8;
      }
      else {
        uint64_t v42 = 2;
      }
    }
    else
    {
      if (qword_26B1284E8 != -1) {
        swift_once();
      }
      if (byte_26B128768) {
        uint64_t v42 = 7;
      }
      else {
        uint64_t v42 = 0;
      }
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return v42;
  }
  sub_2471D10A4((uint64_t)v15, (uint64_t *)&unk_26B1282E0);
  if (!v57)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_247205EA8();
    __swift_project_value_buffer(v43, (uint64_t)qword_26B128910);
    BOOL v34 = sub_247205E98();
    os_log_type_t v35 = sub_247206178();
    if (!os_log_type_enabled(v34, v35)) {
      goto LABEL_42;
    }
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v36 = 0;
    unint64_t v37 = "SystemDialogActs not present using default task type";
    goto LABEL_41;
  }
  uint64_t v25 = *(void *)(v57 + 16);
  if (!v25)
  {
LABEL_17:
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_247205EA8();
    __swift_project_value_buffer(v33, (uint64_t)qword_26B128910);
    BOOL v34 = sub_247205E98();
    os_log_type_t v35 = sub_247206178();
    if (!os_log_type_enabled(v34, v35)) {
      goto LABEL_42;
    }
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v36 = 0;
    unint64_t v37 = "No relevant SDA found, using default task type";
LABEL_41:
    _os_log_impl(&dword_2471B4000, v34, v35, v37, v36, 2u);
    MEMORY[0x24C54D9C0](v36, -1, -1);
LABEL_42:

    if (qword_26B1284E8 != -1) {
      swift_once();
    }
    if (byte_26B128768) {
      return 7;
    }
    else {
      return 0;
    }
  }
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v26 = v5 + 16;
  os_log_type_t v27 = v28;
  uint64_t v29 = v57 + ((*(unsigned __int8 *)(v26 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 64));
  long long v30 = (void (**)(char *, uint64_t))(v26 - 8);
  uint64_t v31 = *(void *)(v26 + 56);
  swift_bridgeObjectRetain();
  while (1)
  {
    uint64_t v32 = v27(v7, v29, v4);
    if (MEMORY[0x24C54B8B0](v32)) {
      break;
    }
    if (sub_247204A68())
    {
      swift_bridgeObjectRelease();
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v51 = sub_247205EA8();
      __swift_project_value_buffer(v51, (uint64_t)qword_26B128910);
      uint64_t v52 = sub_247205E98();
      os_log_type_t v53 = sub_247206178();
      if (os_log_type_enabled(v52, v53))
      {
        uint64_t v54 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v54 = 0;
        _os_log_impl(&dword_2471B4000, v52, v53, "SDA found indicating confirmation task type", v54, 2u);
        MEMORY[0x24C54D9C0](v54, -1, -1);
      }

      if (qword_26B1284E8 != -1) {
        swift_once();
      }
      BOOL v48 = byte_26B128768 == 0;
      uint64_t v49 = 9;
      uint64_t v50 = 7;
      goto LABEL_61;
    }
    (*v30)(v7, v4);
    v29 += v31;
    if (!--v25)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v44 = sub_247205EA8();
  __swift_project_value_buffer(v44, (uint64_t)qword_26B128910);
  unint64_t v45 = sub_247205E98();
  os_log_type_t v46 = sub_247206178();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v47 = 0;
    _os_log_impl(&dword_2471B4000, v45, v46, "SDA found indicating SiriDictation task type", v47, 2u);
    MEMORY[0x24C54D9C0](v47, -1, -1);
  }

  if (qword_26B1284E8 != -1) {
    swift_once();
  }
  BOOL v48 = byte_26B128768 == 0;
  uint64_t v49 = 2;
  uint64_t v50 = 8;
LABEL_61:
  if (v48) {
    uint64_t v42 = v49;
  }
  else {
    uint64_t v42 = v50;
  }
  (*v30)(v7, v4);
  return v42;
}

uint64_t sub_2471CF14C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_247206428();
  __break(1u);
  return result;
}

uint64_t sub_2471CF240(void *a1, uint64_t a2)
{
  char v4 = AFIsATV();
  if (!objc_msgSend(a1, sel_secureOfflineOnly))
  {
    if (AFIsATV())
    {
      uint64_t v5 = 6;
      goto LABEL_17;
    }
LABEL_15:
    uint64_t v5 = 3;
    goto LABEL_17;
  }
  if (v4)
  {
    uint64_t v5 = 10;
LABEL_17:
    objc_msgSend(a1, sel_taskHint);
    return v5;
  }
  if ((objc_msgSend(a1, sel_forceOfflineRecognition) & 1) == 0)
  {
    uint64_t v5 = 4;
    goto LABEL_17;
  }
  if (!objc_msgSend(a1, sel_forceOfflineRecognition)
    || !objc_msgSend(a1, sel_secureOfflineOnly)
    || !AFIsSearchDictationRequest())
  {
    goto LABEL_15;
  }
  uint64_t v6 = sub_247205FD8();
  if (*(void *)(a2 + 16) && (unint64_t v8 = sub_2471FC8B8(v6, v7), (v9 & 1) != 0))
  {
    int v10 = *(unsigned __int8 *)(*(void *)(a2 + 56) + v8);
    swift_bridgeObjectRelease();
    if (v10) {
      return 6;
    }
    else {
      return 3;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    return 3;
  }
}

uint64_t sub_2471CF360(unint64_t a1)
{
  if (a1 > 0xA)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_247205EA8();
    __swift_project_value_buffer(v7, (uint64_t)qword_26B128910);
    unint64_t v2 = sub_247205E98();
    os_log_type_t v3 = sub_247206198();
    if (!os_log_type_enabled(v2, v3)) {
      goto LABEL_14;
    }
    char v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v4 = 0;
    uint64_t v5 = "Unexpected unknown taskName, setting deliverEager to true";
    goto LABEL_13;
  }
  if (((1 << a1) & 0x178) != 0) {
    return 0;
  }
  if (((1 << a1) & 0x287) == 0)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_247205EA8();
    __swift_project_value_buffer(v1, (uint64_t)qword_26B128910);
    unint64_t v2 = sub_247205E98();
    os_log_type_t v3 = sub_247206198();
    if (!os_log_type_enabled(v2, v3)) {
      goto LABEL_14;
    }
    char v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v4 = 0;
    uint64_t v5 = "unexpected spelling taskName, setting deliverEager to true";
LABEL_13:
    _os_log_impl(&dword_2471B4000, v2, v3, v5, v4, 2u);
    MEMORY[0x24C54D9C0](v4, -1, -1);
LABEL_14:
  }
  return 1;
}

uint64_t sub_2471CF504(uint64_t a1)
{
  uint64_t v42 = sub_2472049D8();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_247204A98();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v37 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v37 - v11;
  if (!a1)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_247205EA8();
    __swift_project_value_buffer(v31, (uint64_t)qword_26B128910);
    uint64_t v32 = sub_247205E98();
    os_log_type_t v33 = sub_247206178();
    if (os_log_type_enabled(v32, v33))
    {
      BOOL v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v34 = 0;
      _os_log_impl(&dword_2471B4000, v32, v33, "SDA not present - no payload target language exists returning nil", v34, 2u);
      MEMORY[0x24C54D9C0](v34, -1, -1);
    }

    return 0;
  }
  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13) {
    return 0;
  }
  uint64_t v38 = v10;
  uint64_t v39 = a1;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v14 = v5 + 16;
  int64_t v15 = v16;
  uint64_t v17 = a1 + ((*(unsigned __int8 *)(v14 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 64));
  os_log_type_t v40 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v43 = *(void *)(v14 + 56);
  swift_bridgeObjectRetain();
  uint64_t v44 = (void (**)(char *, uint64_t))(v14 - 8);
  while (1)
  {
    v15(v12, v17, v4);
    char v19 = sub_247204A38();
    v15(v9, (uint64_t)v12, v4);
    if (v19) {
      break;
    }
    int v18 = *v44;
    (*v44)(v9, v4);
LABEL_5:
    v18(v12, v4);
    v17 += v43;
    if (!--v13)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  id v20 = v41;
  sub_247204A88();
  char v21 = sub_2472049C8();
  (*v40)(v20, v42);
  int v18 = *v44;
  (*v44)(v9, v4);
  if ((v21 & 1) == 0) {
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_247205EA8();
  __swift_project_value_buffer(v22, (uint64_t)qword_26B128910);
  id v23 = v38;
  v15(v38, (uint64_t)v12, v4);
  uint64_t v24 = sub_247205E98();
  os_log_type_t v25 = sub_247206178();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v46 = v43;
    *(_DWORD *)uint64_t v26 = 136315138;
    unint64_t v27 = sub_247204A78();
    if (v28)
    {
      unint64_t v29 = v28;
    }
    else
    {
      unint64_t v27 = 0xD000000000000019;
      unint64_t v29 = 0x8000000247208480;
    }
    uint64_t v45 = sub_2471F3F68(v27, v29, &v46);
    sub_2472062B8();
    swift_bridgeObjectRelease();
    v18(v23, v4);
    _os_log_impl(&dword_2471B4000, v24, v25, "SDA found - payload target language is: %s", v26, 0xCu);
    uint64_t v30 = v43;
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v30, -1, -1);
    MEMORY[0x24C54D9C0](v26, -1, -1);
  }
  else
  {
    v18(v23, v4);
  }

  uint64_t v35 = sub_247204A78();
  v18(v12, v4);
  return v35;
}

uint64_t sub_2471CFA50(uint64_t a1, char a2)
{
  uint64_t v44 = sub_2472049D8();
  uint64_t v4 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v43 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_247204A98();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  int v10 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v40 - v11;
  if ((a2 & 1) == 0)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_247205EA8();
    __swift_project_value_buffer(v33, (uint64_t)qword_26B128910);
    BOOL v34 = sub_247205E98();
    os_log_type_t v35 = sub_247206178();
    if (!os_log_type_enabled(v34, v35)) {
      goto LABEL_30;
    }
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v36 = 0;
    uint64_t v37 = "Feature flag for auto-punctuation is off";
    goto LABEL_29;
  }
  if (qword_26B1284F0 != -1) {
    swift_once();
  }
  if (!objc_msgSend((id)qword_26B128808, sel_dictationAutoPunctuationEnabled))
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_247205EA8();
    __swift_project_value_buffer(v38, (uint64_t)qword_26B128910);
    BOOL v34 = sub_247205E98();
    os_log_type_t v35 = sub_247206178();
    if (!os_log_type_enabled(v34, v35)) {
      goto LABEL_30;
    }
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v36 = 0;
    uint64_t v37 = "Auto-punctuation is disabled";
    goto LABEL_29;
  }
  if (!a1)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_247205EA8();
    __swift_project_value_buffer(v39, (uint64_t)qword_26B128910);
    BOOL v34 = sub_247205E98();
    os_log_type_t v35 = sub_247206178();
    if (!os_log_type_enabled(v34, v35)) {
      goto LABEL_30;
    }
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v36 = 0;
    uint64_t v37 = "SystemDialogActs are not present, disabling auto-punctuation";
LABEL_29:
    _os_log_impl(&dword_2471B4000, v34, v35, v37, v36, 2u);
    MEMORY[0x24C54D9C0](v36, -1, -1);
LABEL_30:

    return 0;
  }
  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13) {
    return 0;
  }
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v15 = v7 + 16;
  uint64_t v14 = v16;
  uint64_t v17 = a1 + ((*(unsigned __int8 *)(v15 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 64));
  uint64_t v18 = a1;
  char v19 = (void (**)(char *, uint64_t))(v15 - 8);
  uint64_t v42 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v20 = *(void *)(v15 + 56);
  v40[1] = v18;
  swift_bridgeObjectRetain();
  uint64_t v41 = v16;
  while (1)
  {
    v14(v12, v17, v6);
    char v22 = sub_247204A38();
    v14(v10, (uint64_t)v12, v6);
    if (v22) {
      break;
    }
    char v21 = *v19;
    (*v19)(v10, v6);
    v21(v12, v6);
LABEL_9:
    v17 += v20;
    if (!--v13)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  uint64_t v23 = v15;
  uint64_t v24 = v20;
  os_log_type_t v25 = v43;
  sub_247204A88();
  char v26 = sub_2472049C8();
  (*v42)(v25, v44);
  unint64_t v27 = *v19;
  (*v19)(v10, v6);
  v27(v12, v6);
  uint64_t v20 = v24;
  uint64_t v15 = v23;
  uint64_t v14 = v41;
  if ((v26 & 1) == 0) {
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_247205EA8();
  __swift_project_value_buffer(v28, (uint64_t)qword_26B128910);
  unint64_t v29 = sub_247205E98();
  os_log_type_t v30 = sub_247206178();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v31 = 0;
    _os_log_impl(&dword_2471B4000, v29, v30, "Previous SDA contains a message payload prompt, enabling auto-punctuation", v31, 2u);
    MEMORY[0x24C54D9C0](v31, -1, -1);
  }

  return 1;
}

uint64_t sub_2471CFFDC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286C0);
    uint64_t v3 = sub_247206338();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_247206508();
      swift_bridgeObjectRetain();
      sub_247206018();
      uint64_t result = sub_247206528();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_2472064A8(), (result & 1) != 0))
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
          char v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_2472064A8();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      char v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *char v21 = v8;
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

uint64_t sub_2471D0180(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v37 = a4;
  uint64_t v38 = a5;
  uint64_t v39 = a2;
  uint64_t v40 = sub_247205E88();
  uint64_t v7 = *(void *)(v40 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v40);
  uint64_t v36 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v11 = (char *)&v35 - v10;
  if (qword_26B128378 != -1) {
    swift_once();
  }
  id v12 = (id)qword_26B128778;
  sub_247205E68();
  sub_247206228();
  id v13 = (id)qword_26B128778;
  sub_247205E48();

  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_247205EA8();
  __swift_project_value_buffer(v14, (uint64_t)qword_26B128910);
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_247205E98();
  os_log_type_t v16 = sub_247206178();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v35 = v8;
    BOOL v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    aBlock[0] = v18;
    *(_DWORD *)BOOL v17 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_2471F3F68(v39, a3, aBlock);
    uint64_t v8 = v35;
    sub_2472062B8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2471B4000, v15, v16, "Fetching isUserOnPhoneCall status for requestId: %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v18, -1, -1);
    MEMORY[0x24C54D9C0](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (objc_msgSend(a1, sel_respondsToSelector_, sel_fetchContextsForKeys_forRequestID_includesNearbyDevices_completion_))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B128718);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247206F40;
    *(void *)(inited + 32) = sub_247205FD8();
    *(void *)(inited + 40) = v20;
    swift_unknownObjectRetain();
    uint64_t v35 = sub_2471CFFDC(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    char v21 = v36;
    uint64_t v22 = a1;
    uint64_t v23 = v40;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v36, v11, v40);
    unint64_t v24 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    unint64_t v25 = (v8 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v26 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v27 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v27 + v24, v21, v23);
    uint64_t v28 = (void *)(v27 + v25);
    uint64_t v29 = v38;
    *uint64_t v28 = v39;
    v28[1] = a3;
    os_log_type_t v30 = (void *)(v27 + v26);
    *os_log_type_t v30 = v37;
    v30[1] = v29;
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v31 = (void *)sub_247206158();
    uint64_t v32 = (void *)sub_247205FC8();
    aBlock[4] = (uint64_t)sub_2471D0E74;
    aBlock[5] = v27;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_2471CCB24;
    aBlock[3] = (uint64_t)&block_descriptor_1;
    uint64_t v33 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v22, sel_fetchContextsForKeys_forRequestID_includesNearbyDevices_completion_, v31, v32, 0, v33);
    _Block_release(v33);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v11, v40);
}

uint64_t sub_2471D06E4(void *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v33 = a3;
  uint64_t v5 = sub_247205E88();
  uint64_t v31 = *(void *)(v5 - 8);
  uint64_t v32 = v5;
  MEMORY[0x270FA5388](v5);
  os_log_type_t v30 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_247205F38();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v29 - v12;
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = 2;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  *(void *)(v16 + 24) = v15;
  swift_retain();
  BOOL v17 = v15;
  sub_2471D0180(a1, a2, v33, (uint64_t)sub_2471D0CFC, v16);
  swift_release();
  sub_247205F28();
  if (qword_26B1284F8 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_247205EC8();
  uint64_t v19 = __swift_project_value_buffer(v18, (uint64_t)qword_26B128810);
  MEMORY[0x24C54CDA0](v11, v19);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20(v11, v7);
  sub_247206248();
  v20(v13, v7);
  if (sub_247205ED8())
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_247205EA8();
    __swift_project_value_buffer(v21, (uint64_t)qword_26B128910);
    uint64_t v22 = sub_247205E98();
    os_log_type_t v23 = sub_247206188();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v24 = 0;
      _os_log_impl(&dword_2471B4000, v22, v23, "Timed out fetching phoneCallState.", v24, 2u);
      MEMORY[0x24C54D9C0](v24, -1, -1);
    }

    sub_247206238();
    if (qword_26B128378 != -1) {
      swift_once();
    }
    id v25 = (id)qword_26B128778;
    unint64_t v26 = v30;
    sub_247205E78();
    uint64_t v27 = 2;
    sub_247205E58();

    (*(void (**)(char *, uint64_t))(v31 + 8))(v26, v32);
    swift_release();
  }
  else
  {

    swift_beginAccess();
    uint64_t v27 = *(unsigned __int8 *)(v14 + 16);
    swift_release();
  }
  return v27;
}

uint64_t sub_2471D0B00(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x8000000247208390 || (sub_2472064A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4879616C70736964 && a2 == 0xEC00000073746E69)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_2472064A8();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2471D0C00(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6D6D61724774696ALL && a2 == 0xEA00000000007261)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_2472064A8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2471D0C90()
{
  return 0x6D6D61724774696ALL;
}

uint64_t sub_2471D0CAC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_2471D0CBC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2471D0CFC(char a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  swift_beginAccess();
  *(unsigned char *)(v3 + 16) = a1;
  return sub_247206258();
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

uint64_t sub_2471D0DB0()
{
  uint64_t v1 = sub_247205E88();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, v6 + 16, v5);
}

uint64_t sub_2471D0E74(unint64_t a1)
{
  uint64_t v3 = *(void *)(sub_247205E88() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(v1 + v5);
  unint64_t v7 = *(void *)(v1 + v5 + 8);
  uint64_t v8 = *(uint64_t (**)(BOOL))(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8));
  return sub_2471CCB9C(a1, v1 + v4, v6, v7, v8);
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

unint64_t sub_2471D0F3C()
{
  unint64_t result = qword_26B128680;
  if (!qword_26B128680)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B128680);
  }
  return result;
}

_OWORD *sub_2471D0F7C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2471D0F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2471D0FE8()
{
  unint64_t result = qword_2692410A0;
  if (!qword_2692410A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692410A0);
  }
  return result;
}

uint64_t sub_2471D103C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2471D10A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2471D1100(uint64_t a1)
{
  uint64_t result = sub_2471D2240(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  unint64_t v5 = (void *)sub_2471D22C8(result, v3, 0, a1);
  id v6 = v5;
  return (uint64_t)v5;
}

void sub_2471D1170(NSObject *a1)
{
  long long v2 = v1;
  if (sub_2472059C8() == v1[7] && v4 == v1[8])
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = sub_2472064A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0)
    {
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_247205EA8();
      __swift_project_value_buffer(v7, (uint64_t)qword_26B128910);
      a1 = sub_247205E98();
      os_log_type_t v8 = sub_247206188();
      if (!os_log_type_enabled(a1, v8)) {
        goto LABEL_48;
      }
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_2471B4000, a1, v8, "ResultCandidateMessage requestId does not match current requestId", v9, 2u);
      uint64_t v10 = v9;
LABEL_22:
      MEMORY[0x24C54D9C0](v10, -1, -1);
LABEL_48:

      return;
    }
  }
  if (v1[10] >= v1[9])
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_247205EA8();
    __swift_project_value_buffer(v14, (uint64_t)qword_26B128910);
    swift_retain();
    dispatch_semaphore_t v15 = sub_247205E98();
    os_log_type_t v16 = sub_247206188();
    if (os_log_type_enabled(v15, v16))
    {
      BOOL v17 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)BOOL v17 = 134217984;
      sub_2472062B8();
      swift_release();
      _os_log_impl(&dword_2471B4000, v15, v16, "Number of RC's generated by ASR is greater than maximum number of RC's allowed for the request [%ld]. Caching this RC until it has been accepted", v17, 0xCu);
      MEMORY[0x24C54D9C0](v17, -1, -1);
    }
    else
    {

      swift_release();
    }
    sub_247205398();
    uint64_t v24 = swift_dynamicCastClass();
    if (v24)
    {
      uint64_t v25 = v24;
      unint64_t v26 = (void *)v2[12];
      if (v26 && swift_dynamicCastClass())
      {
        id v27 = v26;
        uint64_t v28 = a1;
        id v29 = v27;
        uint64_t v30 = sub_247205308();
        uint64_t v31 = (void *)sub_2471D1100(v30);
        swift_bridgeObjectRelease();
        double v32 = 0.0;
        double v33 = 0.0;
        if (v31)
        {
          id v34 = objc_msgSend(v31, sel_recognition);

          if (!v34)
          {
            __break(1u);
LABEL_54:
            __break(1u);
            goto LABEL_55;
          }
          objc_msgSend(v34, sel_processedAudioDuration);
          double v33 = v35;
        }
        uint64_t v36 = sub_247205308();
        uint64_t v37 = (void *)sub_2471D1100(v36);
        swift_bridgeObjectRelease();
        if (v37)
        {
          id v38 = objc_msgSend(v37, sel_recognition);

          if (v38) {
            goto LABEL_41;
          }
          goto LABEL_54;
        }
LABEL_42:

        if (v32 >= v33) {
          goto LABEL_46;
        }
        unint64_t v26 = (void *)v2[12];
        v2[12] = v25;
LABEL_45:
        uint64_t v50 = a1;

LABEL_46:
        uint64_t v51 = (void *)v2[12];
        if (v51)
        {
          id v52 = v51;
          sub_2472053C8();

          return;
        }
        goto LABEL_48;
      }
    }
    else
    {
      sub_247204CC8();
      uint64_t v39 = swift_dynamicCastClass();
      if (!v39)
      {
        uint64_t v53 = sub_2472053C8();
        uint64_t v55 = v54;
        swift_beginAccess();
        uint64_t v56 = a1;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v58 = v2[11];
        v2[11] = 0x8000000000000000;
        sub_2471FE908((uint64_t)v56, v53, v55, isUniquelyReferenced_nonNull_native);
        v2[11] = v58;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        sub_2472053C8();
        return;
      }
      uint64_t v25 = v39;
      unint64_t v26 = (void *)v2[12];
      if (v26 && swift_dynamicCastClass())
      {
        id v40 = v26;
        uint64_t v41 = a1;
        id v29 = v40;
        uint64_t v42 = sub_247204C48();
        uint64_t v43 = (void *)sub_2471D1100(v42);
        swift_bridgeObjectRelease();
        double v32 = 0.0;
        double v33 = 0.0;
        if (v43)
        {
          id v44 = objc_msgSend(v43, sel_recognition);

          if (!v44)
          {
LABEL_55:
            __break(1u);
            goto LABEL_56;
          }
          objc_msgSend(v44, sel_processedAudioDuration);
          double v33 = v45;
        }
        uint64_t v46 = sub_247205308();
        uint64_t v47 = (void *)sub_2471D1100(v46);
        swift_bridgeObjectRelease();
        if (v47)
        {
          id v38 = objc_msgSend(v47, sel_recognition);

          if (v38)
          {
LABEL_41:
            objc_msgSend(v38, sel_processedAudioDuration);
            double v32 = v48;

            goto LABEL_42;
          }
LABEL_56:
          __break(1u);
          return;
        }
        goto LABEL_42;
      }
    }
    v2[12] = v25;
    uint64_t v49 = a1;
    goto LABEL_45;
  }
  __swift_project_boxed_opaque_existential_1(v1 + 2, v1[5]);
  if (sub_247205A18())
  {
    uint64_t v11 = v1[10];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (!v12)
    {
      v1[10] = v13;
      return;
    }
    __break(1u);
    goto LABEL_52;
  }
  if (qword_26B128578 != -1) {
LABEL_52:
  }
    swift_once();
  uint64_t v18 = sub_247205EA8();
  __swift_project_value_buffer(v18, (uint64_t)qword_26B128910);
  uint64_t v19 = a1;
  a1 = sub_247205E98();
  os_log_type_t v20 = sub_247206188();
  if (os_log_type_enabled(a1, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 138412290;
    os_log_type_t v23 = v19;
    sub_2472062B8();
    *uint64_t v22 = v19;

    _os_log_impl(&dword_2471B4000, a1, v20, "Failed to post AsrResultCandidateMessage: %@", v21, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v22, -1, -1);
    uint64_t v10 = v21;
    goto LABEL_22;
  }
}

uint64_t sub_2471D1864()
{
  uint64_t v1 = (void *)v0[12];
  if (v1)
  {
    __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
    id v2 = v1;
    if (sub_247205A18())
    {

      int v3 = (void *)v0[12];
      v0[12] = 0;

      return 1;
    }
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_247205EA8();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B128910);
    id v10 = v2;
    char v6 = sub_247205E98();
    os_log_type_t v11 = sub_247206188();
    if (!os_log_type_enabled(v6, v11))
    {

      return 0;
    }
    BOOL v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v12 = 138412290;
    id v14 = v10;
    sub_2472062B8();
    void *v13 = v1;

    _os_log_impl(&dword_2471B4000, v6, v11, "Failed to post muxRcMsgBuffered: %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v13, -1, -1);
    MEMORY[0x24C54D9C0](v12, -1, -1);
  }
  else
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_247205EA8();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B128910);
    char v6 = sub_247205E98();
    os_log_type_t v7 = sub_247206188();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v8 = 0;
      _os_log_impl(&dword_2471B4000, v6, v7, "Buffered MUX RC message does not exist", v8, 2u);
      MEMORY[0x24C54D9C0](v8, -1, -1);
    }
  }

  return 0;
}

void sub_2471D1B0C(void *a1)
{
  id v2 = v1;
  if (sub_2472059C8() == v1[7] && v4 == v1[8])
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = sub_2472064A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0)
    {
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_247205EA8();
      __swift_project_value_buffer(v7, (uint64_t)qword_26B128910);
      oslog = sub_247205E98();
      os_log_type_t v8 = sub_247206188();
      if (os_log_type_enabled(oslog, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_2471B4000, oslog, v8, "ResultSelectedMessage requestId does not match current requestId", v9, 2u);
        MEMORY[0x24C54D9C0](v9, -1, -1);
      }

      return;
    }
  }
  uint64_t v10 = sub_2472053C8();
  uint64_t v12 = v11;
  swift_beginAccess();
  uint64_t v13 = v1[11];
  id v14 = &unk_26B128000;
  if (*(void *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v15 = sub_2471FC8B8(v10, v12);
    if (v16)
    {
      id v17 = *(id *)(*(void *)(v13 + 56) + 8 * v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_project_boxed_opaque_existential_1(v2 + 2, v2[5]);
      sub_247205A18();
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_247205EA8();
      __swift_project_value_buffer(v18, (uint64_t)qword_26B128910);
      id v19 = v17;
      os_log_type_t v20 = sub_247205E98();
      os_log_type_t v21 = sub_247206178();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        uint64_t v47 = v23;
        *(_DWORD *)uint64_t v22 = 136315138;
        uint64_t v24 = sub_2472053C8();
        sub_2471F3F68(v24, v25, &v47);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2471B4000, v20, v21, "Posted buffered RC with id:%s to message bus before posting ResultSelectedMessage", v22, 0xCu);
        swift_arrayDestroy();
        uint64_t v26 = v23;
        id v14 = (void *)&unk_26B128000;
        MEMORY[0x24C54D9C0](v26, -1, -1);
        MEMORY[0x24C54D9C0](v22, -1, -1);

        id v27 = (void *)v2[12];
        if (!v27) {
          goto LABEL_29;
        }
      }
      else
      {

        id v27 = (void *)v2[12];
        if (!v27) {
          goto LABEL_29;
        }
      }
LABEL_24:
      __swift_project_boxed_opaque_existential_1(v2 + 2, v2[5]);
      id v28 = v27;
      sub_247205A18();
      if (v14[175] != -1) {
        swift_once();
      }
      uint64_t v29 = sub_247205EA8();
      __swift_project_value_buffer(v29, (uint64_t)qword_26B128910);
      id v30 = v28;
      uint64_t v31 = sub_247205E98();
      os_log_type_t v32 = sub_247206178();
      if (os_log_type_enabled(v31, v32))
      {
        double v33 = (uint8_t *)swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        uint64_t v47 = v34;
        *(_DWORD *)double v33 = 136315138;
        uint64_t v35 = sub_2472053C8();
        sub_2471F3F68(v35, v36, &v47);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2471B4000, v31, v32, "Posted buffered RC with id:%s to message bus before posting ResultSelectedMessage", v33, 0xCu);
        swift_arrayDestroy();
        uint64_t v37 = v34;
        id v14 = (void *)&unk_26B128000;
        MEMORY[0x24C54D9C0](v37, -1, -1);
        MEMORY[0x24C54D9C0](v33, -1, -1);
      }
      else
      {
      }
      goto LABEL_29;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  id v27 = (void *)v2[12];
  if (v27) {
    goto LABEL_24;
  }
LABEL_29:
  if (v14[175] != -1) {
    swift_once();
  }
  uint64_t v38 = sub_247205EA8();
  __swift_project_value_buffer(v38, (uint64_t)qword_26B128910);
  id v39 = a1;
  id v40 = sub_247205E98();
  os_log_type_t v41 = sub_247206178();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v47 = v43;
    *(_DWORD *)uint64_t v42 = 136315138;
    uint64_t v44 = sub_2472053C8();
    sub_2471F3F68(v44, v45, &v47);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v40, v41, "Posting ResultSelectedMessage for rcId: %s", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v43, -1, -1);
    MEMORY[0x24C54D9C0](v42, -1, -1);
  }
  else
  {
  }
  __swift_project_boxed_opaque_existential_1(v2 + 2, v2[5]);
  sub_247205A18();
  v2[11] = MEMORY[0x263F8EE80];
  swift_bridgeObjectRelease();
}

uint64_t sub_2471D21CC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 104, 7);
}

uint64_t type metadata accessor for BufferedResultCandidateHandler()
{
  return self;
}

uint64_t sub_2471D2240(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
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

uint64_t sub_2471D22C8(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 56) + 8 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

void sub_2471D2318(void *a1, void (*a2)(void, void), uint64_t a3)
{
  uint64_t v137 = a3;
  v142 = a2;
  id v143 = a1;
  uint64_t v4 = sub_247205AA8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v136 = (char *)&v127 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v127 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v127 - v12;
  MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v127 - v14;
  uint64_t v16 = v3;
  uint64_t v17 = v3 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestType;
  uint64_t v18 = *MEMORY[0x263F70AB0];
  uint64_t v138 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  uint64_t v139 = v5 + 104;
  v138((char *)&v127 - v14, v18, v4);
  sub_2471DA4D8(&qword_269241178, MEMORY[0x263F70AD0]);
  uint64_t v140 = v17;
  sub_2472060B8();
  sub_2472060B8();
  if (aBlock == v150 && v145 == v151) {
    char v19 = 1;
  }
  else {
    char v19 = sub_2472064A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v141 = *(void (**)(char *, uint64_t))(v5 + 8);
  v141(v15, v4);
  uint64_t v20 = v16;
  if ((v19 & 1) == 0)
  {
    v138(v13, *MEMORY[0x263F70A90], v4);
    sub_2472060B8();
    sub_2472060B8();
    if (aBlock == v150 && v145 == v151)
    {
      swift_bridgeObjectRelease_n();
      v141(v13, v4);
    }
    else
    {
      char v21 = sub_2472064A8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v141(v13, v4);
      if ((v21 & 1) == 0)
      {
        if (qword_26B128578 != -1) {
          swift_once();
        }
        uint64_t v55 = sub_247205EA8();
        __swift_project_value_buffer(v55, (uint64_t)qword_26B128910);
        swift_retain();
        uint64_t v56 = sub_247205E98();
        os_log_type_t v57 = sub_247206188();
        if (os_log_type_enabled(v56, v57))
        {
          uint64_t v58 = (uint8_t *)swift_slowAlloc();
          uint64_t v59 = swift_slowAlloc();
          uint64_t aBlock = v59;
          *(_DWORD *)uint64_t v58 = 136315138;
          uint64_t v60 = *(void *)(v16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
          unint64_t v61 = *(void *)(v16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
          swift_bridgeObjectRetain();
          uint64_t v150 = sub_2471F3F68(v60, v61, &aBlock);
          sub_2472062B8();
          swift_release();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2471B4000, v56, v57, "#AsrOnServer Exiting as the requestType is unsupported. Request: %s", v58, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v59, -1, -1);
          MEMORY[0x24C54D9C0](v58, -1, -1);

          uint64_t v62 = v142;
          if (!v142) {
            return;
          }
        }
        else
        {

          swift_release();
          uint64_t v62 = v142;
          if (!v142) {
            return;
          }
        }
        v62(0, 0);
        return;
      }
    }
  }
  id v22 = v143;
  id v23 = objc_msgSend(v143, sel_refId);
  if (!v23) {
    goto LABEL_21;
  }
  uint64_t v24 = v23;
  uint64_t v25 = sub_247205FD8();
  uint64_t v27 = v26;

  unint64_t v28 = *(void *)(v16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
  uint64_t v135 = *(void *)(v16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
  if (v25 == v135 && v27 == v28)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  char v29 = sub_2472064A8();
  swift_bridgeObjectRelease();
  if ((v29 & 1) == 0)
  {
LABEL_21:
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_247205EA8();
    __swift_project_value_buffer(v39, (uint64_t)qword_26B128910);
    id v40 = sub_247205E98();
    os_log_type_t v41 = sub_247206188();
    BOOL v42 = os_log_type_enabled(v40, v41);
    uint64_t v43 = v142;
    if (v42)
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v44 = 0;
      _os_log_impl(&dword_2471B4000, v40, v41, "#AsrOnServer Response requestId does not match current requestId", v44, 2u);
      MEMORY[0x24C54D9C0](v44, -1, -1);
    }

    if (v43) {
      v43(0, 0);
    }
    return;
  }
LABEL_15:
  id v30 = objc_msgSend(v22, sel_processedAudioDuration);
  if (!v30)
  {
    unint64_t v45 = v142;
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_247205EA8();
    __swift_project_value_buffer(v46, (uint64_t)qword_26B128910);
    swift_retain();
    uint64_t v47 = sub_247205E98();
    os_log_type_t v48 = sub_247206188();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      uint64_t aBlock = v50;
      *(_DWORD *)uint64_t v49 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v150 = sub_2471F3F68(v135, v28, &aBlock);
      sub_2472062B8();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v47, v48, "#AsrOnServer Failed to parse processedAudioDuration for request: %s", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v50, -1, -1);
      MEMORY[0x24C54D9C0](v49, -1, -1);

      if (!v45) {
        return;
      }
    }
    else
    {

      swift_release();
      if (!v45) {
        return;
      }
    }
    v45(0, 0);
    return;
  }
  uint64_t v31 = v30;
  objc_msgSend(v30, sel_doubleValue);

  if (*(unsigned char *)(v16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_isMedocEnabled) != 1)
  {
    id v51 = objc_msgSend(v22, sel_recognition);

    id v133 = (id)sub_247206208();
    id v52 = objc_msgSend(v22, sel_resultId);
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v132 = sub_247205FD8();
      uint64_t v134 = v54;
    }
    else
    {
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v73 = sub_247205EA8();
      __swift_project_value_buffer(v73, (uint64_t)qword_26B128910);
      uint64_t v74 = sub_247205E98();
      os_log_type_t v75 = sub_247206188();
      if (os_log_type_enabled(v74, v75))
      {
        unint64_t v76 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v76 = 0;
        _os_log_impl(&dword_2471B4000, v74, v75, "#AsrOnServer resultCandidate does not contain resultId: using the default 0", v76, 2u);
        MEMORY[0x24C54D9C0](v76, -1, -1);
      }

      uint64_t v134 = 0xE100000000000000;
      uint64_t v132 = 48;
    }
    uint64_t v77 = v136;
    unsigned int v130 = *MEMORY[0x263F70A90];
    ((void (*)(char *))v138)(v136);
    uint64_t v129 = sub_2471DA4D8(&qword_26B128310, MEMORY[0x263F70AD0]);
    char v78 = sub_247205FB8();
    uint64_t v79 = ((uint64_t (*)(char *, uint64_t))v141)(v77, v4);
    if (v78)
    {

      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v80 = sub_247205EA8();
      __swift_project_value_buffer(v80, (uint64_t)qword_26B128910);
      swift_retain_n();
      swift_bridgeObjectRetain_n();
      v81 = sub_247205E98();
      os_log_type_t v82 = sub_247206178();
      int v83 = v82;
      if (os_log_type_enabled(v81, v82))
      {
        uint64_t v84 = swift_slowAlloc();
        LODWORD(v128) = v83;
        uint64_t v85 = v84;
        uint64_t v127 = swift_slowAlloc();
        uint64_t aBlock = v127;
        *(_DWORD *)uint64_t v85 = 136315394;
        id v131 = v51;
        swift_bridgeObjectRetain();
        uint64_t v150 = sub_2471F3F68(v135, v28, &aBlock);
        unint64_t v86 = v134;
        sub_2472062B8();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v85 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v150 = sub_2471F3F68(v132, v86, &aBlock);
        id v87 = v131;
        sub_2472062B8();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2471B4000, v81, (os_log_type_t)v128, "#AsrOnServer Not posting AsrResultCandidateMessage as the requestType is uos. request: %s rcId: %s", (uint8_t *)v85, 0x16u);
        uint64_t v88 = v127;
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v88, -1, -1);
        MEMORY[0x24C54D9C0](v85, -1, -1);

        if (!v87) {
          goto LABEL_73;
        }
LABEL_85:
        os_log_type_t v118 = *(void **)(v20 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serviceHelper);
        if ((objc_msgSend(v118, sel_respondsToSelector_, sel_selectResultWithResultCandidate_completion_) & 1) == 0)
        {

          swift_bridgeObjectRelease();
          return;
        }
        uint64_t v119 = swift_allocObject();
        swift_weakInit();
        uint64_t v120 = (void *)swift_allocObject();
        uint64_t v121 = (uint64_t)v142;
        v120[2] = v119;
        v120[3] = v121;
        uint64_t v122 = v132;
        v120[4] = v137;
        v120[5] = v122;
        v120[6] = v134;
        v148 = sub_2471DA57C;
        long long v149 = v120;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v145 = 1107296256;
        unint64_t v146 = sub_2471DC9B8;
        uint64_t v147 = &block_descriptor_55;
        uint64_t v123 = _Block_copy(&aBlock);
        sub_2471DA438(v121);
        swift_unknownObjectRetain();
        swift_retain();
        swift_retain();
        swift_release();
        objc_msgSend(v118, sel_selectResultWithResultCandidate_completion_, v22, v123);
        _Block_release(v123);
        swift_release();
        swift_unknownObjectRelease();
        swift_release();
        goto LABEL_94;
      }

      swift_bridgeObjectRelease_n();
      swift_release_n();
      if (v51) {
        goto LABEL_85;
      }
    }
    else
    {
      id v131 = v51;
      MEMORY[0x270FA5388](v79);
      uint64_t v89 = v132;
      *(&v127 - 4) = v20;
      *(&v127 - 3) = v89;
      id v90 = v133;
      *(&v127 - 2) = v134;
      *(&v127 - 1) = (uint64_t)v90;
      id v91 = objc_allocWithZone((Class)sub_247204F68());
      uint64_t v92 = sub_247204EE8();

      if (!v92)
      {
        swift_bridgeObjectRelease();
        if (qword_26B128578 != -1) {
          swift_once();
        }
        uint64_t v111 = sub_247205EA8();
        __swift_project_value_buffer(v111, (uint64_t)qword_26B128910);
        swift_retain();
        uint64_t v112 = sub_247205E98();
        os_log_type_t v113 = sub_247206188();
        BOOL v114 = os_log_type_enabled(v112, v113);
        uint64_t v115 = v142;
        if (v114)
        {
          uint64_t v116 = (uint8_t *)swift_slowAlloc();
          uint64_t v117 = swift_slowAlloc();
          uint64_t aBlock = v117;
          *(_DWORD *)uint64_t v116 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v150 = sub_2471F3F68(v135, v28, &aBlock);
          sub_2472062B8();
          swift_release();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2471B4000, v112, v113, "#AsrOnServer Failed to create AsrResultCandidateMessage for request: %s", v116, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v117, -1, -1);
          MEMORY[0x24C54D9C0](v116, -1, -1);
        }
        else
        {

          swift_release();
        }
        if (v115) {
          v115(0, 0);
        }
        goto LABEL_94;
      }
      sub_2471D1170(v92);
      swift_bridgeObjectRelease();
      sub_2471CB87C(v135, v28, v89, v134);
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v93 = sub_247205EA8();
      __swift_project_value_buffer(v93, (uint64_t)qword_26B128910);
      uint64_t v94 = v92;
      swift_retain();
      uint64_t v95 = v94;
      uint64_t v96 = sub_247205E98();
      os_log_type_t v97 = sub_247206178();
      int v98 = v97;
      if (os_log_type_enabled(v96, v97))
      {
        uint64_t v99 = swift_slowAlloc();
        uint64_t v128 = swift_slowAlloc();
        uint64_t aBlock = v128;
        *(_DWORD *)uint64_t v99 = 136315394;
        LODWORD(v127) = v98;
        swift_bridgeObjectRetain();
        uint64_t v150 = sub_2471F3F68(v135, v28, &aBlock);
        sub_2472062B8();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v99 + 12) = 2080;
        uint64_t v100 = sub_2472053C8();
        uint64_t v150 = sub_2471F3F68(v100, v101, &aBlock);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2471B4000, v96, (os_log_type_t)v127, "#AsrOnServer Invoked posting of AsrResultCandidateMessage for request: %s rcId: %s", (uint8_t *)v99, 0x16u);
        uint64_t v102 = v128;
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v102, -1, -1);
        MEMORY[0x24C54D9C0](v99, -1, -1);
      }
      else
      {

        swift_release();
      }
      if (v131) {
        goto LABEL_85;
      }
    }
LABEL_73:
    long long v103 = v136;
    v138(v136, v130, v4);
    char v104 = sub_247205FB8();
    v141(v103, v4);
    if (v104)
    {
      swift_bridgeObjectRelease();
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v105 = sub_247205EA8();
      __swift_project_value_buffer(v105, (uint64_t)qword_26B128910);
      id v106 = sub_247205E98();
      os_log_type_t v107 = sub_247206188();
      BOOL v108 = os_log_type_enabled(v106, v107);
      unint64_t v109 = v142;
      if (v108)
      {
        os_log_type_t v110 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v110 = 0;
        _os_log_impl(&dword_2471B4000, v106, v107, "#AsrOnServer we are in StartUnderstandingOnServer path. Not posting ResultSelectedMessage. We shouldn't receive empty recognition for StartUnderstaingOnServer.", v110, 2u);
        MEMORY[0x24C54D9C0](v110, -1, -1);
      }
    }
    else
    {
      uint64_t v124 = swift_allocObject();
      swift_weakInit();
      uint64_t v125 = swift_allocObject();
      uint64_t v126 = v132;
      *(void *)(v125 + 16) = v124;
      *(void *)(v125 + 24) = v126;
      *(void *)(v125 + 32) = v134;
      *(unsigned char *)(v125 + 40) = 0;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_2471CBC44(0x7065636361204352, (void *)0xED000065636E6174, (uint64_t)sub_2471DA590, v125);
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      unint64_t v109 = v142;
    }
    if (v109) {
      v109(0, 0);
    }
LABEL_94:

    return;
  }
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_247205EA8();
  uint64_t v33 = __swift_project_value_buffer(v32, (uint64_t)qword_26B128910);
  swift_retain();
  v136 = (char *)v33;
  uint64_t v34 = sub_247205E98();
  os_log_type_t v35 = sub_247206178();
  if (os_log_type_enabled(v34, v35))
  {
    unint64_t v36 = (uint8_t *)swift_slowAlloc();
    uint64_t v134 = swift_slowAlloc();
    uint64_t aBlock = v134;
    *(_DWORD *)unint64_t v36 = 136315138;
    id v133 = v36 + 4;
    swift_bridgeObjectRetain();
    uint64_t v150 = sub_2471F3F68(v135, v28, &aBlock);
    sub_2472062B8();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v34, v35, "#AsrOnServer Medoc enabled. Not posting AsrResultCandidateMessage for request: %s.", v36, 0xCu);
    uint64_t v37 = v134;
    swift_arrayDestroy();
    id v22 = v143;
    MEMORY[0x24C54D9C0](v37, -1, -1);
    uint64_t v38 = v36;
    uint64_t v20 = v16;
    MEMORY[0x24C54D9C0](v38, -1, -1);
  }
  else
  {

    swift_release();
  }
  id v63 = objc_msgSend(v22, sel_recognition);

  v138(v10, *MEMORY[0x263F70A90], v4);
  sub_2472060B8();
  sub_2472060B8();
  if (aBlock == v150 && v145 == v151)
  {
    swift_bridgeObjectRelease_n();
    v141(v10, v4);
    uint64_t v64 = v142;
    if (!v63)
    {
LABEL_48:
      uint64_t v66 = sub_247205E98();
      os_log_type_t v67 = sub_247206188();
      if (os_log_type_enabled(v66, v67))
      {
        uint64_t v68 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v68 = 0;
        _os_log_impl(&dword_2471B4000, v66, v67, "#AsrOnServer we are in StartUnderstandingOnServer path and received empty recognition, which shouldn't happen. Not posting ResultSelectedMessage.", v68, 2u);
        MEMORY[0x24C54D9C0](v68, -1, -1);
      }

      if (v64) {
        v64(0, 0);
      }
      return;
    }
  }
  else
  {
    char v65 = sub_2472064A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v141(v10, v4);
    uint64_t v64 = v142;
    if ((v65 & 1) != 0 && !v63) {
      goto LABEL_48;
    }
  }
  uint64_t v69 = *(void **)(v20 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serviceHelper);
  if (objc_msgSend(v69, sel_respondsToSelector_, sel_selectResultWithResultCandidate_completion_))
  {
    uint64_t v70 = swift_allocObject();
    swift_weakInit();
    unint64_t v71 = (void *)swift_allocObject();
    v71[2] = v70;
    v71[3] = v64;
    v71[4] = v137;
    v148 = sub_2471DA5E8;
    long long v149 = v71;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v145 = 1107296256;
    unint64_t v146 = sub_2471DC9B8;
    uint64_t v147 = &block_descriptor_66;
    uint64_t v72 = _Block_copy(&aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    sub_2471DA438((uint64_t)v64);
    swift_retain();
    swift_release();
    objc_msgSend(v69, sel_selectResultWithResultCandidate_completion_, v143, v72);
    _Block_release(v72);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
}

void sub_2471D3A94(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void, void), uint64_t a5)
{
  uint64_t v59 = a5;
  uint64_t v7 = sub_247205EA8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_247205AA8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v7, (uint64_t)qword_26B128910);
    uint64_t v17 = sub_247205E98();
    os_log_type_t v18 = sub_247206188();
    if (os_log_type_enabled(v17, v18))
    {
      char v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v19 = 0;
      _os_log_impl(&dword_2471B4000, v17, v18, "#AsrOnServer self expired. Ignoring RC acceptance result.", v19, 2u);
      MEMORY[0x24C54D9C0](v19, -1, -1);
    }

    if (a4) {
      a4(0, 0);
    }
    return;
  }
  uint64_t v16 = Strong;
  uint64_t v57 = v8;
  uint64_t v58 = a4;
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F70A90], v11);
  sub_2471DA4D8(&qword_269241178, MEMORY[0x263F70AD0]);
  sub_2472060B8();
  sub_2472060B8();
  if (v62[0] == v60 && v62[1] == v61)
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    char v20 = sub_2472064A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    if ((v20 & 1) == 0)
    {
      if (v58) {
        v58(0, 0);
      }
      goto LABEL_26;
    }
  }
  if (!a1 || (self, (uint64_t v21 = swift_dynamicCastObjCClass()) == 0))
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v7, (uint64_t)qword_26B128910);
    char v29 = sub_247205E98();
    os_log_type_t v30 = sub_247206198();
    BOOL v31 = os_log_type_enabled(v29, v30);
    uint64_t v32 = v58;
    if (v31)
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_2471B4000, v29, v30, "#AsrOnServer Did not receive SAResultSelected for RC acceptance. RC not accepted.", v33, 2u);
      MEMORY[0x24C54D9C0](v33, -1, -1);
    }

    if (v32) {
      v32(0, 0);
    }
LABEL_26:
    swift_release();
    return;
  }
  id v22 = (void *)v21;
  id v23 = a1;
  id v24 = objc_msgSend(v22, sel_refId);
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = sub_247205FD8();
    uint64_t v28 = v27;

    if (v26 == *(void *)(v16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId)
      && v28 == *(void *)(v16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8))
    {
      swift_bridgeObjectRelease();
LABEL_29:
      os_log_type_t v35 = (void (*)(void *, void))v58;
      if (v58)
      {
        id v36 = v23;
        v35(v22, 0);
      }
      if (qword_26B128578 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v7, (uint64_t)qword_26B128910);
      uint64_t v37 = sub_247205E98();
      os_log_type_t v38 = sub_247206178();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl(&dword_2471B4000, v37, v38, "#AsrOnServer we are in StartUnderstandingOnServer path. Sent ResultSelected to the server.", v39, 2u);
        MEMORY[0x24C54D9C0](v39, -1, -1);

        swift_release();
      }
      else
      {

        swift_release();
      }
      return;
    }
    char v34 = sub_2472064A8();
    swift_bridgeObjectRelease();
    if (v34) {
      goto LABEL_29;
    }
  }
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v40 = __swift_project_value_buffer(v7, (uint64_t)qword_26B128910);
  uint64_t v41 = v57;
  (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v10, v40, v7);
  id v42 = v23;
  swift_retain_n();
  id v43 = v42;
  uint64_t v44 = sub_247205E98();
  int v45 = sub_247206188();
  if (os_log_type_enabled(v44, (os_log_type_t)v45))
  {
    int v56 = v45;
    uint64_t v46 = swift_slowAlloc();
    uint64_t v55 = swift_slowAlloc();
    v62[0] = v55;
    *(_DWORD *)uint64_t v46 = 136315394;
    id v47 = objc_msgSend(v22, (SEL)&selRef_localSpeechRecognizerClient_didAcceptedEagerResultWithRequestId_rcId_mitigationSignal_featuresToLog_);
    if (!v47)
    {

      swift_release();
      __break(1u);
      return;
    }
    os_log_type_t v48 = v47;
    uint64_t v49 = sub_247205FD8();
    unint64_t v51 = v50;

    uint64_t v60 = sub_2471F3F68(v49, v51, v62);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v46 + 12) = 2080;
    uint64_t v52 = *(void *)(v16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
    unint64_t v53 = *(void *)(v16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
    swift_bridgeObjectRetain();
    uint64_t v60 = sub_2471F3F68(v52, v53, v62);
    sub_2472062B8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v44, (os_log_type_t)v56, "#AsrOnServer The refId of ResultSelected %s doesn't match current requestId: %s. Ignoring RC acceptance result.", (uint8_t *)v46, 0x16u);
    uint64_t v54 = v55;
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v54, -1, -1);
    MEMORY[0x24C54D9C0](v46, -1, -1);

    (*(void (**)(char *, uint64_t))(v57 + 8))(v10, v7);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v7);
  }
  if (v58) {
    v58(0, 0);
  }
  swift_release();
}

uint64_t sub_2471D4320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v27[1] = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C00);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v13 - 8);
  unint64_t v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *MEMORY[0x263F709E0];
  uint64_t v17 = sub_247205A38();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 104))(v15, v16, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  sub_247204F28();
  swift_bridgeObjectRetain();
  sub_247204F08();
  uint64_t v19 = a2 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  uint64_t v20 = sub_247204938();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v12, v19, v20);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v12, 0, 1, v20);
  sub_247204F58();
  swift_bridgeObjectRetain();
  sub_247204F48();
  swift_bridgeObjectRetain();
  sub_247204EF8();
  id v22 = a5;
  sub_247204F18();
  uint64_t v23 = a2 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_userId;
  uint64_t v24 = sub_247205B68();
  uint64_t v25 = *(void *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v9, v23, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v9, 0, 1, v24);
  return sub_247204F38();
}

void sub_2471D465C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void, void), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v71 = a6;
  uint64_t v72 = a7;
  uint64_t v10 = sub_247205EA8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_247205AA8();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v19 = Strong;
    if (a1)
    {
      self;
      uint64_t v20 = swift_dynamicCastObjCClass();
      if (v20)
      {
        uint64_t v69 = v11;
        uint64_t v21 = (void *)v20;
        id v70 = a1;
        id v66 = v21;
        id v22 = objc_msgSend(v21, sel_refId);
        if (v22)
        {
          uint64_t v23 = v22;
          os_log_type_t v67 = a4;
          uint64_t v68 = a5;
          uint64_t v24 = sub_247205FD8();
          uint64_t v26 = v25;

          if (v24 == *(void *)(v19 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId)
            && v26 == *(void *)(v19 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8))
          {
            swift_bridgeObjectRelease();
            a4 = v67;
LABEL_22:
            (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x263F70A90], v14);
            sub_2471DA4D8(&qword_269241178, MEMORY[0x263F70AD0]);
            sub_2472060B8();
            sub_2472060B8();
            if (v75[0] == v73 && v75[1] == v74)
            {
              swift_bridgeObjectRelease_n();
              (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
            }
            else
            {
              char v50 = sub_2472064A8();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
              if ((v50 & 1) == 0)
              {
                id v56 = objc_msgSend(v66, sel_isMitigated);
                sub_2471CAE98(0, (unint64_t *)&unk_26B128690);
                uint64_t v57 = (void *)sub_247206268();
                uint64_t v58 = v57;
                id v51 = v70;
                if (v56)
                {
                  id v59 = v56;
                  char v60 = sub_247206278();

                  char v61 = v60 ^ 1;
                }
                else
                {

                  char v61 = 1;
                }
                uint64_t v62 = swift_allocObject();
                swift_weakInit();
                uint64_t v63 = swift_allocObject();
                uint64_t v64 = v71;
                uint64_t v65 = v72;
                *(void *)(v63 + 16) = v62;
                *(void *)(v63 + 24) = v64;
                *(void *)(v63 + 32) = v65;
                *(unsigned char *)(v63 + 40) = v61 & 1;
                swift_retain();
                swift_bridgeObjectRetain();
                sub_2471CBC44(0x7065636361204352, (void *)0xED000065636E6174, (uint64_t)sub_2471DA648, v63);
                swift_release();
                swift_release();
                if (a4) {
                  a4(0, 0);
                }
LABEL_47:
                swift_release();

                return;
              }
            }
            id v51 = v70;
            if (a4)
            {
              id v52 = v70;
              a4(v66, 0);
            }
            if (qword_26B128578 != -1) {
              swift_once();
            }
            __swift_project_value_buffer(v10, (uint64_t)qword_26B128910);
            unint64_t v53 = sub_247205E98();
            os_log_type_t v54 = sub_247206178();
            if (os_log_type_enabled(v53, v54))
            {
              uint64_t v55 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v55 = 0;
              _os_log_impl(&dword_2471B4000, v53, v54, "#AsrOnServer we are in StartUnderstandingOnServer path. Sent ResultSelected to the server.", v55, 2u);
              MEMORY[0x24C54D9C0](v55, -1, -1);

              swift_release();
              return;
            }

            goto LABEL_47;
          }
          char v33 = sub_2472064A8();
          swift_bridgeObjectRelease();
          a4 = v67;
          a5 = v68;
          if (v33) {
            goto LABEL_22;
          }
        }
        if (qword_26B128578 != -1) {
          swift_once();
        }
        uint64_t v34 = __swift_project_value_buffer(v10, (uint64_t)qword_26B128910);
        uint64_t v35 = v69;
        (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v13, v34, v10);
        id v36 = v70;
        swift_retain_n();
        id v37 = v36;
        os_log_type_t v38 = sub_247205E98();
        int v39 = sub_247206188();
        if (os_log_type_enabled(v38, (os_log_type_t)v39))
        {
          LODWORD(v72) = v39;
          uint64_t v40 = v37;
          os_log_type_t v67 = a4;
          uint64_t v68 = a5;
          uint64_t v41 = swift_slowAlloc();
          uint64_t v71 = swift_slowAlloc();
          v75[0] = v71;
          *(_DWORD *)uint64_t v41 = 136315394;
          id v42 = objc_msgSend(v66, sel_refId);
          if (!v42)
          {

            swift_release();
            __break(1u);
            return;
          }
          id v43 = v42;
          uint64_t v44 = sub_247205FD8();
          unint64_t v46 = v45;

          uint64_t v73 = sub_2471F3F68(v44, v46, v75);
          sub_2472062B8();

          swift_bridgeObjectRelease();
          *(_WORD *)(v41 + 12) = 2080;
          uint64_t v47 = *(void *)(v19 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
          unint64_t v48 = *(void *)(v19 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
          swift_bridgeObjectRetain();
          uint64_t v73 = sub_2471F3F68(v47, v48, v75);
          id v37 = v40;
          sub_2472062B8();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2471B4000, v38, (os_log_type_t)v72, "#AsrOnServer The refId of ResultSelected %s doesn't match the current requestId: %s. Ignoring RC acceptance result.", (uint8_t *)v41, 0x16u);
          uint64_t v49 = v71;
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v49, -1, -1);
          MEMORY[0x24C54D9C0](v41, -1, -1);

          (*(void (**)(char *, uint64_t))(v69 + 8))(v13, v10);
          a4 = v67;
          if (!v67)
          {
LABEL_33:
            swift_release();

            return;
          }
        }
        else
        {

          swift_release_n();
          (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v10);
          if (!a4) {
            goto LABEL_33;
          }
        }
        a4(0, 0);
        goto LABEL_33;
      }
    }
    if (qword_26B128578 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v10, (uint64_t)qword_26B128910);
    uint64_t v27 = sub_247205E98();
    os_log_type_t v28 = sub_247206198();
    if (os_log_type_enabled(v27, v28))
    {
      char v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v29 = 0;
      _os_log_impl(&dword_2471B4000, v27, v28, "#AsrOnServer Did not receive SAResultSelected for RC acceptance. RC not accepted.", v29, 2u);
      MEMORY[0x24C54D9C0](v29, -1, -1);
    }

    if (a4) {
      a4(0, 0);
    }
    swift_release();
  }
  else
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v10, (uint64_t)qword_26B128910);
    os_log_type_t v30 = sub_247205E98();
    os_log_type_t v31 = sub_247206188();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_2471B4000, v30, v31, "#AsrOnServer self expired. Ignoring RC acceptance result.", v32, 2u);
      MEMORY[0x24C54D9C0](v32, -1, -1);
    }

    if (a4) {
      a4(0, 0);
    }
  }
}

void sub_2471D5038(void *a1, void *a2, int64_t a3, void *a4)
{
  id v150 = a2;
  uint64_t v164 = sub_247205B68();
  uint64_t v7 = *(void ***)(v164 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v164);
  uint64_t v163 = (char *)&v146 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v146 - v10;
  if (qword_26B128578 == -1) {
    goto LABEL_2;
  }
LABEL_85:
  swift_once();
LABEL_2:
  uint64_t v12 = sub_247205EA8();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_26B128910);
  id v14 = a1;
  uint64_t v153 = v13;
  uint64_t v15 = sub_247205E98();
  os_log_type_t v16 = sub_247206178();
  BOOL v17 = os_log_type_enabled(v15, v16);
  unint64_t v152 = a4;
  v165 = v11;
  v168 = (char *)v7;
  if (v17)
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    int64_t v19 = a3;
    uint64_t v20 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 138412290;
    v171[0] = (uint64_t)v14;
    id v21 = v14;
    sub_2472062B8();
    void *v20 = v14;

    _os_log_impl(&dword_2471B4000, v15, v16, "#AsrOnServer Received %@", v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    id v22 = v20;
    a3 = v19;
    MEMORY[0x24C54D9C0](v22, -1, -1);
    MEMORY[0x24C54D9C0](v18, -1, -1);
  }
  else
  {
  }
  id v23 = objc_msgSend(v14, sel_refId);
  if (!v23)
  {
LABEL_14:
    unint64_t v46 = sub_247205E98();
    os_log_type_t v47 = sub_247206188();
    if (!os_log_type_enabled(v46, v47)) {
      goto LABEL_20;
    }
    unint64_t v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v48 = 0;
    uint64_t v49 = "#AsrOnServer Response refId does not match current requestId";
    goto LABEL_16;
  }
  uint64_t v24 = v23;
  uint64_t v25 = sub_247205FD8();
  uint64_t v27 = v26;

  uint64_t v7 = *(void ***)(v166 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
  uint64_t v28 = *(void *)(v166 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
  if ((void **)v25 == v7 && v27 == v28)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v29 = sub_2472064A8();
    swift_bridgeObjectRelease();
    if ((v29 & 1) == 0) {
      goto LABEL_14;
    }
  }
  id v30 = objc_msgSend(v14, sel_rcID);
  if (!v30)
  {
    id v51 = v14;
    unint64_t v46 = sub_247205E98();
    os_log_type_t v52 = sub_247206188();
    if (os_log_type_enabled(v46, v52))
    {
      unint64_t v53 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v54 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v53 = 138412290;
      v171[0] = (uint64_t)v51;
      uint64_t v55 = v51;
      sub_2472062B8();
      *os_log_type_t v54 = v51;

      _os_log_impl(&dword_2471B4000, v46, v52, "#AsrOnServer No rcId found in %@", v53, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v54, -1, -1);
      char v50 = v53;
LABEL_19:
      MEMORY[0x24C54D9C0](v50, -1, -1);
    }
    else
    {

      unint64_t v46 = v51;
    }
LABEL_20:

    if (a3) {
      ((void (*)(void, void))a3)(0, 0);
    }
    return;
  }
  os_log_type_t v31 = v30;
  uint64_t v32 = (uint8_t *)sub_247205FD8();
  uint64_t v34 = v33;

  id v162 = v14;
  id v35 = objc_msgSend(v14, sel_resultCandidates);
  if (!v35)
  {
    swift_bridgeObjectRelease();
    unint64_t v46 = sub_247205E98();
    os_log_type_t v47 = sub_247206188();
    if (!os_log_type_enabled(v46, v47)) {
      goto LABEL_20;
    }
    unint64_t v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v48 = 0;
    uint64_t v49 = "#AsrOnServer No result candidates found";
LABEL_16:
    _os_log_impl(&dword_2471B4000, v46, v47, v49, v48, 2u);
    char v50 = v48;
    goto LABEL_19;
  }
  id v36 = v35;
  sub_2471CAE98(0, (unint64_t *)&unk_269241180);
  uint64_t v37 = sub_247205F68();

  swift_bridgeObjectRetain_n();
  os_log_type_t v38 = sub_247205E98();
  os_log_type_t v39 = sub_247206178();
  uint64_t v11 = (char *)v39;
  BOOL v40 = os_log_type_enabled(v38, v39);
  v160 = v32;
  uint64_t v161 = v34;
  long long v149 = (void (*)(void, void))a3;
  uint64_t v148 = v28;
  uint64_t v147 = v7;
  if (v40)
  {
    uint64_t v41 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    v171[0] = v42;
    *(_DWORD *)uint64_t v41 = 136315138;
    uint64_t v7 = (void **)(v41 + 4);
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_247205F88();
    unint64_t v45 = v44;
    swift_bridgeObjectRelease();
    uint64_t v169 = sub_2471F3F68(v43, v45, v171);
    sub_2472062B8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v38, (os_log_type_t)v11, "#AsrOnServer muxResultCandidate received with recognitions for the following userIds: %s", v41, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v42, -1, -1);
    MEMORY[0x24C54D9C0](v41, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  a4 = v162;
  v172[0] = sub_2471EC954(MEMORY[0x263F8EE78]);
  a1 = (void *)sub_2471CAE98(0, (unint64_t *)&unk_26B128690);
  uint64_t v151 = a1;
  id v56 = (char *)sub_247206268();
  a3 = 0;
  uint64_t v57 = *(void *)(v37 + 64);
  uint64_t v154 = v37 + 64;
  uint64_t v58 = 1 << *(unsigned char *)(v37 + 32);
  uint64_t v59 = -1;
  if (v58 < 64) {
    uint64_t v59 = ~(-1 << v58);
  }
  unint64_t v60 = v59 & v57;
  uint64_t v159 = OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_muxRequestContext;
  int64_t v155 = (unint64_t)(v58 + 63) >> 6;
  v157 = (void (**)(char *, uint64_t, uint64_t))(v168 + 16);
  uint64_t v156 = (void **)(v168 + 8);
  uint64_t v158 = v37;
  if ((v59 & v57) != 0)
  {
LABEL_28:
    unint64_t v61 = __clz(__rbit64(v60));
    uint64_t v62 = (v60 - 1) & v60;
    unint64_t v63 = v61 | (a3 << 6);
    goto LABEL_43;
  }
  while (1)
  {
    int64_t v64 = a3 + 1;
    if (__OFADD__(a3, 1))
    {
      __break(1u);
      goto LABEL_85;
    }
    if (v64 >= v155) {
      goto LABEL_53;
    }
    unint64_t v65 = *(void *)(v154 + 8 * v64);
    ++a3;
    if (!v65)
    {
      a3 = v64 + 1;
      if (v64 + 1 >= v155) {
        goto LABEL_53;
      }
      unint64_t v65 = *(void *)(v154 + 8 * a3);
      if (!v65)
      {
        a3 = v64 + 2;
        if (v64 + 2 >= v155) {
          goto LABEL_53;
        }
        unint64_t v65 = *(void *)(v154 + 8 * a3);
        if (!v65) {
          break;
        }
      }
    }
LABEL_42:
    uint64_t v62 = (v65 - 1) & v65;
    unint64_t v63 = __clz(__rbit64(v65)) + (a3 << 6);
LABEL_43:
    os_log_type_t v67 = *(void **)(*(void *)(v37 + 56) + 8 * v63);
    swift_bridgeObjectRetain();
    id v68 = v67;
    id v69 = objc_msgSend(v68, sel_resultId);
    if (!v69)
    {
      v168 = v56;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v90 = a4;
      id v91 = sub_247205E98();
      os_log_type_t v92 = sub_247206188();
      if (os_log_type_enabled(v91, v92))
      {
        uint64_t v93 = (uint8_t *)swift_slowAlloc();
        v167 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v93 = 138412290;
        v171[0] = (uint64_t)v90;
        uint64_t v94 = v90;
        sub_2472062B8();
        uint64_t v95 = v167;
        void *v167 = v90;

        _os_log_impl(&dword_2471B4000, v91, v92, "#AsrOnServer Malformed or missing resultId in %@", v93, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v95, -1, -1);
        MEMORY[0x24C54D9C0](v93, -1, -1);
      }
      else
      {

        id v91 = v90;
      }
      uint64_t v105 = v149;

      if (v105)
      {
        v105(0, 0);
        swift_release();
      }
      else
      {

        swift_release();
      }
      goto LABEL_82;
    }
    id v70 = v69;
    v167 = (void *)v62;
    v168 = (char *)a3;
    uint64_t v71 = sub_247205FD8();
    uint64_t v73 = v72;

    id v74 = objc_msgSend(v68, sel_processedAudioDuration);
    if (!v74) {
      id v74 = (id)sub_247206268();
    }

    sub_247205FF8();
    os_log_type_t v75 = (char *)v74;
    swift_bridgeObjectRelease();
    uint64_t v76 = (uint64_t)v165;
    sub_247205B48();
    id v77 = objc_msgSend(a4, sel_refId);
    if (!v77) {
      goto LABEL_87;
    }
    char v78 = v77;
    uint64_t v79 = sub_247205FD8();
    uint64_t v81 = v80;

    LODWORD(v78) = objc_msgSend(v75, sel_unsignedIntValue);
    os_log_type_t v82 = v75;

    sub_2471D9844(v76, v160, v161, v71, v73, v68, v79, v81, (int)v78);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v83 = objc_msgSend(v68, sel_processedAudioDuration);
    if (!v83) {
      goto LABEL_88;
    }
    uint64_t v84 = v83;
    sub_247206148();

    uint64_t v85 = (void *)sub_247206208();
    uint64_t v86 = (uint64_t)v163;
    uint64_t v11 = (char *)v164;
    (*v157)(v163, v76, v164);
    id v87 = v85;
    uint64_t v88 = v172[0];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v171[0] = v88;
    sub_2471FED78((uint64_t)v87, v86, isUniquelyReferenced_nonNull_native);
    v172[0] = v171[0];
    swift_bridgeObjectRelease();
    uint64_t v7 = v156;
    a1 = *v156;
    ((void (*)(uint64_t, char *))*v156)(v86, v11);

    ((void (*)(uint64_t, char *))a1)(v76, v11);
    id v56 = v82;
    a4 = v162;
    uint64_t v37 = v158;
    unint64_t v60 = (unint64_t)v167;
    a3 = (int64_t)v168;
    if (v167) {
      goto LABEL_28;
    }
  }
  int64_t v66 = v64 + 3;
  if (v66 >= v155)
  {
LABEL_53:
    uint64_t v96 = swift_release();
    if (!v150)
    {
      swift_bridgeObjectRelease();
      id v106 = sub_247205E98();
      os_log_type_t v107 = sub_247206188();
      BOOL v108 = os_log_type_enabled(v106, v107);
      unint64_t v109 = v149;
      if (v108)
      {
        os_log_type_t v110 = v56;
        uint64_t v111 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v111 = 0;
        _os_log_impl(&dword_2471B4000, v106, v107, "#AsrOnServer no voiceIdScoreCard exists.  This would be caused by a missing or invalid HomeMemberInfo", v111, 2u);
        uint64_t v112 = v111;
        id v56 = v110;
        MEMORY[0x24C54D9C0](v112, -1, -1);
      }

      if (v109) {
        v109(0, 0);
      }

      goto LABEL_82;
    }
    v168 = v56;
    uint64_t v97 = v166;
    if (*(unsigned char *)(v166 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_isIdentityScoreConsumptionEnabled))
    {
      uint64_t v98 = 0xD000000000000017;
      MEMORY[0x270FA5388](v96);
      uint64_t v100 = v160;
      uint64_t v99 = v161;
      *(&v146 - 4) = v97;
      *(&v146 - 3) = (uint64_t)v100;
      uint64_t v144 = v99;
      uint64_t v145 = v172;
      id v101 = objc_allocWithZone((Class)sub_247204CC8());
      id v102 = v150;
      long long v103 = (void *)sub_247204C58();
      unint64_t v104 = 0x80000002472087F0;
      if (!v103) {
        goto LABEL_78;
      }
    }
    else
    {
      MEMORY[0x270FA5388](v96);
      os_log_type_t v113 = v160;
      uint64_t v114 = v161;
      *(&v146 - 6) = v97;
      *(&v146 - 5) = (uint64_t)v113;
      *(&v146 - 4) = v114;
      *(&v146 - 3) = (uint64_t)v172;
      id v115 = v150;
      uint64_t v144 = (uint64_t)v150;
      id v116 = objc_allocWithZone((Class)sub_247205398());
      id v117 = v115;
      long long v103 = (void *)sub_247205318();
      uint64_t v98 = 0xD00000000000001CLL;
      unint64_t v104 = 0x80000002472087D0;
      if (!v103)
      {
LABEL_78:
        swift_bridgeObjectRelease();
        swift_retain_n();
        swift_bridgeObjectRetain();
        uint64_t v139 = sub_247205E98();
        os_log_type_t v140 = sub_247206188();
        if (os_log_type_enabled(v139, v140))
        {
          uint64_t v141 = swift_slowAlloc();
          uint64_t v142 = swift_slowAlloc();
          v171[0] = v142;
          *(_DWORD *)uint64_t v141 = 136315394;
          swift_bridgeObjectRetain();
          uint64_t v169 = sub_2471F3F68(v98, v104, v171);
          sub_2472062B8();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v141 + 12) = 2080;
          unint64_t v143 = v148;
          swift_bridgeObjectRetain();
          uint64_t v169 = sub_2471F3F68((uint64_t)v147, v143, v171);
          sub_2472062B8();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2471B4000, v139, v140, "#AsrOnServer Failed to create %s for request: %s", (uint8_t *)v141, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v142, -1, -1);
          MEMORY[0x24C54D9C0](v141, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_release_n();
        }

LABEL_82:
        swift_bridgeObjectRelease();
        return;
      }
      uint64_t v97 = v166;
      uint64_t v100 = v160;
      uint64_t v99 = v161;
    }
    id v118 = v103;
    uint64_t v119 = (uint64_t)v147;
    unint64_t v120 = v148;
    sub_2471CB8AC((uint64_t)v147, v148, (uint64_t)v100, v99);
    id v121 = v118;
    swift_retain_n();
    uint64_t v122 = v121;
    swift_bridgeObjectRetain();
    uint64_t v123 = sub_247205E98();
    os_log_type_t v124 = sub_247206178();
    if (os_log_type_enabled(v123, v124))
    {
      uint64_t v125 = swift_slowAlloc();
      v167 = (void *)swift_slowAlloc();
      v171[0] = (uint64_t)v167;
      *(_DWORD *)uint64_t v125 = 136315650;
      swift_bridgeObjectRetain();
      uint64_t v169 = sub_2471F3F68(v98, v104, v171);
      sub_2472062B8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v125 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v169 = sub_2471F3F68(v119, v120, v171);
      sub_2472062B8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v125 + 22) = 2080;
      uint64_t v126 = sub_2472053C8();
      uint64_t v169 = sub_2471F3F68(v126, v127, v171);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v123, v124, "#AsrOnServer Posting result candidate event %s for request: %s rcId: %s", (uint8_t *)v125, 0x20u);
      uint64_t v128 = v167;
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v128, -1, -1);
      MEMORY[0x24C54D9C0](v125, -1, -1);
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
    }
    sub_2471D1170(v122);
    uint64_t v131 = *(void *)(v97 + v159);
    uint64_t v132 = v149;
    if (v130)
    {
      id v133 = v129;
      uint64_t v134 = v130;
      swift_bridgeObjectRelease();
      *(unsigned char *)(v131 + 40) = 1;
      swift_beginAccess();
      *(void *)(v131 + 32) = MEMORY[0x263F8EE80];
      swift_bridgeObjectRelease();
      uint64_t v135 = v133;
      v136 = v168;
    }
    else
    {
      v136 = v168;
      uint64_t v135 = v160;
      uint64_t v134 = v161;
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    char v137 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v170 = *(void *)(v131 + 32);
    *(void *)(v131 + 32) = 0x8000000000000000;
    sub_2471FEC0C(0, (uint64_t)v135, v134, v137);
    *(void *)(v131 + 32) = v170;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_bridgeObjectRelease();
    if (v132)
    {
      v132(0, 0);
      uint64_t v138 = v122;
    }
    else
    {
      uint64_t v138 = v136;
      v136 = v122;
    }

    goto LABEL_82;
  }
  unint64_t v65 = *(void *)(v154 + 8 * v66);
  if (v65)
  {
    a3 = v66;
    goto LABEL_42;
  }
  while (1)
  {
    a3 = v66 + 1;
    if (__OFADD__(v66, 1)) {
      break;
    }
    if (a3 >= v155) {
      goto LABEL_53;
    }
    unint64_t v65 = *(void *)(v154 + 8 * a3);
    ++v66;
    if (v65) {
      goto LABEL_42;
    }
  }
  __break(1u);
LABEL_87:
  __break(1u);
LABEL_88:
  __break(1u);
}

uint64_t sub_2471D63E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *MEMORY[0x263F709E0];
  uint64_t v10 = sub_247205A38();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_247204C98();
  swift_bridgeObjectRetain();
  sub_247204C78();
  uint64_t v12 = a2 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  uint64_t v13 = sub_247204938();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  sub_247204CB8();
  swift_bridgeObjectRetain();
  sub_247204CA8();
  swift_bridgeObjectRetain();
  sub_247204C88();
  swift_bridgeObjectRetain();
  return sub_247204C68();
}

uint64_t sub_2471D664C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  v22[1] = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *MEMORY[0x263F709E0];
  uint64_t v15 = sub_247205A38();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  sub_247205368();
  swift_bridgeObjectRetain();
  sub_247205338();
  uint64_t v17 = a2 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  uint64_t v18 = sub_247204938();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  sub_247205388();
  swift_bridgeObjectRetain();
  sub_247205378();
  swift_bridgeObjectRetain();
  sub_247205328();
  swift_bridgeObjectRetain();
  sub_247205358();
  id v20 = a6;
  return sub_247205348();
}

void sub_2471D68C8(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_247205AA8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_247205EA8();
  uint64_t v11 = __swift_project_value_buffer(v10, (uint64_t)qword_26B128910);
  uint64_t v12 = a1;
  uint64_t v13 = sub_247205E98();
  os_log_type_t v14 = sub_247206178();
  BOOL v15 = os_log_type_enabled(v13, v14);
  id v80 = a2;
  if (v15)
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v78 = v11;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v79 = v3;
    uint64_t v76 = (void *)v18;
    *(_DWORD *)uint64_t v17 = 138412290;
    id aBlock = v12;
    uint64_t v19 = v12;
    uint64_t v77 = v6;
    uint64_t v20 = v7;
    id v21 = v19;
    sub_2472062B8();
    id v22 = v76;
    *uint64_t v76 = v12;

    uint64_t v7 = v20;
    uint64_t v6 = v77;
    _os_log_impl(&dword_2471B4000, v13, v14, "#AsrOnServer Received %@", v17, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    uint64_t v3 = v79;
    MEMORY[0x24C54D9C0](v22, -1, -1);
    MEMORY[0x24C54D9C0](v17, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F70AB0], v6);
  sub_2471DA4D8(&qword_269241178, MEMORY[0x263F70AD0]);
  sub_2472060B8();
  sub_2472060B8();
  if (aBlock == (id)v88 && v82 == v89)
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    char v23 = sub_2472064A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if ((v23 & 1) == 0)
    {
      swift_retain();
      unint64_t v44 = sub_247205E98();
      os_log_type_t v45 = sub_247206188();
      if (os_log_type_enabled(v44, v45))
      {
        unint64_t v46 = (uint8_t *)swift_slowAlloc();
        uint64_t v47 = swift_slowAlloc();
        id aBlock = (id)v47;
        *(_DWORD *)unint64_t v46 = 136315138;
        uint64_t v48 = *(void *)&v3[OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId];
        unint64_t v49 = *(void *)&v3[OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8];
        swift_bridgeObjectRetain();
        uint64_t v88 = sub_2471F3F68(v48, v49, (uint64_t *)&aBlock);
        sub_2472062B8();
        swift_release();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2471B4000, v44, v45, "#AsrOnServer Exiting as the requestType is unsupported. Request: %s", v46, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v47, -1, -1);
        MEMORY[0x24C54D9C0](v46, -1, -1);

        return;
      }

      goto LABEL_34;
    }
  }
  uint64_t v24 = *(void *)&v3[OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_muxRequestContext];
  uint64_t v25 = sub_2472053C8();
  uint64_t v27 = v26;
  swift_beginAccess();
  uint64_t v28 = *(void *)(v24 + 24);
  if (*(void *)(v28 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v29 = sub_2471FC8B8(v25, v27);
    if (v30)
    {
      os_log_type_t v31 = *(void **)(*(void *)(v28 + 56) + 8 * v29);
      swift_retain();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      id v32 = v80;
      if (v80)
      {
        uint64_t v79 = v12;
        uint64_t v33 = v31[4];
        uint64_t v34 = v31[5];
        swift_beginAccess();
        id v80 = v32;
        swift_bridgeObjectRetain();
        sub_2471FCC04(v33, v34);
        swift_endAccess();
        swift_bridgeObjectRelease();
        swift_retain();
        id v35 = sub_247205E98();
        os_log_type_t v36 = sub_247206178();
        if (os_log_type_enabled(v35, v36))
        {
          uint64_t v37 = swift_slowAlloc();
          uint64_t v78 = swift_slowAlloc();
          id aBlock = (id)v78;
          *(_DWORD *)uint64_t v37 = 136315394;
          uint64_t v38 = v31[2];
          unint64_t v39 = v31[3];
          swift_bridgeObjectRetain();
          uint64_t v87 = sub_2471F3F68(v38, v39, (uint64_t *)&aBlock);
          sub_2472062B8();
          swift_bridgeObjectRelease();
          *(_WORD *)(v37 + 12) = 2080;
          BOOL v40 = v3;
          uint64_t v41 = v31[4];
          unint64_t v42 = v31[5];
          swift_bridgeObjectRetain();
          uint64_t v87 = sub_2471F3F68(v41, v42, (uint64_t *)&aBlock);
          sub_2472062B8();
          swift_release();
          uint64_t v3 = v40;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2471B4000, v35, v36, "#AsrOnServer Invoking RC acceptance for rcID: %s and asrRCId: %s", (uint8_t *)v37, 0x16u);
          uint64_t v43 = v78;
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v43, -1, -1);
          MEMORY[0x24C54D9C0](v37, -1, -1);
        }
        else
        {

          swift_release();
        }
        unint64_t v60 = v79;
        unint64_t v61 = *(void **)&v3[OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serviceHelper];
        if (objc_msgSend(v61, sel_respondsToSelector_, sel_selectResultWithResultCandidate_completion_))
        {
          uint64_t v62 = *(void **)((char *)v31 + OBJC_IVAR____TtC9ASRBridge28ASRMUXResultCandidateContext_resultCandidate);
          uint64_t v63 = swift_allocObject();
          swift_weakInit();
          int64_t v64 = (void *)swift_allocObject();
          v64[2] = v63;
          v64[3] = v31;
          id v65 = v80;
          v64[4] = v80;
          v64[5] = v60;
          uint64_t v85 = sub_2471DA498;
          uint64_t v86 = v64;
          id aBlock = (id)MEMORY[0x263EF8330];
          uint64_t v82 = 1107296256;
          id v83 = sub_2471DC9B8;
          uint64_t v84 = &block_descriptor_48;
          int64_t v66 = _Block_copy(&aBlock);
          os_log_type_t v67 = v60;
          swift_retain();
          id v68 = v65;
          swift_unknownObjectRetain();
          id v69 = v62;
          swift_retain();
          swift_retain();
          swift_release();
          objc_msgSend(v61, sel_selectResultWithResultCandidate_completion_, v69, v66);
          _Block_release(v66);

          swift_release();
          swift_release();
          swift_unknownObjectRelease();
        }
        if (v3[OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndPointReceived] != 1
          || (v3[OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndPointSentToSpeech] & 1) != 0)
        {
          goto LABEL_32;
        }
        id v70 = *(void **)&v3[OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndpointIdentifiedMessage];
        if (v70)
        {
          id v71 = v70;
          sub_2471D8D90(v71, 0, 0);

LABEL_32:
          swift_release();

          return;
        }
        uint64_t v72 = sub_247205E98();
        os_log_type_t v73 = sub_247206188();
        if (os_log_type_enabled(v72, v73))
        {
          id v74 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v74 = 0;
          _os_log_impl(&dword_2471B4000, v72, v73, "Cannot find cached SASSpeechServerEndpointIdentified message. Request will fail.", v74, 2u);
          MEMORY[0x24C54D9C0](v74, -1, -1);
          swift_release();

          return;
        }
      }
      else
      {
        uint64_t v57 = sub_247205E98();
        os_log_type_t v58 = sub_247206188();
        if (os_log_type_enabled(v57, v58))
        {
          uint64_t v59 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v59 = 0;
          _os_log_impl(&dword_2471B4000, v57, v58, "#AsrOnServer no voiceIdScoreCard exists.  This could be caused by a missing or invalid HomeMemberInfo", v59, 2u);
          MEMORY[0x24C54D9C0](v59, -1, -1);
          swift_release();

          return;
        }
      }
LABEL_34:
      swift_release();
      return;
    }
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRelease();
  char v50 = v12;
  id v51 = sub_247205E98();
  os_log_type_t v52 = sub_247206188();
  if (os_log_type_enabled(v51, v52))
  {
    unint64_t v53 = (uint8_t *)swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    id aBlock = (id)v54;
    *(_DWORD *)unint64_t v53 = 136315138;
    uint64_t v55 = sub_2472053C8();
    uint64_t v87 = sub_2471F3F68(v55, v56, (uint64_t *)&aBlock);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v51, v52, "#AsrOnServer ASRMUXResultCandidateContext not found for rcID=%s", v53, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v54, -1, -1);
    MEMORY[0x24C54D9C0](v53, -1, -1);
  }
  else
  {
  }
}

void sub_2471D73BC(void *a1, uint64_t a2, uint64_t a3, NSObject *a4, NSObject *a5, uint64_t a6)
{
  uint64_t v10 = sub_247205EA8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v10, (uint64_t)qword_26B128910);
    os_log_type_t v45 = sub_247205E98();
    os_log_type_t v46 = sub_247206188();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v47 = 0;
      _os_log_impl(&dword_2471B4000, v45, v46, "#AsrOnServer self expired. Ignoring RC acceptance result.", v47, 2u);
      MEMORY[0x24C54D9C0](v47, -1, -1);
    }

    return;
  }
  BOOL v15 = Strong;
  if (!a1 || (self, (uint64_t v16 = swift_dynamicCastObjCClass()) == 0))
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v10, (uint64_t)qword_26B128910);
    unint64_t v42 = sub_247205E98();
    os_log_type_t v43 = sub_247206178();
    if (!os_log_type_enabled(v42, v43))
    {

      swift_release();
      return;
    }
    unint64_t v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v44 = 0;
    _os_log_impl(&dword_2471B4000, v42, v43, "#AsrOnServer Did not receive SAResultSelected for RC acceptance. RC not accepted.", v44, 2u);
    MEMORY[0x24C54D9C0](v44, -1, -1);
    goto LABEL_19;
  }
  uint64_t v17 = v16;
  uint64_t v78 = a6;
  os_log_t v79 = a1;
  id v18 = [v17 refId];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = sub_247205FD8();
    id v22 = v21;

    char v23 = (uint64_t *)((char *)v15 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
    if ((Class)v20 == *(Class *)((char *)&v15->isa + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId)
      && v22 == *(objc_class **)((char *)&v15[1].isa + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId))
    {
      uint64_t v26 = swift_bridgeObjectRelease();
    }
    else
    {
      char v25 = sub_2472064A8();
      uint64_t v26 = swift_bridgeObjectRelease();
      if ((v25 & 1) == 0) {
        goto LABEL_10;
      }
    }
    if (*((unsigned char *)&v15->isa + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_isIdentityScoreConsumptionEnabled) == 1)
    {
      MEMORY[0x270FA5388](v26);
      *(&v75 - 4) = v15;
      *(&v75 - 3) = a4;
      *(&v75 - 2) = v17;
      id v48 = objc_allocWithZone((Class)sub_247205668());
      uint64_t v49 = sub_247204B88();
      uint64_t v50 = 0xD000000000000023;
      unint64_t v51 = 0x80000002472080F0;
      if (v49)
      {
        os_log_type_t v52 = (void *)v49;
LABEL_33:
        uint64_t v54 = qword_26B128578;
        id v55 = v52;
        if (v54 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v10, (uint64_t)qword_26B128910);
        id v56 = v55;
        swift_bridgeObjectRetain();
        uint64_t v57 = sub_247205E98();
        os_log_type_t v58 = sub_247206178();
        if (os_log_type_enabled(v57, v58))
        {
          uint64_t v59 = swift_slowAlloc();
          uint64_t v76 = (void *)swift_slowAlloc();
          uint64_t v77 = swift_slowAlloc();
          uint64_t v81 = v77;
          *(_DWORD *)uint64_t v59 = 136315394;
          os_log_t v75 = v57;
          swift_bridgeObjectRetain();
          uint64_t v80 = sub_2471F3F68(v50, v51, &v81);
          sub_2472062B8();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v59 + 12) = 2112;
          uint64_t v80 = (uint64_t)v56;
          id v60 = v56;
          sub_2472062B8();
          unint64_t v61 = v76;
          *uint64_t v76 = v52;

          os_log_t v62 = v75;
          _os_log_impl(&dword_2471B4000, v75, v58, "#AsrOnServer Posting result acceptance event %s %@.", (uint8_t *)v59, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v61, -1, -1);
          uint64_t v63 = v77;
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v63, -1, -1);
          MEMORY[0x24C54D9C0](v59, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        os_log_t v70 = v79;
        swift_retain();
        sub_2471D1B0C(v56);
        swift_release();
        uint64_t v71 = *v23;
        uint64_t v72 = v23[1];
        uint64_t v73 = sub_2472053C8();
        sub_2471CB8C4(v71, v72, v73, v74);
        swift_release();
        swift_bridgeObjectRelease();

        return;
      }
    }
    else
    {
      uint64_t v50 = 0xD000000000000018;
      MEMORY[0x270FA5388](v26);
      *(&v75 - 4) = v15;
      *(&v75 - 3) = a4;
      *(&v75 - 2) = v17;
      *(&v75 - 1) = a5;
      id v53 = objc_allocWithZone((Class)sub_247204E58());
      os_log_type_t v52 = (void *)sub_247204DD8();
      unint64_t v51 = 0x80000002472080D0;
      if (v52) {
        goto LABEL_33;
      }
    }
    uint64_t v64 = v50;
    if (qword_26B128578 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v10, (uint64_t)qword_26B128910);
    swift_retain_n();
    swift_bridgeObjectRetain();
    unint64_t v42 = sub_247205E98();
    os_log_type_t v65 = sub_247206188();
    if (!os_log_type_enabled(v42, v65))
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();

      return;
    }
    uint64_t v66 = swift_slowAlloc();
    uint64_t v67 = swift_slowAlloc();
    uint64_t v81 = v67;
    *(_DWORD *)uint64_t v66 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v80 = sub_2471F3F68(v64, v51, &v81);
    sub_2472062B8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v66 + 12) = 2080;
    uint64_t v68 = *v23;
    unint64_t v69 = v23[1];
    swift_bridgeObjectRetain();
    uint64_t v80 = sub_2471F3F68(v68, v69, &v81);
    sub_2472062B8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v42, v65, "Failed to create %s for request: %s", (uint8_t *)v66, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v67, -1, -1);
    MEMORY[0x24C54D9C0](v66, -1, -1);

LABEL_19:
    swift_release();

    return;
  }
LABEL_10:
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v27 = __swift_project_value_buffer(v10, (uint64_t)qword_26B128910);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v27, v10);
  uint64_t v28 = v79;
  swift_retain_n();
  unint64_t v29 = v28;
  char v30 = sub_247205E98();
  int v31 = sub_247206188();
  if (!os_log_type_enabled(v30, (os_log_type_t)v31))
  {

    swift_release_n();
    goto LABEL_31;
  }
  LODWORD(v78) = v31;
  os_log_t v79 = v30;
  uint64_t v32 = swift_slowAlloc();
  uint64_t v77 = swift_slowAlloc();
  uint64_t v81 = v77;
  *(_DWORD *)uint64_t v32 = 136315394;
  id v33 = [v17 refId];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = sub_247205FD8();
    unint64_t v37 = v36;

    uint64_t v80 = sub_2471F3F68(v35, v37, &v81);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2080;
    uint64_t v38 = *(uint64_t *)((char *)&v15->isa + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
    unint64_t v39 = *(unint64_t *)((char *)&v15[1].isa + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
    swift_bridgeObjectRetain();
    uint64_t v80 = sub_2471F3F68(v38, v39, &v81);
    sub_2472062B8();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_t v40 = v79;
    _os_log_impl(&dword_2471B4000, v79, (os_log_type_t)v78, "#AsrOnServer The refId of ResultSelected %s doesn't match the current requestId: %s. Ignoring RC acceptance result.", (uint8_t *)v32, 0x16u);
    uint64_t v41 = v77;
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v41, -1, -1);
    MEMORY[0x24C54D9C0](v32, -1, -1);

    swift_release();
LABEL_31:
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return;
  }

  swift_release();
  __break(1u);
}

uint64_t sub_2471D7EBC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *MEMORY[0x263F709E0];
  uint64_t v13 = sub_247205A38();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 104))(v11, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  sub_247204BD8();
  swift_bridgeObjectRetain();
  sub_247204BA8();
  uint64_t v15 = a2 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  uint64_t v16 = sub_247204938();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v8, v15, v16);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v8, 0, 1, v16);
  sub_247204BF8();
  swift_bridgeObjectRetain();
  sub_247204BE8();
  swift_bridgeObjectRetain();
  sub_247204BC8();
  id v18 = objc_msgSend(a4, sel_isMitigated);
  sub_2471CAE98(0, (unint64_t *)&unk_26B128690);
  uint64_t v19 = (void *)sub_247206268();
  uint64_t v20 = v19;
  if (v18)
  {
    id v21 = v18;
    sub_247206278();
  }
  else
  {
  }
  return sub_247204BB8();
}

uint64_t sub_2471D81AC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *MEMORY[0x263F709E0];
  uint64_t v15 = sub_247205A38();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  sub_247204E28();
  swift_bridgeObjectRetain();
  sub_247204DE8();
  uint64_t v17 = a2 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  uint64_t v18 = sub_247204938();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  sub_247204E48();
  swift_bridgeObjectRetain();
  sub_247204E38();
  swift_bridgeObjectRetain();
  sub_247204E18();
  id v20 = objc_msgSend(a4, sel_isMitigated);
  sub_2471CAE98(0, (unint64_t *)&unk_26B128690);
  id v21 = (void *)sub_247206268();
  id v22 = v21;
  if (v20)
  {
    id v23 = v20;
    sub_247206278();
  }
  else
  {
  }
  sub_247204DF8();
  id v24 = a5;
  return sub_247204E08();
}

void sub_2471D84AC(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      uint64_t v7 = Strong;
      MEMORY[0x270FA5388](Strong);
      id v8 = objc_allocWithZone((Class)sub_247204B98());
      uint64_t v9 = sub_247204B88();
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        swift_retain();
        sub_2471D1B0C(v10);
        swift_release();
        uint64_t v11 = (uint64_t *)(v7 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
        uint64_t v12 = *(void *)(v7 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
        uint64_t v13 = *(void *)(v7 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
        swift_retain();
        swift_bridgeObjectRetain();
        sub_2471CB894(v12, v13, a3, a4);
        swift_release();
        swift_bridgeObjectRelease();
        if (qword_26B128578 != -1) {
          swift_once();
        }
        uint64_t v14 = sub_247205EA8();
        __swift_project_value_buffer(v14, (uint64_t)qword_26B128910);
        swift_retain_n();
        id v15 = v10;
        uint64_t v16 = sub_247205E98();
        os_log_type_t v17 = sub_247206178();
        if (os_log_type_enabled(v16, v17))
        {
          uint64_t v18 = swift_slowAlloc();
          unint64_t v36 = (void *)swift_slowAlloc();
          uint64_t v37 = swift_slowAlloc();
          uint64_t v39 = v37;
          *(_DWORD *)uint64_t v18 = 136315394;
          uint64_t v20 = *v11;
          unint64_t v19 = v11[1];
          swift_bridgeObjectRetain();
          sub_2471F3F68(v20, v19, &v39);
          sub_2472062B8();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v18 + 12) = 2112;
          id v21 = v15;
          sub_2472062B8();
          *unint64_t v36 = v10;

          _os_log_impl(&dword_2471B4000, v16, v17, "#AsrOnServer Invoked posting of ResultSelectedMessage for request: %s resultSelectedMsg: %@", (uint8_t *)v18, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v36, -1, -1);
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v37, -1, -1);
          MEMORY[0x24C54D9C0](v18, -1, -1);
          swift_release();

          return;
        }
      }
      else
      {
        if (qword_26B128578 != -1) {
          swift_once();
        }
        uint64_t v29 = sub_247205EA8();
        __swift_project_value_buffer(v29, (uint64_t)qword_26B128910);
        swift_retain();
        char v30 = sub_247205E98();
        os_log_type_t v31 = sub_247206188();
        if (os_log_type_enabled(v30, v31))
        {
          uint64_t v32 = (uint8_t *)swift_slowAlloc();
          uint64_t v33 = swift_slowAlloc();
          uint64_t v39 = v33;
          *(_DWORD *)uint64_t v32 = 136315138;
          uint64_t v34 = *(void *)(v7 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
          unint64_t v35 = *(void *)(v7 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
          swift_bridgeObjectRetain();
          sub_2471F3F68(v34, v35, &v39);
          sub_2472062B8();
          swift_release();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2471B4000, v30, v31, "#AsrOnServer Failed to create ResultSelectedMessage for request: %s", v32, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v33, -1, -1);
          MEMORY[0x24C54D9C0](v32, -1, -1);
          swift_release();

          return;
        }
      }
      swift_release_n();
    }
    else
    {
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_247205EA8();
      __swift_project_value_buffer(v25, (uint64_t)qword_26B128910);
      uint64_t v26 = sub_247205E98();
      os_log_type_t v27 = sub_247206178();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_2471B4000, v26, v27, "#AsrOnServer Not posting ResultSelectedMessage because self is out of scope after waiting for Myriad decision", v28, 2u);
        MEMORY[0x24C54D9C0](v28, -1, -1);
      }
    }
  }
  else
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_247205EA8();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B128910);
    uint64_t v38 = sub_247205E98();
    os_log_type_t v23 = sub_247206178();
    if (os_log_type_enabled(v38, v23))
    {
      id v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v24 = 0;
      _os_log_impl(&dword_2471B4000, v38, v23, "#AsrOnServer Not posting ResultSelectedMessage due to Myriad loss", v24, 2u);
      MEMORY[0x24C54D9C0](v24, -1, -1);
    }
  }
}

uint64_t sub_2471D8B30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *MEMORY[0x263F709E0];
  uint64_t v10 = sub_247205A38();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_247204BD8();
  swift_bridgeObjectRetain();
  sub_247204BA8();
  uint64_t v12 = a2 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  uint64_t v13 = sub_247204938();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  sub_247204BF8();
  swift_bridgeObjectRetain();
  sub_247204BE8();
  swift_bridgeObjectRetain();
  sub_247204BC8();
  return sub_247204BB8();
}

void sub_2471D8D90(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  *(unsigned char *)(v3 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndPointReceived) = 1;
  if (sub_2471D9DF4()
    && (uint64_t v8 = OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndPointSentToSpeech,
        (*(unsigned char *)(v3 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndPointSentToSpeech) & 1) == 0))
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_247205EA8();
    __swift_project_value_buffer(v14, (uint64_t)qword_26B128910);
    swift_retain();
    id v15 = sub_247205E98();
    os_log_type_t v16 = sub_247206178();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v27 = a2;
      os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      aBlock[0] = v18;
      *(_DWORD *)os_log_type_t v17 = 136315138;
      uint64_t v19 = *(void *)(v4 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
      unint64_t v20 = *(void *)(v4 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
      swift_bridgeObjectRetain();
      uint64_t v21 = v19;
      a2 = v27;
      sub_2471F3F68(v21, v20, aBlock);
      sub_2472062B8();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v15, v16, "#AsrOnServer Posting SASSpeechServerEndpointIdentified for requestId: %s)", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v18, -1, -1);
      MEMORY[0x24C54D9C0](v17, -1, -1);
    }
    else
    {

      swift_release();
    }
    uint64_t v22 = *(void **)(v4 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serviceHelper);
    if (objc_msgSend(v22, sel_respondsToSelector_, sel_handleSpeechServerEndpointIdentified_completion_, v27))
    {
      uint64_t v23 = swift_allocObject();
      swift_weakInit();
      id v24 = (void *)swift_allocObject();
      v24[2] = v23;
      v24[3] = a2;
      v24[4] = a3;
      v24[5] = a1;
      aBlock[4] = (uint64_t)sub_2471DA3F8;
      aBlock[5] = (uint64_t)v24;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_2471DC9B8;
      aBlock[3] = (uint64_t)&block_descriptor_2;
      uint64_t v25 = _Block_copy(aBlock);
      swift_unknownObjectRetain();
      swift_retain();
      sub_2471DA438(a2);
      id v26 = a1;
      swift_retain();
      swift_release();
      objc_msgSend(v22, sel_handleSpeechServerEndpointIdentified_completion_, v26, v25);
      _Block_release(v25);
      swift_release();
      swift_release();
      swift_unknownObjectRelease();
    }
    *(unsigned char *)(v4 + v8) = 1;
  }
  else
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_247205EA8();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B128910);
    uint64_t v10 = sub_247205E98();
    os_log_type_t v11 = sub_247206178();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_2471B4000, v10, v11, "Pre NL user selection has not run for all RCs. Caching SASSpeechServerEndpointIdentified.", v12, 2u);
      MEMORY[0x24C54D9C0](v12, -1, -1);
    }

    id v28 = *(id *)(v4 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndpointIdentifiedMessage);
    *(void *)(v4 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndpointIdentifiedMessage) = a1;
    id v13 = a1;
  }
}

void sub_2471D91E0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t), uint64_t a5, void *a6)
{
}

void sub_2471D91EC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t), uint64_t a5, void *a6, const char *a7)
{
  uint64_t v13 = sub_247205EA8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  os_log_type_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  swift_release();
  if (Strong)
  {
    if (!a4) {
      return;
    }
    uint64_t v18 = a1;
    uint64_t v19 = a2;
    goto LABEL_12;
  }
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v20 = __swift_project_value_buffer(v13, (uint64_t)qword_26B128910);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v20, v13);
  id v21 = a6;
  uint64_t v22 = sub_247205E98();
  int v23 = sub_247206188();
  if (!os_log_type_enabled(v22, (os_log_type_t)v23))
  {

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    if (!a4) {
      return;
    }
    goto LABEL_11;
  }
  int v33 = v23;
  uint64_t v34 = a7;
  uint64_t v35 = a5;
  id v24 = (uint8_t *)swift_slowAlloc();
  uint64_t v32 = swift_slowAlloc();
  uint64_t v37 = v32;
  *(_DWORD *)id v24 = 136315138;
  id v25 = objc_msgSend(v21, sel_refId);
  if (!v25)
  {

    __break(1u);
    return;
  }
  id v26 = v25;
  os_log_type_t v31 = v24 + 4;
  uint64_t v27 = sub_247205FD8();
  unint64_t v29 = v28;

  uint64_t v36 = sub_2471F3F68(v27, v29, &v37);
  sub_2472062B8();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_2471B4000, v22, (os_log_type_t)v33, v34, v24, 0xCu);
  uint64_t v30 = v32;
  swift_arrayDestroy();
  MEMORY[0x24C54D9C0](v30, -1, -1);
  MEMORY[0x24C54D9C0](v24, -1, -1);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  if (a4)
  {
LABEL_11:
    uint64_t v18 = 0;
    uint64_t v19 = 0;
LABEL_12:
    a4(v18, v19);
  }
}

uint64_t sub_2471D9504()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestType;
  uint64_t v2 = sub_247205AA8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  uint64_t v4 = sub_247204938();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  uint64_t v5 = v0 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_userId;
  uint64_t v6 = sub_247205B68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_myriadMonitor);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_2471D9678()
{
  sub_2471D9504();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2471D96D0()
{
  return type metadata accessor for ServerAsrProcessor(0);
}

uint64_t type metadata accessor for ServerAsrProcessor(uint64_t a1)
{
  return sub_2471DA25C(a1, (uint64_t *)&unk_2692410F0);
}

uint64_t sub_2471D96F8()
{
  uint64_t result = sub_247205AA8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_247204938();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_247205B68();
      if (v3 <= 0x3F) {
        return swift_updateClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t sub_2471D9844(uint64_t a1, uint8_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, int a9)
{
  unint64_t v44 = a2;
  LODWORD(v45) = a9;
  uint64_t v14 = sub_247205B68();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  os_log_type_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, v14);
  type metadata accessor for ASRMUXResultCandidateContext(0);
  uint64_t v18 = (void *)swift_allocObject();
  *(void *)((char *)v18 + OBJC_IVAR____TtC9ASRBridge28ASRMUXResultCandidateContext_resultCandidate) = a6;
  id v19 = a6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v20 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_setRefId_, v20);

  uint64_t v21 = a4;
  void v18[2] = a4;
  v18[3] = a5;
  uint64_t v47 = a5;
  v18[4] = v44;
  v18[5] = a3;
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))((uint64_t)v18 + OBJC_IVAR____TtC9ASRBridge28ASRMUXResultCandidateContext_userId, v17, v14);
  *(_DWORD *)((char *)v18 + OBJC_IVAR____TtC9ASRBridge28ASRMUXResultCandidateContext_processedAudioDuration) = v45;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_247205EA8();
  __swift_project_value_buffer(v22, (uint64_t)qword_26B128910);
  swift_retain_n();
  int v23 = sub_247205E98();
  os_log_type_t v24 = sub_247206178();
  if (os_log_type_enabled(v23, v24))
  {
    id v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    v50[0] = v26;
    uint64_t v45 = a4;
    *(_DWORD *)id v25 = 136315138;
    swift_retain();
    uint64_t v27 = sub_2471D9FA8();
    unint64_t v29 = v28;
    swift_release();
    v49[0] = sub_2471F3F68(v27, v29, v50);
    uint64_t v21 = v45;
    sub_2472062B8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v23, v24, "#AsrOnServer Caching ASRMUXResultCandidateContext: %s in the ASRBridge.", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v26, -1, -1);
    MEMORY[0x24C54D9C0](v25, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v31 = v46;
  uint64_t v30 = v47;
  uint64_t v32 = (uint64_t *)(v46 + 24);
  swift_beginAccess();
  if (*(void *)(*(void *)(v31 + 24) + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2471FC8B8(v21, v30);
    if (v33)
    {
      swift_retain_n();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v34 = sub_247205E98();
      os_log_type_t v35 = sub_247206188();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        uint64_t v46 = swift_slowAlloc();
        v49[0] = v46;
        uint64_t v45 = v21;
        *(_DWORD *)uint64_t v36 = 136315138;
        uint64_t v30 = v47;
        unint64_t v44 = v36 + 4;
        swift_retain();
        uint64_t v37 = sub_2471D9FA8();
        unint64_t v39 = v38;
        swift_release();
        uint64_t v48 = sub_2471F3F68(v37, v39, v49);
        uint64_t v21 = v45;
        sub_2472062B8();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2471B4000, v34, v35, "#AsrOnServer ASRMUXRequestContext already contains a cache entry: %s. This will be overwritten and may lead to inconsistent results.", v36, 0xCu);
        uint64_t v40 = v46;
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v40, -1, -1);
        MEMORY[0x24C54D9C0](v36, -1, -1);
        swift_release();
      }
      else
      {

        swift_release_n();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v48 = *v32;
  *uint64_t v32 = 0x8000000000000000;
  sub_2471FEA9C((uint64_t)v18, v21, v30, isUniquelyReferenced_nonNull_native);
  *uint64_t v32 = v48;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

BOOL sub_2471D9DF4()
{
  if (*(unsigned char *)(v0 + 40) == 1)
  {
    swift_retain();
    char v1 = sub_2471D1864();
    swift_release();
    if (v1)
    {
      BOOL result = 0;
      *(unsigned char *)(v0 + 40) = 0;
    }
    else
    {
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_247205EA8();
      __swift_project_value_buffer(v3, (uint64_t)qword_26B128910);
      uint64_t v4 = sub_247205E98();
      os_log_type_t v5 = sub_247206188();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_2471B4000, v4, v5, "Could not post buffer RC message. The request will timeout", v6, 2u);
        MEMORY[0x24C54D9C0](v6, -1, -1);
      }

      return 0;
    }
  }
  else
  {
    swift_beginAccess();
    return *(void *)(*(void *)(v0 + 32) + 16) == 0;
  }
  return result;
}

uint64_t sub_2471D9F3C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 41, 7);
}

uint64_t type metadata accessor for ASRMUXRequestContext()
{
  return self;
}

uint64_t sub_2471D9FA8()
{
  sub_247206348();
  sub_247206028();
  swift_bridgeObjectRetain();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  swift_bridgeObjectRetain();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  sub_247205B68();
  sub_2471DA4D8(&qword_26B128340, MEMORY[0x263F70DF8]);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  uint64_t v2 = *(unsigned int *)(v0 + OBJC_IVAR____TtC9ASRBridge28ASRMUXResultCandidateContext_processedAudioDuration);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  return HIDWORD(v2);
}

uint64_t sub_2471DA174()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC9ASRBridge28ASRMUXResultCandidateContext_userId;
  uint64_t v2 = sub_247205B68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2471DA234()
{
  return type metadata accessor for ASRMUXResultCandidateContext(0);
}

uint64_t type metadata accessor for ASRMUXResultCandidateContext(uint64_t a1)
{
  return sub_2471DA25C(a1, qword_269241100);
}

uint64_t sub_2471DA25C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2471DA294()
{
  uint64_t result = sub_247205B68();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2471DA34C()
{
  return sub_2471D9FA8();
}

uint64_t sub_2471DA370()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2471DA3A8()
{
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_2471DA3F8(uint64_t a1, uint64_t a2)
{
  sub_2471D91EC(a1, a2, *(void *)(v2 + 16), *(void (**)(uint64_t, uint64_t))(v2 + 24), *(void *)(v2 + 32), *(void **)(v2 + 40), "#AsrOnServer self expired. Ignoring SASSpeechServerEndpointIdentified response refId:%s");
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

uint64_t sub_2471DA438(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2471DA448()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_2471DA498(void *a1, uint64_t a2)
{
  sub_2471D73BC(a1, a2, *(void *)(v2 + 16), *(NSObject **)(v2 + 24), *(NSObject **)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_2471DA4A4(uint64_t a1)
{
  return sub_2471D81AC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_2471DA4B0(uint64_t a1)
{
  return sub_2471D7EBC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_2471DA4BC(uint64_t a1)
{
  return sub_2471D664C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t sub_2471DA4CC(uint64_t a1)
{
  return sub_2471D63E8(a1, *(void *)(v1 + 16));
}

uint64_t sub_2471DA4D8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2471DA520(uint64_t a1)
{
  return sub_2471D4320(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_2471DA52C()
{
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_2471DA57C(void *a1, uint64_t a2)
{
  sub_2471D465C(a1, a2, *(void *)(v2 + 16), *(void (**)(void, void))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

void sub_2471DA590(char a1)
{
  sub_2471D84AC(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_2471DA5A0()
{
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2471DA5E8(void *a1, uint64_t a2)
{
  sub_2471D3A94(a1, a2, *(void *)(v2 + 16), *(void (**)(void, void))(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_2471DA5F4(uint64_t a1)
{
  return sub_2471D8B30(a1, *(void *)(v1 + 16));
}

uint64_t objectdestroy_58Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 41, 7);
}

void sub_2471DA664(void *a1)
{
}

void sub_2471DA67C(void *a1)
{
}

void sub_2471DA694(void *a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_247205EA8();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B128910);
  id v7 = a1;
  uint64_t v8 = sub_247205E98();
  os_log_type_t v9 = sub_247206178();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = v4;
    os_log_type_t v11 = a2;
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v13 = v7;
    sub_2472062B8();
    void *v12 = v7;

    _os_log_impl(&dword_2471B4000, v8, v9, "AsrCandidateRequestProcessor received message: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    uint64_t v14 = v12;
    a2 = v11;
    uint64_t v4 = v16;
    MEMORY[0x24C54D9C0](v14, -1, -1);
    MEMORY[0x24C54D9C0](v10, -1, -1);
  }
  else
  {
  }
  id v15 = v7;
  sub_2471DB8DC(v15, v4, a2);
}

void sub_2471DA860(int a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)sub_247204938();
  uint64_t v5 = *(v4 - 1);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + qword_26B1283E0);
  uint64_t v9 = sub_247205CD8();
  uint64_t v11 = v10;
  sub_247205D28();
  id v83 = v7;
  uint64_t v84 = v9;
  uint64_t v85 = v11;
  uint64_t v86 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692413D0);
  sub_2472061C8();
  swift_bridgeObjectRelease();
  uint64_t v12 = (uint64_t)aBlock;
  LOBYTE(v9) = v88;
  id v13 = *(void (**)(char *, id))(v5 + 8);
  id v82 = v4;
  uint64_t v14 = v4;
  id v15 = v13;
  unint64_t v81 = v5 + 8;
  v13(v7, v14);
  if (v9)
  {
    if (qword_26B128578 != -1) {
LABEL_49:
    }
      swift_once();
    uint64_t v16 = sub_247205EA8();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B128910);
    os_log_type_t v17 = sub_247205E98();
    os_log_type_t v18 = sub_247206188();
    if (!os_log_type_enabled(v17, v18)) {
      goto LABEL_6;
    }
    id v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v19 = 0;
    uint64_t v20 = "nil hostTime from AsrCandidateRequestCache";
    goto LABEL_5;
  }
  uint64_t v78 = v1;
  int v80 = a1;
  if (a1)
  {
    uint64_t v76 = v12;
    uint64_t v77 = sub_247205FD8();
    uint64_t v79 = v21;
    uint64_t v74 = 0;
    uint64_t v72 = 0;
    uint64_t v75 = 5;
  }
  else
  {
    uint64_t v77 = sub_247205FD8();
    uint64_t v79 = v22;
    sub_247205CD8();
    uint64_t v23 = sub_247205D28();
    MEMORY[0x270FA5388](v23);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692413D8);
    sub_2472061C8();
    swift_bridgeObjectRelease();
    uint64_t v24 = (uint64_t)aBlock;
    char v25 = v88;
    v15(v7, v82);
    if (v25)
    {
      swift_bridgeObjectRelease();
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_247205EA8();
      __swift_project_value_buffer(v26, (uint64_t)qword_26B128910);
      os_log_type_t v17 = sub_247205E98();
      os_log_type_t v18 = sub_247206188();
      if (!os_log_type_enabled(v17, v18)) {
        goto LABEL_6;
      }
      id v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v19 = 0;
      uint64_t v20 = "nil audioRecordType from AsrCandidateRequestCache";
LABEL_5:
      _os_log_impl(&dword_2471B4000, v17, v18, v20, v19, 2u);
      MEMORY[0x24C54D9C0](v19, -1, -1);
LABEL_6:

      return;
    }
    uint64_t v75 = v24;
    uint64_t v76 = v12;
    sub_247205CD8();
    uint64_t v27 = sub_247205D28();
    MEMORY[0x270FA5388](v27);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269240F70);
    sub_2472061C8();
    swift_bridgeObjectRelease();
    uint64_t v29 = (uint64_t)aBlock;
    uint64_t v28 = v88;
    v15(v7, v82);
    uint64_t v74 = v29;
    if (v28)
    {
      uint64_t v72 = v28;
      uint64_t v2 = v78;
    }
    else
    {
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_247205EA8();
      __swift_project_value_buffer(v30, (uint64_t)qword_26B128910);
      uint64_t v31 = sub_247205E98();
      os_log_type_t v32 = sub_247206178();
      BOOL v33 = os_log_type_enabled(v31, v32);
      uint64_t v2 = v78;
      if (v33)
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl(&dword_2471B4000, v31, v32, "nil audioRecordDeviceId from the AsrCandidateRequestCache", v34, 2u);
        MEMORY[0x24C54D9C0](v34, -1, -1);
      }

      uint64_t v72 = 0;
    }
  }
  sub_247205CD8();
  uint64_t v35 = sub_247205D28();
  MEMORY[0x270FA5388](v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692413E8);
  sub_2472061C8();
  swift_bridgeObjectRelease();
  uint64_t v36 = aBlock;
  v15(v7, v82);
  uint64_t v73 = v36;
  if (v36) {
    goto LABEL_26;
  }
  if (qword_26B128578 != -1) {
    goto LABEL_52;
  }
  while (1)
  {
    uint64_t v37 = sub_247205EA8();
    __swift_project_value_buffer(v37, (uint64_t)qword_26B128910);
    unint64_t v38 = sub_247205E98();
    os_log_type_t v39 = sub_247206188();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&dword_2471B4000, v38, v39, "nil location from the AsrCandidateRequestCache", v40, 2u);
      MEMORY[0x24C54D9C0](v40, -1, -1);
    }

LABEL_26:
    sub_2471E1514((uint64_t *)&v94);
    unint64_t v41 = *(void *)(v2 + qword_26B1283F0);
    if (v41 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_2472063E8();
    }
    else
    {
      uint64_t v42 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    char v43 = v80;
    if (!v42)
    {
      swift_bridgeObjectRelease();
      unint64_t v81 = MEMORY[0x263F8EE78];
LABEL_40:
      char v54 = v43 ^ 1;
      id v82 = (id)sub_247205D18();
      uint64_t v56 = v55;
      uint64_t v57 = v96;
      double v58 = *MEMORY[0x263F525B0];
      swift_bridgeObjectRetain();
      uint64_t v59 = (void *)sub_247205CF8();
      uint64_t v60 = sub_247205D18();
      char v62 = sub_2471D06E4(v59, v60, v61);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      BOOL v64 = (v62 & 1) == 0 && v62 != 2;
      uint64_t v65 = v94;
      char v66 = sub_2471CF360(v94);
      char v67 = v95;
      uint64_t v68 = v97;
      uint64_t v69 = v98;
      objc_allocWithZone(MEMORY[0x263F525A0]);
      swift_bridgeObjectRetain();
      HIBYTE(v70) = v66 & 1;
      LOBYTE(v70) = v64;
      sub_2471DB4A8(v58, (uint64_t)v82, v56, v77, v79, v65, 0, v73, v57, 0, 0, 0, 0, 0, 0, 0, 0, 0, v70,
        1,
        v67,
        0,
        0,
        0,
        0,
        0,
        v81,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        v54 & 1,
        v76,
        v75,
        v74,
        v72,
        0,
        v68,
        v69);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    unint64_t v93 = MEMORY[0x263F8EE78];
    sub_2472063A8();
    if ((v42 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_52:
    swift_once();
  }
  id v82 = self;
  uint64_t v44 = 0;
  unint64_t v81 = v41 & 0xC000000000000001;
  unint64_t v45 = v41;
  while (1)
  {
    if (v42 == v44)
    {
      __break(1u);
LABEL_48:
      __break(1u);
      goto LABEL_49;
    }
    id v46 = v81 ? (id)MEMORY[0x24C54D1C0](v44, v41) : *(id *)(v41 + 8 * v44 + 32);
    uint64_t v47 = v46;
    uint64_t v48 = swift_allocObject();
    *(void *)(v48 + 16) = v47;
    uint64_t v49 = swift_allocObject();
    *(void *)(v49 + 16) = sub_2471DBF74;
    *(void *)(v49 + 24) = v48;
    id v91 = sub_2471C2798;
    uint64_t v92 = v49;
    id aBlock = (void *)MEMORY[0x263EF8330];
    uint64_t v88 = 1107296256;
    uint64_t v89 = sub_2471C2024;
    id v90 = &block_descriptor_3;
    uint64_t v50 = _Block_copy(&aBlock);
    id v51 = v47;
    swift_retain();
    swift_release();
    id v52 = objc_msgSend(v82, sel_newWithBuilder_, v50);
    _Block_release(v50);
    if (!v52) {
      break;
    }
    swift_release();
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();

    swift_release();
    if (isEscapingClosureAtFileLocation) {
      goto LABEL_48;
    }
    ++v44;
    sub_247206388();
    sub_2472063B8();
    sub_2472063C8();
    sub_247206398();
    unint64_t v41 = v45;
    if (v42 == v44)
    {
      unint64_t v81 = v93;
      swift_bridgeObjectRelease();
      char v43 = v80;
      goto LABEL_40;
    }
  }
  __break(1u);
}

void sub_2471DB398(void *a1, id a2)
{
  if (a1)
  {
    id v4 = objc_msgSend(a2, sel_sharedUserId);
    objc_msgSend(a1, sel_setSharedUserId_, v4);

    id v5 = objc_msgSend(a2, sel_loggableSharedUserId);
    objc_msgSend(a1, sel_setLoggableSharedUserId_, v5);

    id v6 = objc_msgSend(a2, sel_personaIdentifier);
    objc_msgSend(a1, sel_setPersonaId_, v6);
  }
}

uint64_t sub_2471DB480(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

id sub_2471DB4A8(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, char a15, char a16, char a17, uint64_t a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42)
{
  uint64_t v71 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  __int16 v70 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  uint64_t v69 = (void *)sub_2472060D8();
  swift_bridgeObjectRelease();
  if (a11)
  {
    uint64_t v68 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v43 = a18;
    if (a13) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v68 = 0;
    uint64_t v43 = a18;
    if (a13)
    {
LABEL_3:
      char v67 = (void *)sub_247205FC8();
      swift_bridgeObjectRelease();
      uint64_t v44 = a23;
      if (v43) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  char v67 = 0;
  uint64_t v44 = a23;
  if (v43)
  {
LABEL_4:
    char v66 = (void *)sub_247205F58();
    swift_bridgeObjectRelease();
    uint64_t v45 = a26;
    if (v44) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  char v66 = 0;
  uint64_t v45 = a26;
  if (v44)
  {
LABEL_5:
    uint64_t v65 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v46 = a27;
    if (v45) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v65 = 0;
  uint64_t v46 = a27;
  if (v45)
  {
LABEL_6:
    BOOL v64 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v47 = a29;
    if (v46) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  BOOL v64 = 0;
  uint64_t v47 = a29;
  if (v46)
  {
LABEL_7:
    sub_2471DBFA4();
    uint64_t v63 = (void *)sub_2472060D8();
    swift_bridgeObjectRelease();
    uint64_t v48 = a31;
    if (v47) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v63 = 0;
  uint64_t v48 = a31;
  if (v47)
  {
LABEL_8:
    unint64_t v81 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v49 = a33;
    if (v48) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  unint64_t v81 = 0;
  uint64_t v49 = a33;
  if (v48)
  {
LABEL_9:
    int v80 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v50 = a39;
    if (v49) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v79 = 0;
    uint64_t v51 = a42;
    if (v50) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_19:
  int v80 = 0;
  uint64_t v50 = a39;
  if (!v49) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v79 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  uint64_t v51 = a42;
  if (v50)
  {
LABEL_11:
    uint64_t v78 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v78 = 0;
LABEL_22:
  uint64_t v52 = a37;
  char v53 = a17;
  char v54 = a16;
  char v55 = a15;
  char v56 = a14;
  if (v51)
  {
    uint64_t v77 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v52 = a37;
    char v56 = a14;
    char v55 = a15;
    char v54 = a16;
    char v53 = a17;
  }
  else
  {
    uint64_t v77 = 0;
  }
  LOBYTE(v62) = a40 & 1;
  LOBYTE(v61) = a35 & 1;
  LOBYTE(v60) = a24 & 1;
  BYTE3(v59) = a21 & 1;
  BYTE2(v59) = a20 & 1;
  LOWORD(v59) = a19 & 0x101;
  BYTE3(v58) = v53 & 1;
  BYTE2(v58) = v54 & 1;
  BYTE1(v58) = v55 & 1;
  LOBYTE(v58) = v56 & 1;
  id v75 = objc_msgSend(v74, sel_initWithRequestId_inputOrigin_speechRecognitionTaskName_speechRecognitionMode_location_jitGrammar_overrideModelPath_applicationName_detectUtterances_continuousListening_shouldHandleCapitalization_secureOfflineOnly_maximumRecognitionDuration_recognitionOverrides_shouldStoreAudioOnDevice_deliverEagerPackage_enableEmojiRecognition_enableAutoPunctuation_UILanguage_enableVoiceCommands_dictationUIInteractionId_sharedUserInfos_prefixText_postfixText_selectedText_powerContext_shouldStartAudioCapture_audioCaptureStartHostTime_audioRecordType_audioRecordDeviceId_shouldGenerateVoiceCommandCandidates_asrLocale_, v71, v70, a6, a7, a8, v69, a1, v68, v67, v58, v66, v59, v65, v60, v64, v63, v81,
          v80,
          v79,
          a34,
          v61,
          a36,
          v52,
          v78,
          v62,
          v77);

  return v75;
}

void sub_2471DB8DC(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128318);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v29 - v10;
  uint64_t v12 = *MEMORY[0x263F70AB0];
  uint64_t v13 = sub_247205AA8();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 104))(v11, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  sub_2471DBDEC((uint64_t)v11, (uint64_t)v9);
  uint64_t v15 = a2 + qword_26B1287A0;
  swift_beginAccess();
  uint64_t v16 = a1;
  sub_2471DBE54((uint64_t)v9, v15);
  swift_endAccess();
  sub_2471E2CB0(0);
  char v17 = a3();
  sub_2471DA860(v17 & 1);
  if (v18)
  {
    id v19 = v18;
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_247205EA8();
    __swift_project_value_buffer(v20, (uint64_t)qword_26B128910);
    uint64_t v21 = v19;
    uint64_t v22 = sub_247205E98();
    os_log_type_t v23 = sub_247206178();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v30 = v16;
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v31 = a2;
      os_log_type_t v32 = v21;
      uint64_t v26 = (void *)v25;
      *(_DWORD *)uint64_t v24 = 138412290;
      uint64_t v27 = v21;
      sub_2472062B8();
      void *v26 = v19;

      uint64_t v16 = v30;
      _os_log_impl(&dword_2471B4000, v22, v23, "Going to call startASR from AsrCandidateRequestProcessor with settings = %@", v24, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
      swift_arrayDestroy();
      uint64_t v28 = v26;
      a2 = v31;
      MEMORY[0x24C54D9C0](v28, -1, -1);
      MEMORY[0x24C54D9C0](v24, -1, -1);
    }
    else
    {

      uint64_t v22 = v21;
    }

    objc_msgSend(*(id *)(a2 + qword_26B128430), sel_startSpeechRecognitionResultsWithSettings_, v21);
  }
  else
  {
    uint64_t v21 = v16;
  }
}

void sub_2471DBC20(void *a1)
{
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_247205EA8();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B128910);
  id v8 = a1;
  uint64_t v3 = sub_247205E98();
  os_log_type_t v4 = sub_247206178();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)id v5 = 138412290;
    id v7 = v8;
    sub_2472062B8();
    *uint64_t v6 = v8;

    _os_log_impl(&dword_2471B4000, v3, v4, "AsrCandidateRequestProcessor received message: %@. Ignoring..", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v6, -1, -1);
    MEMORY[0x24C54D9C0](v5, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_2471DBDEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128318);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2471DBE54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128318);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2471DBEBC@<X0>(uint64_t a1@<X8>)
{
  return sub_2471FA428(v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_2471DBEDC@<X0>(uint64_t a1@<X8>)
{
  return sub_2471FACA0(v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_2471DBEFC@<X0>(void *a1@<X8>)
{
  return sub_2471FB528(v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_2471DBF1C@<X0>(void *a1@<X8>)
{
  return sub_2471F9F74(v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_2471DBF3C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2471DBF74(void *a1)
{
  sub_2471DB398(a1, *(id *)(v1 + 16));
}

uint64_t sub_2471DBF7C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
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

unint64_t sub_2471DBFA4()
{
  unint64_t result = qword_26B127C60;
  if (!qword_26B127C60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B127C60);
  }
  return result;
}

void static SignpostLogger.begin(_:enableTelemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  if (a4) {
    sub_2471DC658(a1, a2, a3, a5, a6);
  }
  else {
    (*(void (**)(uint64_t, uint64_t, uint64_t, void, void, uint64_t, void, void, uint64_t, uint64_t))(a6 + 24))(a1, a2, a3, 0, 0, 256, 0, 0, a5, a6);
  }
}

void static SignpostLogger.end(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_247206218();
  id v8 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(a6 + 8))(a5, a6);
  sub_247205E58();
}

uint64_t static SignpostLogger.event(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = sub_247205E88();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247206238();
  uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a5 + 8))(a4, a5);
  sub_247205E78();
  sub_247205E58();

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_2471DC23C()
{
  qword_26B128928 = 0x6764697242525341;
  unk_26B128930 = 0xE900000000000065;
}

uint64_t sub_2471DC264()
{
  uint64_t v0 = sub_247205EA8();
  __swift_allocate_value_buffer(v0, qword_26B128910);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B128910);
  sub_2471DC7C8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_247206288();
  return sub_247205EB8();
}

uint64_t sub_2471DC330()
{
  uint64_t v0 = sub_247205C78();
  __swift_allocate_value_buffer(v0, qword_26B1288F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1288F8);
  return sub_247205C68();
}

uint64_t sub_2471DC37C()
{
  sub_2471DC7C8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_247206288();
  qword_26B128778 = result;
  return result;
}

void static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(a10 + 8);
  v12(a9, a10);
  sub_247205E68();
  if ((a6 & 0x100) != 0 || !a8)
  {
    sub_247206228();
    id v16 = (id)((uint64_t (*)(uint64_t, uint64_t))v12)(a9, a10);
    sub_247205E58();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_247206228();
    uint64_t v13 = (void *)((uint64_t (*)(uint64_t, uint64_t))v12)(a9, a10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269241098);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_247206F40;
    *(void *)(v14 + 56) = MEMORY[0x263F8D310];
    *(void *)(v14 + 64) = sub_2471D0FE8();
    *(void *)(v14 + 32) = a7;
    *(void *)(v14 + 40) = a8;
    sub_247205E48();

    swift_bridgeObjectRelease();
  }
}

void sub_2471DC5E4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
}

void sub_2471DC5FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void sub_2471DC628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

uint64_t sub_2471DC640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static SignpostLogger.event(_:)(a1, a2, a3, a4, a5);
}

void sub_2471DC658(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(a5 + 8);
  v7(a4, a5);
  sub_247205E68();
  sub_247206228();
  id v8 = (id)((uint64_t (*)(uint64_t, uint64_t))v7)(a4, a5);
  sub_247205E48();
}

uint64_t dispatch thunk of static SignpostLogger.log.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static SignpostLogger.begin(_:enableTelemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(a10 + 24))(a1, a2, a3, a4, a5, a6 & 0x1FF);
}

uint64_t dispatch thunk of static SignpostLogger.end(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t dispatch thunk of static SignpostLogger.event(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

unint64_t sub_2471DC7C8()
{
  unint64_t result = qword_26B1286B8;
  if (!qword_26B1286B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B1286B8);
  }
  return result;
}

uint64_t type metadata accessor for AsrRequestProcessor()
{
  uint64_t result = qword_26B1284A0;
  if (!qword_26B1284A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2471DC854()
{
  sub_2471E5404();
  if (v0 <= 0x3F)
  {
    sub_247205B68();
    if (v1 <= 0x3F) {
      swift_initClassMetadata2();
    }
  }
}

void sub_2471DC9B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_2471DCA44()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + qword_26B128420);
  __swift_destroy_boxed_opaque_existential_1(v0 + qword_26B128488);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + qword_26B128478);
  __swift_destroy_boxed_opaque_existential_1(v0 + qword_26B128440);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  sub_2471D10A4(v0 + qword_26B1287A0, (uint64_t *)&unk_26B128318);
  uint64_t v1 = v0 + qword_26B1287C8;
  uint64_t v2 = sub_247205B68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();

  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2471DCBAC()
{
  objc_msgSend(*(id *)(v0 + qword_26B128430), sel_invalidate);
  uint64_t v1 = sub_247205D38();
  __swift_destroy_boxed_opaque_existential_1(v1 + qword_26B128420);
  __swift_destroy_boxed_opaque_existential_1(v1 + qword_26B128488);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v1 + qword_26B128478);
  __swift_destroy_boxed_opaque_existential_1(v1 + qword_26B128440);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  sub_2471D10A4(v1 + qword_26B1287A0, (uint64_t *)&unk_26B128318);
  uint64_t v2 = v1 + qword_26B1287C8;
  uint64_t v3 = sub_247205B68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_2471DCD30()
{
  uint64_t v0 = sub_2471DCBAC();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2471DCD84()
{
  uint64_t v0 = sub_2472059C8();
  uint64_t v2 = v1;
  if (v0 == sub_247205D18() && v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_2472064A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_2471DCE14(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = a2;
  v22[1] = a1;
  v22[0] = sub_247204938();
  uint64_t v2 = *(void *)(v22[0] - 8);
  MEMORY[0x270FA5388](v22[0]);
  char v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128708);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128350);
  uint64_t v6 = *(void *)(*(void *)(v5 - 8) + 72);
  unint64_t v7 = (*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_247206EE0;
  uint64_t v23 = v8;
  unint64_t v9 = v8 + v7;
  uint64_t v10 = *(int *)(v5 + 48);
  sub_247205BA8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  uint64_t v11 = (void *)(v9 + v10);
  uint64_t v12 = unk_26B128930;
  *uint64_t v11 = qword_26B128928;
  v11[1] = v12;
  uint64_t v13 = (void *)(v9 + v6 + *(int *)(v5 + 48));
  swift_bridgeObjectRetain();
  sub_247205BF8();
  void *v13 = 0xD00000000000001ALL;
  v13[1] = 0x80000002472089E0;
  uint64_t v14 = (void *)(v9 + 2 * v6 + *(int *)(v5 + 48));
  sub_247205BB8();
  uint64_t v25 = 0;
  unint64_t v26 = 0xE000000000000000;
  sub_247206028();
  sub_247205CD8();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v15 = v26;
  void *v14 = v25;
  v14[1] = v15;
  id v16 = (void *)(v9 + 3 * v6 + *(int *)(v5 + 48));
  sub_247205C38();
  uint64_t v25 = 0;
  unint64_t v26 = 0xE000000000000000;
  sub_247206028();
  sub_247205D28();
  sub_2471E8BF0((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
  uint64_t v17 = v22[0];
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v17);
  sub_247206028();
  unint64_t v18 = v26;
  *id v16 = v25;
  v16[1] = v18;
  id v19 = (void *)(v9 + 4 * v6 + *(int *)(v5 + 48));
  sub_247205C28();
  uint64_t v25 = 0;
  unint64_t v26 = 0xE000000000000000;
  sub_247206028();
  sub_2472059C8();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  unint64_t v20 = v26;
  void *v19 = v25;
  v19[1] = v20;
  return v23;
}

void sub_2471DD168(void *a1)
{
  uint64_t v2 = sub_247205C78();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_247205A88();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128318);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v66 - v14;
  if (sub_247205478())
  {
    __int16 v70 = v5;
    uint64_t v71 = v3;
    uint64_t v72 = v2;
    uint64_t v16 = *MEMORY[0x263F70AB0];
    uint64_t v17 = sub_247205AA8();
    uint64_t v18 = *(void *)(v17 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 104))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    sub_2471E8E40((uint64_t)v15, (uint64_t)v13, (uint64_t *)&unk_26B128318);
    id v19 = &v73[qword_26B1287A0];
    swift_beginAccess();
    sub_2471DBE54((uint64_t)v13, (uint64_t)v19);
    swift_endAccess();
    sub_2471E2CB0(0);
    BOOL v20 = sub_247205458() != 0;
    swift_bridgeObjectRelease();
    uint64_t v69 = (char *)(2 * v20);
    uint64_t v21 = sub_2472059C8();
    unint64_t v23 = v22;
    sub_247204B48();
    uint64_t v68 = sub_247205A78();
    uint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if (sub_2472050B8())
    {
      unint64_t v26 = (void *)sub_247205B78();
      swift_release();
    }
    else
    {
      unint64_t v26 = 0;
    }
    uint64_t v34 = sub_247205458();
    if (v34) {
      uint64_t v35 = v34;
    }
    else {
      uint64_t v35 = MEMORY[0x263F8EE78];
    }
    uint64_t v66 = sub_247205468();
    uint64_t v37 = v36;
    double v38 = *MEMORY[0x263F525B0];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v67 = v26;
    os_log_type_t v39 = (void *)sub_247205CF8();
    uint64_t v40 = v21;
    char v41 = sub_2471D06E4(v39, v21, v23);
    swift_unknownObjectRelease();
    BOOL v43 = (v41 & 1) == 0 && v41 != 2;
    id v44 = objc_allocWithZone(MEMORY[0x263F525A0]);
    id v45 = sub_2471E5464(v38, v40, v23, v68, v25, (uint64_t)v69, 0, v26, v35, v66, v37, 0, 0, 0, 0, 0, 0, 0, v43,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_247205EA8();
    __swift_project_value_buffer(v46, (uint64_t)qword_26B128910);
    id v47 = a1;
    id v48 = v45;
    id v49 = v47;
    id v50 = v48;
    uint64_t v51 = sub_247205E98();
    os_log_type_t v52 = sub_247206178();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = swift_slowAlloc();
      char v54 = (void *)swift_slowAlloc();
      uint64_t v69 = (char *)swift_slowAlloc();
      uint64_t v74 = (uint64_t)v50;
      id v75 = v69;
      *(_DWORD *)uint64_t v53 = 138412546;
      id v55 = v50;
      sub_2472062B8();
      *char v54 = v50;

      *(_WORD *)(v53 + 12) = 2080;
      uint64_t v56 = sub_2472059C8();
      uint64_t v74 = sub_2471F3F68(v56, v57, (uint64_t *)&v75);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v51, v52, "RequestSettings: %@ for requestId: %s", (uint8_t *)v53, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v54, -1, -1);
      uint64_t v58 = (uint64_t)v69;
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v58, -1, -1);
      MEMORY[0x24C54D9C0](v53, -1, -1);
    }
    else
    {
    }
    uint64_t v59 = v72;
    uint64_t v60 = v73;
    uint64_t v61 = v70;
    objc_msgSend(*(id *)&v73[qword_26B128430], sel_startSpeechRecognitionResultsWithSettings_, v50);
    uint64_t v62 = v71;
    if (qword_26B127C10 != -1) {
      swift_once();
    }
    uint64_t v63 = __swift_project_value_buffer(v59, (uint64_t)qword_26B1288F8);
    (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v63, v59);
    uint64_t v64 = swift_allocObject();
    *(void *)(v64 + 16) = v60;
    *(void *)(v64 + 24) = v49;
    id v65 = v49;
    swift_retain();
    sub_247205C48();

    swift_release();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v61, v59);
  }
  else
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_247205EA8();
    __swift_project_value_buffer(v27, (uint64_t)qword_26B128910);
    uint64_t v73 = a1;
    uint64_t v28 = sub_247205E98();
    os_log_type_t v29 = sub_247206178();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 138412290;
      id v75 = v73;
      os_log_type_t v32 = v73;
      sub_2472062B8();
      *uint64_t v31 = v73;

      _os_log_impl(&dword_2471B4000, v28, v29, "AsrRequestProcessor received message: %@ ignoring it...", v30, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v31, -1, -1);
      MEMORY[0x24C54D9C0](v30, -1, -1);
    }
    else
    {

      id v33 = v73;
    }
  }
}

uint64_t sub_2471DDA50(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_247205C78();
  uint64_t v68 = *(void *)(v4 - 8);
  uint64_t v69 = v4;
  MEMORY[0x270FA5388](v4);
  id v67 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_247205A88();
  uint64_t v65 = *(void *)(v6 - 8);
  uint64_t v66 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v64 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_247205AA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128318);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  unint64_t v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v63 = (char *)&v59 - v16;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_247205EA8();
  __swift_project_value_buffer(v17, (uint64_t)qword_26B128910);
  id v18 = a1;
  id v19 = sub_247205E98();
  os_log_type_t v20 = sub_247206178();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v60 = v15;
    unint64_t v22 = (uint8_t *)v21;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v62 = v2;
    uint64_t v59 = (void *)v23;
    *(_DWORD *)unint64_t v22 = 138412290;
    id v70 = v18;
    id v24 = v18;
    uint64_t v61 = v9;
    uint64_t v25 = v8;
    id v26 = v24;
    sub_2472062B8();
    uint64_t v27 = v59;
    *uint64_t v59 = v18;

    uint64_t v8 = v25;
    uint64_t v9 = v61;
    _os_log_impl(&dword_2471B4000, v19, v20, "AsrRequestProcessor received message: %@", v22, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    uint64_t v2 = v62;
    MEMORY[0x24C54D9C0](v27, -1, -1);
    uint64_t v28 = v22;
    unint64_t v15 = v60;
    MEMORY[0x24C54D9C0](v28, -1, -1);
  }
  else
  {
  }
  uint64_t v29 = *MEMORY[0x263F70A90];
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
  uint64_t v31 = (uint64_t)v63;
  v30(v63, v29, v8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v31, 0, 1, v8);
  sub_2471E8E40(v31, (uint64_t)v15, (uint64_t *)&unk_26B128318);
  uint64_t v32 = v2 + qword_26B1287A0;
  swift_beginAccess();
  sub_2471DBE54((uint64_t)v15, v32);
  swift_endAccess();
  sub_2471E2CB0(0);
  v30(v11, v29, v8);
  uint64_t v33 = sub_2471E4A84((uint64_t)v11);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  *(void *)(v2 + qword_26B128790) = v33;
  swift_release();
  uint64_t v34 = *(void **)(v2 + qword_26B128430);
  sub_2472059C8();
  uint64_t v35 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v34, sel_disableLocalSpeechRecognitionForRequestId_, v35);

  uint64_t v36 = sub_2472059C8();
  unint64_t v38 = v37;
  os_log_type_t v39 = v64;
  sub_247204B48();
  uint64_t v40 = sub_247205A78();
  uint64_t v42 = v41;
  (*(void (**)(char *, uint64_t))(v65 + 8))(v39, v66);
  double v43 = *MEMORY[0x263F525B0];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v44 = (void *)sub_247205CF8();
  char v45 = sub_2471D06E4(v44, v36, v38);
  swift_unknownObjectRelease();
  BOOL v47 = (v45 & 1) == 0 && v45 != 2;
  id v48 = objc_allocWithZone(MEMORY[0x263F525A0]);
  id v49 = sub_2471E5464(v43, v36, v38, v40, v42, 0, 1, 0, MEMORY[0x263F8EE78], 0, 0, 0, 0, 0, 0, 0, 0, 0, v47,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0);
  uint64_t v50 = v2;
  uint64_t v51 = v49;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_msgSend(v34, sel_startSpeechRecognitionResultsWithSettings_, v51);
  if (qword_26B127C10 != -1) {
    swift_once();
  }
  uint64_t v52 = v69;
  uint64_t v53 = __swift_project_value_buffer(v69, (uint64_t)qword_26B1288F8);
  char v54 = v67;
  uint64_t v55 = v68;
  (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v67, v53, v52);
  uint64_t v56 = swift_allocObject();
  *(void *)(v56 + 16) = v50;
  *(void *)(v56 + 24) = v18;
  id v57 = v18;
  swift_retain();
  sub_247205C48();

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v54, v52);
}

uint64_t sub_2471DE144(void *a1)
{
  uint64_t v2 = sub_247205C78();
  uint64_t v47 = *(void *)(v2 - 8);
  uint64_t v48 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v46 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128318);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v44 - v8;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_247205EA8();
  uint64_t v11 = __swift_project_value_buffer(v10, (uint64_t)qword_26B128910);
  id v12 = a1;
  uint64_t v13 = sub_247205E98();
  os_log_type_t v14 = sub_247206178();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v45 = v11;
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    id v44 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v15 = 138412290;
    v51[0] = v12;
    id v16 = v12;
    sub_2472062B8();
    uint64_t v17 = v44;
    void *v44 = v12;

    _os_log_impl(&dword_2471B4000, v13, v14, "AsrRequestProcessor received message: %@", v15, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v17, -1, -1);
    MEMORY[0x24C54D9C0](v15, -1, -1);
  }
  else
  {
  }
  sub_2472057E8();
  uint64_t v18 = swift_dynamicCastClass();
  uint64_t v19 = sub_247205AA8();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = (unsigned int *)MEMORY[0x263F70AC8];
  if (v18) {
    uint64_t v21 = (unsigned int *)MEMORY[0x263F70A88];
  }
  (*(void (**)(char *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v9, *v21, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v9, 0, 1, v19);
  sub_2471E8E40((uint64_t)v9, (uint64_t)v7, (uint64_t *)&unk_26B128318);
  uint64_t v22 = v49;
  uint64_t v23 = v49 + qword_26B1287A0;
  swift_beginAccess();
  sub_2471DBE54((uint64_t)v7, v23);
  swift_endAccess();
  id v24 = (void *)sub_2472055E8();
  sub_2471E2CB0(v24);

  char v25 = AFIsATV();
  id v26 = sub_2471E1D94((uint64_t)v12, v25);
  swift_retain_n();
  id v27 = v26;
  uint64_t v28 = sub_247205E98();
  os_log_type_t v29 = sub_247206178();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v31 = (void *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    uint64_t v50 = (uint64_t)v27;
    v51[0] = (id)v45;
    *(_DWORD *)uint64_t v30 = 138412546;
    id v32 = v27;
    sub_2472062B8();
    *uint64_t v31 = v27;

    uint64_t v22 = v49;
    *(_WORD *)(v30 + 12) = 2080;
    uint64_t v33 = sub_247205D18();
    uint64_t v50 = sub_2471F3F68(v33, v34, (uint64_t *)v51);
    sub_2472062B8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v28, v29, "RequestSettings: %@ for requestId: %s", (uint8_t *)v30, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v31, -1, -1);
    uint64_t v35 = v45;
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v35, -1, -1);
    MEMORY[0x24C54D9C0](v30, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  id v36 = objc_msgSend(v27, sel_speechRecognitionTask);
  sub_2472059C8();
  sub_2471CB06C((unint64_t)v36);
  swift_bridgeObjectRelease();
  objc_msgSend(*(id *)(v22 + qword_26B128430), sel_startSpeechRecognitionResultsWithSettings_, v27);
  if (qword_26B127C10 != -1) {
    swift_once();
  }
  uint64_t v37 = v48;
  uint64_t v38 = __swift_project_value_buffer(v48, (uint64_t)qword_26B1288F8);
  os_log_type_t v39 = v46;
  uint64_t v40 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v46, v38, v37);
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = v22;
  *(void *)(v41 + 24) = v12;
  id v42 = v12;
  swift_retain();
  sub_247205C48();

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v39, v37);
}

void sub_2471DE7DC(void *a1)
{
  uint64_t v2 = v1;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_247205EA8();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B128910);
  id v5 = a1;
  uint64_t v6 = sub_247205E98();
  os_log_type_t v7 = sub_247206178();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v5;
    sub_2472062B8();
    *uint64_t v9 = v5;

    uint64_t v2 = v1;
    _os_log_impl(&dword_2471B4000, v6, v7, "AsrRequestProcessor received message: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v9, -1, -1);
    MEMORY[0x24C54D9C0](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v11 = *(void **)(v2 + qword_26B128458);
  if (v11)
  {
    id v12 = v11;
    sub_2472059C8();
    uint64_t v13 = sub_247205FC8();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_siriPromptWillStartWithRootRequestId_, v13);
  }
  else
  {
    uint64_t v13 = sub_247205E98();
    os_log_type_t v14 = sub_247206188();
    if (os_log_type_enabled(v13, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v15 = 0;
      _os_log_impl(&dword_2471B4000, v13, v14, "AttendingClient not set while receiving SiriWillPromptMessage, dropping", v15, 2u);
      MEMORY[0x24C54D9C0](v15, -1, -1);
    }
  }
}

void sub_2471DEA40(void *a1)
{
  uint64_t v2 = sub_247205AA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B128330);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128318);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  id v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v49 = (char *)&v42 - v13;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_247205EA8();
  uint64_t v15 = __swift_project_value_buffer(v14, (uint64_t)qword_26B128910);
  id v16 = a1;
  uint64_t v17 = sub_247205E98();
  os_log_type_t v18 = sub_247206178();
  BOOL v19 = os_log_type_enabled(v17, v18);
  id v50 = v16;
  if (v19)
  {
    uint64_t v45 = v6;
    uint64_t v46 = v12;
    uint64_t v20 = v16;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v48 = v3;
    uint64_t v22 = (uint8_t *)v21;
    double v43 = (void *)swift_slowAlloc();
    id v44 = v22;
    *(_DWORD *)uint64_t v22 = 138412290;
    uint64_t v47 = v15;
    uint64_t v53 = v20;
    id v23 = v20;
    sub_2472062B8();
    id v24 = v43;
    void *v43 = v20;
    id v12 = v46;

    char v25 = v44;
    uint64_t v6 = v45;
    _os_log_impl(&dword_2471B4000, v17, v18, "AsrRequestProcessor received message: %@", v44, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v24, -1, -1);
    id v26 = v25;
    uint64_t v3 = v48;
    MEMORY[0x24C54D9C0](v26, -1, -1);
  }
  else
  {
  }
  uint64_t v27 = v51 + qword_26B1287A0;
  swift_beginAccess();
  uint64_t v28 = (uint64_t)v49;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v49, *MEMORY[0x263F70AC8], v2);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v28, 0, 1, v2);
  uint64_t v29 = (uint64_t)&v8[*(int *)(v6 + 48)];
  sub_2471E8B38(v27, (uint64_t)v8);
  sub_2471E8B38(v28, v29);
  uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v30((uint64_t)v8, 1, v2) == 1)
  {
    sub_2471D10A4(v28, (uint64_t *)&unk_26B128318);
    int v31 = v30(v29, 1, v2);
    id v32 = v50;
    if (v31 == 1)
    {
      sub_2471D10A4((uint64_t)v8, (uint64_t *)&unk_26B128318);
LABEL_13:
      uint64_t v35 = *(void **)(v51 + qword_26B128430);
      sub_2472059C8();
      id v36 = sub_247205FC8();
      swift_bridgeObjectRelease();
      objc_msgSend(v35, sel_pauseLocalSpeechRecognitionForRequestId_, v36);
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  sub_2471E8B38((uint64_t)v8, (uint64_t)v12);
  if (v30(v29, 1, v2) == 1)
  {
    sub_2471D10A4(v28, (uint64_t *)&unk_26B128318);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
    id v32 = v50;
LABEL_11:
    sub_2471D10A4((uint64_t)v8, &qword_26B128330);
    goto LABEL_14;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v5, v29, v2);
  sub_2471E8BF0(&qword_26B128310, MEMORY[0x263F70AD0]);
  char v33 = sub_247205FB8();
  unint64_t v34 = *(void (**)(char *, uint64_t))(v3 + 8);
  v34(v5, v2);
  sub_2471D10A4(v28, (uint64_t *)&unk_26B128318);
  v34(v12, v2);
  sub_2471D10A4((uint64_t)v8, (uint64_t *)&unk_26B128318);
  id v32 = v50;
  if (v33) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v37 = v32;
  id v36 = sub_247205E98();
  os_log_type_t v38 = sub_247206188();
  if (os_log_type_enabled(v36, v38))
  {
    os_log_type_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v39 = 138412290;
    uint64_t v52 = v37;
    uint64_t v41 = v37;
    sub_2472062B8();
    *uint64_t v40 = v37;

    _os_log_impl(&dword_2471B4000, v36, v38, "Received unexpected %@ message. Current request is not dictation", v39, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v40, -1, -1);
    MEMORY[0x24C54D9C0](v39, -1, -1);
  }
  else
  {

    id v36 = v37;
  }
LABEL_17:
}

void sub_2471DF0E0(void *a1)
{
  uint64_t v2 = sub_247205AA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B128330);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128318);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v49 = (uint64_t)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v43 - v12;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_247205EA8();
  uint64_t v15 = __swift_project_value_buffer(v14, (uint64_t)qword_26B128910);
  id v16 = a1;
  uint64_t v48 = v15;
  uint64_t v17 = sub_247205E98();
  os_log_type_t v18 = sub_247206178();
  if (os_log_type_enabled(v17, v18))
  {
    id v44 = v13;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v46 = v3;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v47 = v8;
    double v43 = (void *)v21;
    *(_DWORD *)uint64_t v20 = 138412290;
    uint64_t v45 = v5;
    id v52 = v16;
    id v22 = v16;
    id v5 = v45;
    sub_2472062B8();
    id v23 = v43;
    void *v43 = v16;

    uint64_t v13 = v44;
    _os_log_impl(&dword_2471B4000, v17, v18, "AsrRequestProcessor received message: %@", v20, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    uint64_t v8 = v47;
    MEMORY[0x24C54D9C0](v23, -1, -1);
    id v24 = v20;
    uint64_t v3 = v46;
    MEMORY[0x24C54D9C0](v24, -1, -1);
  }
  else
  {
  }
  uint64_t v25 = v50 + qword_26B1287A0;
  swift_beginAccess();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v13, *MEMORY[0x263F70AC8], v2);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v13, 0, 1, v2);
  uint64_t v26 = (uint64_t)&v8[*(int *)(v6 + 48)];
  sub_2471E8B38(v25, (uint64_t)v8);
  sub_2471E8B38((uint64_t)v13, v26);
  uint64_t v27 = (uint64_t)v13;
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48);
  int v29 = v28(v8, 1, v2);
  uint64_t v30 = v49;
  if (v29 == 1)
  {
    sub_2471D10A4(v27, (uint64_t *)&unk_26B128318);
    if (v28((char *)v26, 1, v2) == 1)
    {
      sub_2471D10A4((uint64_t)v8, (uint64_t *)&unk_26B128318);
LABEL_13:
      char v33 = *(void **)(v50 + qword_26B128430);
      sub_2472059C8();
      unint64_t v34 = (void *)sub_247205FC8();
      swift_bridgeObjectRelease();
      sub_2472053D8();
      uint64_t v35 = (void *)sub_247205FC8();
      swift_bridgeObjectRelease();
      sub_2472053E8();
      id v36 = (void *)sub_247205FC8();
      swift_bridgeObjectRelease();
      sub_2472053F8();
      uint64_t v37 = sub_247205FC8();
      swift_bridgeObjectRelease();
      objc_msgSend(v33, sel_resumeLocalRecognitionWithRequestId_prefixText_postfixText_selectedText_, v34, v35, v36, v37);

      goto LABEL_17;
    }
    goto LABEL_11;
  }
  sub_2471E8B38((uint64_t)v8, v49);
  if (v28((char *)v26, 1, v2) == 1)
  {
    sub_2471D10A4(v27, (uint64_t *)&unk_26B128318);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v30, v2);
LABEL_11:
    sub_2471D10A4((uint64_t)v8, &qword_26B128330);
    goto LABEL_14;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v5, v26, v2);
  sub_2471E8BF0(&qword_26B128310, MEMORY[0x263F70AD0]);
  char v31 = sub_247205FB8();
  id v32 = *(void (**)(char *, uint64_t))(v3 + 8);
  v32(v5, v2);
  sub_2471D10A4(v27, (uint64_t *)&unk_26B128318);
  v32((char *)v30, v2);
  sub_2471D10A4((uint64_t)v8, (uint64_t *)&unk_26B128318);
  if (v31) {
    goto LABEL_13;
  }
LABEL_14:
  os_log_type_t v38 = v16;
  uint64_t v37 = sub_247205E98();
  os_log_type_t v39 = sub_247206188();
  if (os_log_type_enabled(v37, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v40 = 138412290;
    uint64_t v51 = v38;
    uint64_t v42 = v38;
    sub_2472062B8();
    *uint64_t v41 = v38;

    _os_log_impl(&dword_2471B4000, v37, v39, "Received unexpected %@ message. Current request is not dictation", v40, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v41, -1, -1);
    MEMORY[0x24C54D9C0](v40, -1, -1);
  }
  else
  {

    uint64_t v37 = v38;
  }
LABEL_17:
}

void sub_2471DF7D0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_247205AA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B128330);
  MEMORY[0x270FA5388](v8);
  uint64_t v58 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128318);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  id v57 = (char *)&v51 - v14;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v55 = v13;
  uint64_t v15 = sub_247205EA8();
  uint64_t v16 = __swift_project_value_buffer(v15, (uint64_t)qword_26B128910);
  id v17 = a1;
  uint64_t v56 = v16;
  os_log_type_t v18 = sub_247205E98();
  os_log_type_t v19 = sub_247206178();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v54 = v5;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v51 = (void *)swift_slowAlloc();
    uint64_t v52 = v8;
    *(_DWORD *)uint64_t v21 = 138412290;
    id v60 = v17;
    id v22 = v17;
    uint64_t v53 = v4;
    id v23 = v22;
    uint64_t v8 = v52;
    sub_2472062B8();
    id v24 = v51;
    void *v51 = v17;

    uint64_t v4 = v53;
    _os_log_impl(&dword_2471B4000, v18, v19, "AsrRequestProcessor received message: %@", v21, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v24, -1, -1);
    uint64_t v25 = v21;
    uint64_t v5 = v54;
    MEMORY[0x24C54D9C0](v25, -1, -1);
  }
  else
  {
  }
  uint64_t v26 = v2 + qword_26B1287A0;
  swift_beginAccess();
  uint64_t v27 = (uint64_t)v57;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v57, *MEMORY[0x263F70AC8], v4);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v27, 0, 1, v4);
  uint64_t v28 = v58;
  int v29 = &v58[*(int *)(v8 + 48)];
  sub_2471E8B38(v26, (uint64_t)v58);
  sub_2471E8B38(v27, (uint64_t)v29);
  uint64_t v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (v30(v28, 1, v4) != 1)
  {
    uint64_t v31 = (uint64_t)v55;
    sub_2471E8B38((uint64_t)v58, (uint64_t)v55);
    if (v30(v29, 1, v4) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v29, v4);
      sub_2471E8BF0(&qword_26B128310, MEMORY[0x263F70AD0]);
      char v32 = sub_247205FB8();
      char v33 = *(void (**)(char *, uint64_t))(v5 + 8);
      v33(v7, v4);
      sub_2471D10A4(v27, (uint64_t *)&unk_26B128318);
      v33((char *)v31, v4);
      sub_2471D10A4((uint64_t)v58, (uint64_t *)&unk_26B128318);
      if (v32) {
        goto LABEL_13;
      }
LABEL_15:
      uint64_t v37 = v17;
      os_log_type_t v38 = sub_247205E98();
      os_log_type_t v39 = sub_247206188();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        uint64_t v41 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v40 = 138412290;
        uint64_t v59 = v37;
        uint64_t v42 = v37;
        sub_2472062B8();
        *uint64_t v41 = v37;

        _os_log_impl(&dword_2471B4000, v38, v39, "Received unexpected %@ message. Current request is not dictation", v40, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v41, -1, -1);
        MEMORY[0x24C54D9C0](v40, -1, -1);
      }
      else
      {

        os_log_type_t v38 = v37;
      }
      goto LABEL_41;
    }
    sub_2471D10A4(v27, (uint64_t *)&unk_26B128318);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v31, v4);
LABEL_11:
    sub_2471D10A4((uint64_t)v58, &qword_26B128330);
    goto LABEL_15;
  }
  sub_2471D10A4(v27, (uint64_t *)&unk_26B128318);
  if (v30(v29, 1, v4) != 1) {
    goto LABEL_11;
  }
  sub_2471D10A4((uint64_t)v58, (uint64_t *)&unk_26B128318);
LABEL_13:
  uint64_t v58 = *(char **)(v2 + qword_26B128430);
  sub_2472059C8();
  unint64_t v34 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  sub_247205298();
  if (v35)
  {
    id v36 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v36 = 0;
  }
  sub_2472052A8();
  if (v43)
  {
    id v44 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v44 = 0;
  }
  sub_2472052B8();
  if (v45)
  {
    uint64_t v46 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v46 = 0;
  }
  if (sub_2472052D8() == 2) {
    uint64_t v47 = 0;
  }
  else {
    uint64_t v47 = (void *)sub_247206138();
  }
  if (sub_2472052C8() == 2) {
    uint64_t v48 = 0;
  }
  else {
    uint64_t v48 = (void *)sub_247206138();
  }
  if (sub_247205288() == 2) {
    uint64_t v49 = 0;
  }
  else {
    uint64_t v49 = (void *)sub_247206138();
  }
  if (sub_247205278() == 2) {
    uint64_t v50 = 0;
  }
  else {
    uint64_t v50 = (void *)sub_247206138();
  }
  if (sub_2472052E8() == 2) {
    os_log_type_t v38 = 0;
  }
  else {
    os_log_type_t v38 = sub_247206138();
  }
  objc_msgSend(v58, sel_updateVoiceCommandContextWithRequestId_prefixText_postfixText_selectedText_disambiguationActive_cursorInVisibleText_favorCommandSuppression_abortCommandSuppression_undoEvent_, v34, v36, v44, v46, v47, v48, v49, v50, v38);

LABEL_41:
}

void sub_2471DFFE0(void *a1)
{
  uint64_t v2 = v1;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_247205EA8();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B128910);
  id v5 = a1;
  uint64_t v6 = sub_247205E98();
  os_log_type_t v7 = sub_247206178();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v5;
    sub_2472062B8();
    *uint64_t v9 = v5;

    _os_log_impl(&dword_2471B4000, v6, v7, "AsrRequestProcessor received message: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v9, -1, -1);
    MEMORY[0x24C54D9C0](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v11 = sub_247204B18();
  sub_2471E5C78(v11);
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void **)(v2 + qword_26B128430);
  sub_2471CAE98(0, (unint64_t *)&unk_26B128690);
  uint64_t v13 = (void *)sub_247205F58();
  swift_release();
  objc_msgSend(v12, sel_updateTCUState_, v13);
}

void sub_2471E0208(void *a1)
{
  uint64_t v2 = v1;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_247205EA8();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B128910);
  id v5 = a1;
  uint64_t v6 = sub_247205E98();
  os_log_type_t v7 = sub_247206178();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v21 = v2;
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v5;
    sub_2472062B8();
    *uint64_t v9 = v5;

    _os_log_impl(&dword_2471B4000, v6, v7, "AsrRequestProcessor received message: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v9, -1, -1);
    uint64_t v11 = v8;
    uint64_t v2 = v21;
    MEMORY[0x24C54D9C0](v11, -1, -1);
  }
  else
  {
  }
  uint64_t v12 = sub_247204B58();
  if (v13)
  {
    uint64_t v14 = v12;
    uint64_t v15 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B128720);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247206F40;
    *(void *)(inited + 32) = v14;
    *(void *)(inited + 40) = v15;
    *(void *)(inited + 48) = sub_247206168();
    sub_2471EC830(inited);
    id v17 = *(void **)(v2 + qword_26B128430);
    sub_2471CAE98(0, (unint64_t *)&unk_26B128690);
    os_log_type_t v18 = sub_247205F58();
    swift_bridgeObjectRelease();
    objc_msgSend(v17, sel_updateTCUState_, v18);
  }
  else
  {
    os_log_type_t v18 = sub_247205E98();
    os_log_type_t v19 = sub_247206178();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_2471B4000, v18, v19, "TRPFinalizedMessage does not have a finalTCUId, skipping calling updateTCUState.", v20, 2u);
      MEMORY[0x24C54D9C0](v20, -1, -1);
    }
  }
}

void sub_2471E04DC(void *a1)
{
  uint64_t v2 = v1;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_247205EA8();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B128910);
  id v5 = a1;
  uint64_t v6 = sub_247205E98();
  os_log_type_t v7 = sub_247206178();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v5;
    sub_2472062B8();
    *uint64_t v9 = v5;

    _os_log_impl(&dword_2471B4000, v6, v7, "AsrRequestProcessor received message: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v9, -1, -1);
    MEMORY[0x24C54D9C0](v8, -1, -1);
  }
  else
  {
  }
  sub_2472059C8();
  sub_247205798();
  uint64_t v11 = *(void **)(v2 + qword_26B128430);
  uint64_t v12 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  uint64_t v13 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_trpCandidateReadyForExecutionForRequestId_withTrpId_, v12, v13);
}

void sub_2471E06F8(void *a1)
{
  uint64_t v2 = v1;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_247205EA8();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B128910);
  id v5 = a1;
  uint64_t v6 = sub_247205E98();
  os_log_type_t v7 = sub_247206178();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = v2;
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    id v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v5;
    sub_2472062B8();
    *id v10 = v5;

    uint64_t v2 = v8;
    _os_log_impl(&dword_2471B4000, v6, v7, "AsrRequestProcessor received message: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v10, -1, -1);
    MEMORY[0x24C54D9C0](v9, -1, -1);
  }
  else
  {
  }
  if ((sub_2472055A8() & 1) == 0)
  {
    uint64_t v12 = *(void **)(v2 + qword_26B1287A8);
    if (v12)
    {
      uint64_t v13 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *v12) + 0xC8);
      uint64_t v14 = v12;
      v13();
    }
    else
    {
      uint64_t v14 = sub_247205E98();
      os_log_type_t v15 = sub_247206188();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_2471B4000, v14, v15, "SpeechRecognizerResponseHandler is nil, unable to submit cached partials", v16, 2u);
        MEMORY[0x24C54D9C0](v16, -1, -1);
      }
    }
  }
}

void sub_2471E0978(void *a1)
{
  uint64_t v2 = sub_247205AA8();
  uint64_t v93 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v84 = (char *)v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B128330);
  uint64_t v4 = MEMORY[0x270FA5388](v94);
  uint64_t v6 = (char *)v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v91 = (uint64_t)v77 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v92 = (uint64_t)v77 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128318);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v78 = (uint64_t)v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  unint64_t v81 = (char *)v77 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  id v17 = (char *)v77 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v90 = (uint64_t)v77 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  id v22 = (char *)v77 - v21;
  MEMORY[0x270FA5388](v20);
  id v24 = (char *)v77 - v23;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_247205EA8();
  uint64_t v26 = __swift_project_value_buffer(v25, (uint64_t)qword_26B128910);
  id v27 = a1;
  uint64_t v79 = v26;
  uint64_t v28 = sub_247205E98();
  os_log_type_t v29 = sub_247206178();
  BOOL v30 = os_log_type_enabled(v28, v29);
  id v82 = v6;
  id v83 = v22;
  id v86 = v27;
  int v80 = v17;
  if (v30)
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v89 = (unsigned int (*)(void, void, void))swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 138412290;
    id v96 = v27;
    id v32 = v27;
    sub_2472062B8();
    char v33 = v89;
    *(void *)uint64_t v89 = v27;

    _os_log_impl(&dword_2471B4000, v28, v29, "AsrRequestProcessor received message: %@", v31, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v33, -1, -1);
    MEMORY[0x24C54D9C0](v31, -1, -1);
  }
  else
  {
  }
  uint64_t v34 = v95 + qword_26B1287A0;
  swift_beginAccess();
  uint64_t v35 = *MEMORY[0x263F70AB0];
  uint64_t v36 = v93;
  uint64_t v87 = *(void (**)(char *, uint64_t, uint64_t))(v93 + 104);
  v87(v24, v35, v2);
  uint64_t v88 = *(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56);
  v88(v24, 0, 1, v2);
  uint64_t v37 = v92;
  uint64_t v38 = v92 + *(int *)(v94 + 48);
  uint64_t v85 = v34;
  sub_2471E8B38(v34, v92);
  sub_2471E8B38((uint64_t)v24, v38);
  uint64_t v39 = (uint64_t)v24;
  uint64_t v40 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48);
  unsigned int v41 = v40(v37, 1, v2);
  uint64_t v42 = v90;
  uint64_t v43 = v91;
  uint64_t v89 = v40;
  if (v41 == 1)
  {
    sub_2471D10A4(v39, (uint64_t *)&unk_26B128318);
    if (v40(v38, 1, v2) == 1)
    {
      uint64_t v44 = v92;
LABEL_22:
      sub_2471D10A4(v44, (uint64_t *)&unk_26B128318);
      goto LABEL_23;
    }
    goto LABEL_11;
  }
  v77[0] = v39;
  v77[1] = v36 + 56;
  uint64_t v45 = (uint64_t)v83;
  sub_2471E8B38(v37, (uint64_t)v83);
  if (v40(v38, 1, v2) == 1)
  {
    sub_2471D10A4(v77[0], (uint64_t *)&unk_26B128318);
    (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v45, v2);
LABEL_11:
    sub_2471D10A4(v92, &qword_26B128330);
    uint64_t v46 = v85;
    goto LABEL_13;
  }
  uint64_t v47 = v93;
  uint64_t v48 = v84;
  (*(void (**)(char *, uint64_t, uint64_t))(v93 + 32))(v84, v38, v2);
  sub_2471E8BF0(&qword_26B128310, MEMORY[0x263F70AD0]);
  char v49 = sub_247205FB8();
  uint64_t v50 = *(void (**)(char *, uint64_t))(v47 + 8);
  v50(v48, v2);
  sub_2471D10A4(v77[0], (uint64_t *)&unk_26B128318);
  v50((char *)v45, v2);
  uint64_t v43 = v91;
  sub_2471D10A4(v37, (uint64_t *)&unk_26B128318);
  uint64_t v46 = v85;
  if ((v49 & 1) == 0)
  {
LABEL_13:
    v87((char *)v42, *MEMORY[0x263F70AC8], v2);
    v88((char *)v42, 0, 1, v2);
    uint64_t v51 = v43 + *(int *)(v94 + 48);
    sub_2471E8B38(v46, v43);
    sub_2471E8B38(v42, v51);
    uint64_t v52 = v89;
    if (v89(v43, 1, v2) == 1)
    {
      sub_2471D10A4(v42, (uint64_t *)&unk_26B128318);
      if (v52(v51, 1, v2) == 1)
      {
        uint64_t v44 = v43;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v53 = (uint64_t)v80;
      sub_2471E8B38(v43, (uint64_t)v80);
      if (v52(v51, 1, v2) != 1)
      {
        uint64_t v69 = v93;
        id v70 = v84;
        (*(void (**)(char *, uint64_t, uint64_t))(v93 + 32))(v84, v51, v2);
        sub_2471E8BF0(&qword_26B128310, MEMORY[0x263F70AD0]);
        char v71 = sub_247205FB8();
        uint64_t v72 = *(void (**)(char *, uint64_t))(v69 + 8);
        v72(v70, v2);
        sub_2471D10A4(v90, (uint64_t *)&unk_26B128318);
        v72((char *)v53, v2);
        sub_2471D10A4(v91, (uint64_t *)&unk_26B128318);
        if (v71) {
          goto LABEL_23;
        }
LABEL_19:
        uint64_t v54 = v81;
        v87(v81, *MEMORY[0x263F70A88], v2);
        uint64_t v55 = (uint64_t)v54;
        v88(v54, 0, 1, v2);
        uint64_t v56 = (uint64_t)v82;
        uint64_t v57 = (uint64_t)&v82[*(int *)(v94 + 48)];
        sub_2471E8B38(v46, (uint64_t)v82);
        sub_2471E8B38(v55, v57);
        uint64_t v58 = v89;
        if (v89(v56, 1, v2) == 1)
        {
          sub_2471D10A4(v55, (uint64_t *)&unk_26B128318);
          if (v58(v57, 1, v2) == 1)
          {
            uint64_t v44 = v56;
            goto LABEL_22;
          }
        }
        else
        {
          uint64_t v68 = v78;
          sub_2471E8B38(v56, v78);
          if (v58(v57, 1, v2) != 1)
          {
            uint64_t v73 = v93;
            uint64_t v74 = v84;
            (*(void (**)(char *, uint64_t, uint64_t))(v93 + 32))(v84, v57, v2);
            sub_2471E8BF0(&qword_26B128310, MEMORY[0x263F70AD0]);
            char v75 = sub_247205FB8();
            uint64_t v76 = *(void (**)(char *, uint64_t))(v73 + 8);
            v76(v74, v2);
            sub_2471D10A4(v55, (uint64_t *)&unk_26B128318);
            v76((char *)v68, v2);
            sub_2471D10A4(v56, (uint64_t *)&unk_26B128318);
            if ((v75 & 1) == 0) {
              return;
            }
            goto LABEL_23;
          }
          sub_2471D10A4(v55, (uint64_t *)&unk_26B128318);
          (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v68, v2);
        }
        sub_2471D10A4(v56, &qword_26B128330);
        return;
      }
      sub_2471D10A4(v90, (uint64_t *)&unk_26B128318);
      (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v53, v2);
    }
    sub_2471D10A4(v43, &qword_26B128330);
    goto LABEL_19;
  }
LABEL_23:
  if ((*(unsigned char *)(v95 + qword_26B128798) & 1) == 0)
  {
    sub_2472059C8();
    sub_2471CB330();
    swift_bridgeObjectRelease();
  }
  sub_247204B78();
  uint64_t v59 = swift_dynamicCastClass();
  id v60 = *(void **)(v95 + qword_26B1287A8);
  if (v60)
  {
    BOOL v61 = v59 != 0;
    uint64_t v62 = *(void *)(v95 + qword_26B128430);
    uint64_t v63 = *(void (**)(uint64_t, BOOL))((*MEMORY[0x263F8EED0] & *v60) + 0xB8);
    uint64_t v64 = v60;
    v63(v62, v61);
  }
  else
  {
    uint64_t v65 = sub_247205E98();
    os_log_type_t v66 = sub_247206188();
    if (os_log_type_enabled(v65, v66))
    {
      id v67 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v67 = 0;
      _os_log_impl(&dword_2471B4000, v65, v66, "SpeechRecognizerResponseHandler is nil, will not be able to stop ASR.", v67, 2u);
      MEMORY[0x24C54D9C0](v67, -1, -1);
    }
  }
}

uint64_t sub_2471E1514@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v78 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282E0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v79 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_247205AE8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = v6;
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v77 = (char *)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  char v75 = (char *)&v70 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v70 - v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286F8);
  uint64_t v14 = *(void *)(v6 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v16 = 2 * v14;
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_247206F10;
  unint64_t v18 = v17 + v15;
  uint64_t v19 = *MEMORY[0x263F70D60];
  uint64_t v80 = v7;
  uint64_t v20 = *(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 104);
  v20(v18, v19, v5);
  unint64_t v21 = v18 + v14;
  uint64_t v22 = *MEMORY[0x263F70D38];
  v20(v21, v22, v5);
  unsigned int v76 = *MEMORY[0x263F70D58];
  ((void (*)(unint64_t))v20)(v18 + v16);
  uint64_t v74 = v2;
  uint64_t v23 = sub_2471E4068(v17);
  swift_bridgeObjectRelease();
  unint64_t v81 = (void (*)(char *, uint64_t, uint64_t))v20;
  v20((unint64_t)v13, v19, v5);
  if (*(void *)(v23 + 16) && (unint64_t v24 = sub_2471FCA04((uint64_t)v13), (v25 & 1) != 0))
  {
    uint64_t v26 = v23;
    sub_2471D0F8C(*(void *)(v23 + 56) + 32 * v24, (uint64_t)&v83);
  }
  else
  {
    uint64_t v26 = v23;
    long long v83 = 0u;
    long long v84 = 0u;
  }
  uint64_t v27 = v5;
  uint64_t v29 = v80 + 8;
  uint64_t v28 = *(void (**)(char *, uint64_t))(v80 + 8);
  v28(v13, v5);
  if (*((void *)&v84 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C28);
    if (swift_dynamicCast()) {
      uint64_t v30 = v82;
    }
    else {
      uint64_t v30 = 0;
    }
  }
  else
  {
    sub_2471D10A4((uint64_t)&v83, &qword_26B128760);
    uint64_t v30 = 0;
  }
  uint64_t v31 = (uint64_t)v75;
  v81(v75, v22, v5);
  uint64_t v32 = v26;
  if (*(void *)(v26 + 16) && (unint64_t v33 = sub_2471FCA04(v31), (v34 & 1) != 0))
  {
    sub_2471D0F8C(*(void *)(v26 + 56) + 32 * v33, (uint64_t)&v83);
  }
  else
  {
    long long v83 = 0u;
    long long v84 = 0u;
  }
  v28((char *)v31, v5);
  if (*((void *)&v84 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B127C40);
    if (swift_dynamicCast())
    {
      uint64_t v35 = v82;
      goto LABEL_19;
    }
  }
  else
  {
    sub_2471D10A4((uint64_t)&v83, &qword_26B128760);
  }
  uint64_t v35 = MEMORY[0x263F8EE78];
LABEL_19:
  if (qword_26B128578 != -1) {
    swift_once();
  }
  char v75 = (char *)v28;
  uint64_t v36 = sub_247205EA8();
  uint64_t v37 = __swift_project_value_buffer(v36, (uint64_t)qword_26B128910);
  swift_bridgeObjectRetain_n();
  uint64_t v73 = v37;
  uint64_t v38 = sub_247205E98();
  os_log_type_t v39 = sub_247206178();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v71 = v32;
    uint64_t v40 = swift_slowAlloc();
    uint64_t v72 = v30;
    unsigned int v41 = (uint8_t *)v40;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v80 = v29;
    uint64_t v43 = v42;
    *(void *)&long long v83 = v42;
    *(_DWORD *)unsigned int v41 = 136315138;
    id v70 = v41 + 4;
    uint64_t v44 = swift_bridgeObjectRetain();
    uint64_t v45 = MEMORY[0x24C54CF50](v44, MEMORY[0x263F8D310]);
    unint64_t v47 = v46;
    swift_bridgeObjectRelease();
    uint64_t v48 = v45;
    uint64_t v32 = v71;
    uint64_t v82 = sub_2471F3F68(v48, v47, (uint64_t *)&v83);
    sub_2472062B8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v38, v39, "displayHintsFromSession: %s", v41, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v43, -1, -1);
    char v49 = v41;
    uint64_t v30 = v72;
    MEMORY[0x24C54D9C0](v49, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v50 = (uint64_t)v79;
  uint64_t v51 = (uint64_t)v77;
  v81(v77, v76, v27);
  if (*(void *)(v32 + 16) && (unint64_t v52 = sub_2471FCA04(v51), (v53 & 1) != 0))
  {
    sub_2471D0F8C(*(void *)(v32 + 56) + 32 * v52, (uint64_t)&v83);
  }
  else
  {
    long long v83 = 0u;
    long long v84 = 0u;
  }
  uint64_t v54 = v74;
  swift_bridgeObjectRelease();
  ((void (*)(uint64_t, uint64_t))v75)(v51, v27);
  if (*((void *)&v84 + 1))
  {
    uint64_t v55 = sub_247204A18();
    int v56 = swift_dynamicCast();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v50, v56 ^ 1u, 1, v55);
  }
  else
  {
    sub_2471D10A4((uint64_t)&v83, &qword_26B128760);
    uint64_t v57 = sub_247204A18();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v50, 1, 1, v57);
  }
  uint64_t v58 = sub_2471CE884(v30, v50);
  char v59 = objc_msgSend(self, sel_isDictationAutoPunctuationEnabled);
  char v60 = sub_2471CFA50(v30, v59);
  uint64_t v61 = sub_2471CF504(v30);
  uint64_t v63 = v62;
  if (*(unsigned char *)(v54 + qword_26B128410) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v64 = sub_247205E98();
    os_log_type_t v65 = sub_247206178();
    if (os_log_type_enabled(v64, v65))
    {
      os_log_type_t v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v66 = 0;
      _os_log_impl(&dword_2471B4000, v64, v65, "Sending empty JITLME for MUX enabled device for improving ASR performance.", v66, 2u);
      MEMORY[0x24C54D9C0](v66, -1, -1);
    }

    uint64_t v67 = MEMORY[0x263F8EE78];
  }
  else
  {
    sub_247205D18();
    *(void *)&long long v83 = v30;
    *((void *)&v83 + 1) = v35;
    sub_2471E8CF0();
    uint64_t v80 = v58;
    unint64_t v81 = (void (*)(char *, uint64_t, uint64_t))v61;
    sub_2471E8D44();
    sub_2471E8D98();
    sub_2471E8DEC();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v50 = (uint64_t)v79;
    sub_247204948();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t v58 = v80;
    uint64_t v61 = (uint64_t)v81;
    swift_bridgeObjectRelease_n();
    uint64_t v67 = v82;
  }
  uint64_t result = sub_2471D10A4(v50, (uint64_t *)&unk_26B1282E0);
  uint64_t v69 = v78;
  *uint64_t v78 = v58;
  *((unsigned char *)v69 + 8) = v60 & 1;
  v69[2] = v67;
  v69[3] = v61;
  v69[4] = v63;
  return result;
}

id sub_2471E1D94(uint64_t a1, char a2)
{
  uint64_t v4 = sub_2472048D8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v98 = (uint64_t)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269241458);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v88 - v11;
  uint64_t v102 = a1;
  uint64_t v13 = (void *)sub_2472055E8();
  id v14 = objc_msgSend(self, sel_sharedPreferences);
  id v15 = objc_msgSend(v14, sel_offlineDictationStatus);

  uint64_t v16 = sub_247205F68();
  if (a2)
  {
    uint64_t v17 = v105 + qword_26B128460;
    unint64_t v18 = *(void *)(v105 + qword_26B128460 + 8);
    if (v18)
    {
      uint64_t v19 = *(NSObject **)v17;
      swift_bridgeObjectRetain();
      os_log_t v103 = v19;
      uint64_t v20 = (void *)sub_247205FC8();
      id v21 = (id)_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();

      if (v21)
      {
        uint64_t v101 = sub_247205FD8();
        unint64_t v23 = v22;

        if (qword_26B128578 != -1) {
          swift_once();
        }
        uint64_t v24 = sub_247205EA8();
        __swift_project_value_buffer(v24, (uint64_t)qword_26B128910);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        char v25 = sub_247205E98();
        os_log_type_t v26 = sub_247206178();
        LODWORD(v100) = v26;
        if (os_log_type_enabled(v25, v26))
        {
          uint64_t v27 = swift_slowAlloc();
          unint64_t v104 = v23;
          uint64_t v28 = v27;
          uint64_t v99 = swift_slowAlloc();
          v108[0] = v99;
          *(_DWORD *)uint64_t v28 = 136315394;
          uint64_t v97 = v28 + 4;
          swift_bridgeObjectRetain();
          *(void *)&long long v109 = sub_2471F3F68((uint64_t)v103, v18, v108);
          os_log_t v103 = v25;
          sub_2472062B8();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v28 + 12) = 2080;
          uint64_t v97 = v28 + 14;
          swift_bridgeObjectRetain();
          uint64_t v29 = v101;
          *(void *)&long long v109 = sub_2471F3F68(v101, v104, v108);
          sub_2472062B8();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2471B4000, v103, (os_log_type_t)v100, "Mapped %s to %s", (uint8_t *)v28, 0x16u);
          uint64_t v30 = v99;
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v30, -1, -1);
          uint64_t v31 = v28;
          unint64_t v23 = v104;
          MEMORY[0x24C54D9C0](v31, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          uint64_t v29 = v101;
        }
        *(void *)uint64_t v17 = v29;
        *(void *)(v17 + 8) = v23;
      }
      swift_bridgeObjectRelease();
    }
  }
  id v32 = objc_msgSend(v13, sel_offlineLanguage);
  if (v32)
  {
    unint64_t v33 = v32;
    uint64_t v34 = sub_247205FD8();
    uint64_t v36 = v35;
  }
  else
  {
    uint64_t v34 = *(void *)(v105 + qword_26B128460);
    uint64_t v36 = *(NSObject **)(v105 + qword_26B128460 + 8);
    swift_bridgeObjectRetain();
  }
  if (v36) {
    uint64_t v37 = v34;
  }
  else {
    uint64_t v37 = 0;
  }
  unint64_t v38 = 0xE000000000000000;
  if (v36) {
    unint64_t v38 = (unint64_t)v36;
  }
  unint64_t v106 = v37;
  unint64_t v107 = v38;
  swift_bridgeObjectRetain();
  sub_247206328();
  if (*(void *)(v16 + 16) && (unint64_t v39 = sub_2471FCAD8((uint64_t)v108), (v40 & 1) != 0))
  {
    sub_2471D0F8C(*(void *)(v16 + 56) + 32 * v39, (uint64_t)&v109);
  }
  else
  {
    long long v109 = 0u;
    long long v110 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_2471E8C38((uint64_t)v108);
  if (*((void *)&v110 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269241460);
    if (swift_dynamicCast())
    {
      unint64_t v41 = v106;
      goto LABEL_29;
    }
  }
  else
  {
    sub_2471D10A4((uint64_t)&v109, &qword_26B128760);
  }
  unint64_t v41 = sub_2471ECB48(MEMORY[0x263F8EE78]);
LABEL_29:
  unint64_t v42 = sub_2471CF240(v13, v41);
  swift_bridgeObjectRelease();
  int v43 = *(unsigned __int8 *)(v105 + qword_26B128410);
  os_log_t v103 = v36;
  unint64_t v104 = v34;
  if (v43 == 1)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v44 = sub_247205EA8();
    __swift_project_value_buffer(v44, (uint64_t)qword_26B128910);
    uint64_t v45 = sub_247205E98();
    os_log_type_t v46 = sub_247206178();
    if (os_log_type_enabled(v45, v46))
    {
      unint64_t v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v47 = 0;
      _os_log_impl(&dword_2471B4000, v45, v46, "Sending empty JITLME for MUX enabled device for improving ASR performance.", v47, 2u);
      MEMORY[0x24C54D9C0](v47, -1, -1);
    }
    uint64_t v88 = MEMORY[0x263F8EE78];
    goto LABEL_37;
  }
  uint64_t v48 = objc_msgSend(v13, sel_inlineItemList);
  if (v48)
  {
    uint64_t v45 = v48;
    uint64_t v88 = sub_2472060E8();
LABEL_37:

    goto LABEL_38;
  }
  uint64_t v88 = MEMORY[0x263F8EE78];
LABEL_38:
  uint64_t v49 = sub_2472059C8();
  uint64_t v100 = v50;
  uint64_t v101 = v49;
  id v51 = objc_msgSend(v13, sel_modelOverrideURL);
  if (v51)
  {
    unint64_t v52 = v51;
    sub_2472048C8();

    uint64_t v53 = 0;
  }
  else
  {
    uint64_t v53 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, v53, 1, v4);
  sub_2471E8E40((uint64_t)v10, (uint64_t)v12, &qword_269241458);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4))
  {
    sub_2471D10A4((uint64_t)v12, &qword_269241458);
    uint64_t v105 = 0;
    uint64_t v99 = 0;
  }
  else
  {
    uint64_t v54 = v98;
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 16))(v98, v12, v4);
    sub_2471D10A4((uint64_t)v12, &qword_269241458);
    uint64_t v105 = sub_2472048B8();
    uint64_t v99 = v55;
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v54, v4);
  }
  id v56 = objc_msgSend(v13, sel_applicationName, v88);
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v98 = sub_247205FD8();
    uint64_t v97 = v58;
  }
  else
  {
    uint64_t v98 = 0;
    uint64_t v97 = 0;
  }
  unsigned int v96 = objc_msgSend(v13, sel_detectUtterances);
  unsigned int v95 = objc_msgSend(v13, sel_continuousListening);
  unsigned int v94 = objc_msgSend(v13, sel_shouldHandleCapitalization);
  unsigned int v93 = objc_msgSend(v13, sel_secureOfflineOnly);
  objc_msgSend(v13, sel_maximumRecognitionDuration);
  double v60 = v59;
  id v61 = objc_msgSend(v13, sel_recognitionOverrides);
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = sub_247205F68();

    unint64_t v92 = sub_2471E28E4(v63);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v92 = 0;
  }
  HIDWORD(v91) = sub_2471CF360(v42);
  LODWORD(v91) = objc_msgSend(v13, sel_emojiRecognition);
  unsigned int v90 = objc_msgSend(v13, sel_autoPunctuation);
  unsigned int v89 = objc_msgSend(v13, sel_shouldRecognizeCommands);
  id v64 = objc_msgSend(v13, sel_interactionIdentifier);
  if (v64)
  {
    os_log_type_t v65 = v64;
    uint64_t v66 = sub_247205FD8();
    uint64_t v68 = v67;
  }
  else
  {
    uint64_t v66 = 0;
    uint64_t v68 = 0;
  }
  uint64_t v102 = v42;
  id v69 = objc_msgSend(v13, sel_prefixText);
  if (v69)
  {
    id v70 = v69;
    uint64_t v71 = sub_247205FD8();
    uint64_t v73 = v72;
  }
  else
  {
    uint64_t v71 = 0;
    uint64_t v73 = 0;
  }
  id v74 = objc_msgSend(v13, sel_postfixText);
  if (v74)
  {
    char v75 = v74;
    uint64_t v76 = sub_247205FD8();
    uint64_t v78 = v77;
  }
  else
  {
    uint64_t v76 = 0;
    uint64_t v78 = 0;
  }
  id v79 = objc_msgSend(v13, sel_selectedText);
  if (v79)
  {
    uint64_t v80 = v79;
    uint64_t v81 = sub_247205FD8();
    uint64_t v83 = v82;
  }
  else
  {
    uint64_t v81 = 0;
    uint64_t v83 = 0;
  }
  char v84 = objc_msgSend(v13, sel_shouldGenerateVoiceCommandCandidates);
  id v85 = objc_allocWithZone(MEMORY[0x263F525A0]);
  id v86 = sub_2471E5870(v60, v101, v100, 0, 0xE000000000000000, v102, 0, 0, v88, v105, v99, v98, v97, v96, v95, v94, v93, v92, *(_WORD *)((unsigned char *)&v91 + 3) & 0x100,
          v91,
          v90,
          v104,
          (uint64_t)v103,
          v89,
          v66,
          v68,
          0,
          v71,
          v73,
          v76,
          v78,
          v81,
          v83,
          0,
          0,
          0,
          0,
          0,
          0,
          v84);

  return v86;
}

unint64_t sub_2471E28E4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269241468);
    uint64_t v1 = (void *)sub_247206418();
  }
  else
  {
    uint64_t v1 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v23 = a1 + 64;
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  unint64_t v4 = v2 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v3) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v6 = 0;
  while (1)
  {
    if (v4)
    {
      uint64_t v10 = (v4 - 1) & v4;
      unint64_t v11 = __clz(__rbit64(v4)) | (v6 << 6);
      int64_t v12 = v6;
    }
    else
    {
      int64_t v13 = v6 + 1;
      if (__OFADD__(v6, 1)) {
        goto LABEL_40;
      }
      if (v13 >= v22)
      {
LABEL_36:
        sub_2471E8CE8();
        return (unint64_t)v1;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v6 + 1;
      if (!v14)
      {
        int64_t v12 = v6 + 2;
        if (v6 + 2 >= v22) {
          goto LABEL_36;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v6 + 3;
          if (v6 + 3 >= v22) {
            goto LABEL_36;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v6 + 4;
            if (v6 + 4 >= v22) {
              goto LABEL_36;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v6 + 5;
              if (v6 + 5 >= v22) {
                goto LABEL_36;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_41;
                  }
                  if (v12 >= v22) {
                    goto LABEL_36;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v6 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_2471E8C8C(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v31);
    sub_2471D0F8C(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v32 + 8);
    v29[0] = v32[0];
    v29[1] = v32[1];
    uint64_t v30 = v33;
    v28[0] = v31[0];
    v28[1] = v31[1];
    sub_2471E8C8C((uint64_t)v28, (uint64_t)v27);
    if (!swift_dynamicCast())
    {
      sub_2471D10A4((uint64_t)v28, &qword_269241470);
LABEL_35:
      swift_bridgeObjectRelease();
      sub_2471E8CE8();
      swift_release();
      return 0;
    }
    sub_2471D0F8C((uint64_t)v29 + 8, (uint64_t)v27);
    sub_2471D10A4((uint64_t)v28, &qword_269241470);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
    unint64_t result = sub_2471FC8B8(v25, v26);
    if (v16)
    {
      uint64_t v7 = 16 * result;
      uint64_t v8 = (uint64_t *)(v1[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v8 = v25;
      v8[1] = v26;
      uint64_t v9 = (uint64_t *)(v1[7] + v7);
      unint64_t result = swift_bridgeObjectRelease();
      *uint64_t v9 = v25;
      v9[1] = v26;
      goto LABEL_8;
    }
    if (v1[2] >= v1[3]) {
      break;
    }
    *(void *)((char *)v1 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v17 = (uint64_t *)(v1[6] + 16 * result);
    *uint64_t v17 = v25;
    v17[1] = v26;
    unint64_t v18 = (uint64_t *)(v1[7] + 16 * result);
    *unint64_t v18 = v25;
    v18[1] = v26;
    uint64_t v19 = v1[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_39;
    }
    v1[2] = v21;
LABEL_8:
    int64_t v6 = v12;
    unint64_t v4 = v10;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

void sub_2471E2CB0(void *a1)
{
  uint64_t v2 = v1;
  id v120 = a1;
  uint64_t v3 = sub_247205EA8();
  uint64_t v134 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  id v121 = &v116[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  id v133 = &v116[-v6];
  uint64_t v7 = sub_247205AA8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v123 = &v116[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B128330);
  MEMORY[0x270FA5388](v126);
  unint64_t v127 = &v116[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v125 = sub_247205B68();
  os_log_type_t v124 = *(void (***)(void, void, void))(v125 - 8);
  MEMORY[0x270FA5388](v125);
  uint64_t v128 = &v116[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_247204938();
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  int64_t v15 = &v116[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v13);
  uint64_t v130 = &v116[-v16];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128318);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  BOOL v20 = &v116[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = &v116[-v22];
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v122 = &v116[-v25];
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v129 = &v116[-v27];
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = &v116[-v29];
  MEMORY[0x270FA5388](v28);
  id v32 = &v116[-v31];
  uint64_t v33 = v2 + qword_26B1287A0;
  swift_beginAccess();
  uint64_t v131 = v33;
  sub_2471E8B38(v33, (uint64_t)v32);
  uint64_t v135 = v8;
  uint64_t v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  uint64_t v136 = v7;
  uint64_t v132 = v34;
  unsigned int v35 = v34((uint64_t)v32, 1, v7);
  uint64_t v36 = (void *)&unk_26B128000;
  if (v35 == 1) {
    goto LABEL_2;
  }
  sub_2471E8B38((uint64_t)v32, (uint64_t)v30);
  int v47 = (*(uint64_t (**)(unsigned char *, uint64_t))(v135 + 88))(v30, v136);
  if (v47 == *MEMORY[0x263F70AB0]) {
    goto LABEL_13;
  }
  if (v47 == *MEMORY[0x263F70A98]
    || v47 == *MEMORY[0x263F70A80]
    || v47 == *MEMORY[0x263F70A78]
    || v47 == *MEMORY[0x263F70AA0])
  {
    goto LABEL_2;
  }
  if (v47 == *MEMORY[0x263F70A90])
  {
LABEL_13:
    sub_2471D10A4((uint64_t)v32, (uint64_t *)&unk_26B128318);
    if (qword_26B128578 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v3, (uint64_t)qword_26B128910);
    swift_retain_n();
    uint64_t v48 = sub_247205E98();
    os_log_type_t v49 = sub_247206178();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v140 = v51;
      *(_DWORD *)uint64_t v50 = 136315138;
      uint64_t v52 = sub_247205D18();
      v139[0] = sub_2471F3F68(v52, v53, &v140);
      sub_2472062B8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v48, v49, "Setting speech client delegate for requestId = %s", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v51, -1, -1);
      MEMORY[0x24C54D9C0](v50, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    uint64_t v54 = v136;
    uint64_t v55 = (uint64_t)v128;
    uint64_t v56 = (uint64_t)v127;
    uint64_t v57 = v132;
    sub_247205D28();
    uint64_t v136 = sub_247205CD8();
    uint64_t v134 = v58;
    id v133 = (unsigned char *)sub_247205D18();
    uint64_t v132 = v59;
    v124[2](v55, v2 + qword_26B1287C8, v125);
    sub_2471CA8E4(v2 + qword_26B128478, (uint64_t)&v140);
    uint64_t v125 = sub_247205CF8();
    sub_2471CA8E4(v2 + qword_26B128440, (uint64_t)v139);
    sub_2471CA8E4(v2 + qword_26B128420, (uint64_t)v138);
    sub_2471CA8E4(v2 + qword_26B128488, (uint64_t)v137);
    os_log_type_t v124 = (void (**)(void, void, void))sub_247205CE8();
    double v60 = *(void **)(v2 + qword_26B128498);
    uint64_t v61 = *(void *)(v2 + qword_26B1283F0);
    LODWORD(v121) = *(unsigned __int8 *)(v2 + qword_26B128408);
    LODWORD(v120) = *(unsigned __int8 *)(v2 + qword_26B128410);
    int v119 = *(unsigned __int8 *)(v2 + qword_26B128448);
    int v118 = *(unsigned __int8 *)(v2 + qword_26B128780);
    int v117 = *(unsigned __int8 *)(v2 + qword_26B1283F8);
    uint64_t v62 = v135;
    uint64_t v63 = v129;
    (*(void (**)(unsigned char *, void, uint64_t))(v135 + 104))(v129, *MEMORY[0x263F70A90], v54);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v62 + 56))(v63, 0, 1, v54);
    uint64_t v64 = v56 + *(int *)(v126 + 48);
    sub_2471E8B38(v131, v56);
    sub_2471E8B38((uint64_t)v63, v64);
    if (v57(v56, 1, v54) == 1)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      sub_2471D10A4((uint64_t)v63, (uint64_t *)&unk_26B128318);
      int v65 = v57(v64, 1, v54);
      if (v65 == 1) {
        uint64_t v66 = (uint64_t *)&unk_26B128318;
      }
      else {
        uint64_t v66 = &qword_26B128330;
      }
      if (v65 == 1) {
        char v67 = -1;
      }
      else {
        char v67 = 0;
      }
    }
    else
    {
      uint64_t v68 = v122;
      sub_2471E8B38(v56, (uint64_t)v122);
      if (v57(v64, 1, v54) == 1)
      {
        swift_retain();
        swift_bridgeObjectRetain();
        sub_2471D10A4((uint64_t)v129, (uint64_t *)&unk_26B128318);
        (*(void (**)(unsigned char *, uint64_t))(v135 + 8))(v68, v54);
        char v67 = 0;
        uint64_t v66 = &qword_26B128330;
      }
      else
      {
        uint64_t v76 = v135;
        uint64_t v77 = v123;
        (*(void (**)(unsigned char *, uint64_t, uint64_t))(v135 + 32))(v123, v64, v54);
        sub_2471E8BF0(&qword_26B128310, MEMORY[0x263F70AD0]);
        swift_retain();
        swift_bridgeObjectRetain();
        char v67 = sub_247205FB8();
        uint64_t v78 = *(void (**)(unsigned char *, uint64_t))(v76 + 8);
        id v79 = v77;
        uint64_t v55 = (uint64_t)v128;
        v78(v79, v54);
        uint64_t v66 = (uint64_t *)&unk_26B128318;
        sub_2471D10A4((uint64_t)v129, (uint64_t *)&unk_26B128318);
        v78(v68, v54);
        uint64_t v56 = (uint64_t)v127;
      }
    }
    sub_2471D10A4(v56, v66);
    unsigned __int8 v80 = *(unsigned char *)(v2 + qword_26B1287B8);
    unsigned __int8 v81 = *(unsigned char *)(v2 + qword_26B1287C0);
    AFDeviceSupportsSAE();
    uint64_t v82 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v139, v139[3]);
    MEMORY[0x270FA5388](v82);
    char v84 = (uint64_t *)&v116[-((v83 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(uint64_t *))(v85 + 16))(v84);
    id v86 = sub_2471E6734((uint64_t)v130, v136, v134, (uint64_t)v133, (unint64_t)v132, v55, (uint64_t)&v140, v125, *v84, (uint64_t)v138, (uint64_t)v137, v124, v60, v61, v121, v120, v119, v118, v117,
            v67 & 1,
            v80,
            v81);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
    uint64_t v36 = &unk_26B128000;
    goto LABEL_32;
  }
  if (v47 == *MEMORY[0x263F70AC0] || v47 == *MEMORY[0x263F70AA8])
  {
LABEL_2:
    sub_2471D10A4((uint64_t)v32, (uint64_t *)&unk_26B128318);
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v37 = __swift_project_value_buffer(v3, (uint64_t)qword_26B128910);
    uint64_t v38 = v134;
    unint64_t v39 = v133;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v134 + 16))(v133, v37, v3);
    swift_retain_n();
    char v40 = sub_247205E98();
    os_log_type_t v41 = sub_247206178();
    if (os_log_type_enabled(v40, v41))
    {
      unint64_t v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      uint64_t v140 = v43;
      *(_DWORD *)unint64_t v42 = 136315138;
      sub_2471E8B38(v131, (uint64_t)v23);
      uint64_t v44 = v136;
      if (v132((uint64_t)v23, 1, v136))
      {
        uint64_t v45 = 7104878;
        sub_2471D10A4((uint64_t)v23, (uint64_t *)&unk_26B128318);
        unint64_t v46 = 0xE300000000000000;
      }
      else
      {
        uint64_t v69 = v135;
        id v70 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v135 + 16);
        uint64_t v130 = (unsigned char *)v3;
        uint64_t v71 = v123;
        v70(v123, v23, v44);
        sub_2471D10A4((uint64_t)v23, (uint64_t *)&unk_26B128318);
        uint64_t v72 = sub_247205A98();
        uint64_t v73 = v44;
        uint64_t v45 = v72;
        unint64_t v46 = v74;
        char v75 = v71;
        uint64_t v3 = (uint64_t)v130;
        (*(void (**)(unsigned char *, uint64_t))(v69 + 8))(v75, v73);
      }
      v139[0] = sub_2471F3F68(v45, v46, &v140);
      sub_2472062B8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v40, v41, "Not setting LocalSpeechRecognizerClientDelegate for requestType %s", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v43, -1, -1);
      MEMORY[0x24C54D9C0](v42, -1, -1);

      (*(void (**)(unsigned char *, uint64_t))(v134 + 8))(v133, v3);
      uint64_t v36 = (void *)&unk_26B128000;
    }
    else
    {

      swift_release_n();
      (*(void (**)(unsigned char *, uint64_t))(v38 + 8))(v39, v3);
    }
    goto LABEL_33;
  }
  if (v47 != *MEMORY[0x263F70AC8] && v47 != *MEMORY[0x263F70A88])
  {
    uint64_t v129 = *(unsigned char **)(v135 + 8);
    ((void (*)(unsigned char *, uint64_t))v129)(v30, v136);
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v89 = __swift_project_value_buffer(v3, (uint64_t)qword_26B128910);
    uint64_t v90 = v134;
    uint64_t v91 = v121;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v134 + 16))(v121, v89, v3);
    swift_retain_n();
    unint64_t v92 = sub_247205E98();
    LODWORD(v133) = sub_247206178();
    if (os_log_type_enabled(v92, (os_log_type_t)v133))
    {
      uint64_t v130 = (unsigned char *)v3;
      unsigned int v93 = (uint8_t *)swift_slowAlloc();
      uint64_t v94 = swift_slowAlloc();
      uint64_t v140 = v94;
      *(_DWORD *)unsigned int v93 = 136315138;
      sub_2471E8B38(v131, (uint64_t)v20);
      uint64_t v95 = v136;
      if (v132((uint64_t)v20, 1, v136))
      {
        uint64_t v96 = 7104878;
        sub_2471D10A4((uint64_t)v20, (uint64_t *)&unk_26B128318);
        unint64_t v97 = 0xE300000000000000;
      }
      else
      {
        uint64_t v111 = v123;
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v135 + 16))(v123, v20, v95);
        sub_2471D10A4((uint64_t)v20, (uint64_t *)&unk_26B128318);
        uint64_t v112 = sub_247205A98();
        uint64_t v113 = v95;
        uint64_t v96 = v112;
        unint64_t v97 = v114;
        ((void (*)(unsigned char *, uint64_t))v129)(v111, v113);
      }
      id v115 = v121;
      v139[0] = sub_2471F3F68(v96, v97, &v140);
      sub_2472062B8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v92, (os_log_type_t)v133, "Not setting LocalSpeechRecognizerClientDelegate for requestType %s", v93, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v94, -1, -1);
      MEMORY[0x24C54D9C0](v93, -1, -1);

      (*(void (**)(unsigned char *, unsigned char *))(v134 + 8))(v115, v130);
      uint64_t v36 = (void *)&unk_26B128000;
    }
    else
    {

      swift_release_n();
      (*(void (**)(unsigned char *, uint64_t))(v90 + 8))(v91, v3);
    }
    sub_2471D10A4((uint64_t)v32, (uint64_t *)&unk_26B128318);
    goto LABEL_33;
  }
  sub_2471D10A4((uint64_t)v32, (uint64_t *)&unk_26B128318);
  if (v120)
  {
    id v98 = v120;
    sub_247205D28();
    uint64_t v99 = sub_247205CD8();
    uint64_t v101 = v100;
    uint64_t v102 = sub_247205D18();
    uint64_t v104 = v103;
    sub_2471CA8E4(v2 + qword_26B128478, (uint64_t)&v140);
    uint64_t v105 = sub_247205CF8();
    id v106 = objc_allocWithZone((Class)type metadata accessor for DictationSpeechRecognizerResponseHandler());
    id v86 = sub_2471EB378(v15, v99, v101, v102, v104, (uint64_t)&v140, v105, v98);

LABEL_32:
    uint64_t v87 = v36[245];
    uint64_t v88 = *(void **)(v2 + v87);
    *(void *)(v2 + v87) = v86;

LABEL_33:
    if (*(void *)(v2 + v36[245])) {
      objc_msgSend(*(id *)(v2 + qword_26B128430), sel_setLocalSpeechRecognizerClientDelegate_);
    }
    return;
  }
  if (qword_26B128578 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v3, (uint64_t)qword_26B128910);
  unint64_t v107 = sub_247205E98();
  os_log_type_t v108 = sub_247206188();
  if (os_log_type_enabled(v107, v108))
  {
    long long v109 = (uint8_t *)swift_slowAlloc();
    uint64_t v110 = swift_slowAlloc();
    uint64_t v140 = v110;
    *(_DWORD *)long long v109 = 136315138;
    v139[0] = sub_2471F3F68(0xD000000000000028, 0x8000000247208B00, &v140);
    sub_2472062B8();
    _os_log_impl(&dword_2471B4000, v107, v108, "Unexpected nil dictationOptions when initializing %s", v109, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v110, -1, -1);
    MEMORY[0x24C54D9C0](v109, -1, -1);
  }
}

uint64_t sub_2471E4068(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_247205AE8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C00);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_247205B68();
  uint64_t v11 = *(void *)(v57 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v57);
  uint64_t v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  MEMORY[0x270FA5388](v15);
  if (*(unsigned char *)(v1 + qword_26B128410) != 1)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_247205EA8();
    __swift_project_value_buffer(v31, (uint64_t)qword_26B128910);
    swift_retain_n();
    id v32 = sub_247205E98();
    os_log_type_t v33 = sub_247206178();
    uint64_t v34 = &unk_26B128000;
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v56 = a1;
      uint64_t v36 = (uint8_t *)v35;
      uint64_t v55 = (void *)swift_slowAlloc();
      v58[0] = (uint64_t)v55;
      *(_DWORD *)uint64_t v36 = 136315138;
      uint64_t v54 = (char *)(v36 + 4);
      uint64_t v19 = v57;
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v1 + qword_26B1287C8, v57);
      sub_2471E8BF0(&qword_26B128340, MEMORY[0x263F70DF8]);
      uint64_t v37 = sub_247206478();
      unint64_t v39 = v38;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v19);
      uint64_t v59 = sub_2471F3F68(v37, v39, v58);
      sub_2472062B8();
      swift_release_n();
      uint64_t v34 = (void *)&unk_26B128000;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v32, v33, "Fetching context for sessionUserId: %s", v36, 0xCu);
      char v40 = v55;
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v40, -1, -1);
      MEMORY[0x24C54D9C0](v36, -1, -1);
    }
    else
    {

      swift_release_n();
      uint64_t v19 = v57;
    }
    __swift_project_boxed_opaque_existential_1((void *)(v2 + qword_26B128420), *(void *)(v2 + qword_26B128420 + 24));
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v2 + v34[249], v19);
    goto LABEL_21;
  }
  uint64_t v53 = v17;
  uint64_t v54 = (char *)&v53 - v16;
  uint64_t v56 = a1;
  uint64_t v18 = *(void *)(v1 + qword_26B128420 + 24);
  uint64_t v55 = (void *)(v1 + qword_26B128420);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + qword_26B128420), v18);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F70D50], v4);
  sub_247205B08();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (!v58[3])
  {
    sub_2471D10A4((uint64_t)v58, &qword_26B128760);
    uint64_t v19 = v57;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v10, 1, 1, v57);
    goto LABEL_15;
  }
  uint64_t v19 = v57;
  int v20 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v10, v20 ^ 1u, 1, v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, v19) == 1)
  {
LABEL_15:
    sub_2471D10A4((uint64_t)v10, &qword_26B127C00);
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_247205EA8();
    __swift_project_value_buffer(v41, (uint64_t)qword_26B128910);
    swift_retain_n();
    unint64_t v42 = sub_247205E98();
    os_log_type_t v43 = sub_247206198();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      v58[0] = v45;
      *(_DWORD *)uint64_t v44 = 136315138;
      uint64_t v54 = (char *)(v44 + 4);
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v1 + qword_26B1287C8, v57);
      sub_2471E8BF0(&qword_26B128340, MEMORY[0x263F70DF8]);
      uint64_t v46 = sub_247206478();
      unint64_t v48 = v47;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v57);
      uint64_t v59 = sub_2471F3F68(v46, v48, v58);
      sub_2472062B8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v42, v43, "Could not find a previous user in the session because perhaps this is the first request of the session. Fetching context for sessionUserId: %s", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v45, -1, -1);
      os_log_type_t v49 = v44;
      uint64_t v19 = v57;
      MEMORY[0x24C54D9C0](v49, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    __swift_project_boxed_opaque_existential_1(v55, v55[3]);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v2 + qword_26B1287C8, v19);
LABEL_21:
    uint64_t v50 = sub_247205B28();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v19);
    return v50;
  }
  uint64_t v21 = v54;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v54, v10, v19);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_247205EA8();
  __swift_project_value_buffer(v22, (uint64_t)qword_26B128910);
  uint64_t v23 = v53;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v53, v21, v19);
  uint64_t v24 = sub_247205E98();
  os_log_type_t v25 = sub_247206178();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    v58[0] = v27;
    *(_DWORD *)uint64_t v26 = 136315138;
    sub_2471E8BF0(&qword_26B128340, MEMORY[0x263F70DF8]);
    uint64_t v28 = sub_247206478();
    uint64_t v59 = sub_2471F3F68(v28, v29, v58);
    sub_2472062B8();
    swift_bridgeObjectRelease();
    uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v30(v23, v19);
    _os_log_impl(&dword_2471B4000, v24, v25, "Fetching context for the user selected in previous request: %s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v27, -1, -1);
    MEMORY[0x24C54D9C0](v26, -1, -1);
  }
  else
  {
    uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v30(v23, v19);
  }

  __swift_project_boxed_opaque_existential_1(v55, v55[3]);
  uint64_t v52 = v54;
  uint64_t v50 = sub_247205B28();
  v30((uint64_t)v52, v19);
  return v50;
}

uint64_t sub_2471E4A84(uint64_t a1)
{
  uint64_t v3 = sub_247205AA8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v35[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_247205B68();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = &v35[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_247204938();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = &v35[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = sub_247205CD8();
  uint64_t v39 = v15;
  uint64_t v40 = v14;
  sub_247205D28();
  uint64_t v16 = sub_247205D18();
  uint64_t v37 = v17;
  uint64_t v38 = v16;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 16))(v10, v1 + qword_26B1287C8, v7);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  sub_247205D08();
  uint64_t v18 = sub_247205CF8();
  sub_2471CA8E4(v1 + qword_26B128440, (uint64_t)v42);
  uint64_t v19 = *(void **)(v1 + qword_26B128498);
  uint64_t v20 = *(void *)(v1 + qword_26B128788);
  int v36 = *(unsigned __int8 *)(v1 + qword_26B1287B8);
  swift_retain();
  swift_retain();
  char v21 = AFDeviceSupportsMedoc();
  uint64_t v22 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v42, v43);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (uint64_t *)&v35[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v25 + 16))(v24);
  uint64_t v26 = *v24;
  uint64_t v27 = type metadata accessor for MyriadDecisionMonitor();
  v41[3] = v27;
  v41[4] = &off_26FB63E00;
  v41[0] = v26;
  type metadata accessor for ServerAsrProcessor(0);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v41, v27);
  MEMORY[0x270FA5388](v29);
  uint64_t v31 = (uint64_t *)&v35[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v32 + 16))(v31);
  uint64_t v33 = sub_2471E6D88(v40, v39, (uint64_t)v13, v38, v37, (uint64_t)v10, (uint64_t)v6, (uint64_t)v44, v18, *v31, 0, v19, v20, v36, v21, v28);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  return v33;
}

void sub_2471E4E84(void *a1)
{
  if (*(unsigned char *)(v1 + qword_26B128410) != 1 || *(unsigned char *)(v1 + qword_26B128798) != 1)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_247205EA8();
    __swift_project_value_buffer(v7, (uint64_t)qword_26B128910);
    oslog = sub_247205E98();
    os_log_type_t v8 = sub_247206188();
    if (!os_log_type_enabled(oslog, v8)) {
      goto LABEL_12;
    }
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    uint64_t v10 = "#AsrOnServer ASRBridge should not be handling AsrResultCandidateMessage messages unless both MUX is enabled an"
          "d the request is being handled as asrOnServer";
LABEL_11:
    _os_log_impl(&dword_2471B4000, oslog, v8, v10, v9, 2u);
    MEMORY[0x24C54D9C0](v9, -1, -1);
    goto LABEL_12;
  }
  if (!*(void *)(v1 + qword_26B128790))
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_247205EA8();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B128910);
    oslog = sub_247205E98();
    os_log_type_t v8 = sub_247206188();
    if (!os_log_type_enabled(oslog, v8)) {
      goto LABEL_12;
    }
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    uint64_t v10 = "#AsrOnServer serverAsrResultCandidateProcessor is nil. Cannot process AsrResultCandidateMessage";
    goto LABEL_11;
  }
  uint64_t v2 = *(void **)(v1 + qword_26B1287A8);
  if (v2)
  {
    type metadata accessor for AssistantSpeechRecognizerResponseHandler();
    uint64_t v4 = swift_dynamicCastClass();
    if (v4)
    {
      uint64_t v5 = *(void **)(v4 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard);
      oslog = v5;
      swift_retain();
      id v6 = v2;
      sub_2471D68C8(a1, v5);
      swift_release();

LABEL_12:

      return;
    }
  }
  uint64_t v11 = qword_26B128578;
  swift_retain();
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_247205EA8();
  __swift_project_value_buffer(v12, (uint64_t)qword_26B128910);
  uint64_t v13 = sub_247205E98();
  os_log_type_t v14 = sub_247206188();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_2471B4000, v13, v14, "#AsrOnServer Current speechResponseHandler is not for Assistant request", v15, 2u);
    MEMORY[0x24C54D9C0](v15, -1, -1);
  }

  swift_release();
}

void sub_2471E5194()
{
  uint64_t v1 = v0;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_247205EA8();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B128910);
  uint64_t v3 = sub_247205E98();
  os_log_type_t v4 = sub_247206178();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2471B4000, v3, v4, "AsrCandidateRequestProcessor transitioning to being the active request processor", v5, 2u);
    MEMORY[0x24C54D9C0](v5, -1, -1);
  }

  id v6 = *(void **)(v0 + qword_26B1287A8);
  if (v6)
  {
    uint64_t v7 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *v6) + 0xC0);
    os_log_type_t v8 = v6;
    v7();

    *(unsigned char *)(v1 + qword_26B1287B0) = 1;
  }
  else
  {
    oslog = sub_247205E98();
    os_log_type_t v9 = sub_247206188();
    if (os_log_type_enabled(oslog, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_2471B4000, oslog, v9, "SpeechRecognizerResponseHandler is nil, will not be able to submit any cached partials", v10, 2u);
      MEMORY[0x24C54D9C0](v10, -1, -1);
    }
  }
}

void sub_2471E5374()
{
}

void sub_2471E53A4()
{
}

void sub_2471E53D4()
{
}

void sub_2471E5404()
{
  if (!qword_26B128328)
  {
    sub_247205AA8();
    unint64_t v0 = sub_2472062A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B128328);
    }
  }
}

uint64_t sub_2471E545C()
{
  return type metadata accessor for AsrRequestProcessor();
}

id sub_2471E5464(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, char a15, char a16, char a17, uint64_t a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  uint64_t v69 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  uint64_t v68 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  char v67 = (void *)sub_2472060D8();
  swift_bridgeObjectRelease();
  if (a11)
  {
    uint64_t v66 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v40 = a18;
    if (a13) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v66 = 0;
    uint64_t v40 = a18;
    if (a13)
    {
LABEL_3:
      int v65 = (void *)sub_247205FC8();
      swift_bridgeObjectRelease();
      uint64_t v41 = a23;
      if (v40) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  int v65 = 0;
  uint64_t v41 = a23;
  if (v40)
  {
LABEL_4:
    uint64_t v64 = (void *)sub_247205F58();
    swift_bridgeObjectRelease();
    uint64_t v42 = a26;
    if (v41) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v64 = 0;
  uint64_t v42 = a26;
  if (v41)
  {
LABEL_5:
    uint64_t v63 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v43 = a27;
    if (v42) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v63 = 0;
  uint64_t v43 = a27;
  if (v42)
  {
LABEL_6:
    uint64_t v62 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v44 = a29;
    if (v43) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v62 = 0;
  uint64_t v44 = a29;
  if (v43)
  {
LABEL_7:
    sub_2471CAE98(0, (unint64_t *)&qword_26B127C60);
    uint64_t v61 = (void *)sub_2472060D8();
    swift_bridgeObjectRelease();
    uint64_t v45 = a31;
    if (v44) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v61 = 0;
  uint64_t v45 = a31;
  if (v44)
  {
LABEL_8:
    uint64_t v76 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v46 = a33;
    if (v45) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v77 = 0;
    uint64_t v47 = a39;
    if (v46) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v76 = 0;
  uint64_t v46 = a33;
  if (!v45) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v77 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  uint64_t v47 = a39;
  if (v46)
  {
LABEL_10:
    char v75 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
LABEL_19:
  char v75 = 0;
LABEL_20:
  uint64_t v48 = a37;
  char v49 = a21;
  char v50 = a20;
  char v51 = a17;
  char v52 = a16;
  char v53 = a15;
  char v54 = a14;
  if (v47)
  {
    uint64_t v55 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v48 = a37;
    char v50 = a20;
    char v49 = a21;
    char v51 = a17;
    char v52 = a16;
    char v53 = a15;
    char v54 = a14;
  }
  else
  {
    uint64_t v55 = 0;
  }
  LOBYTE(v60) = a35 & 1;
  LOBYTE(v59) = a24 & 1;
  BYTE3(v58) = v49 & 1;
  BYTE2(v58) = v50 & 1;
  LOWORD(v58) = a19 & 0x101;
  BYTE3(v57) = v51 & 1;
  BYTE2(v57) = v52 & 1;
  BYTE1(v57) = v53 & 1;
  LOBYTE(v57) = v54 & 1;
  id v73 = objc_msgSend(v72, sel_initWithRequestId_inputOrigin_speechRecognitionTaskName_speechRecognitionMode_location_jitGrammar_overrideModelPath_applicationName_detectUtterances_continuousListening_shouldHandleCapitalization_secureOfflineOnly_maximumRecognitionDuration_recognitionOverrides_shouldStoreAudioOnDevice_deliverEagerPackage_enableEmojiRecognition_enableAutoPunctuation_UILanguage_enableVoiceCommands_dictationUIInteractionId_sharedUserInfos_prefixText_postfixText_selectedText_powerContext_shouldStartAudioCapture_audioCaptureStartHostTime_audioRecordType_audioRecordDeviceId_, v69, v68, a6, a7, a8, v67, a1, v66, v65, v57, v64, v58, v63, v59, v62, v61, v76,
          v77,
          v75,
          a34,
          v60,
          a36,
          v48,
          v55);

  return v73;
}

id sub_2471E5870(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, char a15, char a16, char a17, uint64_t a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  uint64_t v68 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  char v67 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  uint64_t v66 = (void *)sub_2472060D8();
  swift_bridgeObjectRelease();
  if (a11)
  {
    int v65 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v41 = a18;
    if (a13) {
      goto LABEL_3;
    }
  }
  else
  {
    int v65 = 0;
    uint64_t v41 = a18;
    if (a13)
    {
LABEL_3:
      uint64_t v64 = (void *)sub_247205FC8();
      swift_bridgeObjectRelease();
      uint64_t v42 = a23;
      if (v41) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  uint64_t v64 = 0;
  uint64_t v42 = a23;
  if (v41)
  {
LABEL_4:
    uint64_t v63 = (void *)sub_247205F58();
    swift_bridgeObjectRelease();
    uint64_t v43 = a26;
    if (v42) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v63 = 0;
  uint64_t v43 = a26;
  if (v42)
  {
LABEL_5:
    uint64_t v62 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v44 = a27;
    if (v43) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v62 = 0;
  uint64_t v44 = a27;
  if (v43)
  {
LABEL_6:
    uint64_t v61 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v45 = a29;
    if (v44) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v61 = 0;
  uint64_t v45 = a29;
  if (v44)
  {
LABEL_7:
    sub_2471CAE98(0, (unint64_t *)&qword_26B127C60);
    uint64_t v60 = (void *)sub_2472060D8();
    swift_bridgeObjectRelease();
    uint64_t v46 = a31;
    if (v45) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v60 = 0;
  uint64_t v46 = a31;
  if (v45)
  {
LABEL_8:
    uint64_t v77 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v47 = a33;
    if (v46) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v76 = 0;
    uint64_t v48 = a39;
    if (v47) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v77 = 0;
  uint64_t v47 = a33;
  if (!v46) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v76 = (void *)sub_247205FC8();
  swift_bridgeObjectRelease();
  uint64_t v48 = a39;
  if (v47)
  {
LABEL_10:
    char v75 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
LABEL_19:
  char v75 = 0;
LABEL_20:
  uint64_t v49 = a37;
  char v50 = a17;
  char v51 = a16;
  char v52 = a15;
  char v53 = a14;
  if (v48)
  {
    unint64_t v74 = (void *)sub_247205FC8();
    swift_bridgeObjectRelease();
    uint64_t v49 = a37;
    char v52 = a15;
    char v51 = a16;
    char v50 = a17;
    char v53 = a14;
  }
  else
  {
    unint64_t v74 = 0;
  }
  LOBYTE(v59) = a40 & 1;
  LOBYTE(v58) = a35 & 1;
  LOBYTE(v57) = a24 & 1;
  BYTE3(v56) = a21 & 1;
  BYTE2(v56) = a20 & 1;
  LOWORD(v56) = a19 & 0x101;
  BYTE3(v55) = v50 & 1;
  BYTE2(v55) = v51 & 1;
  BYTE1(v55) = v52 & 1;
  LOBYTE(v55) = v53 & 1;
  id v72 = objc_msgSend(v71, sel_initWithRequestId_inputOrigin_speechRecognitionTaskName_speechRecognitionMode_location_jitGrammar_overrideModelPath_applicationName_detectUtterances_continuousListening_shouldHandleCapitalization_secureOfflineOnly_maximumRecognitionDuration_recognitionOverrides_shouldStoreAudioOnDevice_deliverEagerPackage_enableEmojiRecognition_enableAutoPunctuation_UILanguage_enableVoiceCommands_dictationUIInteractionId_sharedUserInfos_prefixText_postfixText_selectedText_powerContext_shouldStartAudioCapture_audioCaptureStartHostTime_audioRecordType_audioRecordDeviceId_shouldGenerateVoiceCommandCandidates_, v68, v67, a6, a7, a8, v66, a1, v65, v64, v55, v63, v56, v62, v57, v61, v60, v77,
          v76,
          v75,
          a34,
          v58,
          a36,
          v49,
          v74,
          v59);

  return v72;
}

uint64_t sub_2471E5C78(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(qword_26B1286E0);
  uint64_t result = sub_2472063F8();
  uint64_t v3 = (void *)result;
  int64_t v4 = 0;
  uint64_t v24 = a1;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v22 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v23 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v9 = result + 64;
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    uint64_t v15 = (uint64_t *)(*(void *)(v24 + 48) + 16 * i);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    swift_bridgeObjectRetain();
    uint64_t result = sub_247206168();
    *(void *)(v9 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v18 = (void *)(v3[6] + 16 * i);
    *uint64_t v18 = v17;
    v18[1] = v16;
    *(void *)(v3[7] + 8 * i) = result;
    uint64_t v19 = v3[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v21;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_24;
    }
    if (v12 >= v23) {
      return (uint64_t)v3;
    }
    unint64_t v13 = *(void *)(v22 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v23) {
        return (uint64_t)v3;
      }
      unint64_t v13 = *(void *)(v22 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v23) {
          return (uint64_t)v3;
        }
        unint64_t v13 = *(void *)(v22 + 8 * v4);
        if (!v13) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v8 = (v13 - 1) & v13;
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v23) {
    return (uint64_t)v3;
  }
  unint64_t v13 = *(void *)(v22 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v23) {
      return (uint64_t)v3;
    }
    unint64_t v13 = *(void *)(v22 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_2471E5E7C(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, unsigned __int8 a15, unsigned __int8 a16, unsigned __int8 a17, unsigned __int8 a18, unsigned __int8 a19, char a20,void *a21,unsigned __int8 a22,unsigned __int8 a23,unsigned __int8 a24,unsigned char *a25)
{
  uint64_t v80 = a8;
  uint64_t v88 = a6;
  uint64_t v77 = a3;
  uint64_t v76 = a2;
  uint64_t v89 = a1;
  uint64_t v86 = a12;
  uint64_t v87 = a11;
  uint64_t v28 = sub_247204938();
  uint64_t v81 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  id v79 = (char *)&v68 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for MyriadDecisionMonitor();
  *(void *)&a25[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg] = 0;
  *(void *)&a25[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard] = 0;
  *(void *)&a25[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_speechPartialResultsCache] = MEMORY[0x263F8EE78];
  v93[4] = &off_26FB63E00;
  a25[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_didStopASR] = 0;
  a25[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_hasfirstVoiceIdScoreCardArrived] = 0;
  v93[3] = v30;
  v93[0] = a10;
  a25[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_havePostedSpeechPartialDeliveryStartedMessage] = 0;
  uint64_t v31 = qword_26B128578;
  uint64_t v32 = a25;
  if (v31 != -1) {
    swift_once();
  }
  uint64_t v83 = a4;
  int v85 = a16;
  uint64_t v33 = a21;
  unsigned __int8 v34 = a19;
  int v73 = a18;
  int v72 = a17;
  LODWORD(v75) = a15;
  uint64_t v68 = a14;
  id v35 = a13;
  uint64_t v36 = sub_247205EA8();
  __swift_project_value_buffer(v36, (uint64_t)qword_26B128910);
  swift_bridgeObjectRetain_n();
  uint64_t v37 = sub_247205E98();
  os_log_type_t v38 = sub_247206178();
  BOOL v39 = os_log_type_enabled(v37, v38);
  uint64_t v82 = v28;
  id v84 = a13;
  if (v39)
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    v92[0] = v41;
    LODWORD(v74) = a19;
    *(_DWORD *)uint64_t v40 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&v91[0] = sub_2471F3F68(v83, a5, v92);
    unsigned __int8 v34 = v74;
    sub_2472062B8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2471B4000, v37, v38, "Result selection gate in place for requestId=%s", v40, 0xCu);
    swift_arrayDestroy();
    uint64_t v42 = v41;
    id v35 = v84;
    MEMORY[0x24C54D9C0](v42, -1, -1);
    MEMORY[0x24C54D9C0](v40, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  int v71 = a24;
  int v70 = a23;
  int v69 = a22;
  uint64_t v74 = a9;
  *(void *)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_homeMembers] = v68;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isRMVEnabled] = v75 & 1;
  sub_2471CA8E4((uint64_t)v93, (uint64_t)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_myriadMonitor]);
  *(void *)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_requestQueue] = v35;
  uint64_t v43 = &v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId];
  uint64_t v44 = sub_247205B68();
  uint64_t v45 = *(void *)(v44 - 8);
  uint64_t v46 = *(void (**)(char *, uint64_t))(v45 + 16);
  uint64_t v75 = v44;
  v46(v43, v88);
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMUXEnabled] = v85 & 1;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMedocEnabled] = v72 & 1;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isCandidateRequest] = v73 & 1;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isFFRequest] = v34 & 1;
  sub_2471CA8E4(v87, (uint64_t)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_sessionState]);
  sub_2471CA8E4(v86, (uint64_t)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_immutableSessionState]);
  uint64_t v47 = a7;
  sub_2471CA8E4(a7, (uint64_t)v92);
  uint64_t v78 = a21;
  if (a21)
  {
    swift_retain();
    id v48 = v35;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
    unint64_t v49 = a5;
    uint64_t v50 = v83;
  }
  else
  {
    sub_2471CA8E4((uint64_t)v92, (uint64_t)v91);
    swift_bridgeObjectRetain();
    id v51 = v35;
    _s9ASRBridge9AsrBridgeC27configuredMaxEagerRCAllowedSivgZ_0();
    uint64_t v53 = v52;
    type metadata accessor for BufferedResultCandidateHandler();
    uint64_t v33 = (void *)swift_allocObject();
    v33[10] = 0;
    v33[11] = sub_2471EC818(MEMORY[0x263F8EE78]);
    v33[12] = 0;
    unint64_t v49 = a5;
    uint64_t v50 = v83;
    v33[7] = v83;
    v33[8] = v49;
    sub_2471CA8BC(v91, (uint64_t)(v33 + 2));
    v33[9] = v53;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
  }
  *(void *)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_bufferedResultCandidateHandler] = v33;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isUOS] = a20 & 1;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isIdentityScoreConsumptionEnabled] = v69 & 1;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isIdentityBridgeInstrumentationEnabled] = v70 & 1;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isAssistantEngineEnabled] = v71 & 1;

  uint64_t v54 = v81;
  uint64_t v55 = *(void (**)(char *, uint64_t, uint64_t))(v81 + 16);
  uint64_t v56 = v79;
  uint64_t v57 = v82;
  v55(v79, (uint64_t)v89, v82);
  sub_2471CA8E4(v47, (uint64_t)v91);
  v55(&v32[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId], (uint64_t)v56, v57);
  uint64_t v58 = &v32[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_assistantId];
  uint64_t v59 = v77;
  void *v58 = v76;
  v58[1] = v59;
  uint64_t v60 = (uint64_t *)&v32[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
  uint64_t *v60 = v50;
  v60[1] = v49;
  sub_2471CA8E4((uint64_t)v91, (uint64_t)&v32[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher]);
  *(void *)&v32[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper] = v80;
  *(void *)&v32[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_instrumentationUtil] = v74;
  uint64_t v61 = (objc_class *)type metadata accessor for SpeechRecognizerResponseHandler();
  v90.receiver = v32;
  v90.super_class = v61;
  swift_unknownObjectRetain();
  swift_retain();
  id v62 = objc_msgSendSuper2(&v90, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
  uint64_t v63 = *(void (**)(char *, uint64_t))(v54 + 8);
  v63(v56, v57);
  if (v85)
  {
    uint64_t v64 = (char *)v62;
    uint64_t v65 = sub_2471C0F80();
    swift_unknownObjectRelease();
    swift_release();

    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v86);
    __swift_destroy_boxed_opaque_existential_1(v87);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
    __swift_destroy_boxed_opaque_existential_1(v47);
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v88, v75);
    v63(v89, v57);
    uint64_t v66 = *(void **)&v64[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard];
    *(void *)&v64[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard] = v65;
  }
  else
  {
    swift_unknownObjectRelease();
    swift_release();

    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v86);
    __swift_destroy_boxed_opaque_existential_1(v87);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
    __swift_destroy_boxed_opaque_existential_1(v47);
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v88, v75);
    v63(v89, v57);
  }
  return v62;
}

id sub_2471E6734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, unsigned __int8 a15, unsigned __int8 a16, unsigned __int8 a17, unsigned __int8 a18, unsigned __int8 a19, unsigned __int8 a20,unsigned __int8 a21,unsigned __int8 a22)
{
  uint64_t v76 = a8;
  unint64_t v75 = a5;
  uint64_t v74 = a4;
  uint64_t v73 = a3;
  uint64_t v71 = a2;
  int v59 = a22;
  int v60 = a21;
  int v61 = a20;
  int v62 = a19;
  int v63 = a18;
  int v64 = a17;
  int v65 = a16;
  int v67 = a15;
  uint64_t v68 = a14;
  uint64_t v56 = a13;
  uint64_t v66 = a12;
  uint64_t v72 = a11;
  uint64_t v69 = a10;
  uint64_t v25 = sub_247205B68();
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v51 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_247204938();
  uint64_t v30 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v51 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = type metadata accessor for MyriadDecisionMonitor();
  uint64_t v91 = &off_26FB63E00;
  uint64_t v52 = v90;
  uint64_t v89 = a9;
  uint64_t v54 = v30;
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  uint64_t v55 = v32;
  uint64_t v80 = a1;
  uint64_t v70 = v29;
  v33(v32, a1, v29);
  uint64_t v57 = v26;
  unsigned __int8 v34 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 16);
  uint64_t v58 = v28;
  uint64_t v79 = a6;
  uint64_t v77 = v25;
  v34(v28, a6, v25);
  uint64_t v78 = a7;
  sub_2471CA8E4(a7, (uint64_t)v88);
  if (qword_26B128368 != -1) {
    swift_once();
  }
  uint64_t v35 = qword_26B128770;
  sub_2471CA8E4((uint64_t)&v89, (uint64_t)v86);
  uint64_t v36 = v69;
  sub_2471CA8E4(v69, (uint64_t)v85);
  uint64_t v37 = v72;
  sub_2471CA8E4(v72, (uint64_t)v84);
  swift_retain();
  unsigned __int8 v38 = AFDeviceSupportsSAE();
  uint64_t v39 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v86, v87);
  uint64_t v53 = &v51;
  MEMORY[0x270FA5388](v39);
  uint64_t v41 = (uint64_t *)((char *)&v51 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v42 + 16))(v41);
  uint64_t v43 = *v41;
  uint64_t v83 = &off_26FB63E00;
  uint64_t v82 = v52;
  v81[0] = v43;
  uint64_t v44 = objc_allocWithZone((Class)type metadata accessor for AssistantSpeechRecognizerResponseHandler());
  uint64_t v45 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v81, v82);
  MEMORY[0x270FA5388](v45);
  uint64_t v47 = (uint64_t *)((char *)&v51 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v48 + 16))(v47);
  id v49 = sub_2471E5E7C(v55, v71, v73, v74, v75, (uint64_t)v58, (uint64_t)v88, v76, v35, *v47, (uint64_t)v85, (uint64_t)v84, v66, v68, v67 & 1, v65 & 1, v64 & 1, v63 & 1, v62 & 1,
          v61 & 1,
          v56,
          v60 & 1,
          v59 & 1,
          v38,
          v44);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  __swift_destroy_boxed_opaque_existential_1(v37);
  __swift_destroy_boxed_opaque_existential_1(v36);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v89);
  __swift_destroy_boxed_opaque_existential_1(v78);
  (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v79, v77);
  (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v80, v70);
  return v49;
}

uint64_t sub_2471E6D88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, char a14, char a15, uint64_t a16)
{
  v48[4] = &off_26FB63E00;
  v48[3] = type metadata accessor for MyriadDecisionMonitor();
  v48[0] = a10;
  *(unsigned char *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndPointReceived) = 0;
  *(unsigned char *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndPointSentToSpeech) = 0;
  *(void *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndpointIdentifiedMessage) = 0;
  uint64_t v24 = (void *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_assistantId);
  void *v24 = a1;
  v24[1] = a2;
  uint64_t v25 = a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  uint64_t v26 = sub_247204938();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v45 = a3;
  uint64_t v43 = v26;
  (*(void (**)(uint64_t, uint64_t))(v27 + 16))(v25, a3);
  uint64_t v28 = (void *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
  uint64_t v41 = a4;
  uint64_t v42 = a5;
  *uint64_t v28 = a4;
  v28[1] = a5;
  uint64_t v29 = a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_userId;
  uint64_t v30 = sub_247205B68();
  uint64_t v31 = *(void *)(v30 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v29, a6, v30);
  uint64_t v32 = a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestType;
  uint64_t v33 = sub_247205AA8();
  uint64_t v34 = *(void *)(v33 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v32, a7, v33);
  *(void *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serviceHelper) = a9;
  sub_2471CA8E4((uint64_t)v48, a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_myriadMonitor);
  uint64_t v44 = a8;
  uint64_t v35 = a8;
  uint64_t v36 = a12;
  sub_2471CA8E4(v35, (uint64_t)v47);
  if (a12)
  {
    swift_retain();
    swift_unknownObjectRetain();
  }
  else
  {
    sub_2471CA8E4((uint64_t)v47, (uint64_t)v46);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    _s9ASRBridge9AsrBridgeC27configuredMaxEagerRCAllowedSivgZ_0();
    uint64_t v38 = v37;
    type metadata accessor for BufferedResultCandidateHandler();
    uint64_t v36 = (void *)swift_allocObject();
    v36[10] = 0;
    v36[11] = sub_2471EC818(MEMORY[0x263F8EE78]);
    v36[12] = 0;
    v36[7] = v41;
    v36[8] = v42;
    sub_2471CA8BC(v46, (uint64_t)(v36 + 2));
    v36[9] = v38;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  *(void *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_bufferedResultCandidateHandler) = v36;
  uint64_t v39 = a11;
  if (!a11)
  {
    if (qword_26B128368 != -1) {
      swift_once();
    }
    uint64_t v39 = qword_26B128770;
    swift_retain();
  }
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
  __swift_destroy_boxed_opaque_existential_1(v44);
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(a7, v33);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(a6, v30);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v45, v43);
  *(void *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_instrumentationUtil) = v39;
  *(void *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_muxRequestContext) = a13;
  *(unsigned char *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_isIdentityScoreConsumptionEnabled) = a14 & 1;
  *(unsigned char *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_isMedocEnabled) = a15 & 1;
  return a16;
}

uint64_t sub_2471E7188(void *a1, void (*a2)(void, void), uint64_t a3)
{
  uint64_t v4 = v3;
  int v67 = a1;
  uint64_t v7 = sub_247205EA8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v65 = v7;
  uint64_t v66 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  int v64 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  int v63 = (char *)&v61 - v11;
  uint64_t v12 = sub_247205AA8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B128330);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128318);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v22 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v61 - v23;
  if ((*(unsigned char *)(v4 + qword_26B128798) & 1) == 0)
  {
    int v61 = a2;
    uint64_t v62 = a3;
    uint64_t v26 = v4 + qword_26B1287A0;
    swift_beginAccess();
    (*(void (**)(char *, void, uint64_t))(v13 + 104))(v24, *MEMORY[0x263F70A90], v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v24, 0, 1, v12);
    uint64_t v27 = (uint64_t)&v18[*(int *)(v16 + 48)];
    sub_2471E8B38(v26, (uint64_t)v18);
    sub_2471E8B38((uint64_t)v24, v27);
    uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
    if (v28((uint64_t)v18, 1, v12) == 1)
    {
      sub_2471D10A4((uint64_t)v24, (uint64_t *)&unk_26B128318);
      int v29 = v28(v27, 1, v12);
      a2 = v61;
      a3 = v62;
      if (v29 == 1)
      {
        sub_2471D10A4((uint64_t)v18, (uint64_t *)&unk_26B128318);
        goto LABEL_2;
      }
    }
    else
    {
      sub_2471E8B38((uint64_t)v18, (uint64_t)v22);
      if (v28(v27, 1, v12) != 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v15, v27, v12);
        sub_2471E8BF0(&qword_26B128310, MEMORY[0x263F70AD0]);
        char v59 = sub_247205FB8();
        int v60 = *(void (**)(char *, uint64_t))(v13 + 8);
        v60(v15, v12);
        sub_2471D10A4((uint64_t)v24, (uint64_t *)&unk_26B128318);
        v60(v22, v12);
        sub_2471D10A4((uint64_t)v18, (uint64_t *)&unk_26B128318);
        a2 = v61;
        a3 = v62;
        if (v59) {
          goto LABEL_2;
        }
LABEL_15:
        if (qword_26B128578 != -1) {
          swift_once();
        }
        uint64_t v45 = v65;
        uint64_t v46 = __swift_project_value_buffer(v65, (uint64_t)qword_26B128910);
        uint64_t v47 = v66;
        uint64_t v48 = v64;
        (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v64, v46, v45);
        id v49 = v67;
        uint64_t v50 = sub_247205E98();
        os_log_type_t v51 = sub_247206188();
        if (os_log_type_enabled(v50, v51))
        {
          uint64_t v52 = (uint8_t *)swift_slowAlloc();
          uint64_t v53 = swift_slowAlloc();
          uint64_t v69 = v53;
          *(_DWORD *)uint64_t v52 = 136315138;
          id v54 = objc_msgSend(v49, sel_resultId);
          if (v54)
          {
            uint64_t v55 = v54;
            uint64_t v56 = sub_247205FD8();
            unint64_t v58 = v57;
          }
          else
          {
            uint64_t v56 = 7104878;
            unint64_t v58 = 0xE300000000000000;
          }
          uint64_t v68 = sub_2471F3F68(v56, v58, &v69);
          sub_2472062B8();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2471B4000, v50, v51, "#AsrOnServer Unsupported path for handling server RC. Either asrOnServer must be true or requestType must be uos. rcId: %s", v52, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v53, -1, -1);
          MEMORY[0x24C54D9C0](v52, -1, -1);

          uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v64, v45);
          if (!a2) {
            return result;
          }
        }
        else
        {

          uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v48, v45);
          if (!a2) {
            return result;
          }
        }
        return ((uint64_t (*)(void, void))a2)(0, 0);
      }
      sub_2471D10A4((uint64_t)v24, (uint64_t *)&unk_26B128318);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v22, v12);
      a2 = v61;
    }
    sub_2471D10A4((uint64_t)v18, &qword_26B128330);
    goto LABEL_15;
  }
LABEL_2:
  if (*(void *)(v4 + qword_26B128790))
  {
    swift_retain();
    sub_2471D2318(v67, a2, a3);
    return swift_release();
  }
  uint64_t v30 = (uint64_t (*)(void, void))a2;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v31 = v65;
  uint64_t v32 = __swift_project_value_buffer(v65, (uint64_t)qword_26B128910);
  uint64_t v33 = v66;
  uint64_t v34 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v63, v32, v31);
  uint64_t v35 = v67;
  uint64_t v36 = sub_247205E98();
  os_log_type_t v37 = sub_247206188();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v69 = v39;
    *(_DWORD *)uint64_t v38 = 136315138;
    id v40 = objc_msgSend(v35, sel_resultId);
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = sub_247205FD8();
      unint64_t v44 = v43;
    }
    else
    {
      uint64_t v42 = 7104878;
      unint64_t v44 = 0xE300000000000000;
    }
    uint64_t v68 = sub_2471F3F68(v42, v44, &v69);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v36, v37, "#AsrOnServer serverAsrResultCandidateProcessor is nil. Cannot process the RC. rcId: %s", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v39, -1, -1);
    MEMORY[0x24C54D9C0](v38, -1, -1);

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v63, v65);
    if (v30) {
      return v30(0, 0);
    }
  }
  else
  {

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v34, v31);
    if (v30) {
      return v30(0, 0);
    }
  }
  return result;
}

void sub_2471E7A48(void *a1, void (*a2)(void, void), void *a3)
{
  uint64_t v7 = sub_247205EA8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v60 - v12;
  if (*(unsigned char *)(v3 + qword_26B128410) != 1)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v7, (uint64_t)qword_26B128910);
    id v19 = a1;
    uint64_t v20 = sub_247205E98();
    os_log_type_t v21 = sub_247206188();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      id v63 = a3;
      uint64_t v24 = (void *)v23;
      *(_DWORD *)uint64_t v22 = 138412290;
      uint64_t v65 = (uint64_t)v19;
      id v25 = v19;
      sub_2472062B8();
      void *v24 = v19;

      _os_log_impl(&dword_2471B4000, v20, v21, "#AsrOnServer MUXResultCandidate received when MUX is disabled.  %@", v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v24, -1, -1);
      MEMORY[0x24C54D9C0](v22, -1, -1);

      if (!a2) {
        return;
      }
    }
    else
    {

      if (!a2) {
        return;
      }
    }
    goto LABEL_19;
  }
  if (*(unsigned char *)(v3 + qword_26B128798) != 1)
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v26 = __swift_project_value_buffer(v7, (uint64_t)qword_26B128910);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v26, v7);
    id v27 = a1;
    uint64_t v28 = sub_247205E98();
    os_log_type_t v29 = sub_247206188();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v62 = a2;
      id v63 = a3;
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v61 = swift_slowAlloc();
      uint64_t v65 = v61;
      *(_DWORD *)uint64_t v30 = 136315138;
      id v31 = objc_msgSend(v27, sel_rcID);
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = sub_247205FD8();
        unint64_t v35 = v34;
      }
      else
      {
        uint64_t v33 = 7104878;
        unint64_t v35 = 0xE300000000000000;
      }
      uint64_t v64 = sub_2471F3F68(v33, v35, &v65);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v28, v29, "#AsrOnServer Unsupported path for handling server RC. rcId: %s", v30, 0xCu);
      uint64_t v50 = v61;
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v50, -1, -1);
      MEMORY[0x24C54D9C0](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
LABEL_49:
      a2 = v62;
      if (!v62) {
        return;
      }
      goto LABEL_19;
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
LABEL_37:
    if (!a2) {
      return;
    }
LABEL_19:
    a2(0, 0);
    return;
  }
  if (!*(void *)(v3 + qword_26B128790))
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v40 = __swift_project_value_buffer(v7, (uint64_t)qword_26B128910);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v13, v40, v7);
    id v41 = a1;
    uint64_t v42 = sub_247205E98();
    os_log_type_t v43 = sub_247206188();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v62 = a2;
      id v63 = a3;
      unint64_t v44 = (uint8_t *)swift_slowAlloc();
      uint64_t v61 = swift_slowAlloc();
      uint64_t v65 = v61;
      *(_DWORD *)unint64_t v44 = 136315138;
      id v45 = objc_msgSend(v41, sel_rcID);
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = sub_247205FD8();
        unint64_t v49 = v48;
      }
      else
      {
        uint64_t v47 = 7104878;
        unint64_t v49 = 0xE300000000000000;
      }
      uint64_t v64 = sub_2471F3F68(v47, v49, &v65);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v42, v43, "#AsrOnServer serverAsrResultCandidateProcessor is nil. Cannot process the RC. rcId: %s", v44, 0xCu);
      uint64_t v59 = v61;
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v59, -1, -1);
      MEMORY[0x24C54D9C0](v44, -1, -1);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
      goto LABEL_49;
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    goto LABEL_37;
  }
  uint64_t v14 = *(void **)(v3 + qword_26B1287A8);
  if (v14
    && (type metadata accessor for AssistantSpeechRecognizerResponseHandler(), (uint64_t v15 = swift_dynamicCastClass()) != 0))
  {
    uint64_t v16 = v15;
    uint64_t v17 = a3;
    if ((*(unsigned char *)(v15
                   + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_hasfirstVoiceIdScoreCardArrived) & 1) != 0)
    {
      swift_retain();
      id v18 = v14;
    }
    else
    {
      os_log_type_t v51 = a2;
      uint64_t v52 = qword_26B128578;
      swift_retain();
      id v53 = v14;
      if (v52 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v7, (uint64_t)qword_26B128910);
      id v54 = sub_247205E98();
      os_log_type_t v55 = sub_247206188();
      if (os_log_type_enabled(v54, v55))
      {
        uint64_t v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v56 = 0;
        _os_log_impl(&dword_2471B4000, v54, v55, "First Voice Id Score card has not arrived yet. The unknown user shall be used for this result candidate.", v56, 2u);
        MEMORY[0x24C54D9C0](v56, -1, -1);
      }

      a2 = v51;
    }
    unint64_t v57 = *(void **)(v16 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard);
    id v63 = v57;
    sub_2471D5038(a1, v57, (int64_t)a2, v17);
    swift_release();

    unint64_t v58 = v63;
  }
  else
  {
    uint64_t v36 = qword_26B128578;
    swift_retain();
    if (v36 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v7, (uint64_t)qword_26B128910);
    os_log_type_t v37 = sub_247205E98();
    os_log_type_t v38 = sub_247206188();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_2471B4000, v37, v38, "#AsrOnServer Current speechResponseHandler is not for Assistant request", v39, 2u);
      MEMORY[0x24C54D9C0](v39, -1, -1);
    }

    swift_release();
  }
}

uint64_t sub_2471E831C(void *a1, uint64_t (*a2)(void, void), uint64_t a3)
{
  uint64_t v7 = sub_247205EA8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v3 + qword_26B128790))
  {
    swift_retain();
    sub_2471D8D90(a1, (uint64_t)a2, a3);
    return swift_release();
  }
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v7, (uint64_t)qword_26B128910);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v7);
  id v13 = a1;
  uint64_t v14 = sub_247205E98();
  os_log_type_t v15 = sub_247206188();
  if (!os_log_type_enabled(v14, v15))
  {

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    if (!a2) {
      return result;
    }
    return a2(0, 0);
  }
  id v25 = a2;
  uint64_t v26 = a3;
  uint64_t v16 = (uint8_t *)swift_slowAlloc();
  uint64_t v24 = swift_slowAlloc();
  uint64_t v28 = v24;
  *(_DWORD *)uint64_t v16 = 136315138;
  id v17 = objc_msgSend(v13, sel_refId);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = sub_247205FD8();
    unint64_t v21 = v20;
  }
  else
  {
    unint64_t v21 = 0xE300000000000000;
    uint64_t v19 = 7104878;
  }
  uint64_t v27 = sub_2471F3F68(v19, v21, &v28);
  sub_2472062B8();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_2471B4000, v14, v15, "#AsrOnServer serverAsrResultCandidateProcessor is nil. Cannot process the SASSpeechServerEndpointIdentified. refId: %s", v16, 0xCu);
  uint64_t v22 = v24;
  swift_arrayDestroy();
  MEMORY[0x24C54D9C0](v22, -1, -1);
  MEMORY[0x24C54D9C0](v16, -1, -1);

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  a2 = v25;
  if (v25) {
    return a2(0, 0);
  }
  return result;
}

uint64_t sub_2471E864C(void *a1, uint64_t (*a2)(void, void), uint64_t a3)
{
  uint64_t v7 = sub_247205EA8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v3 + qword_26B128790);
  if (v11)
  {
    uint64_t v12 = *(void **)(v11 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serviceHelper);
    uint64_t result = (uint64_t)objc_msgSend(v12, sel_respondsToSelector_, sel_handleSpeechRecognized_completion_);
    if (result)
    {
      uint64_t v14 = swift_allocObject();
      swift_weakInit();
      os_log_type_t v15 = (void *)swift_allocObject();
      v15[2] = v14;
      v15[3] = a2;
      v15[4] = a3;
      v15[5] = a1;
      aBlock[4] = (uint64_t)sub_2471E8B14;
      aBlock[5] = (uint64_t)v15;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_2471DC9B8;
      aBlock[3] = (uint64_t)&block_descriptor_4;
      uint64_t v16 = _Block_copy(aBlock);
      swift_retain();
      swift_unknownObjectRetain();
      swift_retain();
      sub_2471DA438((uint64_t)a2);
      id v17 = a1;
      swift_retain();
      swift_release();
      objc_msgSend(v12, sel_handleSpeechRecognized_completion_, v17, v16);
      _Block_release(v16);
      swift_release();
      swift_release();
      swift_release();
      return swift_unknownObjectRelease();
    }
    return result;
  }
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v7, (uint64_t)qword_26B128910);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v18, v7);
  id v19 = a1;
  unint64_t v20 = sub_247205E98();
  int v21 = sub_247206188();
  if (!os_log_type_enabled(v20, (os_log_type_t)v21))
  {

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    if (!a2) {
      return result;
    }
    return a2(0, 0);
  }
  int v30 = v21;
  id v31 = a2;
  uint64_t v22 = (uint8_t *)swift_slowAlloc();
  uint64_t v29 = swift_slowAlloc();
  aBlock[0] = v29;
  *(_DWORD *)uint64_t v22 = 136315138;
  id v23 = objc_msgSend(v19, sel_refId);
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = sub_247205FD8();
    unint64_t v27 = v26;
  }
  else
  {
    unint64_t v27 = 0xE300000000000000;
    uint64_t v25 = 7104878;
  }
  uint64_t aBlock[6] = sub_2471F3F68(v25, v27, aBlock);
  sub_2472062B8();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_2471B4000, v20, (os_log_type_t)v30, "#AsrOnServer serverAsrResultCandidateProcessor is nil. Cannot process the SASSpeechRecognized. refId: %s", v22, 0xCu);
  uint64_t v28 = v29;
  swift_arrayDestroy();
  MEMORY[0x24C54D9C0](v28, -1, -1);
  MEMORY[0x24C54D9C0](v22, -1, -1);

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  a2 = v31;
  if (v31) {
    return a2(0, 0);
  }
  return result;
}

uint64_t sub_2471E8A8C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2471E8AC4()
{
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_2471E8B14(uint64_t a1, uint64_t a2)
{
  sub_2471D91E0(a1, a2, *(void *)(v2 + 16), *(void (**)(uint64_t, uint64_t))(v2 + 24), *(void *)(v2 + 32), *(void **)(v2 + 40));
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

uint64_t sub_2471E8B38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128318);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

uint64_t sub_2471E8BF0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2471E8C38(uint64_t a1)
{
  return a1;
}

uint64_t sub_2471E8C8C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2471E8CE8()
{
  return swift_release();
}

unint64_t sub_2471E8CF0()
{
  unint64_t result = qword_26B1283A0;
  if (!qword_26B1283A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1283A0);
  }
  return result;
}

unint64_t sub_2471E8D44()
{
  unint64_t result = qword_26B128398;
  if (!qword_26B128398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B128398);
  }
  return result;
}

unint64_t sub_2471E8D98()
{
  unint64_t result = qword_26B1283D0;
  if (!qword_26B1283D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1283D0);
  }
  return result;
}

unint64_t sub_2471E8DEC()
{
  unint64_t result = qword_26B1283C8;
  if (!qword_26B1283C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1283C8);
  }
  return result;
}

uint64_t sub_2471E8E40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t objectdestroy_12Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2471E8EF0()
{
  return sub_2471DCE14(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2471E9138(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, unsigned int *a6)
{
  uint64_t v10 = sub_247205FD8();
  unint64_t v12 = v11;
  id v13 = a3;
  id v14 = a5;
  id v15 = a1;
  sub_2471EBF18(v10, v12, v14, a6);

  return swift_bridgeObjectRelease();
}

uint64_t sub_2471E9348(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, unsigned int *a7, char a8)
{
  uint64_t v14 = sub_247205FD8();
  unint64_t v16 = v15;
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a1;
  sub_2471EC148(v14, v16, v18, v19, a7, a8);

  return swift_bridgeObjectRelease();
}

void sub_2471E940C(void *a1, uint64_t a2)
{
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_247205EA8();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B128910);
  uint64_t v6 = v2;
  uint64_t v7 = sub_247205E98();
  os_log_type_t v8 = sub_247206178();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = a2;
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v16 = v10;
    uint64_t v12 = *(void *)&v6[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
    unint64_t v11 = *(void *)&v6[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
    swift_bridgeObjectRetain();
    sub_2471F3F68(v12, v11, &v16);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v7, v8, "Going to stop ASR for requestId = %s", v9, 0xCu);
    swift_arrayDestroy();
    uint64_t v13 = v10;
    a2 = v15;
    MEMORY[0x24C54D9C0](v13, -1, -1);
    MEMORY[0x24C54D9C0](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v14 = (void *)sub_247205FC8();
  objc_msgSend(a1, sel_stopSpeechRecognitionTaskWithReason_requestId_, a2, v14);
}

uint64_t sub_2471E9608(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v6 - 8);
  os_log_type_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *MEMORY[0x263F709E0];
  uint64_t v10 = sub_247205A38();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_247205998();
  swift_bridgeObjectRetain();
  sub_247205988();
  uint64_t v12 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v13 = sub_247204938();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  sub_2472059B8();
  swift_bridgeObjectRetain();
  return sub_2472059A8();
}

void sub_2471E9930(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, void *a6, int a7)
{
  uint64_t v115 = a2;
  int v102 = a7;
  unint64_t v114 = a5;
  uint64_t v109 = a4;
  uint64_t v117 = a1;
  uint64_t v9 = sub_247205AF8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v100 = (char *)&v99 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v104 = (char *)&v99 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  id v106 = (char *)&v99 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  id v19 = (char *)&v99 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v103 = (char *)&v99 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v105 = (char *)&v99 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  unint64_t v107 = (char *)&v99 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v99 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  id v31 = (char *)&v99 - v30;
  MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)&v99 - v32;
  id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F284F0]), sel_init);
  if (a6)
  {
    id v35 = objc_msgSend(a6, sel_commandGrammarParsePackage);
    if (v35)
    {
      uint64_t v36 = v35;
      objc_msgSend(v34, sel_setCommandGrammarParsePackage_, v35);
    }
  }
  uint64_t v101 = v19;
  uint64_t v37 = v10;
  os_log_type_t v38 = *(void (**)(void))(v10 + 104);
  unsigned int v108 = *MEMORY[0x263F70D98];
  uint64_t v111 = v38;
  uint64_t v112 = v10 + 104;
  v38(v33);
  unint64_t v39 = sub_2471EB290();
  sub_2472060B8();
  unint64_t v113 = v39;
  sub_2472060B8();
  if (v120 == v118 && v121 == v119) {
    char v40 = 1;
  }
  else {
    char v40 = sub_2472064A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v110 = *(uint64_t (**)(char *, uint64_t))(v37 + 8);
  uint64_t v41 = v110(v33, v9);
  if (v40)
  {
    MEMORY[0x270FA5388](v41);
    uint64_t v42 = v115;
    *(&v99 - 6) = v116;
    *(&v99 - 5) = v42;
    unint64_t v43 = a3;
    uint64_t v44 = v109;
    *(&v99 - 4) = a3;
    *(&v99 - 3) = v44;
    *(&v99 - 2) = (uint64_t)v114;
    *(&v99 - 1) = (uint64_t)v34;
    id v45 = v34;
    id v46 = objc_allocWithZone((Class)sub_247205028());
    goto LABEL_15;
  }
  ((void (*)(char *, void, uint64_t))v111)(v31, *MEMORY[0x263F70D88], v9);
  sub_2472060B8();
  sub_2472060B8();
  unint64_t v43 = a3;
  if (v120 == v118 && v121 == v119)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v47 = v110(v31, v9);
    uint64_t v48 = (uint64_t)v114;
LABEL_14:
    MEMORY[0x270FA5388](v47);
    uint64_t v50 = v115;
    *(&v99 - 6) = v116;
    *(&v99 - 5) = v50;
    *(&v99 - 4) = v43;
    *(&v99 - 3) = v48;
    id v45 = v34;
    *(&v99 - 2) = (uint64_t)v34;
    id v51 = objc_allocWithZone((Class)sub_247205028());
    goto LABEL_15;
  }
  char v49 = sub_2472064A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v47 = v110(v31, v9);
  uint64_t v48 = (uint64_t)v114;
  if (v49) {
    goto LABEL_14;
  }
  ((void (*)(char *, void, uint64_t))v111)(v28, *MEMORY[0x263F70D90], v9);
  sub_2472060B8();
  sub_2472060B8();
  id v45 = v34;
  if (v120 == v118 && v121 == v119)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v66 = v110(v28, v9);
  }
  else
  {
    char v73 = sub_2472064A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v66 = v110(v28, v9);
    if ((v73 & 1) == 0) {
      goto LABEL_45;
    }
  }
  MEMORY[0x270FA5388](v66);
  uint64_t v74 = v115;
  *(&v99 - 6) = v116;
  *(&v99 - 5) = v74;
  *(&v99 - 4) = v43;
  *(&v99 - 3) = v48;
  *(&v99 - 2) = (uint64_t)v34;
  id v75 = objc_allocWithZone((Class)sub_247205028());
LABEL_15:
  uint64_t v52 = (void *)sub_247204F98();
  if (v52)
  {
    id v53 = v45;
    uint64_t v54 = v116;
    __swift_project_boxed_opaque_existential_1((void *)(v116 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher), *(void *)(v116 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24));
    id v55 = v52;
    sub_247205A18();
    uint64_t v56 = *(void **)(v54 + OBJC_IVAR____TtC9ASRBridge40DictationSpeechRecognizerResponseHandler_dictationOptions);
    if (!objc_msgSend(v56, sel_shouldRecognizeCommands))
    {
      if (objc_msgSend(v56, sel_shouldClassifyIntent))
      {

LABEL_89:
        goto LABEL_90;
      }
      uint64_t v65 = v106;
      ((void (*)(char *, void, uint64_t))v111)(v106, v108, v9);
      sub_2472060B8();
      sub_2472060B8();
      unint64_t v58 = v53;
      if (v120 == v118 && v121 == v119)
      {
        swift_bridgeObjectRelease_n();
        v110(v65, v9);
      }
      else
      {
        char v71 = sub_2472064A8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v110(v65, v9);
        if ((v71 & 1) == 0)
        {
          int v85 = v104;
          ((void (*)(char *, void, uint64_t))v111)(v104, *MEMORY[0x263F70D88], v9);
          sub_2472060B8();
          sub_2472060B8();
          if (v120 == v118 && v121 == v119)
          {
            swift_bridgeObjectRelease_n();
            v110(v85, v9);
            uint64_t v70 = v114;
          }
          else
          {
            char v87 = sub_2472064A8();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v110(v85, v9);
            uint64_t v70 = v114;
            if ((v87 & 1) == 0)
            {
              unsigned int v93 = v100;
              ((void (*)(char *, void, uint64_t))v111)(v100, *MEMORY[0x263F70D90], v9);
              sub_2472060B8();
              sub_2472060B8();
              if (v120 == v118 && v121 == v119)
              {
                swift_bridgeObjectRelease_n();
                v110(v93, v9);
                if (v70)
                {
LABEL_85:
                  int v67 = v55;
                  unint64_t v97 = *(void **)(v116 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper);
                  if ((objc_msgSend(v97, sel_respondsToSelector_, sel_didRecognizeFinalResultCandidatePackage_sessionUUID_) & 1) == 0)goto LABEL_87; {
                  id v98 = v70;
                  }
                  swift_unknownObjectRetain();
                  id v84 = (void *)sub_247205FC8();
                  objc_msgSend(v97, sel_didRecognizeFinalResultCandidatePackage_sessionUUID_, v98, v84);

                  swift_unknownObjectRelease();
                  goto LABEL_53;
                }
LABEL_88:

                goto LABEL_89;
              }
              char v95 = sub_2472064A8();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v110(v93, v9);
              if ((v95 & 1) == 0) {
                goto LABEL_88;
              }
LABEL_84:
              if (v70) {
                goto LABEL_85;
              }
              goto LABEL_88;
            }
          }
          uint64_t v88 = *(void **)(v116 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper);
          if (objc_msgSend(v88, sel_respondsToSelector_, sel_didRecognizePackage_sessionUUID_))
          {
            swift_unknownObjectRetain();
            uint64_t v89 = (void *)sub_247205FC8();
            objc_msgSend(v88, sel_didRecognizePackage_sessionUUID_, v70, v89);
            swift_unknownObjectRelease();

            return;
          }
          goto LABEL_88;
        }
      }
      int v67 = v55;
      uint64_t v72 = *(void **)(v116 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper);
      if (objc_msgSend(v72, sel_respondsToSelector_, sel_didRecognizeTokens_sessionUUID_))
      {
        if (v109)
        {
          sub_2471EB2F4();
          swift_unknownObjectRetain();
          uint64_t v69 = (void *)sub_2472060D8();
        }
        else
        {
          swift_unknownObjectRetain();
          uint64_t v69 = 0;
        }
        uint64_t v86 = (void *)sub_247205FC8();
        objc_msgSend(v72, sel_didRecognizeTokens_sessionUUID_, v69, v86);
        swift_unknownObjectRelease();
        goto LABEL_67;
      }
LABEL_87:

      return;
    }
    unint64_t v57 = v107;
    ((void (*)(char *, void, uint64_t))v111)(v107, v108, v9);
    sub_2472060B8();
    sub_2472060B8();
    if (v120 == v118 && v121 == v119)
    {
      swift_bridgeObjectRelease_n();
      v110(v57, v9);
      unint64_t v58 = v53;
      goto LABEL_23;
    }
    char v59 = sub_2472064A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v110(v57, v9);
    unint64_t v58 = v53;
    if (v59)
    {
LABEL_23:
      uint64_t v60 = *(void **)(v116 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper);
      uint64_t v61 = v114;
      if (v114)
      {
        if (objc_msgSend(*(id *)(v116 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper), sel_respondsToSelector_, sel_didRecognizePartialPackage_nluResult_sessionUUID_))
        {
          id v62 = v61;
          swift_unknownObjectRetain();
          id v63 = v58;
          uint64_t v64 = v55;
          id v55 = (id)sub_247205FC8();
          objc_msgSend(v60, sel_didRecognizePartialPackage_nluResult_sessionUUID_, v62, v63, v55);
LABEL_26:

          swift_unknownObjectRelease();
LABEL_90:

          return;
        }
        goto LABEL_88;
      }
      int v67 = v55;
      if (objc_msgSend(*(id *)(v116 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper), sel_respondsToSelector_, sel_didRecognizeTokens_nluResult_sessionUUID_))
      {
        if (v109)
        {
          sub_2471EB2F4();
          id v68 = v58;
          swift_unknownObjectRetain();
          uint64_t v69 = (void *)sub_2472060D8();
        }
        else
        {
          id v90 = v58;
          swift_unknownObjectRetain();
          uint64_t v69 = 0;
        }
        uint64_t v86 = (void *)sub_247205FC8();
        objc_msgSend(v60, sel_didRecognizeTokens_nluResult_sessionUUID_, v69, v58, v86);
        swift_unknownObjectRelease();

LABEL_67:
        return;
      }
      goto LABEL_87;
    }
    ((void (*)(char *, void, uint64_t))v111)(v105, *MEMORY[0x263F70D88], v9);
    sub_2472060B8();
    sub_2472060B8();
    uint64_t v70 = v114;
    if (v120 == v118 && v121 == v119)
    {
      swift_bridgeObjectRelease_n();
      v110(v105, v9);
LABEL_51:
      int v67 = v55;
      uint64_t v82 = *(void **)(v116 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper);
      if ((objc_msgSend(v82, sel_respondsToSelector_, sel_didRecognizePackage_nluResult_sessionUUID_) & 1) == 0) {
        goto LABEL_87;
      }
      id v83 = v58;
      swift_unknownObjectRetain();
      id v84 = (void *)sub_247205FC8();
      objc_msgSend(v82, sel_didRecognizePackage_nluResult_sessionUUID_, v70, v83, v84);
      swift_unknownObjectRelease();

LABEL_53:
      return;
    }
    char v81 = sub_2472064A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v110(v105, v9);
    if (v81) {
      goto LABEL_51;
    }
    LODWORD(v109) = *MEMORY[0x263F70D90];
    v111(v103);
    sub_2472060B8();
    sub_2472060B8();
    if (v120 == v118 && v121 == v119)
    {
      swift_bridgeObjectRelease_n();
      v110(v103, v9);
    }
    else
    {
      char v91 = sub_2472064A8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v110(v103, v9);
      uint64_t v70 = v114;
      if ((v91 & 1) == 0)
      {
LABEL_77:
        uint64_t v94 = v101;
        ((void (*)(char *, void, uint64_t))v111)(v101, v109, v9);
        sub_2472060B8();
        sub_2472060B8();
        if (v120 == v118 && v121 == v119)
        {
          swift_bridgeObjectRelease_n();
          v110(v94, v9);
        }
        else
        {
          char v96 = sub_2472064A8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v110(v94, v9);
          if ((v96 & 1) == 0) {
            goto LABEL_88;
          }
        }
        if (v102) {
          goto LABEL_88;
        }
        goto LABEL_84;
      }
    }
    if (v102)
    {
      if (v70)
      {
        unint64_t v92 = *(void **)(v116 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper);
        if (objc_msgSend(v92, sel_respondsToSelector_, sel_didRecognizeVoiceCommandCandidatePackage_nluResult_sessionUUID_))
        {
          id v62 = v70;
          id v63 = v58;
          swift_unknownObjectRetain();
          uint64_t v64 = v55;
          id v55 = (id)sub_247205FC8();
          objc_msgSend(v92, sel_didRecognizeVoiceCommandCandidatePackage_nluResult_sessionUUID_, v62, v63, v55);
          goto LABEL_26;
        }
      }
      goto LABEL_88;
    }
    goto LABEL_77;
  }
LABEL_45:
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v76 = sub_247205EA8();
  __swift_project_value_buffer(v76, (uint64_t)qword_26B128910);
  swift_bridgeObjectRetain_n();
  uint64_t v77 = sub_247205E98();
  os_log_type_t v78 = sub_247206188();
  if (os_log_type_enabled(v77, v78))
  {
    uint64_t v79 = (uint8_t *)swift_slowAlloc();
    uint64_t v80 = swift_slowAlloc();
    uint64_t v120 = v80;
    *(_DWORD *)uint64_t v79 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v118 = sub_2471F3F68(v115, v43, &v120);
    sub_2472062B8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2471B4000, v77, v78, "Failed to create DictationAsrResultMessage for requestId: %s", v79, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v80, -1, -1);
    MEMORY[0x24C54D9C0](v79, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_2471EAB28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  id v30 = a6;
  id v31 = a7;
  v29[1] = a3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269241490);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *MEMORY[0x263F709E0];
  uint64_t v18 = sub_247205A38();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 104))(v16, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  sub_247204FF8();
  swift_bridgeObjectRetain();
  sub_247204FC8();
  uint64_t v20 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v21 = sub_247204938();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v13, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v13, 0, 1, v21);
  sub_247205018();
  swift_bridgeObjectRetain();
  sub_247205008();
  uint64_t v23 = *MEMORY[0x263F70D98];
  uint64_t v24 = sub_247205AF8();
  uint64_t v25 = *(void *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 104))(v10, v23, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v10, 0, 1, v24);
  sub_247204FB8();
  swift_bridgeObjectRetain();
  sub_247204FD8();
  id v26 = v30;
  sub_247204FE8();
  id v27 = v31;
  return sub_247204FA8();
}

uint64_t sub_2471EAE6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, unsigned int *a7)
{
  id v31 = a7;
  id v32 = a6;
  v30[1] = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269241490);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *MEMORY[0x263F709E0];
  uint64_t v19 = sub_247205A38();
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 104))(v17, v18, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  sub_247204FF8();
  swift_bridgeObjectRetain();
  sub_247204FC8();
  uint64_t v21 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v22 = sub_247204938();
  uint64_t v23 = *(void *)(v22 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v14, v21, v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v14, 0, 1, v22);
  sub_247205018();
  swift_bridgeObjectRetain();
  sub_247205008();
  uint64_t v24 = *v31;
  uint64_t v25 = sub_247205AF8();
  uint64_t v26 = *(void *)(v25 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 104))(v11, v24, v25);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v11, 0, 1, v25);
  sub_247204FB8();
  id v27 = a5;
  sub_247204FE8();
  id v28 = v32;
  return sub_247204FA8();
}

void sub_2471EB19C()
{
}

id sub_2471EB1AC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DictationSpeechRecognizerResponseHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2471EB1F4()
{
  return type metadata accessor for DictationSpeechRecognizerResponseHandler();
}

uint64_t type metadata accessor for DictationSpeechRecognizerResponseHandler()
{
  uint64_t result = qword_269241478;
  if (!qword_269241478) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2471EB248()
{
  return swift_updateClassMetadata2();
}

unint64_t sub_2471EB290()
{
  unint64_t result = qword_269241488;
  if (!qword_269241488)
  {
    sub_247205AF8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269241488);
  }
  return result;
}

uint64_t sub_2471EB2E8(uint64_t a1)
{
  return sub_2471EB340(a1, MEMORY[0x263F70D90]);
}

unint64_t sub_2471EB2F4()
{
  unint64_t result = qword_26B128638;
  if (!qword_26B128638)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B128638);
  }
  return result;
}

uint64_t sub_2471EB334(uint64_t a1)
{
  return sub_2471EB340(a1, MEMORY[0x263F70D88]);
}

uint64_t sub_2471EB340(uint64_t a1, unsigned int *a2)
{
  return sub_2471EAE6C(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void **)(v2 + 40), *(void **)(v2 + 48), a2);
}

uint64_t sub_2471EB368(uint64_t a1)
{
  return sub_2471EAB28(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void **)(v1 + 48), *(void **)(v1 + 56));
}

id sub_2471EB378(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v32 = a5;
  uint64_t v33 = a7;
  uint64_t v30 = a3;
  uint64_t v31 = a4;
  uint64_t v13 = sub_247204938();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v8[OBJC_IVAR____TtC9ASRBridge40DictationSpeechRecognizerResponseHandler_dictationOptions] = a8;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  id v34 = a1;
  v17(v16, (uint64_t)a1, v13);
  uint64_t v35 = a6;
  sub_2471CA8E4(a6, (uint64_t)v37);
  uint64_t v18 = qword_26B128368;
  id v19 = a8;
  if (v18 != -1) {
    swift_once();
  }
  uint64_t v20 = qword_26B128770;
  v17(&v8[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId], (uint64_t)v16, v13);
  uint64_t v21 = &v8[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_assistantId];
  uint64_t v22 = v30;
  *(void *)uint64_t v21 = a2;
  *((void *)v21 + 1) = v22;
  uint64_t v23 = &v8[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
  uint64_t v24 = v32;
  *(void *)uint64_t v23 = v31;
  *((void *)v23 + 1) = v24;
  sub_2471CA8E4((uint64_t)v37, (uint64_t)&v8[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher]);
  *(void *)&v8[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper] = v33;
  *(void *)&v8[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_instrumentationUtil] = v20;
  uint64_t v25 = (objc_class *)type metadata accessor for SpeechRecognizerResponseHandler();
  v36.receiver = v8;
  v36.super_class = v25;
  swift_retain();
  id v26 = objc_msgSendSuper2(&v36, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  id v27 = *(void (**)(char *, uint64_t))(v14 + 8);
  v27(v16, v13);
  __swift_destroy_boxed_opaque_existential_1(v35);
  v27(v34, v13);
  return v26;
}

void sub_2471EB5C8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_247205AF8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_247205EA8();
  os_log_t v28 = (os_log_t)__swift_project_value_buffer(v12, (uint64_t)qword_26B128910);
  uint64_t v13 = sub_247205E98();
  os_log_type_t v14 = sub_247206178();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = v9;
    uint64_t v16 = v8;
    uint64_t v17 = a1;
    unint64_t v18 = a2;
    uint64_t v19 = v4;
    uint64_t v20 = a3;
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_2471B4000, v13, v14, "Received partial result tokens for dictation request", v21, 2u);
    uint64_t v22 = v21;
    a3 = v20;
    uint64_t v4 = v19;
    a2 = v18;
    a1 = v17;
    uint64_t v8 = v16;
    uint64_t v9 = v15;
    MEMORY[0x24C54D9C0](v22, -1, -1);
  }

  BOOL v23 = *(void *)(v4 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId) == a1
     && *(void *)(v4 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8) == a2;
  if (v23 || (sub_2472064A8() & 1) != 0)
  {
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F70D98], v8);
    sub_2471E9930((uint64_t)v11, a1, a2, a3, 0, 0, 0);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    os_log_t v28 = (os_log_t)sub_247205E98();
    os_log_type_t v24 = sub_247206188();
    if (os_log_type_enabled(v28, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_2471B4000, v28, v24, "Response requestId does not match current requestId", v25, 2u);
      MEMORY[0x24C54D9C0](v25, -1, -1);
    }
    os_log_t v26 = v28;
  }
}

void sub_2471EB8B4(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_247205AF8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  os_log_t v35 = (os_log_t)((char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_247205EA8();
  uint64_t v34 = __swift_project_value_buffer(v13, (uint64_t)qword_26B128910);
  os_log_type_t v14 = sub_247205E98();
  os_log_type_t v15 = sub_247206178();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = a1;
    uint64_t v17 = v11;
    uint64_t v18 = v10;
    unint64_t v19 = a2;
    uint64_t v20 = a3;
    uint64_t v21 = v5;
    uint64_t v22 = a4;
    BOOL v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v23 = 0;
    _os_log_impl(&dword_2471B4000, v14, v15, "Received partial result package for dictation request", v23, 2u);
    os_log_type_t v24 = v23;
    a4 = v22;
    uint64_t v5 = v21;
    a3 = v20;
    a2 = v19;
    uint64_t v10 = v18;
    uint64_t v11 = v17;
    a1 = v16;
    MEMORY[0x24C54D9C0](v24, -1, -1);
  }

  BOOL v25 = *(void *)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId) == a1
     && *(void *)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8) == a2;
  if (v25 || (sub_2472064A8() & 1) != 0)
  {
    os_log_t v26 = v35;
    (*(void (**)(os_log_t, void, uint64_t))(v11 + 104))(v35, *MEMORY[0x263F70D98], v10);
    id v27 = objc_msgSend(a3, sel_recognition);
    if (v27)
    {
      os_log_t v28 = v27;
      id v29 = objc_msgSend(v27, sel_oneBestTokenList);

      if (v29)
      {
        sub_2471EB2F4();
        uint64_t v30 = sub_2472060E8();
      }
      else
      {
        uint64_t v30 = 0;
      }
      sub_2471E9930((uint64_t)v26, a1, a2, v30, a3, a4, 0);
      swift_bridgeObjectRelease();
      (*(void (**)(os_log_t, uint64_t))(v11 + 8))(v26, v10);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    os_log_t v35 = (os_log_t)sub_247205E98();
    os_log_type_t v31 = sub_247206188();
    if (os_log_type_enabled(v35, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_2471B4000, v35, v31, "Response requestId does not match current requestId", v32, 2u);
      MEMORY[0x24C54D9C0](v32, -1, -1);
    }
    os_log_t v33 = v35;
  }
}

void sub_2471EBC24(NSObject *a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  os_log_t v30 = a1;
  uint64_t v9 = sub_247205AF8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_247205EA8();
  uint64_t v29 = __swift_project_value_buffer(v13, (uint64_t)qword_26B128910);
  os_log_type_t v14 = sub_247205E98();
  os_log_type_t v15 = sub_247206178();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = v10;
    uint64_t v17 = v9;
    unint64_t v18 = a2;
    uint64_t v19 = a3;
    uint64_t v20 = v5;
    uint64_t v21 = a4;
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl(&dword_2471B4000, v14, v15, "Received partial result for dictation request with metadata", v22, 2u);
    BOOL v23 = v22;
    a4 = v21;
    uint64_t v5 = v20;
    a3 = v19;
    a2 = v18;
    uint64_t v9 = v17;
    uint64_t v10 = v16;
    MEMORY[0x24C54D9C0](v23, -1, -1);
  }

  os_log_t v24 = v30;
  BOOL v25 = *(os_log_t *)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId) == v30
     && *(void *)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8) == a2;
  if (v25 || (sub_2472064A8() & 1) != 0)
  {
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F70D98], v9);
    sub_2471E9930((uint64_t)v12, (uint64_t)v24, a2, a3, 0, a4, 0);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    os_log_t v30 = (os_log_t)sub_247205E98();
    os_log_type_t v26 = sub_247206188();
    if (os_log_type_enabled(v30, v26))
    {
      id v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v27 = 0;
      _os_log_impl(&dword_2471B4000, v30, v26, "Response requestId does not match current requestId", v27, 2u);
      MEMORY[0x24C54D9C0](v27, -1, -1);
    }
    os_log_t v28 = v30;
  }
}

void sub_2471EBF18(uint64_t a1, unint64_t a2, void *a3, unsigned int *a4)
{
  uint64_t v9 = sub_247205AF8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v13 = *(void *)(v4 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId) == a1
     && *(void *)(v4 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8) == a2;
  if (v13 || (sub_2472064A8() & 1) != 0)
  {
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *a4, v9);
    sub_2471E9930((uint64_t)v12, a1, a2, 0, a3, 0, 0);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_247205EA8();
    __swift_project_value_buffer(v14, (uint64_t)qword_26B128910);
    os_log_t v19 = (os_log_t)sub_247205E98();
    os_log_type_t v15 = sub_247206188();
    if (os_log_type_enabled(v19, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_2471B4000, v19, v15, "Response requestId does not match current requestId", v16, 2u);
      MEMORY[0x24C54D9C0](v16, -1, -1);
    }
    os_log_t v17 = v19;
  }
}

void sub_2471EC148(uint64_t a1, unint64_t a2, void *a3, void *a4, unsigned int *a5, char a6)
{
  uint64_t v13 = sub_247205AF8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v17 = *(void *)(v6 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId) == a1
     && *(void *)(v6 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8) == a2;
  if (v17 || (sub_2472064A8() & 1) != 0)
  {
    (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *a5, v13);
    sub_2471E9930((uint64_t)v16, a1, a2, 0, a3, a4, a6 & 1);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  else
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_247205EA8();
    __swift_project_value_buffer(v18, (uint64_t)qword_26B128910);
    os_log_t v23 = (os_log_t)sub_247205E98();
    os_log_type_t v19 = sub_247206188();
    if (os_log_type_enabled(v23, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_2471B4000, v23, v19, "Response requestId does not match current requestId", v20, 2u);
      MEMORY[0x24C54D9C0](v20, -1, -1);
    }
    os_log_t v21 = v23;
  }
}

void sub_2471EC38C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3
    && ((uint64_t v5 = v4, *(void *)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId) == a2)
      ? (BOOL v8 = *(void *)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8) == a3)
      : (BOOL v8 = 0),
        v8 || (sub_2472064A8() & 1) != 0))
  {
    uint64_t v31 = a1;
    if (qword_26B128578 != -1) {
      swift_once();
    }
    os_log_t v33 = a4;
    uint64_t v9 = sub_247205EA8();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B128910);
    uint64_t v10 = sub_247205E98();
    os_log_type_t v11 = sub_247206178();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_2471B4000, v10, v11, "Completed local dictation recognition", v12, 2u);
      MEMORY[0x24C54D9C0](v12, -1, -1);
    }

    MEMORY[0x270FA5388](v13);
    id v14 = objc_allocWithZone((Class)sub_247205178());
    uint64_t v15 = sub_247205168();
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      __swift_project_boxed_opaque_existential_1((void *)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher), *(void *)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24));
      sub_247205A18();
      BOOL v17 = v33;
      if (!v33) {
        goto LABEL_16;
      }
      uint64_t v18 = (void *)sub_2472048A8();
      uint64_t v19 = (uint64_t)objc_msgSend(v18, sel_code);
      if (v19 < (uint64_t)0xFFFFFFFF80000000)
      {
        __break(1u);
      }
      else if (v19 <= 0x7FFFFFFF)
      {
        sub_2471CB5D8(v19);

LABEL_16:
        uint64_t v20 = *(void **)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper);
        if (objc_msgSend(v20, sel_respondsToSelector_, sel_didCompleteRecognitionWithError_secureOfflineOnlyRecognition_sessionUUID_statistics_, v31))
        {
          os_log_t v21 = *(void **)(v5 + OBJC_IVAR____TtC9ASRBridge40DictationSpeechRecognizerResponseHandler_dictationOptions);
          swift_unknownObjectRetain();
          id v22 = objc_msgSend(v21, sel_secureOfflineOnly);
          if (v33) {
            BOOL v17 = (void *)sub_2472048A8();
          }
          os_log_t v23 = v32;
          os_log_t v24 = (void *)sub_247205FC8();
          if (v32) {
            os_log_t v23 = (void *)sub_247205F58();
          }
          objc_msgSend(v20, sel_didCompleteRecognitionWithError_secureOfflineOnlyRecognition_sessionUUID_statistics_, v17, v22, v24, v23);

          swift_unknownObjectRelease();
        }
        else
        {
        }
        return;
      }
      __break(1u);
      return;
    }
    os_log_t v28 = sub_247205E98();
    os_log_type_t v29 = sub_247206188();
    if (os_log_type_enabled(v28, v29))
    {
      os_log_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_t v30 = 0;
      _os_log_impl(&dword_2471B4000, v28, v29, "Could not create EndDictationRequestMessage msg", v30, 2u);
      MEMORY[0x24C54D9C0](v30, -1, -1);
    }
  }
  else
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_247205EA8();
    __swift_project_value_buffer(v25, (uint64_t)qword_26B128910);
    uint64_t v34 = sub_247205E98();
    os_log_type_t v26 = sub_247206188();
    if (os_log_type_enabled(v34, v26))
    {
      id v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v27 = 0;
      _os_log_impl(&dword_2471B4000, v34, v26, "Response requestId does not match current requestId", v27, 2u);
      MEMORY[0x24C54D9C0](v27, -1, -1);
    }
  }
}

uint64_t sub_2471EC80C(uint64_t a1)
{
  return sub_2471E9608(a1, *(void *)(v1 + 16));
}

unint64_t sub_2471EC818(uint64_t a1)
{
  return sub_2471EC83C(a1, &qword_2692414D8);
}

unint64_t sub_2471EC824(uint64_t a1)
{
  return sub_2471EC83C(a1, &qword_269241500);
}

unint64_t sub_2471EC830(uint64_t a1)
{
  return sub_2471EC83C(a1, qword_26B1286E0);
}

unint64_t sub_2471EC83C(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_247206418();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    BOOL v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_2471FC8B8(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
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

unint64_t sub_2471EC954(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692414F0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692414F8);
  uint64_t v6 = sub_247206418();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2471F8A98(v12, (uint64_t)v5, &qword_2692414F0);
    unint64_t result = sub_2471FC930((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_247205B68();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_2471ECB48(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692414E0);
  uint64_t v2 = (void *)sub_247206418();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_2471FC8B8(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
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

unint64_t sub_2471ECC5C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B128598);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    char v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286D0);
  uint64_t v6 = sub_247206418();
  char v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  char v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v27[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2471F8A98(v12, (uint64_t)v5, &qword_26B128598);
    unint64_t result = sub_2471FCB1C((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for CacheKey();
    unint64_t result = sub_2471F8AFC((uint64_t)v5, v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16);
    uint64_t v19 = v7[7] + 56 * v16;
    char v20 = v9[16];
    uint64_t v21 = *((void *)v9 + 3);
    char v22 = v9[32];
    long long v23 = *(_OWORD *)(v9 + 40);
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v9;
    *(unsigned char *)(v19 + 16) = v20;
    *(void *)(v19 + 24) = v21;
    *(unsigned char *)(v19 + 32) = v22;
    *(_OWORD *)(v19 + 40) = v23;
    uint64_t v24 = v7[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_11;
    }
    v7[2] = v26;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_2471ECE64(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_247206418();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_2471FC8B8(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
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

BOOL sub_2471ECF8C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AsrBridge.__allocating_init(_:_:_:_:_:)(void *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  swift_allocObject();
  uint64_t v12 = sub_2471F78B4(a1, a2, a3, a4, a5, a6);
  swift_unknownObjectRelease();

  return v12;
}

uint64_t AsrBridge.init(_:_:_:_:_:)(void *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v7 = sub_2471F78B4(a1, a2, a3, a4, a5, a6);
  swift_unknownObjectRelease();

  return v7;
}

uint64_t sub_2471ED074(int a1)
{
  int v13 = a1;
  uint64_t v2 = sub_247205D58();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247204C18();
  sub_247205DC8();
  sub_247204B38();
  sub_247205DC8();
  sub_247205628();
  sub_247205DC8();
  sub_247205578();
  sub_247205DC8();
  sub_247205558();
  sub_247205DC8();
  sub_247205498();
  sub_247205DC8();
  sub_247205A68();
  sub_247205DC8();
  sub_247204B08();
  sub_247205DC8();
  sub_247205A58();
  sub_247205DC8();
  uint64_t v6 = *MEMORY[0x263F74440];
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v7(v5, v6, v2);
  sub_2472050C8();
  type metadata accessor for AsrRequestProcessor();
  sub_247205CA8();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v3 + 8);
  v8(v5, v2);
  v7(v5, v6, v2);
  sub_247205448();
  sub_247205CA8();
  v8(v5, v2);
  v7(v5, v6, v2);
  sub_247205488();
  sub_247205CA8();
  v8(v5, v2);
  v7(v5, v6, v2);
  sub_2472057D8();
  sub_247205CA8();
  v8(v5, v2);
  v7(v5, v6, v2);
  sub_2472055F8();
  sub_247205CA8();
  v8(v5, v2);
  uint64_t v9 = *MEMORY[0x263F74468];
  v7(v5, v9, v2);
  sub_247205A48();
  sub_247205CA8();
  v8(v5, v2);
  v7(v5, v9, v2);
  sub_2472055B8();
  sub_247205CA8();
  v8(v5, v2);
  v7(v5, v9, v2);
  sub_2472053A8();
  sub_247205CA8();
  v8(v5, v2);
  v7(v5, v9, v2);
  sub_247205408();
  sub_247205CA8();
  v8(v5, v2);
  v7(v5, v9, v2);
  sub_2472052F8();
  sub_247205CA8();
  v8(v5, v2);
  v7(v5, v9, v2);
  sub_247204B28();
  sub_247205CA8();
  v8(v5, v2);
  v7(v5, v9, v2);
  sub_247204B68();
  sub_247205CA8();
  v8(v5, v2);
  v7(v5, *MEMORY[0x263F74460], v2);
  sub_247204AC8();
  sub_247205CA8();
  v8(v5, v2);
  uint64_t v10 = *MEMORY[0x263F74450];
  v7(v5, v10, v2);
  sub_2472053B8();
  sub_247205CA8();
  v8(v5, v2);
  v7(v5, v10, v2);
  sub_247205588();
  sub_247205CA8();
  v8(v5, v2);
  v7(v5, v9, v2);
  sub_247205598();
  sub_247205CA8();
  v8(v5, v2);
  v7(v5, v9, v2);
  sub_247205568();
  sub_247205CA8();
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v8)(v5, v2);
  if (*(unsigned char *)(v1 + qword_26B128978) == 1)
  {
    v7(v5, v9, v2);
    sub_2472057A8();
    sub_247205CA8();
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v8)(v5, v2);
  }
  if (v13)
  {
    sub_2471CAE98(0, (unint64_t *)&unk_269241180);
    sub_247205DF8();
    sub_2471CAE98(0, &qword_2692414B8);
    sub_247205DF8();
    sub_2471CAE98(0, &qword_2692414B0);
    uint64_t result = sub_247205DF8();
    if (*(unsigned char *)(v1 + qword_26B128940) == 1)
    {
      sub_2471CAE98(0, (unint64_t *)&unk_2692414C0);
      sub_247205DF8();
      v7(v5, v9, v2);
      sub_247204F68();
      sub_247205CA8();
      return ((uint64_t (*)(char *, uint64_t))v8)(v5, v2);
    }
  }
  return result;
}

uint64_t (*sub_2471EDAC8())()
{
  return sub_2471F8A94;
}

uint64_t (*sub_2471EDB08())()
{
  return sub_2471F8A90;
}

uint64_t (*sub_2471EDB48())()
{
  return sub_2471F8A8C;
}

uint64_t (*sub_2471EDB88())()
{
  return sub_2471F8A88;
}

uint64_t (*sub_2471EDBC8())()
{
  return sub_2471F8A84;
}

uint64_t (*sub_2471EDC08())()
{
  return sub_2471F8A80;
}

uint64_t (*sub_2471EDC48())()
{
  return sub_2471F8A7C;
}

uint64_t (*sub_2471EDC88())()
{
  return sub_2471F8A78;
}

uint64_t (*sub_2471EDCC8())()
{
  return sub_2471F8A74;
}

void (*sub_2471EDD08())(void *a1)
{
  return sub_2471F89E0;
}

void (*sub_2471EDD48())(void *a1)
{
  return sub_2471F88EC;
}

void (*sub_2471EDD88())(void *)
{
  return sub_2471F88E8;
}

uint64_t (*sub_2471EDDC8())(void *)
{
  return sub_2471F88E4;
}

uint64_t (*sub_2471EDE08())(void *)
{
  return sub_2471F88E0;
}

void (*sub_2471EDE48())(void *)
{
  return sub_2471F88DC;
}

void (*sub_2471EDE88())(void *)
{
  return sub_2471F88D8;
}

void (*sub_2471EDEC8())(void *)
{
  return sub_2471F88D4;
}

void (*sub_2471EDF08())(void *)
{
  return sub_2471F88D0;
}

void (*sub_2471EDF48())(void *)
{
  return sub_2471F88CC;
}

void (*sub_2471EDF88())(void *)
{
  return sub_2471F88C8;
}

void (*sub_2471EDFC8())(void *)
{
  return sub_2471F88C4;
}

void (*sub_2471EE008())(void *)
{
  return sub_2471F88C0;
}

void (*sub_2471EE048())(void *)
{
  return sub_2471F88BC;
}

void (*sub_2471EE088())(void *)
{
  return sub_2471F88B8;
}

void (*sub_2471EE0C8())(void *)
{
  return sub_2471F88B4;
}

void sub_2471EE108()
{
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_247205EA8();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B128910);
  oslog = sub_247205E98();
  os_log_type_t v1 = sub_247206178();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_2471B4000, oslog, v1, "ASRBridge no-op for StartChildSpeechRequestMessage", v2, 2u);
    MEMORY[0x24C54D9C0](v2, -1, -1);
  }
}

void (*sub_2471EE1F0())()
{
  return sub_2471F88AC;
}

void (*sub_2471EE230())(void *)
{
  return sub_2471F8894;
}

uint64_t (*sub_2471EE270())()
{
  return sub_2471F88A8;
}

uint64_t (*sub_2471EE2B0())()
{
  return sub_2471F88A4;
}

uint64_t (*sub_2471EE2F0())()
{
  return sub_2471F88A0;
}

uint64_t (*sub_2471EE330())()
{
  return sub_2471F889C;
}

void (*sub_2471EE370())(void *)
{
  return sub_2471F8898;
}

uint64_t sub_2471EE3B0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v101 = a3;
  int v100 = a6;
  unint64_t v121 = a2;
  uint64_t v122 = a5;
  uint64_t v103 = a4;
  uint64_t v110 = a1;
  uint64_t v120 = sub_247205EA8();
  uint64_t v117 = *(void *)(v120 - 8);
  MEMORY[0x270FA5388](v120);
  uint64_t v115 = &v97[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C00);
  MEMORY[0x270FA5388](v8 - 8);
  unsigned int v108 = &v97[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v111 = sub_247205B68();
  uint64_t v109 = *(void *)(v111 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v111);
  int v102 = &v97[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  uint64_t v104 = &v97[-v12];
  uint64_t v13 = sub_247204938();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v116 = &v97[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v15);
  uint64_t v112 = &v97[-v17];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127BE8);
  uint64_t v19 = v18 - 8;
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = &v97[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  id v106 = &v97[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v118 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))&v97[-v26];
  MEMORY[0x270FA5388](v25);
  os_log_t v28 = &v97[-v27];
  uint64_t v119 = v6;
  uint64_t v29 = (uint64_t)&v6[qword_26B128960];
  swift_beginAccess();
  unint64_t v113 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v114 = v14 + 16;
  v113(v28, v122, v13);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v28, 0, 1, v13);
  uint64_t v30 = (uint64_t)&v21[*(int *)(v19 + 56)];
  uint64_t v105 = v29;
  uint64_t v31 = v29;
  uint64_t v32 = v13;
  sub_2471F8A98(v31, (uint64_t)v21, (uint64_t *)&unk_26B1282C0);
  sub_2471F8A98((uint64_t)v28, v30, (uint64_t *)&unk_26B1282C0);
  os_log_t v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  uint64_t v130 = v32;
  if (v33((uint64_t)v21, 1, v32) == 1)
  {
    sub_2471D10A4((uint64_t)v28, (uint64_t *)&unk_26B1282C0);
    if (v33(v30, 1, v130) == 1)
    {
      sub_2471D10A4((uint64_t)v21, (uint64_t *)&unk_26B1282C0);
      os_log_t v35 = v119;
      uint64_t v34 = v120;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  sub_2471F8A98((uint64_t)v21, (uint64_t)v118, (uint64_t *)&unk_26B1282C0);
  if (v33(v30, 1, v130) == 1)
  {
    sub_2471D10A4((uint64_t)v28, (uint64_t *)&unk_26B1282C0);
    (*(void (**)(unsigned int (*)(uint64_t, uint64_t, uint64_t), uint64_t))(v14 + 8))(v118, v130);
LABEL_6:
    unint64_t v107 = (void (**)(void, void))v14;
    sub_2471D10A4((uint64_t)v21, &qword_26B127BE8);
    uint64_t v34 = v120;
    uint64_t v37 = v116;
    uint64_t v36 = v117;
LABEL_14:
    uint64_t v118 = v33;
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v51 = __swift_project_value_buffer(v34, (uint64_t)qword_26B128910);
    uint64_t v52 = v115;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v36 + 16))(v115, v51, v34);
    v113(v37, v122, v130);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    id v53 = sub_247205E98();
    LODWORD(v122) = sub_247206188();
    if (os_log_type_enabled(v53, (os_log_type_t)v122))
    {
      uint64_t v34 = swift_slowAlloc();
      uint64_t v111 = swift_slowAlloc();
      v129[0] = v111;
      *(_DWORD *)uint64_t v34 = 136315650;
      uint64_t v54 = v106;
      sub_2471F8A98(v105, (uint64_t)v106, (uint64_t *)&unk_26B1282C0);
      if (v118((uint64_t)v54, 1, v130))
      {
        sub_2471D10A4((uint64_t)v54, (uint64_t *)&unk_26B1282C0);
        unint64_t v55 = 0xE300000000000000;
        uint64_t v56 = 7104878;
        unint64_t v57 = v107;
      }
      else
      {
        uint64_t v82 = v112;
        uint64_t v83 = v130;
        v113(v112, (uint64_t)v54, v130);
        sub_2471D10A4((uint64_t)v54, (uint64_t *)&unk_26B1282C0);
        uint64_t v56 = sub_2472048F8();
        unint64_t v55 = v84;
        unint64_t v57 = v107;
        ((void (**)(unsigned char *, uint64_t))v107)[1](v82, v83);
      }
      *(void *)&long long v127 = sub_2471F3F68(v56, v55, v129);
      sub_2472062B8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 12) = 2080;
      sub_2471F8958((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
      int v85 = v116;
      uint64_t v86 = v130;
      uint64_t v87 = sub_247206478();
      *(void *)&long long v127 = sub_2471F3F68(v87, v88, v129);
      sub_2472062B8();
      swift_bridgeObjectRelease();
      ((void (**)(unsigned char *, uint64_t))v57)[1](v85, v86);
      *(_WORD *)(v34 + 22) = 2080;
      unint64_t v89 = v121;
      swift_bridgeObjectRetain();
      *(void *)&long long v127 = sub_2471F3F68(v110, v89, v129);
      sub_2472062B8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2471B4000, v53, (os_log_type_t)v122, "Request does not belong to current session id: %s, request session id: %s for request id: %s", (uint8_t *)v34, 0x20u);
      uint64_t v90 = v111;
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v90, -1, -1);
      MEMORY[0x24C54D9C0](v34, -1, -1);

      (*(void (**)(unsigned char *, uint64_t))(v117 + 8))(v115, v120);
    }
    else
    {
      swift_release_n();
      ((void (**)(unsigned char *, uint64_t))v107)[1](v37, v130);

      swift_bridgeObjectRelease_n();
      (*(void (**)(unsigned char *, uint64_t))(v36 + 8))(v52, v34);
    }
    sub_2471F7DD0();
    swift_allocError();
    *char v91 = 0;
    goto LABEL_25;
  }
  os_log_type_t v38 = v112;
  uint64_t v39 = v30;
  uint64_t v40 = v130;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v14 + 32))(v112, v39, v130);
  sub_2471F8958((unint64_t *)&unk_26B1282A0, MEMORY[0x263F07508]);
  LODWORD(v99) = sub_247205FB8();
  unint64_t v107 = (void (**)(void, void))v14;
  uint64_t v41 = *(void (**)(unsigned int (*)(uint64_t, uint64_t, uint64_t), uint64_t))(v14 + 8);
  v41((unsigned int (*)(uint64_t, uint64_t, uint64_t))v38, v40);
  sub_2471D10A4((uint64_t)v28, (uint64_t *)&unk_26B1282C0);
  v41(v118, v40);
  sub_2471D10A4((uint64_t)v21, (uint64_t *)&unk_26B1282C0);
  os_log_t v35 = v119;
  uint64_t v34 = v120;
  uint64_t v37 = v116;
  uint64_t v36 = v117;
  if ((v99 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_8:
  uint64_t v42 = &v35[qword_26B128988];
  swift_beginAccess();
  uint64_t v43 = (uint64_t)v42;
  uint64_t v44 = (uint64_t)v108;
  sub_2471F8A98(v43, (uint64_t)v108, &qword_26B127C00);
  uint64_t v45 = v109;
  uint64_t v46 = v111;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v109 + 48))(v44, 1, v111) == 1)
  {
    sub_2471D10A4(v44, &qword_26B127C00);
    if (qword_26B128578 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v34, (uint64_t)qword_26B128910);
    uint64_t v47 = sub_247205E98();
    os_log_type_t v48 = sub_247206188();
    uint64_t v34 = v48;
    if (os_log_type_enabled(v47, v48))
    {
      char v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v49 = 0;
      _os_log_impl(&dword_2471B4000, v47, (os_log_type_t)v34, "UserId has not been set for current session", v49, 2u);
      MEMORY[0x24C54D9C0](v49, -1, -1);
    }

    sub_2471F7DD0();
    swift_allocError();
    *uint64_t v50 = 1;
LABEL_25:
    swift_willThrow();
    return v34;
  }
  unint64_t v58 = v104;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v45 + 32))(v104, v44, v46);
  uint64_t v59 = (uint64_t)&v35[qword_26B128950];
  swift_beginAccess();
  sub_2471F8A98(v59, (uint64_t)&v127, &qword_26B128338);
  if (v128)
  {
    sub_2471CA8BC(&v127, (uint64_t)v129);
    v113(v112, v122, v130);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v45 + 16))(v102, v58, v46);
    swift_bridgeObjectRetain();
    uint64_t v60 = v121;
    swift_bridgeObjectRetain();
    uint64_t v130 = sub_247205E18();
    uint64_t v122 = v61;
    sub_247205DE8();
    uint64_t v120 = sub_247205DD8();
    sub_2471CA8E4((uint64_t)v129, (uint64_t)v126);
    __swift_project_boxed_opaque_existential_1(v129, v129[3]);
    sub_247205B18();
    sub_2471CA8E4((uint64_t)&v35[qword_26B1285B0], (uint64_t)v124);
    uint64_t v119 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x263F525A8]), sel_initWithDelegate_, 0);
    id v62 = *(void (***)(void, void))&v35[qword_26B128958];
    uint64_t v63 = *(void *)&v35[qword_26B1285C8];
    uint64_t v105 = *(void *)&v35[qword_26B1285C0];
    uint64_t v64 = *(void *)&v35[qword_26B128968 + 8];
    uint64_t v117 = *(void *)&v35[qword_26B128968];
    uint64_t v114 = v64;
    id v106 = *(unsigned char **)&v35[qword_26B128938];
    unint64_t v107 = v62;
    LODWORD(v116) = v35[qword_26B128948];
    LODWORD(v115) = v35[qword_26B128940];
    LODWORD(v113) = v35[qword_26B1285B8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v118 = v62;
    swift_retain();
    swift_retain();
    _s9ASRBridge9AsrBridgeC27configuredMaxEagerRCAllowedSivgZ_0();
    uint64_t v99 = v65;
    uint64_t v66 = self;
    unsigned int v98 = objc_msgSend(v66, sel_isIdentityScoreConsumptionEnabled);
    unsigned __int8 v67 = objc_msgSend(v66, sel_isIdentityBridgeInstrumentationEnabled);
    uint64_t v68 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v124, v124[3]);
    unsigned int v108 = v97;
    MEMORY[0x270FA5388](v68);
    uint64_t v70 = (uint64_t *)&v97[-((v69 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(uint64_t *))(v71 + 16))(v70);
    uint64_t v72 = v45;
    uint64_t v73 = *v70;
    uint64_t v74 = type metadata accessor for MyriadDecisionMonitor();
    v123[3] = v74;
    v123[4] = &off_26FB63E00;
    v123[0] = v73;
    type metadata accessor for AsrRequestProcessor();
    uint64_t v75 = swift_allocObject();
    uint64_t v76 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v123, v74);
    MEMORY[0x270FA5388](v76);
    os_log_type_t v78 = (uint64_t *)&v97[-((v77 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(uint64_t *))(v79 + 16))(v78);
    uint64_t v80 = *v78;
    char v81 = v119;
    uint64_t v34 = sub_2471F7E24(v101, v103, (uint64_t)v112, v110, v60, (uint64_t)v102, v130, v122, (uint64_t)&v127, v120, (uint64_t)v126, (uint64_t)&v125, v80, v119, v107, v63, v105, v117, v114,
            v100 & 1,
            (uint64_t)v106,
            (char)v116,
            v115,
            v113,
            v99,
            v98,
            v67,
            v75);

    swift_release();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v123);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v124);
    (*(void (**)(unsigned char *, uint64_t))(v72 + 8))(v104, v111);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v129);
  }
  else
  {
    sub_2471D10A4((uint64_t)&v127, &qword_26B128338);
    if (qword_26B128578 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v34, (uint64_t)qword_26B128910);
    unsigned int v93 = sub_247205E98();
    os_log_type_t v94 = sub_247206188();
    uint64_t v34 = v94;
    if (os_log_type_enabled(v93, v94))
    {
      char v95 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v95 = 0;
      _os_log_impl(&dword_2471B4000, v93, (os_log_type_t)v34, "Unable to find SessionState to pass to AsrRequestProcessor", v95, 2u);
      MEMORY[0x24C54D9C0](v95, -1, -1);
    }

    sub_2471F7DD0();
    swift_allocError();
    *char v96 = 2;
    swift_willThrow();
    (*(void (**)(unsigned char *, uint64_t))(v45 + 8))(v58, v46);
  }
  return v34;
}

uint64_t sub_2471EF44C(void *a1)
{
  uint64_t v2 = sub_247205EA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C00);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v54 = (void (*)(char *, uint64_t))((char *)v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_247204938();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v59 = v5;
  uint64_t v15 = __swift_project_value_buffer(v2, (uint64_t)qword_26B128910);
  id v16 = a1;
  uint64_t v55 = v15;
  uint64_t v17 = sub_247205E98();
  os_log_type_t v18 = sub_247206178();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v60 = v11;
  uint64_t v61 = v12;
  uint64_t v57 = v3;
  uint64_t v58 = v2;
  if (v19)
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    v63[0] = v21;
    *(_DWORD *)uint64_t v20 = 136315138;
    v53[1] = v20 + 4;
    sub_247205A08();
    sub_2471F8958((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
    uint64_t v22 = sub_247206478();
    unint64_t v24 = v23;
    (*(void (**)(char *, uint64_t))(v61 + 8))(v14, v60);
    v62[0] = sub_2471F3F68(v22, v24, v63);
    uint64_t v11 = v60;
    sub_2472062B8();

    uint64_t v3 = v57;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v17, v18, "handling session started for session id: %s", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v25 = v21;
    uint64_t v2 = v58;
    MEMORY[0x24C54D9C0](v25, -1, -1);
    uint64_t v26 = v20;
    uint64_t v12 = v61;
    MEMORY[0x24C54D9C0](v26, -1, -1);
  }
  else
  {
  }
  sub_247205A08();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  uint64_t v27 = v56;
  uint64_t v28 = v56 + qword_26B128960;
  swift_beginAccess();
  sub_2471F88F4((uint64_t)v10, v28, (uint64_t *)&unk_26B1282C0);
  swift_endAccess();
  uint64_t v29 = (uint64_t)v54;
  sub_247204C08();
  uint64_t v30 = sub_247205B68();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 0, 1, v30);
  uint64_t v31 = v27 + qword_26B128988;
  swift_beginAccess();
  sub_2471F88F4(v29, v31, &qword_26B127C00);
  swift_endAccess();
  sub_247205E08();
  __swift_project_boxed_opaque_existential_1(v63, v64);
  sub_247205A08();
  uint64_t v32 = v61;
  sub_247205B38();
  uint64_t v34 = *(void (**)(char *, uint64_t))(v32 + 8);
  uint64_t v33 = v32 + 8;
  uint64_t v54 = v34;
  v34(v14, v11);
  uint64_t v35 = v27 + qword_26B128950;
  swift_beginAccess();
  sub_2471F88F4((uint64_t)v62, v35, &qword_26B128338);
  swift_endAccess();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
  if (*(unsigned char *)(v27 + qword_26B1285B8) == 1)
  {
    sub_247205A08();
    uint64_t v36 = sub_247205A28();
    sub_2471F3A9C((uint64_t)v14, v36, v37);
    swift_bridgeObjectRelease();
    v54(v14, v60);
  }
  uint64_t v61 = v33;
  os_log_type_t v38 = v59;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v59, v55, v2);
  id v39 = v16;
  swift_retain_n();
  id v40 = v39;
  uint64_t v41 = sub_247205E98();
  os_log_type_t v42 = sub_247206178();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = swift_slowAlloc();
    uint64_t v55 = swift_slowAlloc();
    v62[0] = v55;
    *(_DWORD *)uint64_t v43 = 136315394;
    sub_2471F8A98(v35, (uint64_t)v63, &qword_26B128338);
    uint64_t v44 = v64;
    sub_2471D10A4((uint64_t)v63, &qword_26B128338);
    if (v44) {
      uint64_t v45 = 0;
    }
    else {
      uint64_t v45 = 544501582;
    }
    if (v44) {
      unint64_t v46 = 0xE000000000000000;
    }
    else {
      unint64_t v46 = 0xE400000000000000;
    }
    v63[0] = sub_2471F3F68(v45, v46, v62);
    sub_2472062B8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2080;
    sub_247205A08();
    sub_2471F8958((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
    uint64_t v47 = v60;
    uint64_t v48 = sub_247206478();
    unint64_t v50 = v49;
    v54(v14, v47);
    v63[0] = sub_2471F3F68(v48, v50, v62);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v41, v42, "%sFound session state for session id %s", (uint8_t *)v43, 0x16u);
    uint64_t v51 = v55;
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v51, -1, -1);
    MEMORY[0x24C54D9C0](v43, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v59, v58);
  }
  else
  {

    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v38, v2);
  }
}

void sub_2471EFCA4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C00);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v64 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_247204938();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v66 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127BE8);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v63 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v60 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v60 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v60 - v21;
  uint64_t v65 = v1;
  uint64_t v23 = v1 + qword_26B128960;
  swift_beginAccess();
  uint64_t v62 = v23;
  sub_2471F8A98(v23, (uint64_t)v22, (uint64_t *)&unk_26B1282C0);
  id v67 = a1;
  sub_247205A08();
  uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v61(v20, 0, 1, v5);
  uint64_t v24 = (uint64_t)&v11[*(int *)(v9 + 56)];
  sub_2471F8A98((uint64_t)v22, (uint64_t)v11, (uint64_t *)&unk_26B1282C0);
  sub_2471F8A98((uint64_t)v20, v24, (uint64_t *)&unk_26B1282C0);
  uint64_t v68 = v6;
  uint64_t v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v25((uint64_t)v11, 1, v5) == 1)
  {
    sub_2471D10A4((uint64_t)v20, (uint64_t *)&unk_26B1282C0);
    sub_2471D10A4((uint64_t)v22, (uint64_t *)&unk_26B1282C0);
    if (v25(v24, 1, v5) == 1)
    {
      sub_2471D10A4((uint64_t)v11, (uint64_t *)&unk_26B1282C0);
LABEL_8:
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_247205EA8();
      __swift_project_value_buffer(v30, (uint64_t)qword_26B128910);
      uint64_t v31 = sub_247205E98();
      os_log_type_t v32 = sub_247206178();
      BOOL v33 = os_log_type_enabled(v31, v32);
      uint64_t v34 = v65;
      if (v33)
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl(&dword_2471B4000, v31, v32, "setting sessionId and sessionState to nil", v35, 2u);
        MEMORY[0x24C54D9C0](v35, -1, -1);
      }

      uint64_t v36 = (uint64_t)v63;
      v61(v63, 1, 1, v5);
      uint64_t v37 = v62;
      swift_beginAccess();
      sub_2471F88F4(v36, v37, (uint64_t *)&unk_26B1282C0);
      swift_endAccess();
      uint64_t v71 = 0;
      memset(v70, 0, sizeof(v70));
      uint64_t v38 = v34 + qword_26B128950;
      swift_beginAccess();
      sub_2471F88F4((uint64_t)v70, v38, &qword_26B128338);
      swift_endAccess();
      uint64_t v39 = sub_247205B68();
      uint64_t v40 = (uint64_t)v64;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v64, 1, 1, v39);
      uint64_t v41 = v34 + qword_26B128988;
      swift_beginAccess();
      sub_2471F88F4(v40, v41, &qword_26B127C00);
      swift_endAccess();
      sub_2471ECE64(MEMORY[0x263F8EE78], &qword_2692414D0);
      sub_247205C88();
      if (*(unsigned char *)(v34 + qword_26B1285B8) == 1)
      {
        uint64_t v42 = sub_247205A28();
        uint64_t v44 = v43;
        uint64_t v45 = (uint64_t)v66;
        sub_247205A08();
        sub_2471FB6E4(v42, v44, v45);
        uint64_t v46 = qword_26B128958;
        objc_msgSend(*(id *)(v34 + qword_26B128958), sel_invalidate);
        uint64_t v47 = *(void **)(v34 + v46);
        *(void *)(v34 + v46) = 0;

        uint64_t v48 = *(void **)(v34 + qword_26B128980);
        *(void *)(v34 + qword_26B128980) = 0;
        swift_bridgeObjectRelease();

        (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v45, v5);
      }
      return;
    }
    goto LABEL_6;
  }
  sub_2471F8A98((uint64_t)v11, (uint64_t)v17, (uint64_t *)&unk_26B1282C0);
  if (v25(v24, 1, v5) == 1)
  {
    sub_2471D10A4((uint64_t)v20, (uint64_t *)&unk_26B1282C0);
    sub_2471D10A4((uint64_t)v22, (uint64_t *)&unk_26B1282C0);
    (*(void (**)(char *, uint64_t))(v68 + 8))(v17, v5);
LABEL_6:
    sub_2471D10A4((uint64_t)v11, &qword_26B127BE8);
    goto LABEL_14;
  }
  uint64_t v26 = v68;
  uint64_t v27 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v68 + 32))(v66, v24, v5);
  sub_2471F8958((unint64_t *)&unk_26B1282A0, MEMORY[0x263F07508]);
  char v28 = sub_247205FB8();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v26 + 8);
  v29(v27, v5);
  sub_2471D10A4((uint64_t)v20, (uint64_t *)&unk_26B1282C0);
  sub_2471D10A4((uint64_t)v22, (uint64_t *)&unk_26B1282C0);
  v29(v17, v5);
  sub_2471D10A4((uint64_t)v11, (uint64_t *)&unk_26B1282C0);
  if (v28) {
    goto LABEL_8;
  }
LABEL_14:
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v49 = sub_247205EA8();
  __swift_project_value_buffer(v49, (uint64_t)qword_26B128910);
  id v50 = v67;
  uint64_t v51 = sub_247205E98();
  os_log_type_t v52 = sub_247206188();
  if (os_log_type_enabled(v51, v52))
  {
    id v53 = (uint8_t *)swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    *(void *)&v70[0] = v54;
    *(_DWORD *)id v53 = 136315138;
    uint64_t v55 = v66;
    sub_247205A08();
    sub_2471F8958((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
    uint64_t v56 = sub_247206478();
    uint64_t v57 = v5;
    unint64_t v59 = v58;
    (*(void (**)(char *, uint64_t))(v68 + 8))(v55, v57);
    uint64_t v69 = sub_2471F3F68(v56, v59, (uint64_t *)v70);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v51, v52, "SessionId: %s is not the current session, ignoring", v53, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v54, -1, -1);
    MEMORY[0x24C54D9C0](v53, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_2471F059C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C00);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v39 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_247204938();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_247205EA8();
  __swift_project_value_buffer(v13, (uint64_t)qword_26B128910);
  id v14 = a1;
  uint64_t v15 = sub_247205E98();
  os_log_type_t v16 = sub_247206178();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v38 = v10;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v36 = swift_slowAlloc();
    v41[0] = v36;
    uint64_t v37 = v2;
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v35 = v18 + 4;
    sub_247205A08();
    sub_2471F8958((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
    uint64_t v19 = sub_247206478();
    uint64_t v20 = v9;
    unint64_t v22 = v21;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v20);
    v40[0] = sub_2471F3F68(v19, v22, v41);
    uint64_t v2 = v37;
    sub_2472062B8();

    uint64_t v9 = v20;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v15, v16, "Handling StartSpeechDictationSession for sessionId: %s", v18, 0xCu);
    uint64_t v23 = v36;
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v23, -1, -1);
    uint64_t v24 = v18;
    uint64_t v10 = v38;
    MEMORY[0x24C54D9C0](v24, -1, -1);
  }
  else
  {
  }
  sub_247205A08();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  uint64_t v25 = v10;
  uint64_t v26 = v2 + qword_26B128960;
  swift_beginAccess();
  sub_2471F88F4((uint64_t)v8, v26, (uint64_t *)&unk_26B1282C0);
  swift_endAccess();
  sub_247205E08();
  __swift_project_boxed_opaque_existential_1(v41, v41[3]);
  sub_247205A08();
  sub_247205B38();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v9);
  uint64_t v27 = v2 + qword_26B128950;
  swift_beginAccess();
  sub_2471F88F4((uint64_t)v40, v27, &qword_26B128338);
  swift_endAccess();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  uint64_t v28 = sub_247205608();
  uint64_t v29 = (uint64_t *)(v2 + qword_26B128968);
  *uint64_t v29 = v28;
  v29[1] = v30;
  swift_bridgeObjectRelease();
  uint64_t v31 = (uint64_t)v39;
  sub_247205618();
  uint64_t v32 = sub_247205B68();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v31, 0, 1, v32);
  uint64_t v33 = v2 + qword_26B128988;
  swift_beginAccess();
  sub_2471F88F4(v31, v33, &qword_26B127C00);
  return swift_endAccess();
}

void sub_2471F0AA8(void *a1)
{
  uint64_t v3 = sub_247204938();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v49 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127BE8);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v47 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v45 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v45 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v45 - v19;
  uint64_t v48 = v1;
  uint64_t v21 = v1 + qword_26B128960;
  swift_beginAccess();
  uint64_t v46 = v21;
  sub_2471F8A98(v21, (uint64_t)v20, (uint64_t *)&unk_26B1282C0);
  id v50 = a1;
  sub_247205A08();
  uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
  v45(v18, 0, 1, v3);
  uint64_t v22 = (uint64_t)&v9[*(int *)(v7 + 56)];
  sub_2471F8A98((uint64_t)v20, (uint64_t)v9, (uint64_t *)&unk_26B1282C0);
  sub_2471F8A98((uint64_t)v18, v22, (uint64_t *)&unk_26B1282C0);
  uint64_t v51 = v4;
  uint64_t v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v23((uint64_t)v9, 1, v3) == 1)
  {
    sub_2471D10A4((uint64_t)v18, (uint64_t *)&unk_26B1282C0);
    sub_2471D10A4((uint64_t)v20, (uint64_t *)&unk_26B1282C0);
    if (v23(v22, 1, v3) == 1)
    {
      sub_2471D10A4((uint64_t)v9, (uint64_t *)&unk_26B1282C0);
LABEL_8:
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v28 = sub_247205EA8();
      __swift_project_value_buffer(v28, (uint64_t)qword_26B128910);
      uint64_t v29 = sub_247205E98();
      os_log_type_t v30 = sub_247206178();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl(&dword_2471B4000, v29, v30, "Setting sessionId to nil", v31, 2u);
        MEMORY[0x24C54D9C0](v31, -1, -1);
      }

      uint64_t v32 = (uint64_t)v47;
      v45(v47, 1, 1, v3);
      uint64_t v33 = v46;
      swift_beginAccess();
      sub_2471F88F4(v32, v33, (uint64_t *)&unk_26B1282C0);
      swift_endAccess();
      uint64_t v34 = (void *)(v48 + qword_26B128968);
      void *v34 = 0;
      v34[1] = 0;
      swift_bridgeObjectRelease();
      return;
    }
    goto LABEL_6;
  }
  sub_2471F8A98((uint64_t)v9, (uint64_t)v15, (uint64_t *)&unk_26B1282C0);
  if (v23(v22, 1, v3) == 1)
  {
    sub_2471D10A4((uint64_t)v18, (uint64_t *)&unk_26B1282C0);
    sub_2471D10A4((uint64_t)v20, (uint64_t *)&unk_26B1282C0);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v3);
LABEL_6:
    sub_2471D10A4((uint64_t)v9, &qword_26B127BE8);
    goto LABEL_13;
  }
  uint64_t v24 = v51;
  uint64_t v25 = v49;
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 32))(v49, v22, v3);
  sub_2471F8958((unint64_t *)&unk_26B1282A0, MEMORY[0x263F07508]);
  char v26 = sub_247205FB8();
  uint64_t v27 = *(void (**)(char *, uint64_t))(v24 + 8);
  v27(v25, v3);
  sub_2471D10A4((uint64_t)v18, (uint64_t *)&unk_26B1282C0);
  sub_2471D10A4((uint64_t)v20, (uint64_t *)&unk_26B1282C0);
  v27(v15, v3);
  sub_2471D10A4((uint64_t)v9, (uint64_t *)&unk_26B1282C0);
  if (v26) {
    goto LABEL_8;
  }
LABEL_13:
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_247205EA8();
  __swift_project_value_buffer(v35, (uint64_t)qword_26B128910);
  id v36 = v50;
  uint64_t v37 = sub_247205E98();
  os_log_type_t v38 = sub_247206188();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    v52[0] = v40;
    *(_DWORD *)uint64_t v39 = 136315138;
    id v50 = v39 + 4;
    uint64_t v41 = v49;
    sub_247205A08();
    sub_2471F8958((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
    uint64_t v42 = sub_247206478();
    unint64_t v44 = v43;
    (*(void (**)(char *, uint64_t))(v51 + 8))(v41, v3);
    v52[3] = sub_2471F3F68(v42, v44, v52);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v37, v38, "SessionId: %s is not the current session, ignoring", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v40, -1, -1);
    MEMORY[0x24C54D9C0](v39, -1, -1);
  }
  else
  {
  }
}

void sub_2471F11E0(void *a1)
{
  uint64_t v3 = sub_247205EA8();
  uint64_t v93 = *(void *)(v3 - 8);
  uint64_t v94 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v92 = &v80[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_247205AD8();
  uint64_t v85 = *(void *)(v5 - 8);
  uint64_t v86 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  unint64_t v84 = &v80[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v83 = &v80[-v8];
  uint64_t v9 = sub_247204938();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v90 = &v80[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127BE8);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = &v80[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  unint64_t v89 = &v80[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = &v80[-v20];
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v24 = &v80[-v23];
  MEMORY[0x270FA5388](v22);
  char v26 = &v80[-v25];
  char v95 = v1;
  uint64_t v27 = (uint64_t)&v1[qword_26B128960];
  swift_beginAccess();
  uint64_t v88 = v27;
  sub_2471F8A98(v27, (uint64_t)v26, (uint64_t *)&unk_26B1282C0);
  uint64_t v87 = a1;
  sub_247205A08();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v24, 0, 1, v9);
  uint64_t v28 = (uint64_t)&v15[*(int *)(v13 + 56)];
  sub_2471F8A98((uint64_t)v26, (uint64_t)v15, (uint64_t *)&unk_26B1282C0);
  sub_2471F8A98((uint64_t)v24, v28, (uint64_t *)&unk_26B1282C0);
  uint64_t v91 = v10;
  uint64_t v29 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  if (v29(v15, 1, v9) != 1)
  {
    sub_2471F8A98((uint64_t)v15, (uint64_t)v21, (uint64_t *)&unk_26B1282C0);
    if (v29((unsigned char *)v28, 1, v9) != 1)
    {
      uint64_t v82 = v29;
      uint64_t v42 = v90;
      uint64_t v41 = v91;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v91 + 32))(v90, v28, v9);
      sub_2471F8958((unint64_t *)&unk_26B1282A0, MEMORY[0x263F07508]);
      int v81 = sub_247205FB8();
      unint64_t v43 = *(void (**)(unsigned char *, uint64_t))(v41 + 8);
      v43(v42, v9);
      sub_2471D10A4((uint64_t)v24, (uint64_t *)&unk_26B1282C0);
      sub_2471D10A4((uint64_t)v26, (uint64_t *)&unk_26B1282C0);
      v43(v21, v9);
      uint64_t v30 = v94;
      sub_2471D10A4((uint64_t)v15, (uint64_t *)&unk_26B1282C0);
      uint64_t v31 = v92;
      if (v81) {
        goto LABEL_14;
      }
LABEL_7:
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v32 = __swift_project_value_buffer(v30, (uint64_t)qword_26B128910);
      uint64_t v33 = v93;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v93 + 16))(v31, v32, v30);
      swift_retain_n();
      uint64_t v34 = sub_247205E98();
      os_log_type_t v35 = sub_247206178();
      if (os_log_type_enabled(v34, v35))
      {
        id v36 = (uint8_t *)swift_slowAlloc();
        uint64_t v37 = swift_slowAlloc();
        uint64_t v97 = v37;
        *(_DWORD *)id v36 = 136315138;
        os_log_type_t v38 = v89;
        sub_2471F8A98(v88, (uint64_t)v89, (uint64_t *)&unk_26B1282C0);
        if (v82(v38, 1, v9))
        {
          sub_2471D10A4((uint64_t)v38, (uint64_t *)&unk_26B1282C0);
          unint64_t v39 = 0xE300000000000000;
          uint64_t v40 = 7104878;
        }
        else
        {
          uint64_t v70 = v91;
          uint64_t v71 = v9;
          uint64_t v72 = v90;
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v91 + 16))(v90, v38, v71);
          sub_2471D10A4((uint64_t)v38, (uint64_t *)&unk_26B1282C0);
          uint64_t v40 = sub_2472048F8();
          unint64_t v39 = v73;
          (*(void (**)(unsigned char *, uint64_t))(v70 + 8))(v72, v71);
          uint64_t v31 = v92;
        }
        uint64_t v96 = sub_2471F3F68(v40, v39, &v97);
        sub_2472062B8();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2471B4000, v34, v35, "StartAttendingRequestedMessage does not belong to current session id: %s", v36, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v37, -1, -1);
        MEMORY[0x24C54D9C0](v36, -1, -1);

        (*(void (**)(unsigned char *, uint64_t))(v93 + 8))(v31, v30);
      }
      else
      {

        swift_release_n();
        (*(void (**)(unsigned char *, uint64_t))(v33 + 8))(v31, v30);
      }
      return;
    }
    sub_2471D10A4((uint64_t)v24, (uint64_t *)&unk_26B1282C0);
    sub_2471D10A4((uint64_t)v26, (uint64_t *)&unk_26B1282C0);
    (*(void (**)(unsigned char *, uint64_t))(v91 + 8))(v21, v9);
LABEL_6:
    uint64_t v82 = v29;
    sub_2471D10A4((uint64_t)v15, &qword_26B127BE8);
    uint64_t v31 = v92;
    uint64_t v30 = v94;
    goto LABEL_7;
  }
  sub_2471D10A4((uint64_t)v24, (uint64_t *)&unk_26B1282C0);
  sub_2471D10A4((uint64_t)v26, (uint64_t *)&unk_26B1282C0);
  if (v29((unsigned char *)v28, 1, v9) != 1) {
    goto LABEL_6;
  }
  sub_2471D10A4((uint64_t)v15, (uint64_t *)&unk_26B1282C0);
  uint64_t v30 = v94;
LABEL_14:
  unint64_t v44 = *(void **)&v95[qword_26B128958];
  if (v44)
  {
    uint64_t v45 = v30;
    char v95 = v44;
    uint64_t v46 = v87;
    uint64_t v47 = sub_247205548();
    if (v48)
    {
      unint64_t v49 = v48;
      uint64_t v94 = v47;
      id v50 = v83;
      sub_247205538();
      os_log_type_t v52 = v84;
      uint64_t v51 = v85;
      uint64_t v53 = v86;
      (*(void (**)(unsigned char *, void, uint64_t))(v85 + 104))(v84, *MEMORY[0x263F70CE8], v86);
      char v54 = sub_247205AC8();
      uint64_t v55 = *(void (**)(unsigned char *, uint64_t))(v51 + 8);
      v55(v52, v53);
      v55(v50, v53);
      if (v54)
      {
        if (qword_26B128578 != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v45, (uint64_t)qword_26B128910);
        id v56 = v46;
        swift_bridgeObjectRetain_n();
        id v57 = v56;
        unint64_t v58 = sub_247205E98();
        os_log_type_t v59 = sub_247206178();
        if (os_log_type_enabled(v58, v59))
        {
          uint64_t v60 = swift_slowAlloc();
          uint64_t v93 = swift_slowAlloc();
          uint64_t v97 = v93;
          *(_DWORD *)uint64_t v60 = 136315394;
          uint64_t v61 = v9;
          uint64_t v62 = v90;
          sub_247205A08();
          uint64_t v63 = sub_2472048F8();
          unint64_t v65 = v64;
          (*(void (**)(unsigned char *, uint64_t))(v91 + 8))(v62, v61);
          uint64_t v96 = sub_2471F3F68(v63, v65, &v97);
          sub_2472062B8();

          swift_bridgeObjectRelease();
          *(_WORD *)(v60 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v96 = sub_2471F3F68(v94, v49, &v97);
          sub_2472062B8();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2471B4000, v58, v59, "StartAttendingRequestedMessage received for sessionId: %s, calling directActionJarvisAnnounceMessageTrigger(withDeviceId:%s) on the AttendingClient", (uint8_t *)v60, 0x16u);
          uint64_t v66 = v93;
          swift_arrayDestroy();
          MEMORY[0x24C54D9C0](v66, -1, -1);
          MEMORY[0x24C54D9C0](v60, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        os_log_type_t v78 = (void *)sub_247205FC8();
        swift_bridgeObjectRelease();
        id v79 = v95;
        objc_msgSend(v95, sel_directActionJarvisAnnounceMessageTriggerWithDeviceId_, v78);

        return;
      }
      swift_bridgeObjectRelease();
      if (qword_26B128578 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v45, (uint64_t)qword_26B128910);
      uint64_t v74 = sub_247205E98();
      os_log_type_t v75 = sub_247206188();
      if (!os_log_type_enabled(v74, v75))
      {
LABEL_37:

        return;
      }
      uint64_t v76 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v76 = 0;
      uint64_t v77 = "Received StartAttendingRequestedMessage with reason != .directActionCarPlay, dropping";
    }
    else
    {
      if (qword_26B128578 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v30, (uint64_t)qword_26B128910);
      uint64_t v74 = sub_247205E98();
      os_log_type_t v75 = sub_247206188();
      if (!os_log_type_enabled(v74, v75)) {
        goto LABEL_37;
      }
      uint64_t v76 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v76 = 0;
      uint64_t v77 = "Received StartAttendingRequestedMessage missing deviceId, dropping";
    }
    _os_log_impl(&dword_2471B4000, v74, v75, v77, v76, 2u);
    MEMORY[0x24C54D9C0](v76, -1, -1);
    goto LABEL_37;
  }
  if (qword_26B128578 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v30, (uint64_t)qword_26B128910);
  id v67 = sub_247205E98();
  os_log_type_t v68 = sub_247206188();
  if (os_log_type_enabled(v67, v68))
  {
    uint64_t v69 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v69 = 0;
    _os_log_impl(&dword_2471B4000, v67, v68, "Received StartAttendingRequestedMessage outside the scope of a session, dropping", v69, 2u);
    MEMORY[0x24C54D9C0](v69, -1, -1);
  }
}

void sub_2471F1E9C(void *a1)
{
}

void sub_2471F1EC0(void *a1)
{
}

void sub_2471F1EE4(void *a1, const char *a2, SEL *a3, const char *a4, const char *a5)
{
  uint64_t v69 = a3;
  uint64_t v70 = a5;
  id v67 = a4;
  os_log_type_t v68 = a2;
  uint64_t v7 = sub_247205EA8();
  os_log_type_t v78 = *(uint8_t **)(v7 - 8);
  uint64_t v79 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v77 = &v64[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_247204938();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  os_log_type_t v75 = &v64[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127BE8);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = &v64[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v72 = &v64[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v74 = &v64[-v20];
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = &v64[-v22];
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = &v64[-v24];
  uint64_t v80 = v5;
  uint64_t v26 = v5 + qword_26B128960;
  swift_beginAccess();
  uint64_t v71 = v26;
  sub_2471F8A98(v26, (uint64_t)v25, (uint64_t *)&unk_26B1282C0);
  id v73 = a1;
  sub_247205A08();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v23, 0, 1, v9);
  uint64_t v27 = (uint64_t)&v15[*(int *)(v13 + 56)];
  sub_2471F8A98((uint64_t)v25, (uint64_t)v15, (uint64_t *)&unk_26B1282C0);
  sub_2471F8A98((uint64_t)v23, v27, (uint64_t *)&unk_26B1282C0);
  uint64_t v76 = v10;
  uint64_t v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v28((uint64_t)v15, 1, v9) == 1)
  {
    sub_2471D10A4((uint64_t)v23, (uint64_t *)&unk_26B1282C0);
    sub_2471D10A4((uint64_t)v25, (uint64_t *)&unk_26B1282C0);
    if (v28(v27, 1, v9) == 1)
    {
      sub_2471D10A4((uint64_t)v15, (uint64_t *)&unk_26B1282C0);
      uint64_t v29 = v79;
LABEL_8:
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v36 = __swift_project_value_buffer(v29, (uint64_t)qword_26B128910);
      id v37 = v73;
      os_log_type_t v38 = sub_247205E98();
      os_log_type_t v39 = sub_247206178();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v79 = v36;
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        uint64_t v41 = swift_slowAlloc();
        uint64_t v82 = v41;
        *(_DWORD *)uint64_t v40 = 136315138;
        os_log_type_t v78 = v40 + 4;
        uint64_t v42 = v75;
        sub_247205A08();
        uint64_t v43 = sub_2472048F8();
        unint64_t v45 = v44;
        (*(void (**)(unsigned char *, uint64_t))(v76 + 8))(v42, v9);
        uint64_t v81 = sub_2471F3F68(v43, v45, &v82);
        sub_2472062B8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2471B4000, v38, v39, v68, v40, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v41, -1, -1);
        MEMORY[0x24C54D9C0](v40, -1, -1);
      }
      else
      {
      }
      id v56 = *(void **)(v80 + qword_26B128958);
      if (v56)
      {
        [v56 *v69];
      }
      else
      {
        id v57 = sub_247205E98();
        os_log_type_t v58 = sub_247206188();
        if (os_log_type_enabled(v57, v58))
        {
          os_log_type_t v59 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v59 = 0;
          _os_log_impl(&dword_2471B4000, v57, v58, v67, v59, 2u);
          MEMORY[0x24C54D9C0](v59, -1, -1);
        }
      }
      return;
    }
    goto LABEL_6;
  }
  uint64_t v30 = v74;
  sub_2471F8A98((uint64_t)v15, (uint64_t)v74, (uint64_t *)&unk_26B1282C0);
  if (v28(v27, 1, v9) == 1)
  {
    sub_2471D10A4((uint64_t)v23, (uint64_t *)&unk_26B1282C0);
    sub_2471D10A4((uint64_t)v25, (uint64_t *)&unk_26B1282C0);
    (*(void (**)(unsigned char *, uint64_t))(v76 + 8))(v30, v9);
LABEL_6:
    sub_2471D10A4((uint64_t)v15, &qword_26B127BE8);
    uint64_t v29 = v79;
    goto LABEL_12;
  }
  uint64_t v31 = v76;
  uint64_t v32 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v76 + 32);
  uint64_t v66 = v28;
  uint64_t v33 = v75;
  v32(v75, v27, v9);
  sub_2471F8958((unint64_t *)&unk_26B1282A0, MEMORY[0x263F07508]);
  int v65 = sub_247205FB8();
  uint64_t v34 = *(void (**)(unsigned char *, uint64_t))(v31 + 8);
  os_log_type_t v35 = v33;
  uint64_t v28 = v66;
  v34(v35, v9);
  sub_2471D10A4((uint64_t)v23, (uint64_t *)&unk_26B1282C0);
  sub_2471D10A4((uint64_t)v25, (uint64_t *)&unk_26B1282C0);
  v34(v30, v9);
  sub_2471D10A4((uint64_t)v15, (uint64_t *)&unk_26B1282C0);
  uint64_t v29 = v79;
  if (v65) {
    goto LABEL_8;
  }
LABEL_12:
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v46 = __swift_project_value_buffer(v29, (uint64_t)qword_26B128910);
  uint64_t v47 = v77;
  unint64_t v48 = v78;
  (*((void (**)(unsigned char *, uint64_t, uint64_t))v78 + 2))(v77, v46, v29);
  swift_retain_n();
  unint64_t v49 = sub_247205E98();
  os_log_type_t v50 = sub_247206178();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    uint64_t v82 = v52;
    *(_DWORD *)uint64_t v51 = 136315138;
    uint64_t v53 = v72;
    sub_2471F8A98(v71, (uint64_t)v72, (uint64_t *)&unk_26B1282C0);
    if (v28((uint64_t)v53, 1, v9))
    {
      sub_2471D10A4((uint64_t)v53, (uint64_t *)&unk_26B1282C0);
      unint64_t v54 = 0xE300000000000000;
      uint64_t v55 = 7104878;
    }
    else
    {
      uint64_t v61 = v75;
      uint64_t v60 = v76;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v76 + 16))(v75, v53, v9);
      sub_2471D10A4((uint64_t)v53, (uint64_t *)&unk_26B1282C0);
      uint64_t v55 = sub_2472048F8();
      unint64_t v54 = v62;
      (*(void (**)(unsigned char *, uint64_t))(v60 + 8))(v61, v9);
    }
    uint64_t v63 = v70;
    uint64_t v81 = sub_2471F3F68(v55, v54, &v82);
    sub_2472062B8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v49, v50, v63, v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v52, -1, -1);
    MEMORY[0x24C54D9C0](v51, -1, -1);

    (*((void (**)(unsigned char *, uint64_t))v78 + 1))(v77, v79);
  }
  else
  {

    swift_release_n();
    (*((void (**)(unsigned char *, uint64_t))v48 + 1))(v47, v29);
  }
}

uint64_t sub_2471F2844(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127C00);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v29 - v8;
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_247205EA8();
  __swift_project_value_buffer(v10, (uint64_t)qword_26B128910);
  id v11 = a1;
  uint64_t v12 = sub_247205E98();
  os_log_type_t v13 = sub_247206178();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v30 = v7;
    uint64_t v15 = v14;
    uint64_t v29 = swift_slowAlloc();
    v32[0] = v29;
    *(_DWORD *)uint64_t v15 = 136315650;
    uint64_t v16 = sub_247205A28();
    uint64_t v31 = sub_2471F3F68(v16, v17, v32);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2048;
    uint64_t v18 = *(void *)(sub_247204AF8() + 16);

    swift_bridgeObjectRelease();
    uint64_t v31 = v18;
    sub_2472062B8();

    *(_WORD *)(v15 + 22) = 1024;
    char v19 = sub_247204AE8();

    LODWORD(v31) = v19 & 1;
    sub_2472062B8();

    _os_log_impl(&dword_2471B4000, v12, v13, "MUXContextMessage received for assistantId: %s with %ld home members and RMVEnabled=%{BOOL}d", (uint8_t *)v15, 0x1Cu);
    uint64_t v20 = v29;
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v20, -1, -1);
    uint64_t v21 = v15;
    uint64_t v7 = v30;
    MEMORY[0x24C54D9C0](v21, -1, -1);
  }
  else
  {
  }
  uint64_t v22 = sub_247204AF8();
  uint64_t v23 = sub_2471F4E8C(v22);
  swift_bridgeObjectRelease();
  *(void *)(v2 + qword_26B128938) = v23;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v2 + qword_26B128948) = sub_247204AE8() & 1;
  *(unsigned char *)(v2 + qword_26B128940) = 1;
  sub_247204AD8();
  uint64_t v24 = sub_247205B68();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v7, 1, v24) == 1)
  {
    uint64_t v26 = v2 + qword_26B128988;
    swift_beginAccess();
    sub_2471F8A98(v26, (uint64_t)v9, &qword_26B127C00);
    sub_2471D10A4((uint64_t)v7, &qword_26B127C00);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v9, v7, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v9, 0, 1, v24);
  }
  uint64_t v27 = v2 + qword_26B128988;
  swift_beginAccess();
  sub_2471F88F4((uint64_t)v9, v27, &qword_26B127C00);
  return swift_endAccess();
}

void sub_2471F2C84(void *a1)
{
  uint64_t v3 = sub_247205EA8();
  uint64_t v68 = *(void *)(v3 - 8);
  uint64_t v69 = v3;
  MEMORY[0x270FA5388](v3);
  id v67 = &v58[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_247204938();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v63 = &v58[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B127BE8);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  id v11 = &v58[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  unint64_t v62 = &v58[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  int v65 = &v58[-v16];
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  char v19 = &v58[-v18];
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = &v58[-v20];
  uint64_t v70 = v1;
  uint64_t v22 = v1 + qword_26B128960;
  swift_beginAccess();
  uint64_t v61 = v22;
  sub_2471F8A98(v22, (uint64_t)v21, (uint64_t *)&unk_26B1282C0);
  id v64 = a1;
  sub_247205A08();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v6 + 56))(v19, 0, 1, v5);
  uint64_t v23 = (uint64_t)&v11[*(int *)(v9 + 56)];
  sub_2471F8A98((uint64_t)v21, (uint64_t)v11, (uint64_t *)&unk_26B1282C0);
  sub_2471F8A98((uint64_t)v19, v23, (uint64_t *)&unk_26B1282C0);
  uint64_t v66 = v6;
  uint64_t v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v24((uint64_t)v11, 1, v5) == 1)
  {
    sub_2471D10A4((uint64_t)v19, (uint64_t *)&unk_26B1282C0);
    sub_2471D10A4((uint64_t)v21, (uint64_t *)&unk_26B1282C0);
    if (v24(v23, 1, v5) == 1)
    {
      sub_2471D10A4((uint64_t)v11, (uint64_t *)&unk_26B1282C0);
      uint64_t v25 = v69;
LABEL_8:
      if (qword_26B128578 != -1) {
        swift_once();
      }
      uint64_t v32 = __swift_project_value_buffer(v25, (uint64_t)qword_26B128910);
      uint64_t v33 = v64;
      uint64_t v69 = v32;
      uint64_t v34 = sub_247205E98();
      os_log_type_t v35 = sub_247206178();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        id v37 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v36 = 138412290;
        uint64_t v72 = v33;
        os_log_type_t v38 = v33;
        sub_2472062B8();
        *id v37 = v33;

        _os_log_impl(&dword_2471B4000, v34, v35, "AsrBridge received message: %@", v36, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v37, -1, -1);
        MEMORY[0x24C54D9C0](v36, -1, -1);
      }
      else
      {

        uint64_t v34 = v33;
      }

      unint64_t v49 = *(void **)(v70 + qword_26B128958);
      if (v49)
      {
        id v50 = v49;
        sub_2472059C8();
        uint64_t v51 = (void *)sub_247205FC8();
        swift_bridgeObjectRelease();
        objc_msgSend(v50, sel_siriDidPromptWithRootRequestId_, v51);
      }
      else
      {
        uint64_t v52 = sub_247205E98();
        os_log_type_t v53 = sub_247206188();
        if (os_log_type_enabled(v52, v53))
        {
          unint64_t v54 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v54 = 0;
          _os_log_impl(&dword_2471B4000, v52, v53, "AttendingClient not set while receiving SiriPromptedMessage, dropping", v54, 2u);
          MEMORY[0x24C54D9C0](v54, -1, -1);
        }
      }
      return;
    }
    goto LABEL_6;
  }
  uint64_t v26 = v65;
  sub_2471F8A98((uint64_t)v11, (uint64_t)v65, (uint64_t *)&unk_26B1282C0);
  if (v24(v23, 1, v5) == 1)
  {
    sub_2471D10A4((uint64_t)v19, (uint64_t *)&unk_26B1282C0);
    sub_2471D10A4((uint64_t)v21, (uint64_t *)&unk_26B1282C0);
    (*(void (**)(unsigned char *, uint64_t))(v66 + 8))(v26, v5);
LABEL_6:
    sub_2471D10A4((uint64_t)v11, &qword_26B127BE8);
    uint64_t v25 = v69;
    goto LABEL_12;
  }
  uint64_t v27 = v66;
  uint64_t v28 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v66 + 32);
  uint64_t v60 = v24;
  uint64_t v29 = v63;
  v28(v63, v23, v5);
  sub_2471F8958((unint64_t *)&unk_26B1282A0, MEMORY[0x263F07508]);
  int v59 = sub_247205FB8();
  uint64_t v30 = *(void (**)(unsigned char *, uint64_t))(v27 + 8);
  uint64_t v31 = v29;
  uint64_t v24 = v60;
  v30(v31, v5);
  sub_2471D10A4((uint64_t)v19, (uint64_t *)&unk_26B1282C0);
  sub_2471D10A4((uint64_t)v21, (uint64_t *)&unk_26B1282C0);
  v30(v26, v5);
  sub_2471D10A4((uint64_t)v11, (uint64_t *)&unk_26B1282C0);
  uint64_t v25 = v69;
  if (v59) {
    goto LABEL_8;
  }
LABEL_12:
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v39 = __swift_project_value_buffer(v25, (uint64_t)qword_26B128910);
  uint64_t v40 = v67;
  uint64_t v41 = v68;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v68 + 16))(v67, v39, v25);
  swift_retain_n();
  uint64_t v42 = sub_247205E98();
  os_log_type_t v43 = sub_247206178();
  if (os_log_type_enabled(v42, v43))
  {
    unint64_t v44 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    uint64_t v72 = v45;
    *(_DWORD *)unint64_t v44 = 136315138;
    uint64_t v46 = v62;
    sub_2471F8A98(v61, (uint64_t)v62, (uint64_t *)&unk_26B1282C0);
    if (v24((uint64_t)v46, 1, v5))
    {
      sub_2471D10A4((uint64_t)v46, (uint64_t *)&unk_26B1282C0);
      unint64_t v47 = 0xE300000000000000;
      uint64_t v48 = 7104878;
    }
    else
    {
      uint64_t v55 = v66;
      id v56 = v63;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v66 + 16))(v63, v46, v5);
      sub_2471D10A4((uint64_t)v46, (uint64_t *)&unk_26B1282C0);
      uint64_t v48 = sub_2472048F8();
      unint64_t v47 = v57;
      (*(void (**)(unsigned char *, uint64_t))(v55 + 8))(v56, v5);
    }
    uint64_t v71 = sub_2471F3F68(v48, v47, (uint64_t *)&v72);
    sub_2472062B8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v42, v43, "SiriPromptedMessage does not belong to current session id: %s", v44, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v45, -1, -1);
    MEMORY[0x24C54D9C0](v44, -1, -1);

    (*(void (**)(unsigned char *, uint64_t))(v68 + 8))(v67, v69);
  }
  else
  {

    swift_release_n();
    (*(void (**)(unsigned char *, uint64_t))(v41 + 8))(v40, v25);
  }
}

uint64_t sub_2471F35C8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2471F3668(a1, a2, a3, a4, "#AsrOnServer Received SASResultCandidate for requestId:%s", (unint64_t *)&unk_269241180, 0x263F64C10, (uint64_t)sub_2471F35F8);
}

uint64_t (*sub_2471F35F8())(void *a1, uint64_t a2, void (*a3)(void, void), uint64_t a4)
{
  return sub_2471F8888;
}

uint64_t sub_2471F3638(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2471F3668(a1, a2, a3, a4, "#AsrOnServer Received SASMUXResultCandidate for requestId:%s", (unint64_t *)&unk_2692414C0, 0x263F64BF8, (uint64_t)sub_2471F397C);
}

uint64_t sub_2471F3668(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, unint64_t *a6, uint64_t a7, uint64_t a8)
{
  id v37 = a6;
  uint64_t v38 = a7;
  uint64_t v36 = a5;
  uint64_t v10 = v8;
  uint64_t v39 = a2;
  uint64_t v14 = sub_247205EA8();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v14, (uint64_t)qword_26B128910);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v18, v14);
  id v19 = a1;
  uint64_t v20 = sub_247205E98();
  os_log_type_t v21 = sub_247206178();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v32 = a3;
    uint64_t v33 = a4;
    uint64_t v34 = a8;
    uint64_t v35 = v10;
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v41 = v31;
    *(_DWORD *)uint64_t v22 = 136315138;
    id v23 = objc_msgSend(v19, sel_refId);
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = sub_247205FD8();
      unint64_t v27 = v26;
    }
    else
    {
      unint64_t v27 = 0xE900000000000064;
      uint64_t v25 = 0x49666572206C696ELL;
    }
    uint64_t v40 = sub_2471F3F68(v25, v27, &v41);
    sub_2472062B8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471B4000, v20, v21, v36, v22, 0xCu);
    uint64_t v28 = v31;
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v28, -1, -1);
    MEMORY[0x24C54D9C0](v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  sub_2471CAE98(0, v37);
  type metadata accessor for AsrRequestProcessor();
  return sub_247205C98();
}

void (*sub_2471F397C())(void *a1, uint64_t a2, void (*a3)(void, void), void *a4)
{
  return sub_2471F887C;
}

uint64_t sub_2471F39BC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2471F3668(a1, a2, a3, a4, "#AsrOnServer Received SASSpeechServerEndpointIdentified for requestId:%s", &qword_2692414B8, 0x263F64C28, (uint64_t)sub_2471F39EC);
}

uint64_t (*sub_2471F39EC())(void *a1, uint64_t a2, uint64_t (*a3)(void, void), uint64_t a4)
{
  return sub_2471F8870;
}

uint64_t sub_2471F3A2C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2471F3668(a1, a2, a3, a4, "#AsrOnServer Received SASSpeechRecognized for requestId:%s", &qword_2692414B0, 0x263F64C20, (uint64_t)sub_2471F3A5C);
}

uint64_t (*sub_2471F3A5C())(void *a1, uint64_t a2, uint64_t (*a3)(void, void), uint64_t a4)
{
  return sub_2471F8864;
}

void sub_2471F3A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_247204938();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v26[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(char *, uint64_t))(v11 + 16))(v10, a1);
  swift_bridgeObjectRetain();
  sub_247205DE8();
  uint64_t v12 = *(void *)(v4 + qword_26B1285C8);
  id v13 = objc_allocWithZone((Class)type metadata accessor for AttendingStatesServiceHandler());
  swift_retain();
  id v14 = sub_24720424C((uint64_t)v10, a2, a3, (uint64_t)v26, v12);
  swift_release();
  uint64_t v15 = qword_26B128980;
  uint64_t v16 = *(void **)(v4 + qword_26B128980);
  *(void *)(v4 + qword_26B128980) = v14;

  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F52598]), sel_initWithDelegate_, *(void *)(v4 + v15));
  uint64_t v18 = *(void **)(v4 + qword_26B128958);
  *(void *)(v4 + qword_26B128958) = v17;
  id v19 = v17;

  [v19 startUpdateStates];
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_247205EA8();
  __swift_project_value_buffer(v20, (uint64_t)qword_26B128910);
  os_log_type_t v21 = sub_247205E98();
  os_log_type_t v22 = sub_247206178();
  if (os_log_type_enabled(v21, v22))
  {
    id v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v23 = 0;
    _os_log_impl(&dword_2471B4000, v21, v22, "Successfully setup Attending handling in AsrBridge", v23, 2u);
    MEMORY[0x24C54D9C0](v23, -1, -1);
    uint64_t v24 = v19;
  }
  else
  {
    uint64_t v24 = v21;
    os_log_type_t v21 = v19;
  }
}

void AsrBridge.__allocating_init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)()
{
}

void AsrBridge.init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)()
{
}

uint64_t sub_2471F3D54()
{
  swift_release();
  sub_2471D10A4(v0 + qword_26B128960, (uint64_t *)&unk_26B1282C0);
  swift_bridgeObjectRelease();
  sub_2471D10A4(v0 + qword_26B128950, &qword_26B128338);
  sub_2471D10A4(v0 + qword_26B128988, &qword_26B127C00);
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1(v0 + qword_26B1285B0);
  return swift_release();
}

uint64_t AsrBridge.deinit()
{
  uint64_t v0 = sub_247205CC8();
  swift_release();
  sub_2471D10A4(v0 + qword_26B128960, (uint64_t *)&unk_26B1282C0);
  swift_bridgeObjectRelease();
  sub_2471D10A4(v0 + qword_26B128950, &qword_26B128338);
  sub_2471D10A4(v0 + qword_26B128988, &qword_26B127C00);
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1(v0 + qword_26B1285B0);
  swift_release();
  return v0;
}

uint64_t AsrBridge.__deallocating_deinit()
{
  uint64_t v0 = AsrBridge.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2471F3F68(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2471F403C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2471D0F8C((uint64_t)v12, *a3);
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
      sub_2471D0F8C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2471F403C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2472062C8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2471F41F8(a5, a6);
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
  uint64_t v8 = sub_247206378();
  if (!v8)
  {
    sub_2472063D8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_247206428();
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

uint64_t sub_2471F41F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2471F4290(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2471F44EC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2471F44EC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2471F4290(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2471F4408(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_247206358();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2472063D8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_247206038();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_247206428();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2472063D8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2471F4408(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128730);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2471F4470(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_247206088();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x24C54CEB0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_2471F44EC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128730);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_247206428();
  __break(1u);
  return result;
}

unsigned __int8 *sub_2471F463C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_247206098();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    int64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_2471F49A0();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    int64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = (unsigned __int8 *)sub_247206378();
  }
LABEL_7:
  size_t v11 = sub_2471F4724(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_2471F4724(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (unint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_2471F49A0()
{
  unint64_t v0 = sub_2472060A8();
  uint64_t v4 = sub_2471F4A20(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2471F4A20(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_2471F4B78(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_2471F4408(v9, 0);
      unint64_t v12 = sub_2471F4C78((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_247206378();
LABEL_4:
        JUMPOUT(0x24C54CE60);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x24C54CE60](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x24C54CE60]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_2471F4B78(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_2471F4470(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_2471F4470(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_2471F4C78(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    void v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_2471F4470(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_247206078();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_247206378();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_2471F4470(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_247206048();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

void *sub_2471F4E8C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128740);
  unint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  unint64_t v6 = sub_2471F7240(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2471E8CE8();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void sub_2471F4F78(void *a1, char *a2)
{
  uint64_t v4 = sub_247205C78();
  uint64_t v97 = *(void *)(v4 - 8);
  uint64_t v98 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v96 = (char *)&v88 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_247205AA8();
  uint64_t v99 = *(void *)(v6 - 8);
  uint64_t v100 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v90 = (char *)&v88 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_247205A88();
  uint64_t v9 = *(NSObject **)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v93 = (char *)&v88 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v88 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128318);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  unint64_t v17 = (char *)&v88 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v91 = (char *)&v88 - v18;
  uint64_t v19 = sub_247204938();
  uint64_t v102 = *(void *)(v19 - 8);
  id v103 = (id)v19;
  MEMORY[0x270FA5388](v19);
  uint64_t v101 = (char *)&v88 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_247205EA8();
  uint64_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_26B128910);
  id v23 = a1;
  unsigned __int8 v24 = sub_247205E98();
  os_log_type_t v25 = sub_247206178();
  BOOL v26 = os_log_type_enabled(v24, v25);
  os_log_t v94 = v9;
  uint64_t v95 = v8;
  unint64_t v92 = v13;
  if (v26)
  {
    uint64_t v27 = swift_slowAlloc();
    unint64_t v89 = a2;
    uint64_t v28 = (uint8_t *)v27;
    uint64_t v88 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 138412290;
    v106[0] = (uint64_t)v23;
    id v29 = v23;
    sub_2472062B8();
    uint64_t v30 = v88;
    void *v88 = v23;

    _os_log_impl(&dword_2471B4000, v24, v25, "AsrRequestProcessor received message: %@", v28, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v30, -1, -1);
    uint64_t v31 = v28;
    a2 = v89;
    MEMORY[0x24C54D9C0](v31, -1, -1);
  }
  else
  {
  }
  if (sub_2472050B8())
  {
    uint64_t v32 = (void *)sub_247205B78();
    swift_release();
  }
  else
  {
    uint64_t v32 = 0;
  }
  uint64_t v33 = sub_247205CD8();
  uint64_t v35 = v34;
  uint64_t v36 = (uint64_t)v101;
  sub_247205D28();
  sub_2471F98E0(v32, v33, v35, v36);
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, id))(v102 + 8))(v36, v103);
  if (a2[qword_26B1287B0] == 1)
  {
    id v37 = sub_247205E98();
    os_log_type_t v38 = sub_247206198();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_2471B4000, v37, v38, "Dropping the StartSpeechRequestMessage as we already ran this request in Candidate mode.", v39, 2u);
      MEMORY[0x24C54D9C0](v39, -1, -1);
    }
  }
  else
  {
    uint64_t v41 = v99;
    uint64_t v40 = v100;
    uint64_t v42 = *(char **)(v99 + 104);
    uint64_t v43 = (uint64_t)v91;
    LODWORD(v101) = *MEMORY[0x263F70AB0];
    uint64_t v102 = v99 + 104;
    unint64_t v89 = v42;
    ((void (*)(char *))v42)(v91);
    char v44 = 1;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v41 + 56))(v43, 0, 1, v40);
    sub_2471DBDEC(v43, (uint64_t)v17);
    uint64_t v45 = (uint64_t)&a2[qword_26B1287A0];
    swift_beginAccess();
    sub_2471F88F4((uint64_t)v17, v45, (uint64_t *)&unk_26B128318);
    swift_endAccess();
    uint64_t v46 = v92;
    unint64_t v47 = v23;
    sub_247204B48();
    unint64_t v49 = v93;
    os_log_t v48 = v94;
    uint64_t v50 = v95;
    ((void (*)(char *, void, uint64_t))v94[13].isa)(v93, *MEMORY[0x263F70A40], v95);
    sub_2471F8958((unint64_t *)&unk_26B128300, MEMORY[0x263F70A50]);
    sub_2472060B8();
    sub_2472060B8();
    if (v106[0] != v104 || v106[1] != v105) {
      char v44 = sub_2472064A8();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    isa = (void (*)(char *, uint64_t))v48[1].isa;
    isa(v49, v50);
    isa(v46, v50);
    a2[qword_26B1283F8] = v44 & 1;
    sub_2471E2CB0(0);
    sub_2471F6850((uint64_t)v47, a2);
    os_log_type_t v53 = v52;
    id v54 = v47;
    id v55 = v53;
    id v56 = v54;
    id v57 = v55;
    id v103 = (id)v22;
    os_log_type_t v58 = sub_247205E98();
    os_log_type_t v59 = sub_247206178();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = swift_slowAlloc();
      uint64_t v93 = (char *)swift_slowAlloc();
      os_log_t v94 = v58;
      uint64_t v61 = v93;
      uint64_t v95 = swift_slowAlloc();
      v106[0] = v95;
      *(_DWORD *)uint64_t v60 = 138412546;
      uint64_t v104 = (uint64_t)v57;
      unint64_t v62 = a2;
      id v63 = v57;
      sub_2472062B8();
      *uint64_t v61 = v57;

      a2 = v62;
      *(_WORD *)(v60 + 12) = 2080;
      uint64_t v64 = sub_2472059C8();
      uint64_t v104 = sub_2471F3F68(v64, v65, v106);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      os_log_t v66 = v94;
      _os_log_impl(&dword_2471B4000, v94, v59, "RequestSettings: %@ for requestId: %s", (uint8_t *)v60, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
      id v67 = v93;
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v67, -1, -1);
      uint64_t v68 = v95;
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v68, -1, -1);
      MEMORY[0x24C54D9C0](v60, -1, -1);
    }
    else
    {
    }
    if (sub_2472050A8())
    {
      a2[qword_26B128798] = 1;
      uint64_t v69 = (uint64_t)v90;
      uint64_t v70 = v100;
      ((void (*)(char *, void, uint64_t))v89)(v90, v101, v100);
      uint64_t v71 = sub_2471E4A84(v69);
      (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v69, v70);
      *(void *)&a2[qword_26B128790] = v71;
      swift_release();
      uint64_t v72 = *(void **)&a2[qword_26B128430];
      sub_2472059C8();
      id v73 = (void *)sub_247205FC8();
      swift_bridgeObjectRelease();
      objc_msgSend(v72, sel_disableLocalSpeechRecognitionForRequestId_, v73);

      id v74 = v56;
      os_log_type_t v75 = sub_247205E98();
      os_log_type_t v76 = sub_247206178();
      if (os_log_type_enabled(v75, v76))
      {
        uint64_t v77 = (uint8_t *)swift_slowAlloc();
        uint64_t v78 = swift_slowAlloc();
        v106[0] = v78;
        *(_DWORD *)uint64_t v77 = 136315138;
        id v103 = v56;
        uint64_t v79 = sub_2472059C8();
        uint64_t v104 = sub_2471F3F68(v79, v80, v106);
        id v56 = v103;
        sub_2472062B8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2471B4000, v75, v76, "#AsrOnServer ASR is being processed on server for requestId: %s. LocalSpeechRecognition is disabled.", v77, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v78, -1, -1);
        MEMORY[0x24C54D9C0](v77, -1, -1);
      }
      else
      {
      }
    }
    else
    {
      id v81 = objc_msgSend(v57, sel_speechRecognitionTask);
      sub_2472059C8();
      sub_2471CB06C((unint64_t)v81);
      swift_bridgeObjectRelease();
    }
    objc_msgSend(*(id *)&a2[qword_26B128430], sel_startSpeechRecognitionResultsWithSettings_, v57);
    if (qword_26B127C10 != -1) {
      swift_once();
    }
    uint64_t v82 = v98;
    uint64_t v83 = __swift_project_value_buffer(v98, (uint64_t)qword_26B1288F8);
    unint64_t v84 = v96;
    uint64_t v85 = v97;
    (*(void (**)(char *, uint64_t, uint64_t))(v97 + 16))(v96, v83, v82);
    uint64_t v86 = (void *)swift_allocObject();
    v86[2] = a2;
    v86[3] = v56;
    unsigned char v86[4] = &off_26FB64368;
    id v87 = v56;
    swift_retain();
    sub_247205C48();

    swift_release();
    (*(void (**)(char *, uint64_t))(v85 + 8))(v84, v82);
  }
}

void sub_2471F5BE4(void *a1, char *a2)
{
  uint64_t v4 = sub_247205C78();
  uint64_t v97 = *(void *)(v4 - 8);
  uint64_t v98 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v96 = (char *)&v88 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_247205AA8();
  uint64_t v99 = *(void *)(v6 - 8);
  uint64_t v100 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v90 = (char *)&v88 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_247205A88();
  uint64_t v9 = *(NSObject **)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v93 = (char *)&v88 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v88 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128318);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  unint64_t v17 = (char *)&v88 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v91 = (char *)&v88 - v18;
  uint64_t v19 = sub_247204938();
  uint64_t v102 = *(void *)(v19 - 8);
  id v103 = (id)v19;
  MEMORY[0x270FA5388](v19);
  uint64_t v101 = (char *)&v88 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_247205EA8();
  uint64_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_26B128910);
  id v23 = a1;
  unsigned __int8 v24 = sub_247205E98();
  os_log_type_t v25 = sub_247206178();
  BOOL v26 = os_log_type_enabled(v24, v25);
  os_log_t v94 = v9;
  uint64_t v95 = v8;
  unint64_t v92 = v13;
  if (v26)
  {
    uint64_t v27 = swift_slowAlloc();
    unint64_t v89 = a2;
    uint64_t v28 = (uint8_t *)v27;
    uint64_t v88 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 138412290;
    v106[0] = (uint64_t)v23;
    id v29 = v23;
    sub_2472062B8();
    uint64_t v30 = v88;
    void *v88 = v23;

    _os_log_impl(&dword_2471B4000, v24, v25, "AsrRequestProcessor received message: %@", v28, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v30, -1, -1);
    uint64_t v31 = v28;
    a2 = v89;
    MEMORY[0x24C54D9C0](v31, -1, -1);
  }
  else
  {
  }
  if (sub_247205438())
  {
    uint64_t v32 = (void *)sub_247205B78();
    swift_release();
  }
  else
  {
    uint64_t v32 = 0;
  }
  uint64_t v33 = sub_247205CD8();
  uint64_t v35 = v34;
  uint64_t v36 = (uint64_t)v101;
  sub_247205D28();
  sub_2471F98E0(v32, v33, v35, v36);
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, id))(v102 + 8))(v36, v103);
  if (a2[qword_26B1287B0] == 1)
  {
    id v37 = sub_247205E98();
    os_log_type_t v38 = sub_247206198();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_2471B4000, v37, v38, "Dropping the StartSpeechRequestMessage as we already ran this request in Candidate mode.", v39, 2u);
      MEMORY[0x24C54D9C0](v39, -1, -1);
    }
  }
  else
  {
    uint64_t v41 = v99;
    uint64_t v40 = v100;
    uint64_t v42 = *(char **)(v99 + 104);
    uint64_t v43 = (uint64_t)v91;
    LODWORD(v101) = *MEMORY[0x263F70AB0];
    uint64_t v102 = v99 + 104;
    unint64_t v89 = v42;
    ((void (*)(char *))v42)(v91);
    char v44 = 1;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v41 + 56))(v43, 0, 1, v40);
    sub_2471DBDEC(v43, (uint64_t)v17);
    uint64_t v45 = (uint64_t)&a2[qword_26B1287A0];
    swift_beginAccess();
    sub_2471F88F4((uint64_t)v17, v45, (uint64_t *)&unk_26B128318);
    swift_endAccess();
    uint64_t v46 = v92;
    unint64_t v47 = v23;
    sub_247205428();
    unint64_t v49 = v93;
    os_log_t v48 = v94;
    uint64_t v50 = v95;
    ((void (*)(char *, void, uint64_t))v94[13].isa)(v93, *MEMORY[0x263F70A40], v95);
    sub_2471F8958((unint64_t *)&unk_26B128300, MEMORY[0x263F70A50]);
    sub_2472060B8();
    sub_2472060B8();
    if (v106[0] != v104 || v106[1] != v105) {
      char v44 = sub_2472064A8();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    isa = (void (*)(char *, uint64_t))v48[1].isa;
    isa(v49, v50);
    isa(v46, v50);
    a2[qword_26B1283F8] = v44 & 1;
    sub_2471E2CB0(0);
    sub_2471F6D48((uint64_t)v47, a2);
    os_log_type_t v53 = v52;
    id v54 = v47;
    id v55 = v53;
    id v56 = v54;
    id v57 = v55;
    id v103 = (id)v22;
    os_log_type_t v58 = sub_247205E98();
    os_log_type_t v59 = sub_247206178();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = swift_slowAlloc();
      uint64_t v93 = (char *)swift_slowAlloc();
      os_log_t v94 = v58;
      uint64_t v61 = v93;
      uint64_t v95 = swift_slowAlloc();
      v106[0] = v95;
      *(_DWORD *)uint64_t v60 = 138412546;
      uint64_t v104 = (uint64_t)v57;
      unint64_t v62 = a2;
      id v63 = v57;
      sub_2472062B8();
      *uint64_t v61 = v57;

      a2 = v62;
      *(_WORD *)(v60 + 12) = 2080;
      uint64_t v64 = sub_2472059C8();
      uint64_t v104 = sub_2471F3F68(v64, v65, v106);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      os_log_t v66 = v94;
      _os_log_impl(&dword_2471B4000, v94, v59, "RequestSettings: %@ for requestId: %s", (uint8_t *)v60, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
      id v67 = v93;
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v67, -1, -1);
      uint64_t v68 = v95;
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v68, -1, -1);
      MEMORY[0x24C54D9C0](v60, -1, -1);
    }
    else
    {
    }
    if (sub_247205418())
    {
      a2[qword_26B128798] = 1;
      uint64_t v69 = (uint64_t)v90;
      uint64_t v70 = v100;
      ((void (*)(char *, void, uint64_t))v89)(v90, v101, v100);
      uint64_t v71 = sub_2471E4A84(v69);
      (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v69, v70);
      *(void *)&a2[qword_26B128790] = v71;
      swift_release();
      uint64_t v72 = *(void **)&a2[qword_26B128430];
      sub_2472059C8();
      id v73 = (void *)sub_247205FC8();
      swift_bridgeObjectRelease();
      objc_msgSend(v72, sel_disableLocalSpeechRecognitionForRequestId_, v73);

      id v74 = v56;
      os_log_type_t v75 = sub_247205E98();
      os_log_type_t v76 = sub_247206178();
      if (os_log_type_enabled(v75, v76))
      {
        uint64_t v77 = (uint8_t *)swift_slowAlloc();
        uint64_t v78 = swift_slowAlloc();
        v106[0] = v78;
        *(_DWORD *)uint64_t v77 = 136315138;
        id v103 = v56;
        uint64_t v79 = sub_2472059C8();
        uint64_t v104 = sub_2471F3F68(v79, v80, v106);
        id v56 = v103;
        sub_2472062B8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2471B4000, v75, v76, "#AsrOnServer ASR is being processed on server for requestId: %s. LocalSpeechRecognition is disabled.", v77, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C54D9C0](v78, -1, -1);
        MEMORY[0x24C54D9C0](v77, -1, -1);
      }
      else
      {
      }
    }
    else
    {
      id v81 = objc_msgSend(v57, sel_speechRecognitionTask);
      sub_2472059C8();
      sub_2471CB06C((unint64_t)v81);
      swift_bridgeObjectRelease();
    }
    objc_msgSend(*(id *)&a2[qword_26B128430], sel_startSpeechRecognitionResultsWithSettings_, v57);
    if (qword_26B127C10 != -1) {
      swift_once();
    }
    uint64_t v82 = v98;
    uint64_t v83 = __swift_project_value_buffer(v98, (uint64_t)qword_26B1288F8);
    unint64_t v84 = v96;
    uint64_t v85 = v97;
    (*(void (**)(char *, uint64_t, uint64_t))(v97 + 16))(v96, v83, v82);
    uint64_t v86 = (void *)swift_allocObject();
    v86[2] = a2;
    v86[3] = v56;
    unsigned char v86[4] = &off_26FB64390;
    id v87 = v56;
    swift_retain();
    sub_247205C48();

    swift_release();
    (*(void (**)(char *, uint64_t))(v85 + 8))(v84, v82);
  }
}

void sub_2471F6850(uint64_t a1, char *a2)
{
  uint64_t v4 = (void *)sub_247205A88();
  uint64_t v5 = (void *)*(v4 - 1);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2471E1514((uint64_t *)&v50);
  unint64_t v8 = *(void *)&a2[qword_26B1283F0];
  if (v8 >> 62) {
    goto LABEL_15;
  }
  uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v9)
  {
    while (1)
    {
      uint64_t v49 = MEMORY[0x263F8EE78];
      sub_2472063A8();
      if (v9 < 0) {
        break;
      }
      uint64_t v39 = v7;
      uint64_t v40 = v5;
      uint64_t v41 = v4;
      uint64_t v43 = a1;
      uint64_t v44 = (uint64_t)a2;
      uint64_t v10 = self;
      uint64_t v7 = 0;
      unint64_t v45 = v8 & 0xC000000000000001;
      id v46 = v10;
      uint64_t v5 = v48;
      unint64_t v11 = v8;
      while ((char *)v9 != v7)
      {
        if (v45) {
          id v12 = (id)MEMORY[0x24C54D1C0](v7, v8);
        }
        else {
          id v12 = *(id *)(v8 + 8 * (void)v7 + 32);
        }
        uint64_t v13 = v12;
        a1 = swift_allocObject();
        *(void *)(a1 + 16) = v13;
        uint64_t v14 = swift_allocObject();
        *(void *)(v14 + 16) = sub_2471F8B60;
        *(void *)(v14 + 24) = a1;
        v48[2] = sub_2471F8B74;
        v48[3] = v14;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        v48[0] = sub_2471C2024;
        v48[1] = &block_descriptor_25;
        a2 = (char *)_Block_copy(aBlock);
        unint64_t v8 = v13;
        swift_retain();
        swift_release();
        uint64_t v4 = objc_msgSend(v46, sel_newWithBuilder_, a2);
        _Block_release(a2);
        if (!v4) {
          goto LABEL_31;
        }
        swift_release();
        char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();

        swift_release();
        if (isEscapingClosureAtFileLocation) {
          goto LABEL_14;
        }
        ++v7;
        sub_247206388();
        sub_2472063B8();
        sub_2472063C8();
        sub_247206398();
        unint64_t v8 = v11;
        if ((char *)v9 == v7)
        {
          uint64_t v42 = v49;
          swift_bridgeObjectRelease();
          uint64_t v5 = v40;
          uint64_t v4 = v41;
          uint64_t v7 = v39;
          goto LABEL_17;
        }
      }
      __break(1u);
LABEL_14:
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_2472063E8();
      if (!v9) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_31:
    __break(1u);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v42 = MEMORY[0x263F8EE78];
LABEL_17:
    char v16 = sub_2472050A8();
    unint64_t v17 = (void *)sub_2472059C8();
    unint64_t v45 = v18;
    id v46 = v17;
    sub_247204B48();
    uint64_t v19 = sub_247205A78();
    uint64_t v43 = v20;
    uint64_t v44 = v19;
    ((void (*)(char *, id))v5[1])(v7, v4);
    if (sub_2472050B8())
    {
      uint64_t v21 = (void *)sub_247205B78();
      swift_release();
    }
    else
    {
      uint64_t v21 = 0;
    }
    if (v16) {
      uint64_t v22 = 2;
    }
    else {
      uint64_t v22 = 0;
    }
    uint64_t v23 = v52;
    double v24 = *MEMORY[0x263F525B0];
    swift_bridgeObjectRetain();
    os_log_type_t v25 = (void *)sub_247205CF8();
    uint64_t v26 = sub_247205D18();
    char v28 = sub_2471D06E4(v25, v26, v27);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    BOOL v30 = (v28 & 1) == 0 && v28 != 2;
    uint64_t v31 = v50;
    char v32 = sub_2471CF360(v50);
    char v33 = v51;
    uint64_t v34 = v53;
    uint64_t v35 = v54;
    id v36 = objc_allocWithZone(MEMORY[0x263F525A0]);
    swift_bridgeObjectRetain();
    HIBYTE(v37) = v32 & 1;
    LOBYTE(v37) = v30;
    sub_2471DB4A8(v24, (uint64_t)v46, v45, v44, v43, v31, v22, v21, v23, 0, 0, 0, 0, 0, 0, 0, 0, 0, v37,
      1,
      v33,
      0,
      0,
      0,
      0,
      0,
      v42,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      v34,
      v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_2471F6D48(uint64_t a1, char *a2)
{
  uint64_t v4 = (void *)sub_247205A88();
  uint64_t v5 = (void *)*(v4 - 1);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2471E1514((uint64_t *)&v50);
  unint64_t v8 = *(void *)&a2[qword_26B1283F0];
  if (v8 >> 62) {
    goto LABEL_15;
  }
  uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v9)
  {
    while (1)
    {
      uint64_t v49 = MEMORY[0x263F8EE78];
      sub_2472063A8();
      if (v9 < 0) {
        break;
      }
      uint64_t v39 = v7;
      uint64_t v40 = v5;
      uint64_t v41 = v4;
      uint64_t v43 = a1;
      uint64_t v44 = (uint64_t)a2;
      uint64_t v10 = self;
      uint64_t v7 = 0;
      unint64_t v45 = v8 & 0xC000000000000001;
      id v46 = v10;
      uint64_t v5 = v48;
      unint64_t v11 = v8;
      while ((char *)v9 != v7)
      {
        if (v45) {
          id v12 = (id)MEMORY[0x24C54D1C0](v7, v8);
        }
        else {
          id v12 = *(id *)(v8 + 8 * (void)v7 + 32);
        }
        uint64_t v13 = v12;
        a1 = swift_allocObject();
        *(void *)(a1 + 16) = v13;
        uint64_t v14 = swift_allocObject();
        *(void *)(v14 + 16) = sub_2471DBF74;
        *(void *)(v14 + 24) = a1;
        v48[2] = sub_2471F89C0;
        v48[3] = v14;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        v48[0] = sub_2471C2024;
        v48[1] = &block_descriptor_5;
        a2 = (char *)_Block_copy(aBlock);
        unint64_t v8 = v13;
        swift_retain();
        swift_release();
        uint64_t v4 = objc_msgSend(v46, sel_newWithBuilder_, a2);
        _Block_release(a2);
        if (!v4) {
          goto LABEL_31;
        }
        swift_release();
        char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();

        swift_release();
        if (isEscapingClosureAtFileLocation) {
          goto LABEL_14;
        }
        ++v7;
        sub_247206388();
        sub_2472063B8();
        sub_2472063C8();
        sub_247206398();
        unint64_t v8 = v11;
        if ((char *)v9 == v7)
        {
          uint64_t v42 = v49;
          swift_bridgeObjectRelease();
          uint64_t v5 = v40;
          uint64_t v4 = v41;
          uint64_t v7 = v39;
          goto LABEL_17;
        }
      }
      __break(1u);
LABEL_14:
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_2472063E8();
      if (!v9) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_31:
    __break(1u);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v42 = MEMORY[0x263F8EE78];
LABEL_17:
    char v16 = sub_247205418();
    unint64_t v17 = (void *)sub_2472059C8();
    unint64_t v45 = v18;
    id v46 = v17;
    sub_247205428();
    uint64_t v19 = sub_247205A78();
    uint64_t v43 = v20;
    uint64_t v44 = v19;
    ((void (*)(char *, id))v5[1])(v7, v4);
    if (sub_247205438())
    {
      uint64_t v21 = (void *)sub_247205B78();
      swift_release();
    }
    else
    {
      uint64_t v21 = 0;
    }
    if (v16) {
      uint64_t v22 = 2;
    }
    else {
      uint64_t v22 = 0;
    }
    uint64_t v23 = v52;
    double v24 = *MEMORY[0x263F525B0];
    swift_bridgeObjectRetain();
    os_log_type_t v25 = (void *)sub_247205CF8();
    uint64_t v26 = sub_247205D18();
    char v28 = sub_2471D06E4(v25, v26, v27);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    BOOL v30 = (v28 & 1) == 0 && v28 != 2;
    uint64_t v31 = v50;
    char v32 = sub_2471CF360(v50);
    char v33 = v51;
    uint64_t v34 = v53;
    uint64_t v35 = v54;
    id v36 = objc_allocWithZone(MEMORY[0x263F525A0]);
    swift_bridgeObjectRetain();
    HIBYTE(v37) = v32 & 1;
    LOBYTE(v37) = v30;
    sub_2471DB4A8(v24, (uint64_t)v46, v45, v44, v43, v31, v22, v21, v23, 0, 0, 0, 0, 0, 0, 0, 0, 0, v37,
      1,
      v33,
      0,
      0,
      0,
      0,
      0,
      v42,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      v34,
      v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void *sub_2471F7240(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  unint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *unint64_t v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = v20;
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void _s9ASRBridge9AsrBridgeC27configuredMaxEagerRCAllowedSivgZ_0()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)sub_247205FC8();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    unint64_t v3 = (void *)sub_247205FC8();
    id v4 = objc_msgSend(v2, sel_stringForKey_, v3);

    if (v4)
    {
      uint64_t v5 = sub_247205FD8();
      unint64_t v7 = v6;

      uint64_t v8 = HIBYTE(v7) & 0xF;
      uint64_t v9 = v5 & 0xFFFFFFFFFFFFLL;
      if ((v7 & 0x2000000000000000) != 0) {
        uint64_t v10 = HIBYTE(v7) & 0xF;
      }
      else {
        uint64_t v10 = v5 & 0xFFFFFFFFFFFFLL;
      }
      if (v10)
      {
        if ((v7 & 0x1000000000000000) != 0)
        {
          uint64_t v12 = (uint64_t)sub_2471F463C(v5, v7, 10);
          LOBYTE(v5) = v32;
          goto LABEL_46;
        }
        if ((v7 & 0x2000000000000000) == 0)
        {
          if ((v5 & 0x1000000000000000) != 0) {
            unint64_t v11 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
          }
          else {
            unint64_t v11 = (unsigned __int8 *)sub_247206378();
          }
          uint64_t v12 = (uint64_t)sub_2471F4724(v11, v9, 10);
          LOBYTE(v5) = v13 & 1;
          goto LABEL_46;
        }
        v33[0] = v5;
        v33[1] = v7 & 0xFFFFFFFFFFFFFFLL;
        if (v5 == 43)
        {
          if (!v8) {
            goto LABEL_67;
          }
          if (v8 == 1 || (BYTE1(v5) - 48) > 9u) {
            goto LABEL_33;
          }
          uint64_t v12 = (BYTE1(v5) - 48);
          if (v8 != 2)
          {
            if ((BYTE2(v5) - 48) > 9u) {
              goto LABEL_33;
            }
            uint64_t v12 = 10 * (BYTE1(v5) - 48) + (BYTE2(v5) - 48);
            uint64_t v14 = v8 - 3;
            if (v14)
            {
              unint64_t v15 = (unsigned __int8 *)v33 + 3;
              while (1)
              {
                unsigned int v16 = *v15 - 48;
                if (v16 > 9) {
                  goto LABEL_33;
                }
                uint64_t v17 = 10 * v12;
                if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63) {
                  goto LABEL_33;
                }
                uint64_t v12 = v17 + v16;
                if (__OFADD__(v17, v16)) {
                  goto LABEL_33;
                }
                LOBYTE(v5) = 0;
                ++v15;
                if (!--v14) {
                  goto LABEL_46;
                }
              }
            }
          }
        }
        else
        {
          if (v5 == 45)
          {
            if (v8)
            {
              if (v8 != 1 && (BYTE1(v5) - 48) <= 9u)
              {
                if (v8 == 2)
                {
                  LOBYTE(v5) = 0;
                  uint64_t v12 = -(uint64_t)(BYTE1(v5) - 48);
LABEL_46:
                  swift_bridgeObjectRelease();
                  uint64_t v23 = 5;
                  if (v12 >= 0) {
                    uint64_t v23 = v12;
                  }
                  if (v5) {
                    uint64_t v24 = 5;
                  }
                  else {
                    uint64_t v24 = v23;
                  }
                  goto LABEL_59;
                }
                if ((BYTE2(v5) - 48) <= 9u)
                {
                  uint64_t v12 = -10 * (BYTE1(v5) - 48) - (BYTE2(v5) - 48);
                  uint64_t v22 = v8 - 3;
                  if (!v22) {
                    goto LABEL_45;
                  }
                  os_log_type_t v25 = (unsigned __int8 *)v33 + 3;
                  while (1)
                  {
                    unsigned int v26 = *v25 - 48;
                    if (v26 > 9) {
                      break;
                    }
                    uint64_t v27 = 10 * v12;
                    if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63) {
                      break;
                    }
                    uint64_t v12 = v27 - v26;
                    if (__OFSUB__(v27, v26)) {
                      break;
                    }
                    LOBYTE(v5) = 0;
                    ++v25;
                    if (!--v22) {
                      goto LABEL_46;
                    }
                  }
                }
              }
LABEL_33:
              uint64_t v12 = 0;
              LOBYTE(v5) = 1;
              goto LABEL_46;
            }
            __break(1u);
LABEL_67:
            __break(1u);
            return;
          }
          if (!v8 || (v5 - 48) > 9u) {
            goto LABEL_33;
          }
          uint64_t v12 = (v5 - 48);
          if (v8 != 1)
          {
            if ((BYTE1(v5) - 48) > 9u) {
              goto LABEL_33;
            }
            uint64_t v12 = 10 * (v5 - 48) + (BYTE1(v5) - 48);
            uint64_t v18 = v8 - 2;
            if (v18)
            {
              int64_t v19 = (unsigned __int8 *)v33 + 2;
              while (1)
              {
                unsigned int v20 = *v19 - 48;
                if (v20 > 9) {
                  goto LABEL_33;
                }
                uint64_t v21 = 10 * v12;
                if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63) {
                  goto LABEL_33;
                }
                uint64_t v12 = v21 + v20;
                if (__OFADD__(v21, v20)) {
                  goto LABEL_33;
                }
                LOBYTE(v5) = 0;
                ++v19;
                if (!--v18) {
                  goto LABEL_46;
                }
              }
            }
          }
        }
LABEL_45:
        LOBYTE(v5) = 0;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v24 = 5;
LABEL_59:
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_247205EA8();
  __swift_project_value_buffer(v28, (uint64_t)qword_26B128910);
  id v29 = sub_247205E98();
  os_log_type_t v30 = sub_247206178();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 134217984;
    v33[0] = v24;
    sub_2472062B8();
    _os_log_impl(&dword_2471B4000, v29, v30, "maxEagerRcAllowed: %ld", v31, 0xCu);
    MEMORY[0x24C54D9C0](v31, -1, -1);
  }
}

uint64_t sub_2471F78B4(void *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v42 = a6;
  uint64_t v43 = a3;
  v39[0] = a5;
  v39[1] = a1;
  v39[2] = a2;
  v39[3] = a4;
  uint64_t v8 = sub_247205EA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_247205E88();
  uint64_t v40 = *(void *)(v12 - 8);
  uint64_t v41 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = v6 + qword_26B128960;
  uint64_t v16 = sub_247204938();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  uint64_t v17 = qword_26B128978;
  *(unsigned char *)(v7 + qword_26B128978) = 0;
  *(void *)(v7 + qword_26B128938) = MEMORY[0x263F8EE78];
  uint64_t v18 = v7 + qword_26B128950;
  *(_OWORD *)uint64_t v18 = 0u;
  *(_OWORD *)(v18 + 16) = 0u;
  *(void *)(v18 + 32) = 0;
  uint64_t v19 = v7 + qword_26B128988;
  uint64_t v20 = sub_247205B68();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  *(unsigned char *)(v7 + qword_26B128948) = 0;
  uint64_t v21 = (void *)(v7 + qword_26B128968);
  *uint64_t v21 = 0;
  v21[1] = 0;
  *(void *)(v7 + qword_26B128958) = 0;
  *(void *)(v7 + qword_26B128980) = 0;
  uint64_t v22 = qword_26B128940;
  *(unsigned char *)(v7 + qword_26B128940) = 0;
  uint64_t v23 = qword_26B128378;
  swift_retain();
  if (v23 != -1) {
    swift_once();
  }
  id v24 = (id)qword_26B128778;
  sub_247205E68();
  sub_247206228();
  id v25 = (id)qword_26B128778;
  sub_247205E48();

  uint64_t v26 = type metadata accessor for MyriadDecisionMonitor();
  uint64_t inited = swift_initStaticObject();
  uint64_t v28 = (uint64_t *)(v7 + qword_26B1285B0);
  v28[3] = v26;
  v28[4] = (uint64_t)&off_26FB63E00;
  *uint64_t v28 = inited;
  if (qword_26B128368 != -1) {
    swift_once();
  }
  *(void *)(v7 + qword_26B1285C0) = qword_26B128770;
  swift_retain();
  _s9ASRBridge9AsrBridgeC27configuredMaxEagerRCAllowedSivgZ_0();
  *(void *)(v7 + qword_26B128970) = v29;
  *(unsigned char *)(v7 + v22) = AFDeviceSupportsSiriMUX();
  type metadata accessor for AsrCandidateRequestCacheManager();
  swift_allocObject();
  *(void *)(v7 + qword_26B1285C8) = sub_2471FC664();
  *(unsigned char *)(v7 + qword_26B1285B8) = AFDeviceSupportsMedoc();
  *(unsigned char *)(v7 + v17) = AFDeviceSupportsPatientSiri();
  swift_release();
  uint64_t v30 = v43;
  sub_2471CA8E4(v43, (uint64_t)v45);
  uint64_t v31 = v42;
  sub_2471CA8E4(v42, (uint64_t)v44);
  uint64_t v32 = qword_26B128578;
  swift_unknownObjectRetain();
  id v33 = v39[0];
  if (v32 != -1) {
    swift_once();
  }
  uint64_t v34 = __swift_project_value_buffer(v8, (uint64_t)qword_26B128910);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v34, v8);
  uint64_t v35 = sub_247205CB8();
  swift_retain();
  int v36 = AFDeviceSupportsHybridUOD();
  sub_2471ED074(v36);
  sub_247206218();
  id v37 = (id)qword_26B128778;
  sub_247205E58();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1(v31);
  __swift_destroy_boxed_opaque_existential_1(v30);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v14, v41);
  return v35;
}

unint64_t sub_2471F7DD0()
{
  unint64_t result = qword_269241498;
  if (!qword_269241498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269241498);
  }
  return result;
}

uint64_t sub_2471F7E24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, unsigned __int8 a20,uint64_t a21,char a22,unsigned __int8 a23,unsigned __int8 a24,uint64_t a25,unsigned __int8 a26,unsigned __int8 a27,uint64_t a28)
{
  uint64_t v75 = a7;
  uint64_t v76 = a8;
  uint64_t v61 = a6;
  uint64_t v77 = a5;
  uint64_t v64 = a4;
  uint64_t v72 = a3;
  uint64_t v73 = a1;
  uint64_t v74 = a2;
  uint64_t v67 = a16;
  os_log_t v66 = a15;
  int v59 = a27;
  int v58 = a26;
  int v57 = a20;
  int v56 = a24;
  int v55 = a23;
  uint64_t v54 = a19;
  uint64_t v71 = a10;
  uint64_t v52 = a9;
  uint64_t v53 = a18;
  uint64_t v63 = a12;
  uint64_t v65 = a11;
  unint64_t v62 = a14;
  uint64_t v29 = sub_247204938();
  uint64_t v69 = *(void *)(v29 - 8);
  uint64_t v70 = v29;
  MEMORY[0x270FA5388](v29);
  uint64_t v68 = (char *)&v51 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79[3] = type metadata accessor for MyriadDecisionMonitor();
  v79[4] = &off_26FB63E00;
  v79[0] = a13;
  uint64_t v31 = a28 + qword_26B1287A0;
  uint64_t v32 = sub_247205AA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v31, 1, 1, v32);
  *(unsigned char *)(a28 + qword_26B128798) = 0;
  *(void *)(a28 + qword_26B128790) = 0;
  *(void *)(a28 + qword_26B1287A8) = 0;
  *(unsigned char *)(a28 + qword_26B1287B0) = 0;
  id v33 = (void *)(a28 + qword_26B128460);
  *id v33 = 0;
  v33[1] = 0;
  *(unsigned char *)(a28 + qword_26B1283F8) = 0;
  *(void *)(a28 + qword_26B1283F0) = a21;
  *(unsigned char *)(a28 + qword_26B128408) = a22;
  sub_2471CA8E4(a11, a28 + qword_26B128420);
  sub_2471CA8E4(a12, a28 + qword_26B128488);
  uint64_t v34 = a28 + qword_26B1287C8;
  uint64_t v60 = sub_247205B68();
  uint64_t v35 = *(void *)(v60 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v34, a6, v60);
  *(void *)(a28 + qword_26B128480) = a17;
  uint64_t v36 = v52;
  sub_2471CA8E4(v52, a28 + qword_26B128478);
  sub_2471CA8E4((uint64_t)v79, a28 + qword_26B128440);
  uint64_t v37 = v54;
  *id v33 = v53;
  v33[1] = v37;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a28 + qword_26B128410) = v55;
  *(unsigned char *)(a28 + qword_26B128448) = v56;
  *(unsigned char *)(a28 + qword_26B128780) = v57;
  *(void *)(a28 + qword_26B128468) = a25;
  *(unsigned char *)(a28 + qword_26B1287B8) = v58;
  *(unsigned char *)(a28 + qword_26B1287C0) = v59;
  sub_2471CA8E4(v36, (uint64_t)v78);
  type metadata accessor for BufferedResultCandidateHandler();
  uint64_t v38 = (void *)swift_allocObject();
  v38[10] = 0;
  uint64_t v39 = v77;
  swift_bridgeObjectRetain();
  uint64_t v40 = MEMORY[0x263F8EE78];
  v38[11] = sub_2471EC83C(MEMORY[0x263F8EE78], &qword_2692414D8);
  v38[12] = 0;
  v38[7] = v64;
  v38[8] = v39;
  sub_2471CA8BC(v78, (uint64_t)(v38 + 2));
  *(void *)(a28 + qword_26B128498) = v38;
  uint64_t v41 = v62;
  *(void *)(a28 + qword_26B128430) = v62;
  uint64_t v42 = v66;
  *(void *)(a28 + qword_26B128458) = v66;
  v38[9] = a25;
  *(void *)(a28 + qword_26B1283E0) = v67;
  type metadata accessor for ASRMUXRequestContext();
  uint64_t v43 = swift_allocObject();
  id v44 = v42;
  swift_retain();
  swift_retain();
  id v45 = v41;
  *(void *)(v43 + 24) = sub_2471ECE64(v40, &qword_269241508);
  *(void *)(v43 + 32) = sub_2471ECB48(v40);
  *(unsigned char *)(v43 + 40) = 0;
  *(void *)(v43 + 16) = v38;
  *(void *)(a28 + qword_26B128788) = v43;
  swift_release();
  uint64_t v46 = v69;
  uint64_t v47 = v72;
  uint64_t v48 = v70;
  (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v68, v72, v70);
  sub_2471CA8E4(v36, (uint64_t)v78);
  uint64_t v49 = sub_247205D48();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v79);
  __swift_destroy_boxed_opaque_existential_1(v63);
  __swift_destroy_boxed_opaque_existential_1(v65);
  __swift_destroy_boxed_opaque_existential_1(v36);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v61, v60);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v47, v48);
  return v49;
}

uint64_t type metadata accessor for AsrBridge()
{
  uint64_t result = qword_26B127C18;
  if (!qword_26B127C18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2471F8484()
{
  sub_2471F8614(319, (unint64_t *)&unk_26B1282D0, MEMORY[0x263F07508]);
  if (v0 <= 0x3F)
  {
    sub_2471F8614(319, &qword_26B128348, MEMORY[0x263F70DF8]);
    if (v1 <= 0x3F) {
      swift_initClassMetadata2();
    }
  }
}

uint64_t method lookup function for AsrBridge(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AsrBridge);
}

void sub_2471F8614(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2472062A8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_2471F8668()
{
  return type metadata accessor for AsrBridge();
}

uint64_t getEnumTagSinglePayload for AsrBridge.AsrBridgeError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AsrBridge.AsrBridgeError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2471F87CCLL);
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

unsigned char *sub_2471F87F4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AsrBridge.AsrBridgeError()
{
  return &type metadata for AsrBridge.AsrBridgeError;
}

unint64_t sub_2471F8810()
{
  unint64_t result = qword_2692414A8;
  if (!qword_2692414A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692414A8);
  }
  return result;
}

uint64_t sub_2471F8864(void *a1, uint64_t a2, uint64_t (*a3)(void, void), uint64_t a4)
{
  return sub_2471E864C(a1, a3, a4);
}

uint64_t sub_2471F8870(void *a1, uint64_t a2, uint64_t (*a3)(void, void), uint64_t a4)
{
  return sub_2471E831C(a1, a3, a4);
}

void sub_2471F887C(void *a1, uint64_t a2, void (*a3)(void, void), void *a4)
{
}

uint64_t sub_2471F8888(void *a1, uint64_t a2, void (*a3)(void, void), uint64_t a4)
{
  return sub_2471E7188(a1, a3, a4);
}

void sub_2471F88AC()
{
}

void sub_2471F88EC(void *a1)
{
  sub_2471F5BE4(a1, v1);
}

uint64_t sub_2471F88F4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_2471F8958(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2471F89A4()
{
  return sub_2471DCE14(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2471F89B0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2471F89C0(uint64_t a1)
{
  return sub_2471DB480(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

void sub_2471F89E0(void *a1)
{
  sub_2471F4F78(a1, v1);
}

uint64_t objectdestroyTm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2471F8A2C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2471F8A64()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2471F8A98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2471F8AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CacheKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2471F8B78()
{
}

void sub_2471F8B94()
{
}

void sub_2471F8BB0(uint64_t a1, unint64_t a2)
{
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_247205EA8();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B128910);
  oslog = sub_247205E98();
  os_log_type_t v5 = sub_247206188();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v9 = v7;
    *(_DWORD *)uint64_t v6 = 136315394;
    sub_2471F3F68(a1, a2, &v9);
    sub_2472062B8();
    *(_WORD *)(v6 + 12) = 2080;
    sub_2471F3F68(0xD00000000000001FLL, 0x8000000247207850, &v9);
    sub_2472062B8();
    _os_log_impl(&dword_2471B4000, oslog, v5, "Unexpected %s called on base %s class", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v7, -1, -1);
    MEMORY[0x24C54D9C0](v6, -1, -1);
  }
  else
  {
  }
}

void sub_2471F8D8C()
{
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_247205EA8();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B128910);
  oslog = sub_247205E98();
  os_log_type_t v1 = sub_247206188();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = swift_slowAlloc();
    uint64_t v3 = swift_slowAlloc();
    uint64_t v5 = v3;
    *(_DWORD *)uint64_t v2 = 136315394;
    sub_2471F3F68(0xD000000000000032, 0x8000000247208F70, &v5);
    sub_2472062B8();
    *(_WORD *)(v2 + 12) = 2080;
    sub_2471F3F68(0xD00000000000001FLL, 0x8000000247207850, &v5);
    sub_2472062B8();
    _os_log_impl(&dword_2471B4000, oslog, v1, "Unexpected %s called on base %s class", (uint8_t *)v2, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v3, -1, -1);
    MEMORY[0x24C54D9C0](v2, -1, -1);
  }
  else
  {
  }
}

id sub_2471F9244()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SpeechRecognizerResponseHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2471F9344()
{
  return type metadata accessor for SpeechRecognizerResponseHandler();
}

uint64_t type metadata accessor for SpeechRecognizerResponseHandler()
{
  uint64_t result = qword_26B128520;
  if (!qword_26B128520) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2471F9398()
{
  uint64_t result = sub_247204938();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_2471F9458(char a1)
{
  unint64_t result = 0xD00000000000001ALL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000021;
      break;
    case 3:
      unint64_t result = 0xD000000000000021;
      break;
    case 4:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000024;
      break;
    case 6:
      unint64_t result = 0xD000000000000027;
      break;
    case 7:
      unint64_t result = 0xD00000000000002ELL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 9:
      unint64_t result = 0xD000000000000025;
      break;
    case 10:
      unint64_t result = 0xD000000000000020;
      break;
    case 11:
      unint64_t result = 0xD00000000000002CLL;
      break;
    case 12:
      unint64_t result = 0xD000000000000015;
      break;
    case 13:
      unint64_t result = 0x616972794D727361;
      break;
    case 16:
      unint64_t result = 0xD000000000000016;
      break;
    case 17:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 18:
      unint64_t result = 0xD00000000000002ELL;
      break;
    case 19:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2471F9628()
{
  return sub_247206528();
}

uint64_t sub_2471F96E8()
{
  sub_247204938();
  sub_247200868((unint64_t *)&unk_26B128290, MEMORY[0x263F07508]);
  sub_247205FA8();
  swift_bridgeObjectRetain();
  sub_247206018();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2471F979C()
{
  return sub_247206528();
}

uint64_t sub_2471F9858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((sub_247204918() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  uint64_t v9 = (void *)(a2 + v6);
  if (v7 == *v9 && v8 == v9[1]) {
    return 1;
  }
  return sub_2472064A8();
}

uint64_t sub_2471F98E0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v29 = a1;
  uint64_t v30 = a3;
  uint64_t v28 = a2;
  uint64_t v33 = sub_247205EE8();
  uint64_t v36 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v31 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_247205F18();
  uint64_t v34 = *(void *)(v8 - 8);
  uint64_t v35 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_247204938();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = *(void *)(v4 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a4, v11);
  unint64_t v15 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v16 = (v13 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = (v16 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v19 + v15, v14, v11);
  uint64_t v20 = (void *)(v19 + v16);
  uint64_t v21 = v30;
  void *v20 = v28;
  v20[1] = v21;
  *(void *)(v19 + v17) = v5;
  uint64_t v22 = v29;
  *(void *)(v19 + v18) = v29;
  aBlock[4] = sub_247200780;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_247200920;
  aBlock[3] = &block_descriptor_33;
  uint64_t v23 = _Block_copy(aBlock);
  id v24 = v22;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_247205EF8();
  uint64_t v37 = MEMORY[0x263F8EE78];
  sub_247200868(&qword_26B128360, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1285E0);
  sub_2472008B0((unint64_t *)&qword_26B1285F0, (uint64_t *)&unk_26B1285E0);
  id v25 = v31;
  uint64_t v26 = v33;
  sub_2472062E8();
  MEMORY[0x24C54D030](0, v10, v25, v23);
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v35);
  return swift_release();
}

uint64_t sub_2471F9CA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = type metadata accessor for CacheKey();
  uint64_t v11 = v10 - 8;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v36 - v15;
  uint64_t v17 = sub_247204938();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v16, a1, v17);
  unint64_t v18 = &v16[*(int *)(v11 + 28)];
  *(void *)unint64_t v18 = a2;
  *((void *)v18 + 1) = a3;
  uint64_t v19 = (uint64_t *)(a4 + 24);
  swift_beginAccess();
  uint64_t v20 = *(void *)(a4 + 24);
  uint64_t v21 = *(void *)(v20 + 16);
  swift_bridgeObjectRetain();
  if (v21)
  {
    swift_bridgeObjectRetain();
    unint64_t v22 = sub_2471FCB1C((uint64_t)v16);
    if (v23)
    {
      uint64_t v24 = *(void *)(v20 + 56) + 56 * v22;
      id v25 = *(void **)v24;
      uint64_t v26 = *(void *)(v24 + 8);
      char v27 = *(unsigned char *)(v24 + 16);
      uint64_t v28 = *(void *)(v24 + 24);
      int v37 = *(unsigned __int8 *)(v24 + 32);
      uint64_t v29 = *(void *)(v24 + 48);
      uint64_t v36 = *(void *)(v24 + 40);
      swift_bridgeObjectRetain_n();
      id v30 = v25;
      swift_bridgeObjectRelease();

      sub_247200308((uint64_t)v16, (uint64_t)v14);
      uint64_t v39 = a5;
      uint64_t v40 = v26;
      char v41 = v27;
      uint64_t v42 = v28;
      char v43 = v37;
      uint64_t v44 = v36;
      uint64_t v45 = v29;
      swift_beginAccess();
      id v31 = a5;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v38 = *v19;
      uint64_t *v19 = 0x8000000000000000;
      sub_2471FEF20((uint64_t)&v39, (uint64_t)v14, isUniquelyReferenced_nonNull_native);
      uint64_t *v19 = v38;
      swift_bridgeObjectRelease();
      sub_2471FCE90((uint64_t)v14);
      swift_endAccess();
      sub_2471FCE90((uint64_t)v16);
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  sub_247200308((uint64_t)v16, (uint64_t)v14);
  uint64_t v39 = a5;
  uint64_t v40 = 0;
  char v41 = 1;
  uint64_t v42 = 0;
  char v43 = 1;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  swift_beginAccess();
  id v34 = a5;
  char v35 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v38 = *v19;
  uint64_t *v19 = 0x8000000000000000;
  sub_2471FEF20((uint64_t)&v39, (uint64_t)v14, v35);
  uint64_t *v19 = v38;
  swift_bridgeObjectRelease();
  sub_2471FCE90((uint64_t)v14);
  swift_endAccess();
  return sub_2471FCE90((uint64_t)v16);
}

uint64_t sub_2471F9F74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v10 = type metadata accessor for CacheKey();
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_247204938();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v13, a1, v14);
  uint64_t v15 = &v13[*(int *)(v11 + 28)];
  *(void *)uint64_t v15 = a2;
  *((void *)v15 + 1) = a3;
  swift_beginAccess();
  uint64_t v16 = *(void *)(a4 + 24);
  uint64_t v17 = *(void *)(v16 + 16);
  swift_bridgeObjectRetain();
  if (!v17) {
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  unint64_t v18 = sub_2471FCB1C((uint64_t)v13);
  if ((v19 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    uint64_t result = sub_2471FCE90((uint64_t)v13);
    goto LABEL_7;
  }
  uint64_t v20 = *(void *)(v16 + 56) + 56 * v18;
  uint64_t v21 = *(void **)v20;
  v25[7] = *(unsigned __int8 *)(v20 + 16);
  v25[2] = *(unsigned __int8 *)(v20 + 32);
  v25[1] = *(void *)(v20 + 40);
  swift_bridgeObjectRetain();
  id v22 = v21;
  swift_bridgeObjectRelease();
  uint64_t result = sub_2471FCE90((uint64_t)v13);
  if (v21 == (void *)1)
  {
LABEL_7:
    uint64_t v21 = 0;
    goto LABEL_8;
  }
  id v24 = v22;
  uint64_t result = (uint64_t)sub_2471FCE4C(v21);
LABEL_8:
  *a5 = v21;
  return result;
}

uint64_t sub_2471FA134(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2471FA610(a1, a2, a3, a4, a5, (uint64_t)&unk_26FB64800, (uint64_t)sub_2472005D4, (uint64_t)&block_descriptor_27);
}

uint64_t sub_2471FA15C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v12 = type metadata accessor for CacheKey();
  uint64_t v13 = v12 - 8;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)&v35 - v17;
  uint64_t v19 = sub_247204938();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v18, a1, v19);
  uint64_t v20 = &v18[*(int *)(v13 + 28)];
  *(void *)uint64_t v20 = a2;
  *((void *)v20 + 1) = a3;
  uint64_t v21 = (uint64_t *)(a4 + 24);
  swift_beginAccess();
  uint64_t v22 = *(void *)(a4 + 24);
  uint64_t v23 = *(void *)(v22 + 16);
  swift_bridgeObjectRetain();
  if (!v23) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  unint64_t v24 = sub_2471FCB1C((uint64_t)v18);
  if ((v25 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_247200308((uint64_t)v18, (uint64_t)v16);
    uint64_t v38 = 0;
    uint64_t v39 = a5;
    char v40 = a6 & 1;
    uint64_t v41 = 0;
    char v42 = 1;
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v37 = *v21;
    *uint64_t v21 = 0x8000000000000000;
    sub_2471FEF20((uint64_t)&v38, (uint64_t)v16, isUniquelyReferenced_nonNull_native);
    *uint64_t v21 = v37;
    swift_bridgeObjectRelease();
    sub_2471FCE90((uint64_t)v16);
    swift_endAccess();
    return sub_2471FCE90((uint64_t)v18);
  }
  uint64_t v26 = *(void *)(v22 + 56) + 56 * v24;
  char v27 = *(void **)v26;
  uint64_t v28 = *(void *)(v26 + 24);
  char v29 = *(unsigned char *)(v26 + 32);
  uint64_t v30 = *(void *)(v26 + 48);
  uint64_t v35 = *(void *)(v26 + 40);
  swift_bridgeObjectRetain();
  id v36 = v27;
  swift_bridgeObjectRelease();
  sub_247200308((uint64_t)v18, (uint64_t)v16);
  uint64_t v38 = v27;
  uint64_t v39 = a5;
  char v40 = a6 & 1;
  uint64_t v41 = v28;
  char v42 = v29;
  uint64_t v43 = v35;
  uint64_t v44 = v30;
  swift_beginAccess();
  id v31 = v36;
  swift_bridgeObjectRetain();
  char v32 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v37 = *v21;
  *uint64_t v21 = 0x8000000000000000;
  sub_2471FEF20((uint64_t)&v38, (uint64_t)v16, v32);
  *uint64_t v21 = v37;
  swift_bridgeObjectRelease();
  sub_2471FCE90((uint64_t)v16);
  swift_endAccess();
  swift_bridgeObjectRelease();

  return sub_2471FCE90((uint64_t)v18);
}

uint64_t sub_2471FA428@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for CacheKey();
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_247204938();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v13, a1, v14);
  uint64_t v15 = &v13[*(int *)(v11 + 28)];
  *(void *)uint64_t v15 = a2;
  *((void *)v15 + 1) = a3;
  swift_beginAccess();
  uint64_t v16 = *(void *)(a4 + 24);
  uint64_t v17 = *(void *)(v16 + 16);
  swift_bridgeObjectRetain();
  if (!v17) {
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  unint64_t v18 = sub_2471FCB1C((uint64_t)v13);
  if ((v19 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    uint64_t result = sub_2471FCE90((uint64_t)v13);
    goto LABEL_7;
  }
  uint64_t v20 = *(void *)(v16 + 56) + 56 * v18;
  uint64_t v22 = *(void **)v20;
  uint64_t v21 = *(void *)(v20 + 8);
  char v23 = *(unsigned char *)(v20 + 16);
  v26[5] = *(unsigned __int8 *)(v20 + 32);
  v26[0] = *(void *)(v20 + 40);
  swift_bridgeObjectRetain();
  id v24 = v22;
  swift_bridgeObjectRelease();
  uint64_t result = sub_2471FCE90((uint64_t)v13);
  if (v22 == (void *)1)
  {
LABEL_7:
    uint64_t v21 = 0;
    char v23 = 1;
    goto LABEL_8;
  }
  uint64_t result = (uint64_t)sub_2471FCE4C(v22);
LABEL_8:
  *(void *)a5 = v21;
  *(unsigned char *)(a5 + 8) = v23;
  return result;
}

uint64_t sub_2471FA5E8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2471FA610(a1, a2, a3, a4, a5, (uint64_t)&unk_26FB647B0, (uint64_t)sub_2472004F0, (uint64_t)&block_descriptor_21);
}

uint64_t sub_2471FA610(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v37 = a8;
  uint64_t v35 = a7;
  v29[1] = a6;
  uint64_t v30 = a3;
  uint64_t v31 = a4;
  uint64_t v32 = a1;
  int v33 = a2;
  uint64_t v38 = sub_247205EE8();
  uint64_t v41 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  id v34 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_247205F18();
  uint64_t v39 = *(void *)(v11 - 8);
  uint64_t v40 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_247204938();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = *(void *)(v8 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a5, v14);
  unint64_t v18 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v19 = (v16 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (v19 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v21 + v18, v17, v14);
  uint64_t v22 = (void *)(v21 + v19);
  uint64_t v23 = v31;
  *uint64_t v22 = v30;
  v22[1] = v23;
  *(void *)(v21 + v20) = v8;
  unint64_t v24 = v21 + ((v20 + 15) & 0xFFFFFFFFFFFFFFF8);
  *(void *)unint64_t v24 = v32;
  *(unsigned char *)(v24 + 8) = v33 & 1;
  aBlock[4] = v35;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_247200920;
  aBlock[3] = v37;
  char v25 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_247205EF8();
  uint64_t v42 = MEMORY[0x263F8EE78];
  sub_247200868(&qword_26B128360, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1285E0);
  sub_2472008B0((unint64_t *)&qword_26B1285F0, (uint64_t *)&unk_26B1285E0);
  uint64_t v26 = v34;
  uint64_t v27 = v38;
  sub_2472062E8();
  MEMORY[0x24C54D030](0, v13, v26, v25);
  _Block_release(v25);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v26, v27);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v40);
  return swift_release();
}

uint64_t sub_2471FA9D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v12 = type metadata accessor for CacheKey();
  uint64_t v13 = v12 - 8;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)&v35 - v17;
  uint64_t v19 = sub_247204938();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v18, a1, v19);
  unint64_t v20 = &v18[*(int *)(v13 + 28)];
  *(void *)unint64_t v20 = a2;
  *((void *)v20 + 1) = a3;
  uint64_t v21 = (uint64_t *)(a4 + 24);
  swift_beginAccess();
  uint64_t v22 = *(void *)(a4 + 24);
  uint64_t v23 = *(void *)(v22 + 16);
  swift_bridgeObjectRetain();
  if (!v23) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  unint64_t v24 = sub_2471FCB1C((uint64_t)v18);
  if ((v25 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_247200308((uint64_t)v18, (uint64_t)v16);
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    char v40 = 1;
    uint64_t v41 = a5;
    char v42 = a6 & 1;
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v37 = *v21;
    *uint64_t v21 = 0x8000000000000000;
    sub_2471FEF20((uint64_t)&v38, (uint64_t)v16, isUniquelyReferenced_nonNull_native);
    *uint64_t v21 = v37;
    swift_bridgeObjectRelease();
    sub_2471FCE90((uint64_t)v16);
    swift_endAccess();
    return sub_2471FCE90((uint64_t)v18);
  }
  uint64_t v26 = *(void *)(v22 + 56) + 56 * v24;
  uint64_t v27 = *(void **)v26;
  uint64_t v28 = *(void *)(v26 + 8);
  char v29 = *(unsigned char *)(v26 + 16);
  uint64_t v30 = *(void *)(v26 + 48);
  uint64_t v35 = *(void *)(v26 + 40);
  swift_bridgeObjectRetain();
  id v36 = v27;
  swift_bridgeObjectRelease();
  sub_247200308((uint64_t)v18, (uint64_t)v16);
  uint64_t v38 = v27;
  uint64_t v39 = v28;
  char v40 = v29;
  uint64_t v41 = a5;
  char v42 = a6 & 1;
  uint64_t v43 = v35;
  uint64_t v44 = v30;
  swift_beginAccess();
  id v31 = v36;
  swift_bridgeObjectRetain();
  char v32 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v37 = *v21;
  *uint64_t v21 = 0x8000000000000000;
  sub_2471FEF20((uint64_t)&v38, (uint64_t)v16, v32);
  *uint64_t v21 = v37;
  swift_bridgeObjectRelease();
  sub_2471FCE90((uint64_t)v16);
  swift_endAccess();
  swift_bridgeObjectRelease();

  return sub_2471FCE90((uint64_t)v18);
}

uint64_t sub_2471FACA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for CacheKey();
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_247204938();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v13, a1, v14);
  uint64_t v15 = &v13[*(int *)(v11 + 28)];
  *(void *)uint64_t v15 = a2;
  *((void *)v15 + 1) = a3;
  swift_beginAccess();
  uint64_t v16 = *(void *)(a4 + 24);
  uint64_t v17 = *(void *)(v16 + 16);
  swift_bridgeObjectRetain();
  if (!v17) {
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  unint64_t v18 = sub_2471FCB1C((uint64_t)v13);
  if ((v19 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    uint64_t result = sub_2471FCE90((uint64_t)v13);
    goto LABEL_7;
  }
  uint64_t v20 = *(void *)(v16 + 56) + 56 * v18;
  uint64_t v21 = *(void **)v20;
  v26[5] = *(unsigned __int8 *)(v20 + 16);
  uint64_t v22 = *(void *)(v20 + 24);
  char v23 = *(unsigned char *)(v20 + 32);
  v26[0] = *(void *)(v20 + 40);
  swift_bridgeObjectRetain();
  id v24 = v21;
  swift_bridgeObjectRelease();
  uint64_t result = sub_2471FCE90((uint64_t)v13);
  if (v21 == (void *)1)
  {
LABEL_7:
    uint64_t v22 = 0;
    char v23 = 1;
    goto LABEL_8;
  }
  uint64_t result = (uint64_t)sub_2471FCE4C(v21);
LABEL_8:
  *(void *)a5 = v22;
  *(unsigned char *)(a5 + 8) = v23;
  return result;
}

uint64_t sub_2471FAE60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  uint64_t v34 = sub_247205EE8();
  uint64_t v37 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  char v32 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_247205F18();
  uint64_t v35 = *(void *)(v8 - 8);
  uint64_t v36 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_247204938();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = *(void *)(v5 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a5, v11);
  unint64_t v15 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v16 = (v13 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = (v16 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v18 + v15, v14, v11);
  char v19 = (void *)(v18 + v16);
  uint64_t v20 = v29;
  void *v19 = v28;
  v19[1] = v20;
  *(void *)(v18 + v17) = v5;
  uint64_t v21 = (void *)(v18 + ((v17 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v22 = v31;
  *uint64_t v21 = v30;
  v21[1] = v22;
  aBlock[4] = sub_247200440;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_247200920;
  aBlock[3] = &block_descriptor_15;
  char v23 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_247205EF8();
  uint64_t v38 = MEMORY[0x263F8EE78];
  sub_247200868(&qword_26B128360, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1285E0);
  sub_2472008B0((unint64_t *)&qword_26B1285F0, (uint64_t *)&unk_26B1285E0);
  id v24 = v32;
  uint64_t v25 = v34;
  sub_2472062E8();
  MEMORY[0x24C54D030](0, v10, v24, v23);
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v24, v25);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v36);
  return swift_release();
}

void sub_2471FB22C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = type metadata accessor for CacheKey();
  uint64_t v13 = v12 - 8;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  unint64_t v16 = &v33[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = &v33[-v17];
  uint64_t v19 = sub_247204938();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v18, a1, v19);
  uint64_t v20 = &v18[*(int *)(v13 + 28)];
  void *v20 = a2;
  v20[1] = a3;
  uint64_t v21 = (uint64_t *)(a4 + 24);
  swift_beginAccess();
  uint64_t v22 = *(void *)(a4 + 24);
  uint64_t v23 = *(void *)(v22 + 16);
  swift_bridgeObjectRetain();
  if (v23)
  {
    swift_bridgeObjectRetain();
    unint64_t v24 = sub_2471FCB1C((uint64_t)v18);
    if (v25)
    {
      uint64_t v26 = *(void *)(v22 + 56) + 56 * v24;
      uint64_t v27 = *(void **)v26;
      uint64_t v28 = *(void *)(v26 + 8);
      int v36 = *(unsigned __int8 *)(v26 + 16);
      uint64_t v35 = *(void *)(v26 + 24);
      int v34 = *(unsigned __int8 *)(v26 + 32);
      swift_bridgeObjectRetain();
      id v29 = v27;
      swift_bridgeObjectRelease();
      id v30 = v29;
      swift_bridgeObjectRelease();
      sub_247200308((uint64_t)v18, (uint64_t)v16);
      uint64_t v38 = v27;
      uint64_t v39 = v28;
      char v40 = v36;
      uint64_t v41 = v35;
      char v42 = v34;
      uint64_t v43 = a5;
      uint64_t v44 = a6;
      swift_beginAccess();
      swift_bridgeObjectRetain_n();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v37 = *v21;
      *uint64_t v21 = 0x8000000000000000;
      sub_2471FEF20((uint64_t)&v38, (uint64_t)v16, isUniquelyReferenced_nonNull_native);
      *uint64_t v21 = v37;
      swift_bridgeObjectRelease();
      sub_2471FCE90((uint64_t)v16);
      swift_endAccess();
      sub_2471FCE90((uint64_t)v18);
      swift_bridgeObjectRelease();

      return;
    }
    swift_bridgeObjectRelease();
  }
  sub_247200308((uint64_t)v18, (uint64_t)v16);
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  char v40 = 1;
  uint64_t v41 = 0;
  char v42 = 1;
  uint64_t v43 = a5;
  uint64_t v44 = a6;
  swift_beginAccess();
  swift_bridgeObjectRetain_n();
  char v32 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v37 = *v21;
  *uint64_t v21 = 0x8000000000000000;
  sub_2471FEF20((uint64_t)&v38, (uint64_t)v16, v32);
  *uint64_t v21 = v37;
  swift_bridgeObjectRelease();
  sub_2471FCE90((uint64_t)v16);
  swift_endAccess();
  sub_2471FCE90((uint64_t)v18);
  swift_bridgeObjectRelease();
}

uint64_t sub_2471FB528@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v10 = type metadata accessor for CacheKey();
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_247204938();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v13, a1, v14);
  uint64_t v15 = &v13[*(int *)(v11 + 28)];
  *(void *)uint64_t v15 = a2;
  *((void *)v15 + 1) = a3;
  swift_beginAccess();
  uint64_t v16 = *(void *)(a4 + 24);
  uint64_t v17 = *(void *)(v16 + 16);
  swift_bridgeObjectRetain();
  if (!v17) {
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  unint64_t v18 = sub_2471FCB1C((uint64_t)v13);
  if ((v19 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    uint64_t result = sub_2471FCE90((uint64_t)v13);
    goto LABEL_7;
  }
  uint64_t v20 = *(void *)(v16 + 56) + 56 * v18;
  uint64_t v21 = *(void **)v20;
  v26[5] = *(void *)(v20 + 24);
  v26[0] = *(unsigned __int8 *)(v20 + 32);
  uint64_t v23 = *(void *)(v20 + 40);
  uint64_t v22 = *(void *)(v20 + 48);
  swift_bridgeObjectRetain();
  id v24 = v21;
  swift_bridgeObjectRelease();
  uint64_t result = sub_2471FCE90((uint64_t)v13);
  if (v21 != (void *)1)
  {
    swift_bridgeObjectRetain();
    uint64_t result = (uint64_t)sub_2471FCE4C(v21);
    *a5 = v23;
    a5[1] = v22;
    return result;
  }
LABEL_7:
  *a5 = 0;
  a5[1] = 0;
  return result;
}

uint64_t sub_2471FB6E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  uint64_t v25 = sub_247205EE8();
  uint64_t v28 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_247205F18();
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v27 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_247204938();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = *(void *)(v3 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a3, v10);
  unint64_t v14 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v15 = (v12 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v16 + v14, v13, v10);
  uint64_t v17 = (void *)(v16 + v15);
  uint64_t v18 = v23;
  *uint64_t v17 = v22;
  v17[1] = v18;
  *(void *)(v16 + ((v15 + 23) & 0xFFFFFFFFFFFFFFF8)) = v3;
  aBlock[4] = sub_2471FC5B0;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_247200920;
  aBlock[3] = &block_descriptor_6;
  char v19 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_247205EF8();
  uint64_t v29 = MEMORY[0x263F8EE78];
  sub_247200868(&qword_26B128360, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1285E0);
  sub_2472008B0((unint64_t *)&qword_26B1285F0, (uint64_t *)&unk_26B1285E0);
  uint64_t v20 = v25;
  sub_2472062E8();
  MEMORY[0x24C54D030](0, v9, v6, v19);
  _Block_release(v19);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v20);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v27);
  return swift_release();
}

uint64_t sub_2471FBA84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CacheKey();
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_247204938();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v9, a1, v10);
  uint64_t v11 = &v9[*(int *)(v7 + 28)];
  *uint64_t v11 = a2;
  v11[1] = a3;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_2471FCCD4((uint64_t)v9, (uint64_t *)v14);
  swift_endAccess();
  sub_2471FCE14(v14);
  return sub_2471FCE90((uint64_t)v9);
}

uint64_t sub_2471FBBA0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for AsrCandidateRequestCacheManager()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for AsrCandidateRequestCache(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AsrCandidateRequestCache(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AsrCandidateRequestCache(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  id v6 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AsrCandidateRequestCache(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  uint64_t v7 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v7;
  uint64_t v8 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AsrCandidateRequestCache(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AsrCandidateRequestCache(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 56)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AsrCandidateRequestCache(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AsrCandidateRequestCache()
{
  return &type metadata for AsrCandidateRequestCache;
}

uint64_t *sub_2471FBEA0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_247204938();
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

uint64_t sub_2471FBF78(uint64_t a1)
{
  uint64_t v2 = sub_247204938();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2471FBFF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247204938();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  void *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2471FC078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247204938();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2471FC114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247204938();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_2471FC190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247204938();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  void *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2471FC21C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2471FC230);
}

uint64_t sub_2471FC230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247204938();
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

uint64_t sub_2471FC2F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2471FC308);
}

uint64_t sub_2471FC308(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_247204938();
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

uint64_t type metadata accessor for CacheKey()
{
  uint64_t result = qword_26B128588;
  if (!qword_26B128588) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2471FC414()
{
  uint64_t result = sub_247204938();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2471FC4A8()
{
  return sub_247200868(&qword_26B128580, (void (*)(uint64_t))type metadata accessor for CacheKey);
}

uint64_t sub_2471FC4F0()
{
  uint64_t v1 = sub_247204938();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t sub_2471FC5B0()
{
  uint64_t v1 = *(void *)(sub_247204938() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(v0 + v3);
  uint64_t v5 = *(void *)(v0 + v3 + 8);
  return sub_2471FBA84(v0 + v2, v4, v5);
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t sub_2471FC664()
{
  uint64_t v1 = sub_2472061B8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2472061A8();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_247205F18();
  MEMORY[0x270FA5388](v6 - 8);
  v8[0] = sub_247200828();
  sub_247205F08();
  v8[1] = MEMORY[0x263F8EE78];
  sub_247200868(&qword_26B128670, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128600);
  sub_2472008B0(qword_26B128610, (uint64_t *)&unk_26B128600);
  sub_2472062E8();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F130], v1);
  *(void *)(v0 + 16) = sub_2472061E8();
  *(void *)(v0 + 24) = sub_2471ECC5C(MEMORY[0x263F8EE78]);
  return v0;
}

unint64_t sub_2471FC8B8(uint64_t a1, uint64_t a2)
{
  sub_247206508();
  sub_247206018();
  uint64_t v4 = sub_247206528();
  return sub_2471FF224(a1, a2, v4);
}

unint64_t sub_2471FC930(uint64_t a1)
{
  sub_247205B68();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x263F70DF8];
  sub_247200868(&qword_2692415B0, MEMORY[0x263F70DF8]);
  uint64_t v3 = sub_247205F98();
  return sub_2471FF308(a1, v3, MEMORY[0x263F70DF8], &qword_2692415B8, v2, MEMORY[0x263F70E10]);
}

unint64_t sub_2471FCA04(uint64_t a1)
{
  sub_247205AE8();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x263F70D70];
  sub_247200868(&qword_2692415A0, MEMORY[0x263F70D70]);
  uint64_t v3 = sub_247205F98();
  return sub_2471FF308(a1, v3, MEMORY[0x263F70D70], &qword_2692415A8, v2, MEMORY[0x263F70D80]);
}

unint64_t sub_2471FCAD8(uint64_t a1)
{
  uint64_t v2 = sub_247206308();
  return sub_2471FF4A8(a1, v2);
}

unint64_t sub_2471FCB1C(uint64_t a1)
{
  sub_247206508();
  sub_247204938();
  sub_247200868((unint64_t *)&unk_26B128290, MEMORY[0x263F07508]);
  sub_247205FA8();
  type metadata accessor for CacheKey();
  swift_bridgeObjectRetain();
  sub_247206018();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_247206528();
  return sub_2471FF570(a1, v2);
}

uint64_t sub_2471FCC04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_2471FC8B8(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 2;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2471FFBE4();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(v9 + 56) + v6);
  sub_2471FE3D8(v6, v9);
  uint64_t *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2471FCCD4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_2471FCB1C(a1);
  LOBYTE(a1) = v7;
  uint64_t result = swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v10 = *v3;
    uint64_t v22 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_247200028();
      uint64_t v10 = v22;
    }
    uint64_t v11 = *(void *)(v10 + 48);
    uint64_t v12 = type metadata accessor for CacheKey();
    sub_2471FCE90(v11 + *(void *)(*(void *)(v12 - 8) + 72) * v6);
    uint64_t v13 = *(void *)(v10 + 56) + 56 * v6;
    uint64_t v14 = *(void *)v13;
    uint64_t v21 = *(void *)(v13 + 8);
    uint64_t v15 = *(unsigned __int8 *)(v13 + 16);
    uint64_t v16 = *(void *)(v13 + 24);
    uint64_t v17 = *(unsigned __int8 *)(v13 + 32);
    uint64_t v19 = *(void *)(v13 + 40);
    uint64_t v18 = *(void *)(v13 + 48);
    sub_2471FE5B0(v6, v10);
    uint64_t *v3 = v10;
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v20 = v21;
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v19 = 0;
    uint64_t v18 = 0;
    uint64_t v14 = 1;
  }
  *a2 = v14;
  a2[1] = v20;
  a2[2] = v15;
  a2[3] = v16;
  a2[4] = v17;
  a2[5] = v19;
  a2[6] = v18;
  return result;
}

void **sub_2471FCE14(void **a1)
{
  return a1;
}

void *sub_2471FCE4C(void *result)
{
  if (result != (void *)1)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2471FCE90(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CacheKey();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2471FCEEC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B1286E0);
  char v38 = a2;
  uint64_t v6 = sub_247206408();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  int v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1)) {
      goto LABEL_40;
    }
    if (v14 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v14);
    if (!v24)
    {
      int64_t v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        uint64_t v3 = v36;
        if ((v38 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          int64_t v14 = v25 + 1;
          if (__OFADD__(v25, 1)) {
            break;
          }
          if (v14 >= v11) {
            goto LABEL_31;
          }
          unint64_t v24 = *(void *)(v37 + 8 * v14);
          ++v25;
          if (v24) {
            goto LABEL_20;
          }
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    uint64_t v26 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void **)(*(void *)(v5 + 56) + 8 * v21);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v30 = v29;
    }
    sub_247206508();
    sub_247206018();
    uint64_t result = sub_247206528();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v33 = v17 == v32;
        if (v17 == v32) {
          unint64_t v17 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v17);
      }
      while (v34 == -1);
      unint64_t v18 = __clz(__rbit64(~v34)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    void *v19 = v28;
    v19[1] = v27;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v29;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_2471FD1DC(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v39 = a2;
  uint64_t v7 = sub_247206408();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    uint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    id v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    BOOL v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_247206508();
    sub_247206018();
    uint64_t result = sub_247206528();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v36;
  uint64_t v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_2471FD4E8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269241508);
  char v36 = a2;
  uint64_t v6 = sub_247206408();
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
    int64_t v22 = (void *)(v5 + 64);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_247206508();
    sub_247206018();
    uint64_t result = sub_247206528();
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
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_2471FD800(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692414E0);
  char v37 = a2;
  uint64_t v6 = sub_247206408();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v35) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    char v32 = *(unsigned char *)(*(void *)(v5 + 56) + v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_247206508();
    sub_247206018();
    uint64_t result = sub_247206528();
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
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(unsigned char *)(*(void *)(v7 + 56) + v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  int64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_2471FDB0C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_247205B68();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692414F8);
  int v46 = a2;
  uint64_t v10 = sub_247206408();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  char v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  char v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  unint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    char v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    sub_247200868(&qword_2692415B0, MEMORY[0x263F70DF8]);
    uint64_t result = sub_247205F98();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  char v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v12;
  return result;
}

uint64_t sub_2471FDF30(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for CacheKey();
  uint64_t v48 = *(void *)(v5 - 8);
  uint64_t v49 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286D0);
  int v50 = a2;
  uint64_t v9 = sub_247206408();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  int v46 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v44 = v2;
  int64_t v45 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  uint64_t v47 = v8;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v45) {
      break;
    }
    unint64_t v23 = v46;
    unint64_t v24 = v46[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v45) {
        goto LABEL_34;
      }
      unint64_t v24 = v46[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v45)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v44;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v46[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v45) {
              goto LABEL_34;
            }
            unint64_t v24 = v46[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v48 + 72);
    uint64_t v27 = *(void *)(v8 + 48) + v26 * v21;
    if (v50)
    {
      sub_2471F8AFC(v27, (uint64_t)v7);
      uint64_t v28 = *(void *)(v8 + 56) + 56 * v21;
      long long v54 = *(_OWORD *)v28;
      int v53 = *(unsigned __int8 *)(v28 + 16);
      uint64_t v52 = *(void *)(v28 + 24);
      int v51 = *(unsigned __int8 *)(v28 + 32);
      uint64_t v30 = *(void *)(v28 + 40);
      uint64_t v29 = *(void *)(v28 + 48);
    }
    else
    {
      sub_247200308(v27, (uint64_t)v7);
      uint64_t v31 = *(void *)(v8 + 56) + 56 * v21;
      long long v32 = *(_OWORD *)v31;
      int v53 = *(unsigned __int8 *)(v31 + 16);
      uint64_t v52 = *(void *)(v31 + 24);
      int v51 = *(unsigned __int8 *)(v31 + 32);
      uint64_t v30 = *(void *)(v31 + 40);
      uint64_t v29 = *(void *)(v31 + 48);
      long long v54 = v32;
      unint64_t v33 = (void *)v32;
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_247206508();
    sub_247204938();
    sub_247200868((unint64_t *)&unk_26B128290, MEMORY[0x263F07508]);
    sub_247205FA8();
    swift_bridgeObjectRetain();
    sub_247206018();
    swift_bridgeObjectRelease();
    uint64_t result = sub_247206528();
    uint64_t v35 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v36 = result & ~v35;
    unint64_t v37 = v36 >> 6;
    if (((-1 << v36) & ~*(void *)(v15 + 8 * (v36 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v36) & ~*(void *)(v15 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v8 = v47;
    }
    else
    {
      char v38 = 0;
      unint64_t v39 = (unint64_t)(63 - v35) >> 6;
      uint64_t v8 = v47;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v40 = v37 == v39;
        if (v37 == v39) {
          unint64_t v37 = 0;
        }
        v38 |= v40;
        uint64_t v41 = *(void *)(v15 + 8 * v37);
      }
      while (v41 == -1);
      unint64_t v18 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t result = sub_2471F8AFC((uint64_t)v7, *(void *)(v10 + 48) + v26 * v18);
    uint64_t v19 = *(void *)(v10 + 56) + 56 * v18;
    *(_OWORD *)uint64_t v19 = v54;
    *(unsigned char *)(v19 + 16) = v53;
    *(void *)(v19 + 24) = v52;
    *(unsigned char *)(v19 + 32) = v51;
    *(void *)(v19 + 40) = v30;
    *(void *)(v19 + 48) = v29;
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v44;
  unint64_t v23 = v46;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v42 = 1 << *(unsigned char *)(v8 + 32);
  if (v42 >= 64) {
    bzero(v23, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v42;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v10;
  return result;
}

unint64_t sub_2471FE3D8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2472062F8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_247206508();
        swift_bridgeObjectRetain();
        sub_247206018();
        uint64_t v9 = sub_247206528();
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
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (unsigned char *)(v14 + v3);
          unint64_t v16 = (unsigned char *)(v14 + v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *int64_t v17 = v19 & v18;
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

unint64_t sub_2471FE5B0(int64_t a1, uint64_t a2)
{
  uint64_t v34 = type metadata accessor for CacheKey();
  uint64_t v4 = *(void *)(v34 - 8);
  unint64_t result = MEMORY[0x270FA5388](v34);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a2 + 64;
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    unint64_t result = sub_2472062F8();
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v33 = (result + 1) & v11;
      uint64_t v12 = *(void *)(v4 + 72);
      uint64_t v13 = v11;
      do
      {
        uint64_t v17 = v12;
        int64_t v18 = v12 * v10;
        uint64_t v19 = v13;
        sub_247200308(*(void *)(a2 + 48) + v12 * v10, (uint64_t)v7);
        sub_247206508();
        sub_247204938();
        sub_247200868((unint64_t *)&unk_26B128290, MEMORY[0x263F07508]);
        sub_247205FA8();
        swift_bridgeObjectRetain();
        sub_247206018();
        swift_bridgeObjectRelease();
        uint64_t v20 = sub_247206528();
        unint64_t result = sub_2471FCE90((uint64_t)v7);
        uint64_t v13 = v19;
        unint64_t v21 = v20 & v19;
        if (a1 >= (uint64_t)v33)
        {
          if (v21 < v33)
          {
            uint64_t v12 = v17;
          }
          else
          {
            uint64_t v12 = v17;
            if (a1 >= (uint64_t)v21) {
              goto LABEL_12;
            }
          }
        }
        else
        {
          uint64_t v12 = v17;
          if (v21 >= v33 || a1 >= (uint64_t)v21)
          {
LABEL_12:
            uint64_t v22 = *(void *)(a2 + 48);
            unint64_t result = v22 + v12 * a1;
            if (v12 * a1 < v18 || result >= v22 + v18 + v12)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
LABEL_17:
              uint64_t v13 = v19;
            }
            else if (v12 * a1 != v18)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_17;
            }
            uint64_t v23 = *(void *)(a2 + 56);
            unint64_t v24 = v23 + 56 * a1;
            int64_t v25 = (long long *)(v23 + 56 * v10);
            if (a1 != v10 || (a1 = v10, v24 >= (unint64_t)v25 + 56))
            {
              long long v14 = *v25;
              long long v15 = v25[1];
              long long v16 = v25[2];
              *(void *)(v24 + 48) = *((void *)v25 + 6);
              *(_OWORD *)(v24 + 16) = v15;
              *(_OWORD *)(v24 + 32) = v16;
              *(_OWORD *)unint64_t v24 = v14;
              a1 = v10;
            }
          }
        }
        unint64_t v10 = (v10 + 1) & v13;
      }
      while (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v26;
    uint64_t v28 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v28 = *v26;
    uint64_t v27 = (-1 << a1) - 1;
  }
  uint64_t *v26 = v28 & v27;
  uint64_t v29 = *(void *)(a2 + 16);
  BOOL v30 = __OFSUB__(v29, 1);
  uint64_t v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_2471FE8FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

void sub_2471FE908(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

void sub_2471FE914(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_2471FC8B8(a2, a3);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_2471FF880(a5);
LABEL_7:
    uint64_t v20 = (void *)*v7;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_2471FD1DC(v17, a4 & 1, a5);
  unint64_t v22 = sub_2471FC8B8(a2, a3);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_17:
    sub_2472064B8();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  uint64_t v20 = (void *)*v7;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  unint64_t v24 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v24 = a2;
  v24[1] = a3;
  *(void *)(v20[7] + 8 * v14) = a1;
  uint64_t v25 = v20[2];
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v27;
  swift_bridgeObjectRetain();
}

uint64_t sub_2471FEA9C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2471FC8B8(a2, a3);
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
    sub_2471FFA2C();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_2471FD4E8(v15, a4 & 1);
  unint64_t v21 = sub_2471FC8B8(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_2472064B8();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v23 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v23 = a2;
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
  void v18[2] = v26;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2471FEC0C(char a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2471FC8B8(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2471FFBE4();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(unsigned char *)(v18[7] + v12) = a1 & 1;
      return result;
    }
    goto LABEL_11;
  }
  sub_2471FD800(result, a4 & 1);
  uint64_t result = sub_2471FC8B8(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_2472064B8();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v20 = a2;
  v20[1] = a3;
  *(unsigned char *)(v18[7] + v12) = a1 & 1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v18[2] = v23;
  return swift_bridgeObjectRetain();
}

void sub_2471FED78(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_247205B68();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_2471FC930(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_2471FFD90();
    goto LABEL_7;
  }
  sub_2471FDB0C(v17, a3 & 1);
  unint64_t v22 = sub_2471FC930(a2);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_14:
    sub_2472064B8();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  uint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_2471FF0B0(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_2471FEF20(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for CacheKey();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v11 = (void *)*v3;
  unint64_t v13 = sub_2471FCB1C(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 >= v16 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v19 = *v4;
    if (v17)
    {
LABEL_8:
      uint64_t v20 = v19[7] + 56 * v13;

      uint64_t result = swift_bridgeObjectRelease();
      long long v22 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)uint64_t v20 = *(_OWORD *)a1;
      *(_OWORD *)(v20 + 16) = v22;
      *(_OWORD *)(v20 + 32) = *(_OWORD *)(a1 + 32);
      *(void *)(v20 + 48) = *(void *)(a1 + 48);
      return result;
    }
    goto LABEL_11;
  }
  if (v18 >= v16 && (a3 & 1) == 0)
  {
    sub_247200028();
    goto LABEL_7;
  }
  sub_2471FDF30(v16, a3 & 1);
  unint64_t v23 = sub_2471FCB1C(a2);
  if ((v17 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = sub_2472064B8();
    __break(1u);
    return result;
  }
  unint64_t v13 = v23;
  uint64_t v19 = *v4;
  if (v17) {
    goto LABEL_8;
  }
LABEL_11:
  sub_247200308(a2, (uint64_t)v10);
  return sub_2471FF168(v13, (uint64_t)v10, (long long *)a1, v19);
}

uint64_t sub_2471FF0B0(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_247205B68();
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

uint64_t sub_2471FF168(unint64_t a1, uint64_t a2, long long *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for CacheKey();
  uint64_t result = sub_2471F8AFC(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1);
  uint64_t v11 = a4[7] + 56 * a1;
  *(void *)(v11 + 48) = *((void *)a3 + 6);
  long long v12 = a3[2];
  long long v13 = *a3;
  *(_OWORD *)(v11 + 16) = a3[1];
  *(_OWORD *)(v11 + 32) = v12;
  *(_OWORD *)uint64_t v11 = v13;
  uint64_t v14 = a4[2];
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    a4[2] = v16;
  }
  return result;
}

unint64_t sub_2471FF224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2472064A8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        long long v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2472064A8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2471FF308(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  char v24 = a5;
  uint64_t v25 = a6;
  unint64_t v23 = a4;
  v21[1] = a1;
  uint64_t v8 = a3(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  BOOL v11 = (char *)v21 - v10;
  uint64_t v22 = v6;
  uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v13 = a2 & ~v12;
  v21[0] = v6 + 64;
  if ((*(void *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v14 = ~v12;
    char v17 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    uint64_t v16 = v9 + 16;
    BOOL v15 = v17;
    uint64_t v18 = *(void *)(v16 + 56);
    do
    {
      v15(v11, *(void *)(v22 + 48) + v18 * v13, v8);
      sub_247200868(v23, v24);
      char v19 = sub_247205FB8();
      (*(void (**)(char *, uint64_t))(v16 - 8))(v11, v8);
      if (v19) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v14;
    }
    while (((*(void *)(v21[0] + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

unint64_t sub_2471FF4A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_2471E8C8C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x24C54D170](v9, a1);
      sub_2471E8C38((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_2471FF570(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for CacheKey();
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v10 = a2 & ~v9;
  if ((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    while (1)
    {
      sub_247200308(*(void *)(v2 + 48) + v12 * v10, (uint64_t)v8);
      if (sub_247204918())
      {
        uint64_t v13 = *(int *)(v5 + 20);
        uint64_t v14 = *(void *)&v8[v13];
        uint64_t v15 = *(void *)&v8[v13 + 8];
        uint64_t v16 = (void *)(a1 + v13);
        BOOL v17 = v14 == *v16 && v15 == v16[1];
        if (v17 || (sub_2472064A8() & 1) != 0) {
          break;
        }
      }
      sub_2471FCE90((uint64_t)v8);
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        return v10;
      }
    }
    sub_2471FCE90((uint64_t)v8);
  }
  return v10;
}

id sub_2471FF6E4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B1286E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2472063F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    if (!v23) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    BOOL v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

id sub_2471FF880(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_2472063F8();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
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
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void **)(*(void *)(v3 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *uint64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
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

void *sub_2471FFA2C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269241508);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2472063F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    id result = (void *)swift_retain();
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

void *sub_2471FFBE4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692414E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2472063F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    LOBYTE(v16) = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + 16 * v15);
    void *v19 = v18;
    v19[1] = v17;
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = (_BYTE)v16;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2471FFD90()
{
  uint64_t v1 = sub_247205B68();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692414F8);
  unint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_2472063F8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (id)swift_release();
    uint64_t *v23 = v7;
    return result;
  }
  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void **)(*(void *)(v5 + 56) + v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_247200028()
{
  uint64_t v1 = type metadata accessor for CacheKey();
  uint64_t v40 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  unint64_t v39 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286D0);
  unint64_t v36 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_2472063F8();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v42 = v4;
  if (!v5)
  {
    id result = (id)swift_release();
    uint64_t v35 = v42;
    uint64_t v34 = v36;
LABEL_25:
    uint64_t *v34 = v35;
    return result;
  }
  uint64_t v6 = v4;
  id result = (id)(v4 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    uint64_t v6 = v42;
  }
  int64_t v9 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v41 = v3;
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v3 + 64);
  uint64_t v37 = v3 + 64;
  int64_t v38 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = (uint64_t)v39;
  uint64_t v14 = v42;
  while (1)
  {
    if (v12)
    {
      unint64_t v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      int64_t v43 = v9;
      unint64_t v16 = v15 | (v9 << 6);
      uint64_t v17 = v41;
      goto LABEL_9;
    }
    int64_t v30 = v9 + 1;
    uint64_t v17 = v41;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v30 >= v38) {
      goto LABEL_23;
    }
    unint64_t v31 = *(void *)(v37 + 8 * v30);
    int64_t v32 = v9 + 1;
    if (!v31)
    {
      int64_t v32 = v30 + 1;
      if (v30 + 1 >= v38) {
        goto LABEL_23;
      }
      unint64_t v31 = *(void *)(v37 + 8 * v32);
      if (!v31) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v31 - 1) & v31;
    int64_t v43 = v32;
    unint64_t v16 = __clz(__rbit64(v31)) + (v32 << 6);
LABEL_9:
    unint64_t v18 = *(void *)(v40 + 72) * v16;
    sub_247200308(*(void *)(v17 + 48) + v18, v13);
    uint64_t v19 = 56 * v16;
    uint64_t v20 = *(void *)(v17 + 56) + 56 * v16;
    char v21 = *(unsigned char *)(v20 + 16);
    uint64_t v22 = *(void *)(v20 + 24);
    char v23 = *(unsigned char *)(v20 + 32);
    uint64_t v24 = *(void *)(v20 + 40);
    uint64_t v25 = *(void *)(v20 + 48);
    uint64_t v26 = *(void *)(v14 + 48) + v18;
    long long v44 = *(_OWORD *)v20;
    sub_2471F8AFC(v13, v26);
    uint64_t v27 = *(void *)(v14 + 56) + v19;
    uint64_t v28 = (void *)v44;
    *(_OWORD *)uint64_t v27 = v44;
    *(unsigned char *)(v27 + 16) = v21;
    *(void *)(v27 + 24) = v22;
    *(unsigned char *)(v27 + 32) = v23;
    *(void *)(v27 + 40) = v24;
    *(void *)(v27 + 48) = v25;
    uint64_t v29 = v28;
    swift_bridgeObjectRetain();
    id result = v29;
    int64_t v9 = v43;
  }
  int64_t v33 = v30 + 2;
  if (v33 >= v38)
  {
LABEL_23:
    id result = (id)swift_release();
    uint64_t v34 = v36;
    uint64_t v35 = v42;
    goto LABEL_25;
  }
  unint64_t v31 = *(void *)(v37 + 8 * v33);
  if (v31)
  {
    int64_t v32 = v33;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v32 = v33 + 1;
    if (__OFADD__(v33, 1)) {
      break;
    }
    if (v32 >= v38) {
      goto LABEL_23;
    }
    unint64_t v31 = *(void *)(v37 + 8 * v32);
    ++v33;
    if (v31) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_247200308(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CacheKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24720036C()
{
  uint64_t v1 = sub_247204938();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v6 + 16, v5);
}

void sub_247200440()
{
  uint64_t v1 = *(void *)(sub_247204938() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = v0 + v2;
  uint64_t v6 = *(void *)(v0 + v3);
  uint64_t v7 = *(void *)(v0 + v3 + 8);
  uint64_t v8 = *(void *)(v0 + v4);
  int64_t v9 = (uint64_t *)(v0 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  sub_2471FB22C(v5, v6, v7, v8, v10, v11);
}

uint64_t sub_2472004F0()
{
  return sub_2472005EC((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2471FA9D8);
}

uint64_t objectdestroy_17Tm()
{
  uint64_t v1 = sub_247204938();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
     + 9;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2472005D4()
{
  return sub_2472005EC((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2471FA15C);
}

uint64_t sub_2472005EC(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(sub_247204938() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v1 + v3;
  uint64_t v7 = *(void *)(v1 + v4);
  uint64_t v8 = *(void *)(v1 + v4 + 8);
  uint64_t v9 = *(void *)(v1 + v5);
  uint64_t v10 = (uint64_t *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = *((unsigned __int8 *)v10 + 8);
  return a1(v6, v7, v8, v9, v11, v12);
}

uint64_t sub_2472006B0()
{
  uint64_t v1 = sub_247204938();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t sub_247200780()
{
  uint64_t v1 = *(void *)(sub_247204938() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(v0 + v4);
  unint64_t v6 = *(void **)(v0 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = *(void *)(v0 + v3);
  uint64_t v8 = *(void *)(v0 + v3 + 8);
  return sub_2471F9CA8(v0 + v2, v7, v8, v5, v6);
}

unint64_t sub_247200828()
{
  unint64_t result = qword_26B128678;
  if (!qword_26B128678)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B128678);
  }
  return result;
}

uint64_t sub_247200868(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2472008B0(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_247200920(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_247200964(uint64_t a1, uint64_t a2)
{
  return sub_247200E2C(a1, a2, (uint64_t)&unk_26FB64A58, (uint64_t)sub_24720419C, (uint64_t)&block_descriptor_37);
}

void sub_24720098C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247205C78();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v27[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  uint64_t v30 = a3;
  id v10 = objc_allocWithZone((Class)sub_247204C38());
  uint64_t v11 = sub_247204C28();
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_247205EA8();
    __swift_project_value_buffer(v13, (uint64_t)qword_26B128910);
    uint64_t v14 = sub_247205E98();
    os_log_type_t v15 = sub_247206178();
    if (os_log_type_enabled(v14, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v16 = 0;
      _os_log_impl(&dword_2471B4000, v14, v15, "Going to post AttendingStartedMessage", v16, 2u);
      MEMORY[0x24C54D9C0](v16, -1, -1);
    }

    if (qword_26B127C10 != -1) {
      swift_once();
    }
    uint64_t v17 = __swift_project_value_buffer(v6, (uint64_t)qword_26B1288F8);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, v17, v6);
    *(void *)(swift_allocObject() + 16) = a1;
    unint64_t v18 = a1;
    sub_247205C48();
    swift_release();
    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
    __swift_project_boxed_opaque_existential_1(&v18[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher], *(void *)&v18[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher + 24]);
    sub_247205A18();
  }
  else
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_247205EA8();
    __swift_project_value_buffer(v19, (uint64_t)qword_26B128910);
    id v20 = a1;
    char v21 = sub_247205E98();
    os_log_type_t v22 = sub_247206188();
    if (os_log_type_enabled(v21, v22))
    {
      char v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)char v23 = 136315138;
      uint64_t v32 = v24;
      sub_247204938();
      sub_24720482C((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
      uint64_t v25 = sub_247206478();
      uint64_t v31 = sub_2471F3F68(v25, v26, &v32);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v21, v22, "Failed to create AttendingStartedMessage for session: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v24, -1, -1);
      MEMORY[0x24C54D9C0](v23, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_247200E04(uint64_t a1, uint64_t a2)
{
  return sub_247200E2C(a1, a2, (uint64_t)&unk_26FB64A08, (uint64_t)sub_2472040DC, (uint64_t)&block_descriptor_31);
}

uint64_t sub_247200E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v20[0] = a5;
  uint64_t v9 = sub_247205EE8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_247205F18();
  uint64_t v13 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  os_log_type_t v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[1] = *(void *)&v5[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_queue];
  unint64_t v16 = (void *)swift_allocObject();
  v16[2] = v5;
  v16[3] = a1;
  v16[4] = a2;
  aBlock[4] = a4;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_247200920;
  aBlock[3] = v20[0];
  uint64_t v17 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  unint64_t v18 = v5;
  sub_247205EF8();
  uint64_t v22 = MEMORY[0x263F8EE78];
  sub_24720482C(&qword_26B128360, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1285E0);
  sub_2472008B0((unint64_t *)&qword_26B1285F0, (uint64_t *)&unk_26B1285E0);
  sub_2472062E8();
  MEMORY[0x24C54D030](0, v15, v12, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v21);
  return swift_release();
}

void sub_2472010E0(char *a1)
{
  id v2 = objc_allocWithZone((Class)sub_247204F88());
  uint64_t v3 = sub_247204F78();
  if (v3)
  {
    unint64_t v4 = (char *)v3;
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_247205EA8();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B128910);
    uint64_t v6 = sub_247205E98();
    os_log_type_t v7 = sub_247206178();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_2471B4000, v6, v7, "Going to post AttendingWillStartMessage", v8, 2u);
      MEMORY[0x24C54D9C0](v8, -1, -1);
    }

    __swift_project_boxed_opaque_existential_1(&a1[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher], *(void *)&a1[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher + 24]);
    sub_247205A18();
  }
  else
  {
    if (qword_26B128578 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_247205EA8();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B128910);
    unint64_t v4 = a1;
    uint64_t v10 = sub_247205E98();
    os_log_type_t v11 = sub_247206188();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      uint64_t v16 = v13;
      sub_247204938();
      sub_24720482C((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
      uint64_t v14 = sub_247206478();
      sub_2471F3F68(v14, v15, &v16);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v10, v11, "Failed to create AttendingWillStartMessage for session: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v13, -1, -1);
      MEMORY[0x24C54D9C0](v12, -1, -1);

      return;
    }
  }
}

uint64_t sub_2472013F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *), void (*a6)(uint64_t, uint64_t), void (*a7)(char *), uint64_t (*a8)(uint64_t, uint64_t))
{
  uint64_t v29 = a3;
  uint64_t v30 = a8;
  uint64_t v28 = a7;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *MEMORY[0x263F709E0];
  uint64_t v19 = sub_247205A38();
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 104))(v17, v18, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  a5(v17);
  uint64_t v21 = *(void *)(a2 + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_assistantId);
  uint64_t v22 = *(void *)(a2 + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_assistantId + 8);
  swift_bridgeObjectRetain();
  a6(v21, v22);
  uint64_t v23 = a2 + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId;
  uint64_t v24 = sub_247204938();
  uint64_t v25 = *(void *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v14, v23, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v14, 0, 1, v24);
  v28(v14);
  swift_bridgeObjectRetain();
  return v30(v29, a4);
}

uint64_t sub_247201664(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  if (a3)
  {
    uint64_t v6 = sub_247205FD8();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a1;
  a4(v6, v8);

  return swift_bridgeObjectRelease();
}

uint64_t sub_2472016E0(void *a1)
{
  uint64_t v3 = sub_247205EE8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_247205F18();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = *(void *)&v1[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_queue];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = v1;
  aBlock[4] = sub_247204094;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_247200920;
  aBlock[3] = &block_descriptor_22;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = a1;
  uint64_t v14 = v1;
  sub_247205EF8();
  v16[1] = MEMORY[0x263F8EE78];
  sub_24720482C(&qword_26B128360, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1285E0);
  sub_2472008B0((unint64_t *)&qword_26B1285F0, (uint64_t *)&unk_26B1285E0);
  sub_2472062E8();
  MEMORY[0x24C54D030](0, v10, v6, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

void sub_247201998(void *a1, void *a2)
{
  v37[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_247205C78();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_247205EA8();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B128910);
  id v9 = a1;
  id v10 = a1;
  uint64_t v11 = sub_247205E98();
  os_log_type_t v12 = sub_247206188();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v34 = a2;
    uint64_t v35 = v5;
    id v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)id v13 = 138412290;
    if (a1)
    {
      id v15 = a1;
      uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
      v37[0] = v16;
      sub_2472062B8();
    }
    else
    {
      v37[0] = 0;
      sub_2472062B8();
      uint64_t v16 = 0;
    }
    void *v14 = v16;

    _os_log_impl(&dword_2471B4000, v11, v12, "Received AttendingStoppedUnexpectedly with error = %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1286A0);
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v14, -1, -1);
    MEMORY[0x24C54D9C0](v13, -1, -1);

    a2 = v34;
    uint64_t v5 = v35;
  }
  else
  {
  }
  MEMORY[0x270FA5388](v17);
  *(&v33 - 2) = (uint64_t)a2;
  id v18 = objc_allocWithZone((Class)sub_247205648());
  uint64_t v19 = sub_247205638();
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    uint64_t v21 = sub_247205E98();
    os_log_type_t v22 = sub_247206178();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_2471B4000, v21, v22, "Going to post AttendingStoppedUnexpectedlyMessage", v23, 2u);
      MEMORY[0x24C54D9C0](v23, -1, -1);
    }

    if (qword_26B127C10 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v4, (uint64_t)qword_26B1288F8);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v24, v4);
    *(void *)(swift_allocObject() + 16) = a2;
    uint64_t v25 = a2;
    sub_247205C48();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    __swift_project_boxed_opaque_existential_1(&v25[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher], *(void *)&v25[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher + 24]);
    sub_247205A18();
  }
  else
  {
    id v26 = a2;
    uint64_t v27 = sub_247205E98();
    os_log_type_t v28 = sub_247206188();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 136315138;
      v37[0] = v30;
      sub_247204938();
      sub_24720482C((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
      uint64_t v31 = sub_247206478();
      uint64_t v36 = sub_2471F3F68(v31, v32, v37);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v27, v28, "Failed to create AttendingStoppedUnexpectedlyMessage for session: %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v30, -1, -1);
      MEMORY[0x24C54D9C0](v29, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_247201F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *MEMORY[0x263F709E0];
  uint64_t v10 = sub_247205A38();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_2472059E8();
  swift_bridgeObjectRetain();
  sub_2472059D8();
  uint64_t v12 = a2 + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId;
  uint64_t v13 = sub_247204938();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  return sub_2472059F8();
}

uint64_t sub_247202168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128708);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128350);
  uint64_t v6 = *(void *)(*(void *)(v5 - 8) + 72);
  unint64_t v7 = (*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2472079C0;
  unint64_t v9 = v8 + v7;
  uint64_t v10 = *(int *)(v5 + 48);
  sub_247205BA8();
  if (qword_26B1285A0 != -1) {
    swift_once();
  }
  uint64_t v11 = (void *)(v9 + v10);
  uint64_t v12 = unk_26B128930;
  *uint64_t v11 = qword_26B128928;
  v11[1] = v12;
  uint64_t v13 = (void *)(v9 + v6 + *(int *)(v5 + 48));
  swift_bridgeObjectRetain();
  sub_247205BF8();
  void *v13 = a2;
  v13[1] = a3;
  uint64_t v14 = (void *)(v9 + 2 * v6 + *(int *)(v5 + 48));
  sub_247205BB8();
  sub_247206028();
  sub_247206028();
  sub_247206028();
  void *v14 = 0;
  v14[1] = 0xE000000000000000;
  id v15 = (void *)(v9 + 3 * v6 + *(int *)(v5 + 48));
  sub_247205C38();
  sub_247206028();
  sub_247204938();
  sub_24720482C((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
  sub_247206478();
  sub_247206028();
  swift_bridgeObjectRelease();
  sub_247206028();
  *id v15 = 0;
  v15[1] = 0xE000000000000000;
  return v8;
}

void sub_24720241C()
{
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_247205EA8();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B128910);
  oslog = sub_247205E98();
  os_log_type_t v1 = sub_247206178();
  if (os_log_type_enabled(oslog, v1))
  {
    id v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_2471B4000, oslog, v1, "Received SpeechStartDetected in deprecated path, dropping.", v2, 2u);
    MEMORY[0x24C54D9C0](v2, -1, -1);
  }
}

uint64_t sub_247202560(char a1)
{
  uint64_t v3 = sub_247205EE8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_247205F18();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[0] = *(void *)&v1[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_queue];
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = v1;
  aBlock[4] = sub_247203FD0;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_247200920;
  aBlock[3] = &block_descriptor_13;
  uint64_t v12 = _Block_copy(aBlock);
  uint64_t v13 = v1;
  sub_247205EF8();
  v15[1] = MEMORY[0x263F8EE78];
  sub_24720482C(&qword_26B128360, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1285E0);
  sub_2472008B0((unint64_t *)&qword_26B1285F0, (uint64_t *)&unk_26B1285E0);
  sub_2472062E8();
  MEMORY[0x24C54D030](0, v10, v6, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

void sub_247202814(char a1, void *a2)
{
  uint64_t v4 = sub_247205C78();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_247205EA8();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B128910);
  uint64_t v9 = sub_247205E98();
  os_log_type_t v10 = sub_247206178();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 67109120;
    LODWORD(v29) = a1 & 1;
    sub_2472062B8();
    _os_log_impl(&dword_2471B4000, v9, v10, "Received SpeechStartDetected with shouldDuckTTS:%{BOOL}d", v11, 8u);
    MEMORY[0x24C54D9C0](v11, -1, -1);
  }

  MEMORY[0x270FA5388](v12);
  *(&v28 - 2) = (uint64_t)a2;
  *((unsigned char *)&v28 - 8) = a1 & 1;
  id v13 = objc_allocWithZone((Class)sub_2472051D8());
  uint64_t v14 = sub_247205188();
  if (v14)
  {
    id v15 = (void *)v14;
    uint64_t v16 = sub_247205E98();
    os_log_type_t v17 = sub_247206178();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_2471B4000, v16, v17, "Going to post SpeechStartDetectedMessage", v18, 2u);
      MEMORY[0x24C54D9C0](v18, -1, -1);
    }

    if (qword_26B127C10 != -1) {
      swift_once();
    }
    uint64_t v19 = __swift_project_value_buffer(v4, (uint64_t)qword_26B1288F8);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v19, v4);
    *(void *)(swift_allocObject() + 16) = a2;
    uint64_t v20 = a2;
    sub_247205C48();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    __swift_project_boxed_opaque_existential_1(&v20[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher], *(void *)&v20[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher + 24]);
    sub_247205A18();
  }
  else
  {
    id v21 = a2;
    os_log_type_t v22 = sub_247205E98();
    os_log_type_t v23 = sub_247206188();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136315138;
      uint64_t v29 = v25;
      sub_247204938();
      sub_24720482C((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
      uint64_t v26 = sub_247206478();
      uint64_t v28 = sub_2471F3F68(v26, v27, &v29);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v22, v23, "Failed to create SpeechStartDetectedMessage for session: %s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v25, -1, -1);
      MEMORY[0x24C54D9C0](v24, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_247202CFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *MEMORY[0x263F709E0];
  uint64_t v10 = sub_247205A38();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_2472051B8();
  swift_bridgeObjectRetain();
  sub_247205198();
  uint64_t v12 = a2 + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId;
  uint64_t v13 = sub_247204938();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  sub_2472051C8();
  return sub_2472051A8();
}

uint64_t sub_247202F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_247205EE8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_247205F18();
  uint64_t v13 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  id v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[1] = *(void *)&v4[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_queue];
  uint64_t v16 = (void *)swift_allocObject();
  void v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a4;
  v16[6] = v4;
  aBlock[4] = sub_247203F2C;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_247200920;
  aBlock[3] = &block_descriptor_7;
  os_log_type_t v17 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v18 = v4;
  sub_247205EF8();
  uint64_t v22 = MEMORY[0x263F8EE78];
  sub_24720482C(&qword_26B128360, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1285E0);
  sub_2472008B0((unint64_t *)&qword_26B1285F0, (uint64_t *)&unk_26B1285E0);
  sub_2472062E8();
  MEMORY[0x24C54D030](0, v15, v12, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v21);
  return swift_release();
}

void sub_247203234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  uint64_t v10 = sub_247205C78();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v49 = v10;
  uint64_t v50 = v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v48 = &v45[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_26B128578 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_247205EA8();
  uint64_t v14 = __swift_project_value_buffer(v13, (uint64_t)qword_26B128910);
  swift_bridgeObjectRetain_n();
  uint64_t v51 = v14;
  id v15 = sub_247205E98();
  os_log_type_t v16 = sub_247206178();
  int v17 = v16;
  os_log_t v52 = v15;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    uint64_t v53 = a1;
    uint64_t v54 = v47;
    *(_DWORD *)uint64_t v18 = 134218498;
    uint64_t v19 = a3;
    sub_2472062B8();
    *(_WORD *)(v18 + 12) = 2048;
    uint64_t v53 = a2;
    sub_2472062B8();
    *(_WORD *)(v18 + 22) = 2080;
    if (!a4) {
      a3 = 0;
    }
    int v46 = v17;
    if (a4) {
      unint64_t v20 = a4;
    }
    else {
      unint64_t v20 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v53 = sub_2471F3F68(a3, v20, &v54);
    a3 = v19;
    sub_2472062B8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v21 = v52;
    _os_log_impl(&dword_2471B4000, v52, (os_log_type_t)v46, "Received SpeechRecognizerReadyForNewTurn with hostTime:%llu, audioRecordType: %lld, deviceId: %s", (uint8_t *)v18, 0x20u);
    uint64_t v22 = v47;
    swift_arrayDestroy();
    MEMORY[0x24C54D9C0](v22, -1, -1);
    MEMORY[0x24C54D9C0](v18, -1, -1);
  }
  else
  {

    uint64_t v23 = swift_bridgeObjectRelease_n();
  }
  MEMORY[0x270FA5388](v23);
  *(void *)&v45[-48] = a5;
  *(void *)&v45[-40] = a1;
  *(void *)&v45[-32] = a2;
  *(void *)&v45[-24] = a3;
  *(void *)&v45[-16] = a4;
  id v24 = objc_allocWithZone((Class)sub_247204ED8());
  uint64_t v25 = sub_247204E68();
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = *(void *)&a5[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_assistantId];
    uint64_t v28 = *(void *)&a5[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_assistantId + 8];
    uint64_t v29 = (uint64_t)&a5[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId];
    sub_2471FA134(a1, 0, v27, v28, (uint64_t)&a5[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId]);
    sub_2471FA5E8(a2, 0, v27, v28, v29);
    sub_2471FAE60(a3, a4, v27, v28, v29);
    uint64_t v30 = sub_247205E98();
    os_log_type_t v31 = sub_247206178();
    if (os_log_type_enabled(v30, v31))
    {
      unint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v32 = 0;
      _os_log_impl(&dword_2471B4000, v30, v31, "Going to post ASRReadyForNewTurnMessage", v32, 2u);
      MEMORY[0x24C54D9C0](v32, -1, -1);
    }

    if (qword_26B127C10 != -1) {
      swift_once();
    }
    uint64_t v33 = v49;
    uint64_t v34 = __swift_project_value_buffer(v49, (uint64_t)qword_26B1288F8);
    uint64_t v35 = v50;
    uint64_t v36 = v48;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v50 + 16))(v48, v34, v33);
    *(void *)(swift_allocObject() + 16) = a5;
    uint64_t v37 = a5;
    sub_247205C48();
    swift_release();
    (*(void (**)(unsigned char *, uint64_t))(v35 + 8))(v36, v33);
    __swift_project_boxed_opaque_existential_1(&v37[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher], *(void *)&v37[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher + 24]);
    sub_247205A18();
  }
  else
  {
    int64_t v38 = a5;
    unint64_t v39 = sub_247205E98();
    os_log_type_t v40 = sub_247206188();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      *(_DWORD *)uint64_t v41 = 136315138;
      uint64_t v54 = v42;
      sub_247204938();
      sub_24720482C((unint64_t *)&unk_26B1282B0, MEMORY[0x263F07508]);
      uint64_t v43 = sub_247206478();
      uint64_t v53 = sub_2471F3F68(v43, v44, &v54);
      sub_2472062B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471B4000, v39, v40, "Failed to create ASRReadyForNewTurnMessage for session: %s", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C54D9C0](v42, -1, -1);
      MEMORY[0x24C54D9C0](v41, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_24720389C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v27[0] = a5;
  v27[1] = a6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269241638);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282C0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1282F0);
  MEMORY[0x270FA5388](v14 - 8);
  os_log_type_t v16 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *MEMORY[0x263F709E0];
  uint64_t v18 = sub_247205A38();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 104))(v16, v17, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  sub_247204EA8();
  swift_bridgeObjectRetain();
  sub_247204E78();
  uint64_t v20 = a2 + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId;
  uint64_t v21 = sub_247204938();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v13, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v13, 0, 1, v21);
  sub_247204EC8();
  sub_247204EB8();
  switch(a4)
  {
    case 22:
      uint64_t v23 = (unsigned int *)MEMORY[0x263F70C48];
      break;
    case 23:
      uint64_t v23 = (unsigned int *)MEMORY[0x263F70C50];
      break;
    case 25:
      uint64_t v23 = (unsigned int *)MEMORY[0x263F70C60];
      break;
    case 27:
      uint64_t v23 = (unsigned int *)MEMORY[0x263F70C58];
      break;
    default:
      uint64_t v23 = (unsigned int *)MEMORY[0x263F70C68];
      break;
  }
  uint64_t v24 = *v23;
  uint64_t v25 = sub_247205AB8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104))(v10, v24, v25);
  sub_247205AB8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v10, 0, 1, v25);
  sub_247204E88();
  swift_bridgeObjectRetain();
  return sub_247204E98();
}

id sub_247203CEC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AttendingStatesServiceHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_247203DD8()
{
  return type metadata accessor for AttendingStatesServiceHandler();
}

uint64_t type metadata accessor for AttendingStatesServiceHandler()
{
  uint64_t result = qword_26B128508;
  if (!qword_26B128508) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_247203E2C()
{
  uint64_t result = sub_247204938();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_247203EEC()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_247203F2C()
{
  sub_247203234(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(char **)(v0 + 48));
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_247203F54(uint64_t a1)
{
  return sub_24720389C(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_247203F64()
{
  return sub_247202168(*(void *)(v0 + 16), 0xD000000000000015, 0x80000002472094F0);
}

uint64_t sub_247203F98()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_247203FD0()
{
  sub_247202814(*(unsigned char *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_247203FDC(uint64_t a1)
{
  return sub_247202CFC(a1, *(void *)(v1 + 16));
}

uint64_t sub_247203FE8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_247204020()
{
  return sub_247202168(*(void *)(v0 + 16), 0xD000000000000016, 0x80000002472094D0);
}

uint64_t sub_247204054()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_247204094()
{
  sub_247201998(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_24720409C(uint64_t a1)
{
  return sub_247201F5C(a1, *(void *)(v1 + 16));
}

uint64_t sub_2472040A4()
{
  return sub_247202168(*(void *)(v0 + 16), 0xD00000000000002CLL, 0x8000000247209510);
}

void sub_2472040DC()
{
  sub_2472010E0(*(char **)(v0 + 16));
}

uint64_t sub_2472040E8(uint64_t a1)
{
  return sub_2472013F8(a1, v1[2], v1[3], v1[4], MEMORY[0x263F70950], MEMORY[0x263F70940], MEMORY[0x263F70958], MEMORY[0x263F70948]);
}

uint64_t objectdestroy_27Tm()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_24720419C()
{
  sub_24720098C(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_2472041A8(uint64_t a1)
{
  return sub_2472013F8(a1, v1[2], v1[3], v1[4], MEMORY[0x263F70838], MEMORY[0x263F70828], MEMORY[0x263F70840], MEMORY[0x263F70830]);
}

uint64_t sub_247204218()
{
  return sub_247202168(*(void *)(v0 + 16), 0xD000000000000020, 0x8000000247209540);
}

id sub_24720424C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = a4;
  uint64_t v29 = a5;
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v25 = a1;
  uint64_t v24 = sub_2472061B8();
  uint64_t v6 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2472061A8();
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = sub_247205F18();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v23 = OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_queue;
  v22[0] = sub_247200828();
  uint64_t v11 = v5;
  sub_247205F08();
  uint64_t v31 = MEMORY[0x263F8EE78];
  sub_24720482C(&qword_26B128670, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B128600);
  sub_2472008B0(qword_26B128610, (uint64_t *)&unk_26B128600);
  sub_2472062E8();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F130], v24);
  *(void *)(v22[1] + v23) = sub_2472061E8();
  uint64_t v12 = &v11[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId];
  uint64_t v13 = sub_247204938();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v12, v25, v13);
  os_log_type_t v16 = &v11[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_assistantId];
  uint64_t v17 = v27;
  uint64_t v18 = v28;
  *(void *)os_log_type_t v16 = v26;
  *((void *)v16 + 1) = v17;
  sub_2471CA8E4(v18, (uint64_t)&v11[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher]);
  *(void *)&v11[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_candidateRequestCacheManager] = v29;
  swift_retain();

  uint64_t v19 = (objc_class *)type metadata accessor for AttendingStatesServiceHandler();
  v30.receiver = v11;
  v30.super_class = v19;
  id v20 = objc_msgSendSuper2(&v30, sel_init);
  __swift_destroy_boxed_opaque_existential_1(v18);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v13);
  return v20;
}

uint64_t sub_2472045A4()
{
  uint64_t v1 = sub_247205EE8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_247205F18();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = *(void *)(v0 + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_queue);
  aBlock[4] = sub_24720241C;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_247200920;
  aBlock[3] = &block_descriptor_43;
  uint64_t v9 = _Block_copy(aBlock);
  sub_247205EF8();
  v11[1] = MEMORY[0x263F8EE78];
  sub_24720482C(&qword_26B128360, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1285E0);
  sub_2472008B0((unint64_t *)&qword_26B1285F0, (uint64_t *)&unk_26B1285E0);
  sub_2472062E8();
  MEMORY[0x24C54D030](0, v8, v4, v9);
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_24720482C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2472048A8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2472048B8()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2472048C8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2472048D8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2472048E8()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_2472048F8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_247204908()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_247204918()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_247204928()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_247204938()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_247204948()
{
  return MEMORY[0x270F286D8]();
}

uint64_t sub_247204958()
{
  return MEMORY[0x270F6A310]();
}

uint64_t sub_247204968()
{
  return MEMORY[0x270F6A338]();
}

uint64_t sub_247204978()
{
  return MEMORY[0x270F6A358]();
}

uint64_t sub_247204988()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_247204998()
{
  return MEMORY[0x270F6A758]();
}

uint64_t sub_2472049A8()
{
  return MEMORY[0x270F6A7B0]();
}

uint64_t sub_2472049B8()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_2472049C8()
{
  return MEMORY[0x270F6AA70]();
}

uint64_t sub_2472049D8()
{
  return MEMORY[0x270F6AA98]();
}

uint64_t sub_2472049E8()
{
  return MEMORY[0x270F6AAB0]();
}

uint64_t sub_2472049F8()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t sub_247204A08()
{
  return MEMORY[0x270F6AB90]();
}

uint64_t sub_247204A18()
{
  return MEMORY[0x270F6AC08]();
}

uint64_t sub_247204A28()
{
  return MEMORY[0x270F6AC18]();
}

uint64_t sub_247204A38()
{
  return MEMORY[0x270F6AC30]();
}

uint64_t sub_247204A48()
{
  return MEMORY[0x270F6AC38]();
}

uint64_t sub_247204A58()
{
  return MEMORY[0x270F6AC60]();
}

uint64_t sub_247204A68()
{
  return MEMORY[0x270F6AC68]();
}

uint64_t sub_247204A78()
{
  return MEMORY[0x270F6AC78]();
}

uint64_t sub_247204A88()
{
  return MEMORY[0x270F6AC98]();
}

uint64_t sub_247204A98()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_247204AA8()
{
  return MEMORY[0x270F6ADA8]();
}

uint64_t sub_247204AB8()
{
  return MEMORY[0x270F6ADC0]();
}

uint64_t sub_247204AC8()
{
  return MEMORY[0x270F68990]();
}

uint64_t sub_247204AD8()
{
  return MEMORY[0x270F70E30]();
}

uint64_t sub_247204AE8()
{
  return MEMORY[0x270F689B0]();
}

uint64_t sub_247204AF8()
{
  return MEMORY[0x270F689B8]();
}

uint64_t sub_247204B08()
{
  return MEMORY[0x270F689C0]();
}

uint64_t sub_247204B18()
{
  return MEMORY[0x270F689C8]();
}

uint64_t sub_247204B28()
{
  return MEMORY[0x270F689D0]();
}

uint64_t sub_247204B38()
{
  return MEMORY[0x270F68A18]();
}

uint64_t sub_247204B48()
{
  return MEMORY[0x270F68A20]();
}

uint64_t sub_247204B58()
{
  return MEMORY[0x270F68A30]();
}

uint64_t sub_247204B68()
{
  return MEMORY[0x270F68A38]();
}

uint64_t sub_247204B78()
{
  return MEMORY[0x270F68A40]();
}

uint64_t sub_247204B88()
{
  return MEMORY[0x270F68AA8]();
}

uint64_t sub_247204B98()
{
  return MEMORY[0x270F68AB0]();
}

uint64_t sub_247204BA8()
{
  return MEMORY[0x270F68AB8]();
}

uint64_t sub_247204BB8()
{
  return MEMORY[0x270F68AC0]();
}

uint64_t sub_247204BC8()
{
  return MEMORY[0x270F68AC8]();
}

uint64_t sub_247204BD8()
{
  return MEMORY[0x270F68AD0]();
}

uint64_t sub_247204BE8()
{
  return MEMORY[0x270F68AD8]();
}

uint64_t sub_247204BF8()
{
  return MEMORY[0x270F68AE0]();
}

uint64_t sub_247204C08()
{
  return MEMORY[0x270F68B00]();
}

uint64_t sub_247204C18()
{
  return MEMORY[0x270F68B08]();
}

uint64_t sub_247204C28()
{
  return MEMORY[0x270F68B20]();
}

uint64_t sub_247204C38()
{
  return MEMORY[0x270F68B28]();
}

uint64_t sub_247204C48()
{
  return MEMORY[0x270F68B30]();
}

uint64_t sub_247204C58()
{
  return MEMORY[0x270F68B38]();
}

uint64_t sub_247204C68()
{
  return MEMORY[0x270F68B40]();
}

uint64_t sub_247204C78()
{
  return MEMORY[0x270F68B48]();
}

uint64_t sub_247204C88()
{
  return MEMORY[0x270F68B50]();
}

uint64_t sub_247204C98()
{
  return MEMORY[0x270F68B58]();
}

uint64_t sub_247204CA8()
{
  return MEMORY[0x270F68B60]();
}

uint64_t sub_247204CB8()
{
  return MEMORY[0x270F68B68]();
}

uint64_t sub_247204CC8()
{
  return MEMORY[0x270F68B70]();
}

uint64_t sub_247204CD8()
{
  return MEMORY[0x270F68B80]();
}

uint64_t sub_247204CE8()
{
  return MEMORY[0x270F68B88]();
}

uint64_t sub_247204CF8()
{
  return MEMORY[0x270F68B90]();
}

uint64_t sub_247204D08()
{
  return MEMORY[0x270F68B98]();
}

uint64_t sub_247204D18()
{
  return MEMORY[0x270F68BA0]();
}

uint64_t sub_247204D28()
{
  return MEMORY[0x270F68BA8]();
}

uint64_t sub_247204D38()
{
  return MEMORY[0x270F68BB0]();
}

uint64_t sub_247204D48()
{
  return MEMORY[0x270F68BB8]();
}

uint64_t sub_247204D58()
{
  return MEMORY[0x270F68BC0]();
}

uint64_t sub_247204D68()
{
  return MEMORY[0x270F68BD0]();
}

uint64_t sub_247204D78()
{
  return MEMORY[0x270F68BD8]();
}

uint64_t sub_247204D88()
{
  return MEMORY[0x270F68BE0]();
}

uint64_t sub_247204D98()
{
  return MEMORY[0x270F68BE8]();
}

uint64_t sub_247204DA8()
{
  return MEMORY[0x270F68BF0]();
}

uint64_t sub_247204DB8()
{
  return MEMORY[0x270F68BF8]();
}

uint64_t sub_247204DC8()
{
  return MEMORY[0x270F68C00]();
}

uint64_t sub_247204DD8()
{
  return MEMORY[0x270F68CE0]();
}

uint64_t sub_247204DE8()
{
  return MEMORY[0x270F68CE8]();
}

uint64_t sub_247204DF8()
{
  return MEMORY[0x270F68CF0]();
}

uint64_t sub_247204E08()
{
  return MEMORY[0x270F68CF8]();
}

uint64_t sub_247204E18()
{
  return MEMORY[0x270F68D00]();
}

uint64_t sub_247204E28()
{
  return MEMORY[0x270F68D08]();
}

uint64_t sub_247204E38()
{
  return MEMORY[0x270F68D10]();
}

uint64_t sub_247204E48()
{
  return MEMORY[0x270F68D18]();
}

uint64_t sub_247204E58()
{
  return MEMORY[0x270F68D20]();
}

uint64_t sub_247204E68()
{
  return MEMORY[0x270F68F28]();
}

uint64_t sub_247204E78()
{
  return MEMORY[0x270F68F30]();
}

uint64_t sub_247204E88()
{
  return MEMORY[0x270F68F38]();
}

uint64_t sub_247204E98()
{
  return MEMORY[0x270F68F40]();
}

uint64_t sub_247204EA8()
{
  return MEMORY[0x270F68F48]();
}

uint64_t sub_247204EB8()
{
  return MEMORY[0x270F68F50]();
}

uint64_t sub_247204EC8()
{
  return MEMORY[0x270F68F58]();
}

uint64_t sub_247204ED8()
{
  return MEMORY[0x270F68F60]();
}

uint64_t sub_247204EE8()
{
  return MEMORY[0x270F68F70]();
}

uint64_t sub_247204EF8()
{
  return MEMORY[0x270F68F78]();
}

uint64_t sub_247204F08()
{
  return MEMORY[0x270F68F80]();
}

uint64_t sub_247204F18()
{
  return MEMORY[0x270F68F88]();
}

uint64_t sub_247204F28()
{
  return MEMORY[0x270F68F90]();
}

uint64_t sub_247204F38()
{
  return MEMORY[0x270F68F98]();
}

uint64_t sub_247204F48()
{
  return MEMORY[0x270F68FA0]();
}

uint64_t sub_247204F58()
{
  return MEMORY[0x270F68FA8]();
}

uint64_t sub_247204F68()
{
  return MEMORY[0x270F68FB0]();
}

uint64_t sub_247204F78()
{
  return MEMORY[0x270F68FC0]();
}

uint64_t sub_247204F88()
{
  return MEMORY[0x270F68FC8]();
}

uint64_t sub_247204F98()
{
  return MEMORY[0x270F68FE8]();
}

uint64_t sub_247204FA8()
{
  return MEMORY[0x270F68FF0]();
}

uint64_t sub_247204FB8()
{
  return MEMORY[0x270F68FF8]();
}

uint64_t sub_247204FC8()
{
  return MEMORY[0x270F69000]();
}

uint64_t sub_247204FD8()
{
  return MEMORY[0x270F69008]();
}

uint64_t sub_247204FE8()
{
  return MEMORY[0x270F69010]();
}

uint64_t sub_247204FF8()
{
  return MEMORY[0x270F69018]();
}

uint64_t sub_247205008()
{
  return MEMORY[0x270F69020]();
}

uint64_t sub_247205018()
{
  return MEMORY[0x270F69028]();
}

uint64_t sub_247205028()
{
  return MEMORY[0x270F69030]();
}

uint64_t sub_247205038()
{
  return MEMORY[0x270F69038]();
}

uint64_t sub_247205048()
{
  return MEMORY[0x270F69040]();
}

uint64_t sub_247205058()
{
  return MEMORY[0x270F69048]();
}

uint64_t sub_247205068()
{
  return MEMORY[0x270F69050]();
}

uint64_t sub_247205078()
{
  return MEMORY[0x270F69058]();
}

uint64_t sub_247205088()
{
  return MEMORY[0x270F69060]();
}

uint64_t sub_247205098()
{
  return MEMORY[0x270F69068]();
}

uint64_t sub_2472050A8()
{
  return MEMORY[0x270F69070]();
}

uint64_t sub_2472050B8()
{
  return MEMORY[0x270F69078]();
}

uint64_t sub_2472050C8()
{
  return MEMORY[0x270F69080]();
}

uint64_t sub_2472050D8()
{
  return MEMORY[0x270F69088]();
}

uint64_t sub_2472050E8()
{
  return MEMORY[0x270F69090]();
}

uint64_t sub_2472050F8()
{
  return MEMORY[0x270F69098]();
}

uint64_t sub_247205108()
{
  return MEMORY[0x270F690A0]();
}

uint64_t sub_247205118()
{
  return MEMORY[0x270F690A8]();
}

uint64_t sub_247205128()
{
  return MEMORY[0x270F690B0]();
}

uint64_t sub_247205138()
{
  return MEMORY[0x270F690B8]();
}

uint64_t sub_247205148()
{
  return MEMORY[0x270F690C0]();
}

uint64_t sub_247205158()
{
  return MEMORY[0x270F690C8]();
}

uint64_t sub_247205168()
{
  return MEMORY[0x270F690D8]();
}

uint64_t sub_247205178()
{
  return MEMORY[0x270F690E0]();
}

uint64_t sub_247205188()
{
  return MEMORY[0x270F690F0]();
}

uint64_t sub_247205198()
{
  return MEMORY[0x270F690F8]();
}

uint64_t sub_2472051A8()
{
  return MEMORY[0x270F69100]();
}

uint64_t sub_2472051B8()
{
  return MEMORY[0x270F69108]();
}

uint64_t sub_2472051C8()
{
  return MEMORY[0x270F69110]();
}

uint64_t sub_2472051D8()
{
  return MEMORY[0x270F69118]();
}

uint64_t sub_2472051E8()
{
  return MEMORY[0x270F69128]();
}

uint64_t sub_2472051F8()
{
  return MEMORY[0x270F69130]();
}

uint64_t sub_247205208()
{
  return MEMORY[0x270F69138]();
}

uint64_t sub_247205218()
{
  return MEMORY[0x270F69140]();
}

uint64_t sub_247205228()
{
  return MEMORY[0x270F69148]();
}

uint64_t sub_247205238()
{
  return MEMORY[0x270F69150]();
}

uint64_t sub_247205248()
{
  return MEMORY[0x270F69158]();
}

uint64_t sub_247205258()
{
  return MEMORY[0x270F69160]();
}

uint64_t sub_247205268()
{
  return MEMORY[0x270F69168]();
}

uint64_t sub_247205278()
{
  return MEMORY[0x270F69180]();
}

uint64_t sub_247205288()
{
  return MEMORY[0x270F69188]();
}

uint64_t sub_247205298()
{
  return MEMORY[0x270F69190]();
}

uint64_t sub_2472052A8()
{
  return MEMORY[0x270F69198]();
}

uint64_t sub_2472052B8()
{
  return MEMORY[0x270F691A0]();
}

uint64_t sub_2472052C8()
{
  return MEMORY[0x270F691A8]();
}

uint64_t sub_2472052D8()
{
  return MEMORY[0x270F691B0]();
}

uint64_t sub_2472052E8()
{
  return MEMORY[0x270F691B8]();
}

uint64_t sub_2472052F8()
{
  return MEMORY[0x270F691C0]();
}

uint64_t sub_247205308()
{
  return MEMORY[0x270F691E8]();
}

uint64_t sub_247205318()
{
  return MEMORY[0x270F691F0]();
}

uint64_t sub_247205328()
{
  return MEMORY[0x270F691F8]();
}

uint64_t sub_247205338()
{
  return MEMORY[0x270F69200]();
}

uint64_t sub_247205348()
{
  return MEMORY[0x270F69208]();
}

uint64_t sub_247205358()
{
  return MEMORY[0x270F69210]();
}

uint64_t sub_247205368()
{
  return MEMORY[0x270F69218]();
}

uint64_t sub_247205378()
{
  return MEMORY[0x270F69220]();
}

uint64_t sub_247205388()
{
  return MEMORY[0x270F69228]();
}

uint64_t sub_247205398()
{
  return MEMORY[0x270F69230]();
}

uint64_t sub_2472053A8()
{
  return MEMORY[0x270F69238]();
}

uint64_t sub_2472053B8()
{
  return MEMORY[0x270F69240]();
}

uint64_t sub_2472053C8()
{
  return MEMORY[0x270F692A0]();
}

uint64_t sub_2472053D8()
{
  return MEMORY[0x270F692A8]();
}

uint64_t sub_2472053E8()
{
  return MEMORY[0x270F692B0]();
}

uint64_t sub_2472053F8()
{
  return MEMORY[0x270F692B8]();
}

uint64_t sub_247205408()
{
  return MEMORY[0x270F692C0]();
}

uint64_t sub_247205418()
{
  return MEMORY[0x270F692D0]();
}

uint64_t sub_247205428()
{
  return MEMORY[0x270F692D8]();
}

uint64_t sub_247205438()
{
  return MEMORY[0x270F692E0]();
}

uint64_t sub_247205448()
{
  return MEMORY[0x270F692E8]();
}

uint64_t sub_247205458()
{
  return MEMORY[0x270F692F0]();
}

uint64_t sub_247205468()
{
  return MEMORY[0x270F692F8]();
}

uint64_t sub_247205478()
{
  return MEMORY[0x270F69300]();
}

uint64_t sub_247205488()
{
  return MEMORY[0x270F69308]();
}

uint64_t sub_247205498()
{
  return MEMORY[0x270F69338]();
}

uint64_t sub_2472054A8()
{
  return MEMORY[0x270F69348]();
}

uint64_t sub_2472054B8()
{
  return MEMORY[0x270F69350]();
}

uint64_t sub_2472054C8()
{
  return MEMORY[0x270F69358]();
}

uint64_t sub_2472054D8()
{
  return MEMORY[0x270F69360]();
}

uint64_t sub_2472054E8()
{
  return MEMORY[0x270F69368]();
}

uint64_t sub_2472054F8()
{
  return MEMORY[0x270F69370]();
}

uint64_t sub_247205508()
{
  return MEMORY[0x270F69378]();
}

uint64_t sub_247205518()
{
  return MEMORY[0x270F69380]();
}

uint64_t sub_247205528()
{
  return MEMORY[0x270F69388]();
}

uint64_t sub_247205538()
{
  return MEMORY[0x270F693E0]();
}

uint64_t sub_247205548()
{
  return MEMORY[0x270F69418]();
}

uint64_t sub_247205558()
{
  return MEMORY[0x270F69420]();
}

uint64_t sub_247205568()
{
  return MEMORY[0x270F69430]();
}

uint64_t sub_247205578()
{
  return MEMORY[0x270F69468]();
}

uint64_t sub_247205588()
{
  return MEMORY[0x270F69480]();
}

uint64_t sub_247205598()
{
  return MEMORY[0x270F694A0]();
}

uint64_t sub_2472055A8()
{
  return MEMORY[0x270F69518]();
}

uint64_t sub_2472055B8()
{
  return MEMORY[0x270F69520]();
}

uint64_t sub_2472055C8()
{
  return MEMORY[0x270F69528]();
}

uint64_t sub_2472055D8()
{
  return MEMORY[0x270F69530]();
}

uint64_t sub_2472055E8()
{
  return MEMORY[0x270F69540]();
}

uint64_t sub_2472055F8()
{
  return MEMORY[0x270F69548]();
}

uint64_t sub_247205608()
{
  return MEMORY[0x270F69550]();
}

uint64_t sub_247205618()
{
  return MEMORY[0x270F69558]();
}

uint64_t sub_247205628()
{
  return MEMORY[0x270F69560]();
}

uint64_t sub_247205638()
{
  return MEMORY[0x270F69578]();
}

uint64_t sub_247205648()
{
  return MEMORY[0x270F69580]();
}

uint64_t sub_247205658()
{
  return MEMORY[0x270F695E8]();
}

uint64_t sub_247205668()
{
  return MEMORY[0x270F695F0]();
}

uint64_t sub_247205678()
{
  return MEMORY[0x270F695F8]();
}

uint64_t sub_247205688()
{
  return MEMORY[0x270F69600]();
}

uint64_t sub_247205698()
{
  return MEMORY[0x270F69608]();
}

uint64_t sub_2472056A8()
{
  return MEMORY[0x270F69610]();
}

uint64_t sub_2472056B8()
{
  return MEMORY[0x270F69618]();
}

uint64_t sub_2472056C8()
{
  return MEMORY[0x270F69620]();
}

uint64_t sub_2472056D8()
{
  return MEMORY[0x270F69628]();
}

uint64_t sub_2472056E8()
{
  return MEMORY[0x270F69630]();
}

uint64_t sub_2472056F8()
{
  return MEMORY[0x270F69638]();
}

uint64_t sub_247205708()
{
  return MEMORY[0x270F69640]();
}

uint64_t sub_247205718()
{
  return MEMORY[0x270F69648]();
}

uint64_t sub_247205728()
{
  return MEMORY[0x270F69650]();
}

uint64_t sub_247205738()
{
  return MEMORY[0x270F69658]();
}

uint64_t sub_247205748()
{
  return MEMORY[0x270F69660]();
}

uint64_t sub_247205758()
{
  return MEMORY[0x270F69668]();
}

uint64_t sub_247205768()
{
  return MEMORY[0x270F69670]();
}

uint64_t sub_247205778()
{
  return MEMORY[0x270F69678]();
}

uint64_t sub_247205788()
{
  return MEMORY[0x270F69680]();
}

uint64_t sub_247205798()
{
  return MEMORY[0x270F696A8]();
}

uint64_t sub_2472057A8()
{
  return MEMORY[0x270F696B0]();
}

uint64_t sub_2472057B8()
{
  return MEMORY[0x270F696D8]();
}

uint64_t sub_2472057C8()
{
  return MEMORY[0x270F696E0]();
}

uint64_t sub_2472057D8()
{
  return MEMORY[0x270F696E8]();
}

uint64_t sub_2472057E8()
{
  return MEMORY[0x270F696F0]();
}

uint64_t sub_2472057F8()
{
  return MEMORY[0x270F69718]();
}

uint64_t sub_247205808()
{
  return MEMORY[0x270F69720]();
}

uint64_t sub_247205818()
{
  return MEMORY[0x270F69738]();
}

uint64_t sub_247205828()
{
  return MEMORY[0x270F69740]();
}

uint64_t sub_247205838()
{
  return MEMORY[0x270F69748]();
}

uint64_t sub_247205848()
{
  return MEMORY[0x270F69750]();
}

uint64_t sub_247205858()
{
  return MEMORY[0x270F69758]();
}

uint64_t sub_247205868()
{
  return MEMORY[0x270F69760]();
}

uint64_t sub_247205878()
{
  return MEMORY[0x270F69768]();
}

uint64_t sub_247205888()
{
  return MEMORY[0x270F69770]();
}

uint64_t sub_247205898()
{
  return MEMORY[0x270F69778]();
}

uint64_t sub_2472058A8()
{
  return MEMORY[0x270F69780]();
}

uint64_t sub_2472058B8()
{
  return MEMORY[0x270F69788]();
}

uint64_t sub_2472058C8()
{
  return MEMORY[0x270F69790]();
}

uint64_t sub_2472058D8()
{
  return MEMORY[0x270F69798]();
}

uint64_t sub_2472058E8()
{
  return MEMORY[0x270F697A0]();
}

uint64_t sub_2472058F8()
{
  return MEMORY[0x270F697B8]();
}

uint64_t sub_247205908()
{
  return MEMORY[0x270F697C0]();
}

uint64_t sub_247205918()
{
  return MEMORY[0x270F697C8]();
}

uint64_t sub_247205928()
{
  return MEMORY[0x270F697D0]();
}

uint64_t sub_247205938()
{
  return MEMORY[0x270F697D8]();
}

uint64_t sub_247205948()
{
  return MEMORY[0x270F697E0]();
}

uint64_t sub_247205958()
{
  return MEMORY[0x270F697E8]();
}

uint64_t sub_247205968()
{
  return MEMORY[0x270F697F0]();
}

uint64_t sub_247205978()
{
  return MEMORY[0x270F697F8]();
}

uint64_t sub_247205988()
{
  return MEMORY[0x270F69800]();
}

uint64_t sub_247205998()
{
  return MEMORY[0x270F69808]();
}

uint64_t sub_2472059A8()
{
  return MEMORY[0x270F69810]();
}

uint64_t sub_2472059B8()
{
  return MEMORY[0x270F69818]();
}

uint64_t sub_2472059C8()
{
  return MEMORY[0x270F69820]();
}

uint64_t sub_2472059D8()
{
  return MEMORY[0x270F69828]();
}

uint64_t sub_2472059E8()
{
  return MEMORY[0x270F69830]();
}

uint64_t sub_2472059F8()
{
  return MEMORY[0x270F69838]();
}

uint64_t sub_247205A08()
{
  return MEMORY[0x270F69840]();
}

uint64_t sub_247205A18()
{
  return MEMORY[0x270F69848]();
}

uint64_t sub_247205A28()
{
  return MEMORY[0x270F69850]();
}

uint64_t sub_247205A38()
{
  return MEMORY[0x270F69860]();
}

uint64_t sub_247205A48()
{
  return MEMORY[0x270F69870]();
}

uint64_t sub_247205A58()
{
  return MEMORY[0x270F69888]();
}

uint64_t sub_247205A68()
{
  return MEMORY[0x270F69898]();
}

uint64_t sub_247205A78()
{
  return MEMORY[0x270F69908]();
}

uint64_t sub_247205A88()
{
  return MEMORY[0x270F69910]();
}

uint64_t sub_247205A98()
{
  return MEMORY[0x270F69918]();
}

uint64_t sub_247205AA8()
{
  return MEMORY[0x270F69920]();
}

uint64_t sub_247205AB8()
{
  return MEMORY[0x270F69A88]();
}

uint64_t sub_247205AC8()
{
  return MEMORY[0x270F69B20]();
}

uint64_t sub_247205AD8()
{
  return MEMORY[0x270F69B28]();
}

uint64_t sub_247205AE8()
{
  return MEMORY[0x270F69B48]();
}

uint64_t sub_247205AF8()
{
  return MEMORY[0x270F69B50]();
}

uint64_t sub_247205B08()
{
  return MEMORY[0x270F69B78]();
}

uint64_t sub_247205B18()
{
  return MEMORY[0x270F69B80]();
}

uint64_t sub_247205B28()
{
  return MEMORY[0x270F69B90]();
}

uint64_t sub_247205B38()
{
  return MEMORY[0x270F69BA0]();
}

uint64_t sub_247205B48()
{
  return MEMORY[0x270F69BB8]();
}

uint64_t sub_247205B58()
{
  return MEMORY[0x270F69BC0]();
}

uint64_t sub_247205B68()
{
  return MEMORY[0x270F69BD8]();
}

uint64_t sub_247205B78()
{
  return MEMORY[0x270F69BE0]();
}

uint64_t sub_247205B88()
{
  return MEMORY[0x270F446F8]();
}

uint64_t sub_247205B98()
{
  return MEMORY[0x270F44710]();
}

uint64_t sub_247205BA8()
{
  return MEMORY[0x270F70E40]();
}

uint64_t sub_247205BB8()
{
  return MEMORY[0x270F70E50]();
}

uint64_t sub_247205BC8()
{
  return MEMORY[0x270F70E58]();
}

uint64_t sub_247205BD8()
{
  return MEMORY[0x270F70E60]();
}

uint64_t sub_247205BE8()
{
  return MEMORY[0x270F70E78]();
}

uint64_t sub_247205BF8()
{
  return MEMORY[0x270F70E80]();
}

uint64_t sub_247205C08()
{
  return MEMORY[0x270F70E90]();
}

uint64_t sub_247205C18()
{
  return MEMORY[0x270F70E98]();
}

uint64_t sub_247205C28()
{
  return MEMORY[0x270F70EA0]();
}

uint64_t sub_247205C38()
{
  return MEMORY[0x270F70EA8]();
}

uint64_t sub_247205C48()
{
  return MEMORY[0x270F70EB0]();
}

uint64_t sub_247205C58()
{
  return MEMORY[0x270F70EB8]();
}

uint64_t sub_247205C68()
{
  return MEMORY[0x270F70EC0]();
}

uint64_t sub_247205C78()
{
  return MEMORY[0x270F70EC8]();
}

uint64_t sub_247205C88()
{
  return MEMORY[0x270F70ED0]();
}

uint64_t sub_247205C98()
{
  return MEMORY[0x270F70ED8]();
}

uint64_t sub_247205CA8()
{
  return MEMORY[0x270F70EE8]();
}

uint64_t sub_247205CB8()
{
  return MEMORY[0x270F70EF0]();
}

uint64_t sub_247205CC8()
{
  return MEMORY[0x270F70F00]();
}

uint64_t sub_247205CD8()
{
  return MEMORY[0x270F70F30]();
}

uint64_t sub_247205CE8()
{
  return MEMORY[0x270F70F38]();
}

uint64_t sub_247205CF8()
{
  return MEMORY[0x270F70F40]();
}

uint64_t sub_247205D08()
{
  return MEMORY[0x270F70F48]();
}

uint64_t sub_247205D18()
{
  return MEMORY[0x270F70F50]();
}

uint64_t sub_247205D28()
{
  return MEMORY[0x270F70F58]();
}

uint64_t sub_247205D38()
{
  return MEMORY[0x270F70F60]();
}

uint64_t sub_247205D48()
{
  return MEMORY[0x270F70F68]();
}

uint64_t sub_247205D58()
{
  return MEMORY[0x270F70FA8]();
}

uint64_t sub_247205D68()
{
  return MEMORY[0x270F70FB0]();
}

uint64_t sub_247205D78()
{
  return MEMORY[0x270F70FB8]();
}

uint64_t sub_247205D88()
{
  return MEMORY[0x270F70FC0]();
}

uint64_t sub_247205D98()
{
  return MEMORY[0x270F70FC8]();
}

uint64_t sub_247205DA8()
{
  return MEMORY[0x270F70FD0]();
}

uint64_t sub_247205DB8()
{
  return MEMORY[0x270F70FD8]();
}

uint64_t sub_247205DC8()
{
  return MEMORY[0x270F70FE8]();
}

uint64_t sub_247205DD8()
{
  return MEMORY[0x270F70FF0]();
}

uint64_t sub_247205DE8()
{
  return MEMORY[0x270F70FF8]();
}

uint64_t sub_247205DF8()
{
  return MEMORY[0x270F71000]();
}

uint64_t sub_247205E08()
{
  return MEMORY[0x270F71008]();
}

uint64_t sub_247205E18()
{
  return MEMORY[0x270F71010]();
}

uint64_t sub_247205E28()
{
  return MEMORY[0x270F71038]();
}

uint64_t sub_247205E38()
{
  return MEMORY[0x270F71040]();
}

uint64_t sub_247205E48()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_247205E58()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_247205E68()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_247205E78()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_247205E88()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_247205E98()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_247205EA8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_247205EB8()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_247205EC8()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_247205ED8()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_247205EE8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_247205EF8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_247205F08()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_247205F18()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_247205F28()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_247205F38()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_247205F48()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_247205F58()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_247205F68()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_247205F78()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_247205F88()
{
  return MEMORY[0x270F9D0B8]();
}

uint64_t sub_247205F98()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_247205FA8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_247205FB8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_247205FC8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_247205FD8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_247205FE8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_247205FF8()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_247206008()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_247206018()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_247206028()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_247206038()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_247206048()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_247206058()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_247206078()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_247206088()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_247206098()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2472060A8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2472060B8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2472060C8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2472060D8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2472060E8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2472060F8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_247206108()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_247206118()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_247206128()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_247206138()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_247206148()
{
  return MEMORY[0x270EF1C00]();
}

uint64_t sub_247206158()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_247206168()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_247206178()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_247206188()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_247206198()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2472061A8()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2472061B8()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2472061C8()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_2472061D8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2472061E8()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2472061F8()
{
  return MEMORY[0x270F71050]();
}

uint64_t sub_247206208()
{
  return MEMORY[0x270F71058]();
}

uint64_t sub_247206218()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_247206228()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_247206238()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_247206248()
{
  return MEMORY[0x270FA0F00]();
}

uint64_t sub_247206258()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_247206268()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_247206278()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_247206288()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_247206298()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_2472062A8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2472062B8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2472062C8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2472062D8()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_2472062E8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2472062F8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_247206308()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_247206318()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_247206328()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_247206338()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_247206348()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_247206358()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_247206368()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_247206378()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_247206388()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_247206398()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2472063A8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2472063B8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2472063C8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2472063D8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2472063E8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2472063F8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_247206408()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_247206418()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_247206428()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_247206438()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_247206448()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_247206458()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_247206468()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_247206478()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_247206488()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_247206498()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_2472064A8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2472064B8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2472064C8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2472064D8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2472064E8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2472064F8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_247206508()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_247206518()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_247206528()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_247206538()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_247206548()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AFDeviceSupportsHybridUOD()
{
  return MEMORY[0x270F0ECC0]();
}

uint64_t AFDeviceSupportsMedoc()
{
  return MEMORY[0x270F0ECC8]();
}

uint64_t AFDeviceSupportsPatientSiri()
{
  return MEMORY[0x270F0ECD0]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x270F0ECD8]();
}

uint64_t AFDeviceSupportsSiriMUX()
{
  return MEMORY[0x270F0ECE0]();
}

uint64_t AFIsATV()
{
  return MEMORY[0x270F0EDA0]();
}

uint64_t AFIsHorseman()
{
  return MEMORY[0x270F0EDC0]();
}

uint64_t AFIsSearchDictationRequest()
{
  return MEMORY[0x270F0EDF0]();
}

uint64_t _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode()
{
  return MEMORY[0x270F0F050]();
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

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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