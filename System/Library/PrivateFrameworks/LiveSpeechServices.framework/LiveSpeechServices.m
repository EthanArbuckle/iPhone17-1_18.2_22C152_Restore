uint64_t LiveSpeechError.description.getter()
{
  return sub_254F09018(19, 0xD000000000000011);
}

uint64_t LiveCaptionsError.message.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

LiveSpeechServices::LiveCaptionsError __swiftcall LiveCaptionsError.init(_:)(LiveSpeechServices::LiveCaptionsError result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t LiveCaptionsError.description.getter()
{
  return sub_254F09018(21, 0xD000000000000013);
}

uint64_t sub_254F09018(uint64_t a1, uint64_t a2)
{
  return a2;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for LiveSpeechError()
{
  return &type metadata for LiveSpeechError;
}

void *initializeBufferWithCopyOfBuffer for LiveCaptionsError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LiveCaptionsError()
{
  return swift_bridgeObjectRelease();
}

void *_s18LiveSpeechServices15LiveSpeechErrorVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for LiveCaptionsError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18LiveSpeechServices15LiveSpeechErrorVwet_0(uint64_t a1, int a2)
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

uint64_t sub_254F091BC(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LiveCaptionsError()
{
  return &type metadata for LiveCaptionsError;
}

uint64_t sub_254F0921C(uint64_t a1)
{
  return sub_254F0947C(a1, qword_26B270B58);
}

uint64_t LiveSpeechLog.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_254F09518(&qword_26B270B70, (uint64_t)qword_26B270B58, a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t LiveSpeechLog.setter(uint64_t a1)
{
  return sub_254F095E4(a1, &qword_26B270B70, (uint64_t)qword_26B270B58);
}

uint64_t (*LiveSpeechLog.modify())()
{
  if (qword_26B270B70 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_254F10140();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B270B58);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_254F09354(uint64_t a1)
{
  return sub_254F0947C(a1, qword_26B270AE8);
}

uint64_t LiveCaptionsLog.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_254F09518(&qword_26B270B00, (uint64_t)qword_26B270AE8, a1);
}

uint64_t LiveCaptionsLog.setter(uint64_t a1)
{
  return sub_254F095E4(a1, &qword_26B270B00, (uint64_t)qword_26B270AE8);
}

uint64_t (*LiveCaptionsLog.modify())()
{
  if (qword_26B270B00 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_254F10140();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B270AE8);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_254F09458(uint64_t a1)
{
  return sub_254F0947C(a1, qword_269E76AC0);
}

uint64_t sub_254F0947C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_254F10140();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_254F10130();
}

uint64_t LSLCCommonLog.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_254F09518(&qword_269E76AB0, (uint64_t)qword_269E76AC0, a1);
}

uint64_t sub_254F09518@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_254F10140();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t LSLCCommonLog.setter(uint64_t a1)
{
  return sub_254F095E4(a1, &qword_269E76AB0, (uint64_t)qword_269E76AC0);
}

uint64_t sub_254F095E4(uint64_t a1, void *a2, uint64_t a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_254F10140();
  uint64_t v6 = __swift_project_value_buffer(v5, a3);
  swift_beginAccess();
  uint64_t v7 = *(void *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v6, a1, v5);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v5);
}

uint64_t (*LSLCCommonLog.modify())()
{
  if (qword_269E76AB0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_254F10140();
  __swift_project_value_buffer(v0, (uint64_t)qword_269E76AC0);
  swift_beginAccess();
  return j_j__swift_endAccess;
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

LiveSpeechServices::LiveSpeechLiveCaptionsUIServiceMessageID_optional __swiftcall LiveSpeechLiveCaptionsUIServiceMessageID.init(rawValue:)(Swift::Int rawValue)
{
  unint64_t v2 = 0x302010004uLL >> (8 * rawValue);
  if ((unint64_t)rawValue >= 5) {
    LOBYTE(v2) = 4;
  }
  *uint64_t v1 = v2;
  return (LiveSpeechServices::LiveSpeechLiveCaptionsUIServiceMessageID_optional)rawValue;
}

uint64_t LiveSpeechLiveCaptionsUIServiceMessageID.rawValue.getter()
{
  return *v0 + 1;
}

BOOL sub_254F097F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_254F0980C()
{
  return sub_254F103F0();
}

uint64_t sub_254F09854()
{
  return sub_254F103E0();
}

uint64_t sub_254F09884()
{
  return sub_254F103F0();
}

LiveSpeechServices::LiveSpeechLiveCaptionsUIServiceMessageID_optional sub_254F098C8(Swift::Int *a1)
{
  return LiveSpeechLiveCaptionsUIServiceMessageID.init(rawValue:)(*a1);
}

void sub_254F098D0(void *a1@<X8>)
{
  *a1 = *v1 + 1;
}

id sub_254F098E0()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LiveSpeechCaptionsClient()), sel_init);
  qword_26B270B10 = (uint64_t)result;
  return result;
}

id static LiveSpeechCaptionsClient.shared.getter()
{
  if (qword_26B270B18 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B270B10;

  return v0;
}

id LiveSpeechCaptionsClient.__deallocating_deinit()
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_254F09A74();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_254F09A74()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_254F10140();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned char *)(v1 + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveSpeechRunning) & 1) == 0
    && (*(unsigned char *)(v1 + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveCaptionsRunning) & 1) == 0)
  {
    if (qword_26B270B70 != -1) {
      swift_once();
    }
    uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_26B270B58);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
    uint64_t v7 = sub_254F10120();
    os_log_type_t v8 = sub_254F10290();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_254F07000, v7, v8, "LiveSpeechLiveCaptionsClient clean up", v9, 2u);
      MEMORY[0x25A281FD0](v9, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v10 = swift_allocObject();
    uint64_t v11 = OBJC_IVAR___LiveSpeechCaptionsClient__client;
    v12 = *(void **)(v1 + OBJC_IVAR___LiveSpeechCaptionsClient__client);
    *(void *)(v10 + 16) = v12;
    *(void *)(v1 + v11) = 0;
    if (v12)
    {
      aBlock[4] = sub_254F0D3A0;
      aBlock[5] = v10;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_254F0C00C;
      aBlock[3] = &block_descriptor_38;
      v13 = _Block_copy(aBlock);
      id v14 = v12;
      swift_retain();
      swift_release();
      objc_msgSend(v14, sel_invalidate_, v13);
      _Block_release(v13);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LiveSpeechCaptionsClient.startLiveSpeech()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_254F10140();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = (char *)&aBlock[-1] - v7;
  if (*(unsigned char *)(v1 + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveSpeechRunning) == 1)
  {
    if (qword_26B270B70 != -1) {
      swift_once();
    }
    uint64_t v9 = __swift_project_value_buffer(v2, (uint64_t)qword_26B270B58);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v9, v2);
    uint64_t v10 = sub_254F10120();
    os_log_type_t v11 = sub_254F10290();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_254F07000, v10, v11, "Already running LiveSpeech, skip", v12, 2u);
      MEMORY[0x25A281FD0](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  else
  {
    *(unsigned char *)(v1 + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveSpeechRunning) = 1;
    if (qword_26B270B70 != -1) {
      swift_once();
    }
    uint64_t v13 = __swift_project_value_buffer(v2, (uint64_t)qword_26B270B58);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v13, v2);
    id v14 = sub_254F10120();
    os_log_type_t v15 = sub_254F10290();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_254F07000, v14, v15, "Client requesting LiveSpeech start", v16, 2u);
      MEMORY[0x25A281FD0](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    id v17 = sub_254F0A150();
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = sub_254F0A2F0;
    *(void *)(v18 + 24) = 0;
    aBlock[4] = sub_254F0C7BC;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_254F0C7C4;
    aBlock[3] = &block_descriptor;
    v19 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v17, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 1, 0, v19);
    _Block_release(v19);
  }
}

id sub_254F0A150()
{
  uint64_t v1 = OBJC_IVAR___LiveSpeechCaptionsClient__client;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___LiveSpeechCaptionsClient__client);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___LiveSpeechCaptionsClient__client);
LABEL_6:
    id v13 = v2;
    return v3;
  }
  uint64_t v4 = v0;
  sub_254F102E0();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel_processInfo);
  objc_msgSend(v5, sel_processIdentifier);

  sub_254F10360();
  sub_254F10200();
  swift_bridgeObjectRelease();
  id v6 = objc_allocWithZone(MEMORY[0x263F22198]);
  uint64_t v7 = (void *)sub_254F101C0();
  swift_bridgeObjectRelease();
  os_log_type_t v8 = (void *)sub_254F101C0();
  id v9 = objc_msgSend(v6, sel_initWithIdentifier_serviceBundleName_, v7, v8);

  uint64_t v10 = *(void **)(v4 + v1);
  *(void *)(v4 + v1) = v9;

  id result = *(id *)(v4 + v1);
  if (result)
  {
    id result = objc_msgSend(result, sel_setDelegate_, v4);
    v12 = *(void **)(v4 + v1);
    if (v12)
    {
      id v3 = v12;
      uint64_t v2 = 0;
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_254F0A2F0(void *a1, char a2)
{
  uint64_t v4 = sub_254F10140();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  os_log_type_t v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v27 - v9;
  if (a2)
  {
    id v15 = a1;
    if (qword_26B270B70 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v4, (uint64_t)qword_26B270B58);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v16, v4);
    id v17 = a1;
    id v18 = a1;
    v19 = sub_254F10120();
    os_log_type_t v20 = sub_254F10280();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = (void *)swift_slowAlloc();
      *(_DWORD *)v21 = 138412290;
      v27[1] = v21 + 4;
      sub_254F0D32C();
      swift_allocError();
      void *v23 = a1;
      id v24 = a1;
      uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
      v27[2] = v25;
      sub_254F102A0();
      void *v22 = v25;
      sub_254F0D320(a1, 1);
      sub_254F0D320(a1, 1);
      _os_log_impl(&dword_254F07000, v19, v20, "Failed to start LiveSpeech: %@", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E76B78);
      swift_arrayDestroy();
      MEMORY[0x25A281FD0](v22, -1, -1);
      MEMORY[0x25A281FD0](v21, -1, -1);

      sub_254F0D320(a1, 1);
    }
    else
    {
      sub_254F0D320(a1, 1);
      sub_254F0D320(a1, 1);
    }
    uint64_t v10 = v8;
  }
  else
  {
    if (qword_26B270B70 != -1) {
      swift_once();
    }
    uint64_t v11 = __swift_project_value_buffer(v4, (uint64_t)qword_26B270B58);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v11, v4);
    v12 = sub_254F10120();
    os_log_type_t v13 = sub_254F10290();
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_254F07000, v12, v13, "Client received LiveSpeech start success callback", v14, 2u);
      MEMORY[0x25A281FD0](v14, -1, -1);
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LiveSpeechCaptionsClient.stopLiveSpeech()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_254F10140();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = (char *)&aBlock[-1] - v7;
  if (v1[OBJC_IVAR___LiveSpeechCaptionsClient_isLiveSpeechRunning])
  {
    v1[OBJC_IVAR___LiveSpeechCaptionsClient_isLiveSpeechRunning] = 0;
    if (qword_26B270B70 != -1) {
      swift_once();
    }
    uint64_t v9 = __swift_project_value_buffer(v2, (uint64_t)qword_26B270B58);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v9, v2);
    uint64_t v10 = sub_254F10120();
    os_log_type_t v11 = sub_254F10290();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_254F07000, v10, v11, "Client requesting LiveSpeech stop", v12, 2u);
      MEMORY[0x25A281FD0](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    id v13 = sub_254F0A150();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v1;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_254F0C888;
    *(void *)(v15 + 24) = v14;
    aBlock[4] = sub_254F0D52C;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_254F0C7C4;
    aBlock[3] = &block_descriptor_10;
    uint64_t v16 = _Block_copy(aBlock);
    id v17 = v1;
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 2, 0, v16);
    _Block_release(v16);
    swift_release();
  }
  else
  {
    if (qword_26B270B70 != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v2, (uint64_t)qword_26B270B58);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v18, v2);
    v19 = sub_254F10120();
    os_log_type_t v20 = sub_254F10290();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_254F07000, v19, v20, "Can't stop LiveSpeech, not running", v21, 2u);
      MEMORY[0x25A281FD0](v21, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
}

void sub_254F0AAF8(void *a1, char a2)
{
  uint64_t v4 = sub_254F10140();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v26 - v9;
  if (a2)
  {
    id v15 = a1;
    if (qword_26B270B70 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v4, (uint64_t)qword_26B270B58);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v16, v4);
    id v17 = a1;
    id v18 = a1;
    v19 = sub_254F10120();
    os_log_type_t v20 = sub_254F10280();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = (void *)swift_slowAlloc();
      *(_DWORD *)v21 = 138412290;
      v26[1] = v21 + 4;
      sub_254F0D32C();
      swift_allocError();
      void *v23 = a1;
      id v24 = a1;
      uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
      v26[2] = v25;
      sub_254F102A0();
      void *v22 = v25;
      sub_254F0D320(a1, 1);
      sub_254F0D320(a1, 1);
      _os_log_impl(&dword_254F07000, v19, v20, "Failed to stop LiveSpeech: %@", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E76B78);
      swift_arrayDestroy();
      MEMORY[0x25A281FD0](v22, -1, -1);
      MEMORY[0x25A281FD0](v21, -1, -1);

      sub_254F0D320(a1, 1);
    }
    else
    {
      sub_254F0D320(a1, 1);
      sub_254F0D320(a1, 1);
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    if (qword_26B270B70 != -1) {
      swift_once();
    }
    uint64_t v11 = __swift_project_value_buffer(v4, (uint64_t)qword_26B270B58);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v11, v4);
    v12 = sub_254F10120();
    os_log_type_t v13 = sub_254F10290();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_254F07000, v12, v13, "Client received LiveSpeech stop success callback", v14, 2u);
      MEMORY[0x25A281FD0](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    sub_254F09A74();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LiveSpeechCaptionsClient.startLiveCaptions()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_254F10140();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = (char *)&aBlock[-1] - v7;
  if (*(unsigned char *)(v1 + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveCaptionsRunning) == 1)
  {
    if (qword_26B270B00 != -1) {
      swift_once();
    }
    uint64_t v9 = __swift_project_value_buffer(v2, (uint64_t)qword_26B270AE8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v9, v2);
    uint64_t v10 = sub_254F10120();
    os_log_type_t v11 = sub_254F10290();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_254F07000, v10, v11, "Already running LiveCaptions, skip", v12, 2u);
      MEMORY[0x25A281FD0](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  else
  {
    *(unsigned char *)(v1 + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveCaptionsRunning) = 1;
    if (qword_26B270B00 != -1) {
      swift_once();
    }
    uint64_t v13 = __swift_project_value_buffer(v2, (uint64_t)qword_26B270AE8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v13, v2);
    uint64_t v14 = sub_254F10120();
    os_log_type_t v15 = sub_254F10290();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_254F07000, v14, v15, "Client requesting LiveCaptions start", v16, 2u);
      MEMORY[0x25A281FD0](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    id v17 = sub_254F0A150();
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = sub_254F0B2F4;
    *(void *)(v18 + 24) = 0;
    aBlock[4] = sub_254F0D52C;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_254F0C7C4;
    aBlock[3] = &block_descriptor_17;
    v19 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v17, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 3, 0, v19);
    _Block_release(v19);
  }
}

uint64_t sub_254F0B2F4(void *a1, char a2)
{
  uint64_t v4 = sub_254F10140();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v27 - v9;
  if (a2)
  {
    id v15 = a1;
    if (qword_26B270B00 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v4, (uint64_t)qword_26B270AE8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v16, v4);
    id v17 = a1;
    id v18 = a1;
    v19 = sub_254F10120();
    os_log_type_t v20 = sub_254F10280();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = (void *)swift_slowAlloc();
      *(_DWORD *)v21 = 138412290;
      v27[1] = v21 + 4;
      sub_254F0D32C();
      swift_allocError();
      void *v23 = a1;
      id v24 = a1;
      uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
      v27[2] = v25;
      sub_254F102A0();
      void *v22 = v25;
      sub_254F0D320(a1, 1);
      sub_254F0D320(a1, 1);
      _os_log_impl(&dword_254F07000, v19, v20, "Failed to start LiveCaptions: %@", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E76B78);
      swift_arrayDestroy();
      MEMORY[0x25A281FD0](v22, -1, -1);
      MEMORY[0x25A281FD0](v21, -1, -1);

      sub_254F0D320(a1, 1);
    }
    else
    {
      sub_254F0D320(a1, 1);
      sub_254F0D320(a1, 1);
    }
    uint64_t v10 = v8;
  }
  else
  {
    if (qword_26B270B00 != -1) {
      swift_once();
    }
    uint64_t v11 = __swift_project_value_buffer(v4, (uint64_t)qword_26B270AE8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v11, v4);
    v12 = sub_254F10120();
    os_log_type_t v13 = sub_254F10290();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_254F07000, v12, v13, "Client received LiveCaptions start success callback", v14, 2u);
      MEMORY[0x25A281FD0](v14, -1, -1);
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LiveSpeechCaptionsClient.stopLiveCaptions()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_254F10140();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = (char *)&aBlock[-1] - v7;
  if (v1[OBJC_IVAR___LiveSpeechCaptionsClient_isLiveCaptionsRunning])
  {
    v1[OBJC_IVAR___LiveSpeechCaptionsClient_isLiveCaptionsRunning] = 0;
    if (qword_26B270B00 != -1) {
      swift_once();
    }
    uint64_t v9 = __swift_project_value_buffer(v2, (uint64_t)qword_26B270AE8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v9, v2);
    uint64_t v10 = sub_254F10120();
    os_log_type_t v11 = sub_254F10290();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_254F07000, v10, v11, "Client requesting LiveCaptions stop", v12, 2u);
      MEMORY[0x25A281FD0](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    id v13 = sub_254F0A150();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v1;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_254F0C8D4;
    *(void *)(v15 + 24) = v14;
    aBlock[4] = sub_254F0D52C;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_254F0C7C4;
    aBlock[3] = &block_descriptor_27;
    uint64_t v16 = _Block_copy(aBlock);
    id v17 = v1;
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 4, 0, v16);
    _Block_release(v16);
    swift_release();
  }
  else
  {
    if (qword_26B270B00 != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v2, (uint64_t)qword_26B270AE8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v18, v2);
    v19 = sub_254F10120();
    os_log_type_t v20 = sub_254F10290();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_254F07000, v19, v20, "Can't stop LiveCaptions, not running", v21, 2u);
      MEMORY[0x25A281FD0](v21, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
}

void sub_254F0BAFC(void *a1, char a2)
{
  uint64_t v4 = sub_254F10140();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v26 - v9;
  if (a2)
  {
    id v15 = a1;
    if (qword_26B270B00 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v4, (uint64_t)qword_26B270AE8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v16, v4);
    id v17 = a1;
    id v18 = a1;
    v19 = sub_254F10120();
    os_log_type_t v20 = sub_254F10280();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = (void *)swift_slowAlloc();
      *(_DWORD *)v21 = 138412290;
      v26[1] = v21 + 4;
      sub_254F0D32C();
      swift_allocError();
      void *v23 = a1;
      id v24 = a1;
      uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
      v26[2] = v25;
      sub_254F102A0();
      void *v22 = v25;
      sub_254F0D320(a1, 1);
      sub_254F0D320(a1, 1);
      _os_log_impl(&dword_254F07000, v19, v20, "Failed to stop LiveCaptions: %@", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E76B78);
      swift_arrayDestroy();
      MEMORY[0x25A281FD0](v22, -1, -1);
      MEMORY[0x25A281FD0](v21, -1, -1);

      sub_254F0D320(a1, 1);
    }
    else
    {
      sub_254F0D320(a1, 1);
      sub_254F0D320(a1, 1);
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    if (qword_26B270B00 != -1) {
      swift_once();
    }
    uint64_t v11 = __swift_project_value_buffer(v4, (uint64_t)qword_26B270AE8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v11, v4);
    v12 = sub_254F10120();
    os_log_type_t v13 = sub_254F10290();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_254F07000, v12, v13, "Client received LiveCaptions stop success callback", v14, 2u);
      MEMORY[0x25A281FD0](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    sub_254F09A74();
  }
}

unint64_t LiveSpeechCaptionsClient.serviceName.getter()
{
  return 0xD000000000000013;
}

void sub_254F0BF94(uint64_t a1)
{
  uint64_t v2 = (void **)(a1 + 16);
  swift_beginAccess();
  uint64_t v3 = *(void **)(a1 + 16);
  if (v3) {
    objc_msgSend(v3, sel_setDelegate_, 0);
  }
  swift_beginAccess();
  uint64_t v4 = *v2;
  *uint64_t v2 = 0;
}

uint64_t sub_254F0C00C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id LiveSpeechCaptionsClient.userInterfaceClient(_:accessQueueForProcessingMessageWithIdentifier:)()
{
  id v0 = objc_msgSend(self, sel_mainAccessQueue);

  return v0;
}

void LiveSpeechCaptionsClient.connectionWithServiceWasInterrupted(forUserInterfaceClient:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_254F10140();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v41 - v10;
  MEMORY[0x270FA5388](v9);
  os_log_type_t v13 = (char *)&v41 - v12;
  uint64_t v14 = *(void *)(v2 + OBJC_IVAR___LiveSpeechCaptionsClient__client);
  if (a1)
  {
    if (v14) {
      BOOL v15 = a1 == v14;
    }
    else {
      BOOL v15 = 0;
    }
    if (!v15) {
      return;
    }
  }
  else if (v14)
  {
    return;
  }
  if (qword_26B270B70 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v4, (uint64_t)qword_26B270B58);
  swift_beginAccess();
  v42 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v42(v13, v16, v4);
  id v17 = sub_254F10120();
  os_log_type_t v18 = sub_254F10280();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v41 = (uint8_t *)v4;
    uint64_t v20 = v5;
    v21 = v8;
    v22 = v19;
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_254F07000, v17, v18, "Connection to LiveSpeech UI Service was interrupted", v19, 2u);
    v23 = v22;
    os_log_type_t v8 = v21;
    uint64_t v5 = v20;
    uint64_t v4 = (uint64_t)v41;
    MEMORY[0x25A281FD0](v23, -1, -1);
  }

  id v24 = *(void (**)(char *, uint64_t))(v5 + 8);
  v24(v13, v4);
  if (_AXSLiveSpeechEnabled())
  {
    v42(v11, v16, v4);
    uint64_t v25 = sub_254F10120();
    os_log_type_t v26 = sub_254F10270();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v41 = (uint8_t *)v4;
      v28 = v24;
      v29 = v27;
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_254F07000, v25, v26, "LiveSpeech still enabled. Will attempt to relaunch", v27, 2u);
      v30 = v29;
      id v24 = v28;
      uint64_t v4 = (uint64_t)v41;
      MEMORY[0x25A281FD0](v30, -1, -1);
    }

    v24(v11, v4);
    LiveSpeechCaptionsClient.startLiveSpeech()();
    if (v31)
    {
      v42(v8, v16, v4);
      id v32 = v31;
      id v33 = v31;
      v34 = sub_254F10120();
      os_log_type_t v35 = sub_254F10280();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)swift_slowAlloc();
        uint64_t v37 = swift_slowAlloc();
        v42 = (void (*)(char *, uint64_t, uint64_t))v24;
        uint64_t v38 = v37;
        uint64_t v44 = v37;
        *(_DWORD *)v36 = 136315138;
        v41 = v36 + 4;
        swift_getErrorValue();
        uint64_t v39 = sub_254F10380();
        uint64_t v43 = sub_254F0C924(v39, v40, &v44);
        sub_254F102A0();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_254F07000, v34, v35, "Error occurred relaunching LiveSpeech Service: %s", v36, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A281FD0](v38, -1, -1);
        MEMORY[0x25A281FD0](v36, -1, -1);

        ((void (*)(char *, uint64_t))v42)(v8, v4);
      }
      else
      {

        v24(v8, v4);
      }
    }
  }
}

uint64_t sub_254F0C60C(void *a1)
{
  id v2 = a1;
  sub_254F10200();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269E76B80);
  sub_254F10310();

  return 0;
}

uint64_t sub_254F0C6A0()
{
  return sub_254F0C60C(*v0);
}

uint64_t sub_254F0C6B4(uint64_t result, void *a2, void (*a3)(void *, uint64_t))
{
  if (a3)
  {
    if (a2)
    {
      sub_254F0D390((uint64_t)a3);
      id v5 = a2;
      a3(a2, 1);

      return sub_254F0D380((uint64_t)a3);
    }
    else
    {
      unint64_t v6 = result;
      if (result)
      {
        swift_retain();
        unint64_t v7 = v6;
      }
      else
      {
        swift_retain();
        unint64_t v7 = sub_254F0D530(MEMORY[0x263F8EE78]);
      }
      swift_bridgeObjectRetain();
      a3((void *)v7, 0);
      sub_254F0D380((uint64_t)a3);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_254F0C7BC(uint64_t a1, void *a2)
{
  return sub_254F0C6B4(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16));
}

uint64_t sub_254F0C7C4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = sub_254F101B0();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
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

void sub_254F0C888(void *a1, char a2)
{
}

uint64_t sub_254F0C89C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_254F0C8D4(void *a1, char a2)
{
}

uint64_t objectdestroyTm()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_254F0C924(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_254F0CCA8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_254F0CEB4((uint64_t)v12, *a3);
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
      sub_254F0CEB4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_254F0C9FC()
{
  unint64_t result = qword_269E76AF0;
  if (!qword_269E76AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76AF0);
  }
  return result;
}

unint64_t sub_254F0CA50(uint64_t a1)
{
  unint64_t result = sub_254F0CA78();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_254F0CA78()
{
  unint64_t result = qword_269E76AF8;
  if (!qword_269E76AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76AF8);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LiveSpeechLiveCaptionsUIServiceMessageID(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LiveSpeechLiveCaptionsUIServiceMessageID(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x254F0CC38);
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

uint64_t sub_254F0CC60(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_254F0CC6C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LiveSpeechLiveCaptionsUIServiceMessageID()
{
  return &type metadata for LiveSpeechLiveCaptionsUIServiceMessageID;
}

uint64_t type metadata accessor for LiveSpeechCaptionsClient()
{
  return self;
}

uint64_t sub_254F0CCA8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_254F102B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_254F0CF10(a5, a6);
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
  uint64_t v8 = sub_254F10300();
  if (!v8)
  {
    sub_254F10320();
    __break(1u);
LABEL_17:
    uint64_t result = sub_254F10340();
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

uint64_t sub_254F0CEB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_254F0CF10(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_254F0CFA8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_254F0D188(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_254F0D188(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_254F0CFA8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_254F0D120(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_254F102F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_254F10320();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_254F10210();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_254F10340();
    __break(1u);
LABEL_14:
    uint64_t result = sub_254F10320();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_254F0D120(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E76B68);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_254F0D188(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E76B68);
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
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_254F10340();
  __break(1u);
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

void sub_254F0D320(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_254F0D32C()
{
  unint64_t result = qword_269E76B70;
  if (!qword_269E76B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76B70);
  }
  return result;
}

uint64_t sub_254F0D380(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_254F0D390(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void sub_254F0D3A0()
{
  sub_254F0BF94(v0);
}

void *initializeBufferWithCopyOfBuffer for AXUIError(void *a1, id *a2)
{
  id v3 = *a2;
  id v4 = *a2;
  *a1 = v3;
  return a1;
}

void destroy for AXUIError(id *a1)
{
}

void **assignWithCopy for AXUIError(void **a1, id *a2)
{
  id v3 = *a2;
  id v4 = *a2;
  size_t v5 = *a1;
  *a1 = v3;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **assignWithTake for AXUIError(void **a1, void **a2)
{
  id v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for AXUIError(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AXUIError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_254F0D4E4()
{
  return 0;
}

ValueMetadata *type metadata accessor for AXUIError()
{
  return &type metadata for AXUIError;
}

unint64_t sub_254F0D530(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E76C08);
  uint64_t v2 = sub_254F10330();
  id v3 = (void *)v2;
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
    sub_254F0DBF0(v6, (uint64_t)v15);
    unint64_t result = sub_254F0F730((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_254F0DC58(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_254F0D660(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E76C00);
  uint64_t v2 = (void *)sub_254F10330();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    int64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_254F0F774(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v11 = (uint64_t *)(v2[6] + 16 * result);
    *long long v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

void static LiveSpeechAnalytics.didSpeak(inputMode:mixToUplink:voiceName:language:)(char *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v11 = *a1;
  uint64_t v12 = (void *)sub_254F101C0();
  uint64_t v13 = swift_allocObject();
  *(unsigned char *)(v13 + 16) = v11;
  *(unsigned char *)(v13 + 17) = a2;
  *(void *)(v13 + 24) = a3;
  *(void *)(v13 + 32) = a4;
  *(void *)(v13 + 40) = a5;
  *(void *)(v13 + 48) = a6;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_254F0DA88;
  *(void *)(v14 + 24) = v13;
  v16[4] = sub_254F0DAD4;
  v16[5] = v14;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  v16[2] = sub_254F0DAFC;
  v16[3] = &block_descriptor_0;
  BOOL v15 = _Block_copy(v16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v15);
}

unint64_t sub_254F0D8D8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E76BF8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_254F10DA0;
  *(void *)(inited + 32) = 0x7079547475706E69;
  *(void *)(inited + 40) = 0xE900000000000065;
  uint64_t v1 = sub_254F101C0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v1;
  *(void *)(inited + 56) = 0x6C70556F5478696DLL;
  *(void *)(inited + 64) = 0xEB000000006B6E69;
  *(void *)(inited + 72) = sub_254F10260();
  *(void *)(inited + 80) = 0x6D614E6563696F76;
  *(void *)(inited + 88) = 0xE900000000000065;
  *(void *)(inited + 96) = sub_254F101C0();
  *(void *)(inited + 104) = 0x65676175676E616CLL;
  *(void *)(inited + 112) = 0xE800000000000000;
  *(void *)(inited + 120) = sub_254F101C0();
  return sub_254F0D660(inited);
}

uint64_t sub_254F0DA48()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

unint64_t sub_254F0DA88()
{
  return sub_254F0D8D8();
}

uint64_t sub_254F0DA9C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_254F0DAD4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_254F0DAFC(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_254F0DBB0();
    uint64_t v4 = (void *)sub_254F101A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
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

ValueMetadata *type metadata accessor for LiveSpeechAnalytics()
{
  return &type metadata for LiveSpeechAnalytics;
}

unint64_t sub_254F0DBB0()
{
  unint64_t result = qword_269E76BF0;
  if (!qword_269E76BF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269E76BF0);
  }
  return result;
}

uint64_t sub_254F0DBF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E76C10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_254F0DC58(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_254F0DC68()
{
  uint64_t v0 = (void *)sub_254F101C0();
  id v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

  qword_269E76C18 = (uint64_t)v1;
}

uint64_t _s18LiveSpeechServices0abC9LocStringyS2SF_0(uint64_t a1)
{
  if (qword_269E76AB8 != -1) {
    swift_once();
  }
  if (qword_269E76C18)
  {
    id v2 = (id)qword_269E76C18;
    uint64_t v3 = (void *)sub_254F101C0();
    uint64_t v4 = (void *)sub_254F101C0();
    uint64_t v5 = (void *)sub_254F101C0();
    id v6 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, v5);

    a1 = sub_254F101D0();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_254F0DE00(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x657469726F766166;
  }
  else {
    uint64_t v3 = 0x6472616F6279656BLL;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0xEF73657361726850;
  }
  if (a2) {
    uint64_t v5 = 0x657469726F766166;
  }
  else {
    uint64_t v5 = 0x6472616F6279656BLL;
  }
  if (a2) {
    unint64_t v6 = 0xEF73657361726850;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_254F10370();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_254F0DEB0()
{
  return sub_254F103F0();
}

uint64_t sub_254F0DF40()
{
  sub_254F101F0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_254F0DFB8()
{
  return sub_254F103F0();
}

uint64_t LiveSpeechInputMode.rawValue.getter()
{
  if (*v0) {
    return 0x657469726F766166;
  }
  else {
    return 0x6472616F6279656BLL;
  }
}

uint64_t LiveSpeechInputMode.title.getter()
{
  uint64_t v1 = 0xD000000000000011;
  if (*v0)
  {
    if (qword_269E76AB8 != -1) {
      swift_once();
    }
    if (qword_269E76C18)
    {
LABEL_9:
      id v2 = (id)qword_269E76C18;
      uint64_t v3 = (void *)sub_254F101C0();
      unint64_t v4 = (void *)sub_254F101C0();
      uint64_t v5 = (void *)sub_254F101C0();
      id v6 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, v5);

      uint64_t v1 = sub_254F101D0();
    }
  }
  else
  {
    if (qword_269E76AB8 != -1) {
      swift_once();
    }
    uint64_t v1 = 0xD000000000000012;
    if (qword_269E76C18) {
      goto LABEL_9;
    }
  }
  return v1;
}

uint64_t LiveSpeechInputMode.systemImageName.getter()
{
  if (*v0) {
    return 0x6B72616D6B6F6F62;
  }
  else {
    return 0x6472616F6279656BLL;
  }
}

LiveSpeechServices::LiveSpeechInputMode_optional __swiftcall LiveSpeechInputMode.init(rawValue:)(Swift::String rawValue)
{
  id v2 = v1;
  uint64_t v3 = sub_254F10350();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *id v2 = v5;
  return result;
}

uint64_t sub_254F0E2CC(char *a1, char *a2)
{
  return sub_254F0DE00(*a1, *a2);
}

uint64_t sub_254F0E2D8()
{
  return sub_254F0DEB0();
}

uint64_t sub_254F0E2E0()
{
  return sub_254F0DF40();
}

uint64_t sub_254F0E2E8()
{
  return sub_254F0DFB8();
}

LiveSpeechServices::LiveSpeechInputMode_optional sub_254F0E2F0(Swift::String *a1)
{
  return LiveSpeechInputMode.init(rawValue:)(*a1);
}

uint64_t sub_254F0E2FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LiveSpeechInputMode.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_254F0E324()
{
  return sub_254F10230();
}

uint64_t sub_254F0E384()
{
  return sub_254F10220();
}

id sub_254F0E3D4()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LiveSpeechService()), sel_init);
  qword_26B270B48 = (uint64_t)result;
  return result;
}

id static LiveSpeechService.shared.getter()
{
  if (qword_26B270B50 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B270B48;

  return v0;
}

id LiveSpeechService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t LiveSpeechService.serviceName.getter()
{
  return 0xD000000000000013;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LiveSpeechService.startLiveSpeech()()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LiveSpeechService.stopLiveSpeech()()
{
}

uint64_t sub_254F0E61C(uint64_t (*a1)(void))
{
  if (qword_26B270B18 != -1) {
    swift_once();
  }
  return a1();
}

uint64_t sub_254F0E6A4(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v5 = qword_26B270B18;
  id v6 = a1;
  if (v5 != -1) {
    swift_once();
  }
  a4();

  return 1;
}

void LiveSpeechService.inputMode.getter(BOOL *a1@<X8>)
{
  sub_254F0E918();
  uint64_t v3 = v2;
  unint64_t v4 = (void *)sub_254F101C0();
  id v5 = objc_msgSend(v3, sel_stringForKey_, v4);

  if (v5)
  {
    sub_254F101D0();

    uint64_t v6 = sub_254F10350();
    swift_bridgeObjectRelease();
    BOOL v7 = 0;
    if (v6) {
      BOOL v7 = v6 == 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  *a1 = v7;
}

void LiveSpeechService.inputMode.setter()
{
  sub_254F0E918();
  uint64_t v1 = v0;
  objc_super v2 = (void *)sub_254F101C0();
  swift_bridgeObjectRelease();
  id v3 = (id)sub_254F101C0();
  objc_msgSend(v1, sel_setObject_forKey_, v2, v3);
}

void sub_254F0E918()
{
  uint64_t v1 = OBJC_IVAR___LiveSpeechServices____lazy_storage___liveSpeechDefaults;
  objc_super v2 = *(void **)(v0 + OBJC_IVAR___LiveSpeechServices____lazy_storage___liveSpeechDefaults);
  if (v2) {
    goto LABEL_4;
  }
  sub_254F10160();
  id v3 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  unint64_t v4 = (void *)sub_254F101C0();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v3, sel_initWithSuiteName_, v4);

  if (v5)
  {
    uint64_t v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    v5;

    objc_super v2 = 0;
LABEL_4:
    id v7 = v2;
    return;
  }
  __break(1u);
}

void (*LiveSpeechService.inputMode.modify(uint64_t a1))()
{
  *(void *)a1 = v1;
  LiveSpeechService.inputMode.getter((BOOL *)(a1 + 8));
  return sub_254F0EA28;
}

void sub_254F0EA28()
{
  sub_254F0E918();
  id v3 = v0;
  uint64_t v1 = (void *)sub_254F101C0();
  swift_bridgeObjectRelease();
  objc_super v2 = (void *)sub_254F101C0();
  objc_msgSend(v3, sel_setObject_forKey_, v1, v2);
}

uint64_t LiveSpeechService.liveSpeechPhrases.getter()
{
  return sub_254F0EE70((SEL *)&selRef_liveSpeechPhrases);
}

uint64_t LiveSpeechService.observeFavoriteLiveSpeechPhrasesChanges(_:)(uint64_t a1, uint64_t a2)
{
  return sub_254F0F364(a1, a2);
}

char *keypath_get_selector_liveSpeechPhrases()
{
  return sel_liveSpeechPhrases;
}

void sub_254F0EB50(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_254F0EB70(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_254F0EB90()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_254F0EBC8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_254F0ED64(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  id v3 = (void *)sub_254F101C0();
  swift_bridgeObjectRelease();

  return v3;
}

id sub_254F0EDC0(void *a1, uint64_t a2, SEL *a3)
{
  id v4 = a1;
  sub_254F0E918();
  uint64_t v6 = v5;
  id v7 = [v5 *a3];

  __swift_instantiateConcreteTypeFromMangledName(&qword_269E76C20);
  sub_254F10250();

  id v8 = (void *)sub_254F10240();
  swift_bridgeObjectRelease();

  return v8;
}

uint64_t LiveSpeechService.favoritePhrases.getter()
{
  return sub_254F0EE70((SEL *)&selRef_favoritePhrases);
}

uint64_t sub_254F0EE70(SEL *a1)
{
  sub_254F0E918();
  id v3 = v2;
  id v4 = [v2 *a1];

  __swift_instantiateConcreteTypeFromMangledName(&qword_269E76C20);
  uint64_t v5 = sub_254F10250();

  return v5;
}

Swift::Void __swiftcall LiveSpeechService.addFavoritePhrase(_:)(Swift::OpaquePointer a1)
{
  sub_254F0E918();
  id v3 = v2;
  id v4 = objc_msgSend(v2, sel_favoritePhrases);

  __swift_instantiateConcreteTypeFromMangledName(&qword_269E76C20);
  uint64_t v5 = (void *)sub_254F10250();

  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = sub_254F0F620(0, v5[2] + 1, 1, v5);
  }
  unint64_t v7 = v5[2];
  unint64_t v6 = v5[3];
  if (v7 >= v6 >> 1) {
    uint64_t v5 = sub_254F0F620((void *)(v6 > 1), v7 + 1, 1, v5);
  }
  v5[2] = v7 + 1;
  v5[v7 + 4] = a1._rawValue;
  sub_254F0E918();
  uint64_t v9 = v8;
  char v10 = (void *)sub_254F10240();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setFavoritePhrases_, v10);

  sub_254F10190();
  uint64_t v11 = sub_254F101E0();
  swift_bridgeObjectRelease();
  notify_post((const char *)(v11 + 32));

  swift_release();
}

Swift::Void __swiftcall LiveSpeechService.removeFavoritePhrase(_:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  sub_254F0E918();
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_favoritePhrases);

  __swift_instantiateConcreteTypeFromMangledName(&qword_269E76C20);
  sub_254F10250();

  id v7 = v1;
  swift_bridgeObjectRetain();
  uint64_t v8 = swift_bridgeObjectRetain();
  unint64_t v9 = sub_254F0FAB8(v8, countAndFlagsBits, (uint64_t)object);
  char v11 = v10;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if ((v11 & 1) == 0)
  {
    sub_254F0F200(v9);
    swift_bridgeObjectRelease();
  }
  sub_254F0E918();
  uint64_t v13 = v12;
  uint64_t v14 = (void *)sub_254F10240();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_setFavoritePhrases_, v14);

  sub_254F10190();
  uint64_t v15 = sub_254F101E0();
  swift_bridgeObjectRelease();
  notify_post((const char *)(v15 + 32));

  swift_release();
}

uint64_t sub_254F0F200(unint64_t a1)
{
  id v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    id v3 = sub_254F0F998(v3);
  }
  unint64_t v4 = v3[2];
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v4 - 1;
    uint64_t v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      id v7 = &v3[a1];
      uint64_t v8 = v7[4];
      memmove(v7 + 4, v7 + 5, 8 * v6);
      v3[2] = v5;
      *uint64_t v1 = v3;
      return v8;
    }
  }
  uint64_t result = sub_254F10340();
  __break(1u);
  return result;
}

uint64_t LiveSpeechService.observeFavoritePhrasesChanges(_:)(uint64_t a1, uint64_t a2)
{
  return sub_254F0F364(a1, a2);
}

uint64_t sub_254F0F364(uint64_t a1, uint64_t a2)
{
  sub_254F0E918();
  uint64_t v8 = v4;
  swift_getKeyPath();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  swift_retain();
  uint64_t v6 = sub_254F10110();
  swift_release();
  swift_release();

  return v6;
}

void sub_254F0F420(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E76C20);
  uint64_t v5 = sub_254F10250();

  *a3 = v5;
}

void sub_254F0F484(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E76C20);
  id v7 = (id)sub_254F10240();
  objc_msgSend(v6, *a5, v7);
}

void *sub_254F0F620(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E76C48);
      char v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      char v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_254F0F9AC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_254F0F730(uint64_t a1)
{
  uint64_t v2 = sub_254F102C0();

  return sub_254F0F7EC(a1, v2);
}

unint64_t sub_254F0F774(uint64_t a1, uint64_t a2)
{
  sub_254F103D0();
  sub_254F101F0();
  uint64_t v4 = sub_254F103F0();

  return sub_254F0F8B4(a1, a2, v4);
}

unint64_t sub_254F0F7EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_254F10008(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x25A281AE0](v9, a1);
      sub_254F10064((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_254F0F8B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_254F10370() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_254F10370() & 1) == 0);
    }
  }
  return v6;
}

void *sub_254F0F998(void *a1)
{
  return sub_254F0F620(0, a1[2], 0, a1);
}

uint64_t sub_254F0F9AC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E76C20);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_254F10340();
  __break(1u);
  return result;
}

uint64_t sub_254F0FAB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v6 = 0;
    uint64_t v7 = a1 + 32;
    while (1)
    {
      uint64_t v8 = *(void *)(v7 + 8 * v6);
      swift_bridgeObjectRetain();
      uint64_t v9 = _s18LiveSpeechServices0aB7ServiceC13phraseTextKeySSvg_0();
      if (*(void *)(v8 + 16) && (unint64_t v11 = sub_254F0F774(v9, v10), (v12 & 1) != 0))
      {
        sub_254F0CEB4(*(void *)(v8 + 56) + 32 * v11, (uint64_t)&v17);
      }
      else
      {
        long long v17 = 0u;
        long long v18 = 0u;
      }
      swift_bridgeObjectRelease();
      if (!*((void *)&v18 + 1)) {
        break;
      }
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_4;
      }
      if (v15 == a2 && v16 == a3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v6;
      }
      char v13 = sub_254F10370();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v13) {
        return v6;
      }
LABEL_5:
      if (v3 == ++v6) {
        return 0;
      }
    }
    sub_254F0FFA8((uint64_t)&v17);
LABEL_4:
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  return 0;
}

char *keypath_get_selector_favoritePhrases()
{
  return sel_favoritePhrases;
}

void sub_254F0FC3C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_254F0FC5C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

unint64_t sub_254F0FC80()
{
  unint64_t result = qword_269E76C28;
  if (!qword_269E76C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76C28);
  }
  return result;
}

void sub_254F0FCD4(unsigned char *a1@<X8>)
{
  LiveSpeechService.inputMode.getter(&v2);
  *a1 = v2;
}

void sub_254F0FD10()
{
}

uint64_t getEnumTagSinglePayload for LiveSpeechInputMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LiveSpeechInputMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x254F0FEA4);
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

unsigned char *sub_254F0FECC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LiveSpeechInputMode()
{
  return &type metadata for LiveSpeechInputMode;
}

uint64_t type metadata accessor for LiveSpeechService()
{
  return self;
}

uint64_t sub_254F0FF0C()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_254F0FF44()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

unint64_t sub_254F0FF54()
{
  unint64_t result = qword_269E76C38;
  if (!qword_269E76C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E76C38);
  }
  return result;
}

uint64_t sub_254F0FFA8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E76C40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_254F10008(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_254F10064(uint64_t a1)
{
  return a1;
}

uint64_t sub_254F100D0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_254F100E0()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_254F100F0()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_254F10100()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_254F10110()
{
  return MEMORY[0x270EEFA78]();
}

uint64_t sub_254F10120()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_254F10130()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_254F10140()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t _s18LiveSpeechServices0aB7ServiceC13phraseTextKeySSvg_0()
{
  return MEMORY[0x270F7D830]();
}

uint64_t sub_254F10160()
{
  return MEMORY[0x270F7D838]();
}

uint64_t _s18LiveSpeechServices0aB7ServiceC16phraseInputIDKeySSvg_0()
{
  return MEMORY[0x270F7D840]();
}

uint64_t _s18LiveSpeechServices0aB7ServiceC17phraseShortcutKeySSvg_0()
{
  return MEMORY[0x270F7D848]();
}

uint64_t sub_254F10190()
{
  return MEMORY[0x270F7D850]();
}

uint64_t sub_254F101A0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_254F101B0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_254F101C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_254F101D0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_254F101E0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_254F101F0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_254F10200()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_254F10210()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_254F10220()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_254F10230()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_254F10240()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_254F10250()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_254F10260()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_254F10270()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_254F10280()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_254F10290()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_254F102A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_254F102B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_254F102C0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_254F102D0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_254F102E0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_254F102F0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_254F10300()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_254F10310()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_254F10320()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_254F10330()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_254F10340()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_254F10350()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_254F10360()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_254F10370()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_254F10380()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_254F10390()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_254F103A0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_254F103B0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_254F103C0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_254F103D0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_254F103E0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_254F103F0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t _AXSLiveSpeechEnabled()
{
  return MEMORY[0x270F908C0]();
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}