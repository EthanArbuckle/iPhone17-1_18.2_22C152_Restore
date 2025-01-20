void sub_23C245760(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  NSObject *v3;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    v3 = AXLogLiveTranscription();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[AXLTSpeechTranscriber initializeAudioTap]();
    }

    objc_end_catch();
    JUMPOUT(0x23C245748);
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_23C24D44C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23C24DCD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Block_object_dispose((const void *)(v29 - 224), 8);
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

void sub_23C24E3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id AXLCLocString(void *a1)
{
  id v1 = a1;
  v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.accessibility.LiveTranscription"];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 localizedStringForKey:v1 value:v1 table:@"Localizable"];
  }
  else
  {
    id v4 = v1;
  }
  uint64_t v5 = v4;

  return v5;
}

void sub_23C24EFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23C24F750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void handleInputBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v12 = AXLogLiveTranscription();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    handleInputBuffer_cold_1(a5, v12);
  }

  v13 = +[AXLTAudioOutManager sharedInstance];
  [v13 handleInputBufferWithContext:a1 audioQueue:a2 audioBuffer:a3 timestamp:a4 packetCount:a5 packetDesc:a6];
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

LiveTranscription::AXLTCaptionActionsType_optional __swiftcall AXLTCaptionActionsType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *id v1 = v2;
  return (LiveTranscription::AXLTCaptionActionsType_optional)rawValue;
}

uint64_t AXLTCaptionActionsType.rawValue.getter()
{
  return *v0;
}

BOOL sub_23C2518B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C2518C8()
{
  return sub_23C255440();
}

uint64_t sub_23C251910()
{
  return sub_23C255430();
}

uint64_t sub_23C25193C()
{
  return sub_23C255440();
}

LiveTranscription::AXLTCaptionActionsType_optional sub_23C251980(Swift::Int *a1)
{
  return AXLTCaptionActionsType.init(rawValue:)(*a1);
}

void sub_23C251988(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t AXLTCaption.id.getter()
{
  return *(void *)v0;
}

uint64_t AXLTCaption.appID.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXLTCaption.appName.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXLTCaption.time.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXLTCaption.time.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*AXLTCaption.time.modify())()
{
  return nullsub_1;
}

uint64_t AXLTCaption.text.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXLTCaption.text.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return result;
}

uint64_t (*AXLTCaption.text.modify())()
{
  return nullsub_1;
}

uint64_t AXLTCaption.segments.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AXLTCaption.segments.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 72) = a1;
  return result;
}

uint64_t (*AXLTCaption.segments.modify())()
{
  return nullsub_1;
}

uint64_t AXLTCaption.placeholder.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXLTCaption.placeholder.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = a2;
  return result;
}

uint64_t (*AXLTCaption.placeholder.modify())()
{
  return nullsub_1;
}

void AXLTCaption.actionType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 96);
}

unsigned char *AXLTCaption.actionType.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 96) = *result;
  return result;
}

uint64_t (*AXLTCaption.actionType.modify())()
{
  return nullsub_1;
}

void __swiftcall AXLTCaption.init(id:appID:appName:time:text:segments:placeholder:actionType:)(LiveTranscription::AXLTCaption *__return_ptr retstr, Swift::Int id, Swift::String appID, Swift::String appName, Swift::String time, Swift::String text, Swift::OpaquePointer segments, Swift::String placeholder, LiveTranscription::AXLTCaptionActionsType actionType)
{
  LiveTranscription::AXLTCaptionActionsType v9 = *(unsigned char *)actionType;
  retstr->id = id;
  retstr->appID = appID;
  retstr->appName = appName;
  retstr->time = time;
  retstr->text._countAndFlagsBits = text._countAndFlagsBits;
  *(Swift::String *)&retstr->text._object = *(Swift::String *)&text._object;
  retstr->placeholder = placeholder;
  retstr->actionType = v9;
}

id sub_23C251C58(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_23C255400();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_23C255400();
    swift_bridgeObjectRelease();
    if (v5 == v29) {
      goto LABEL_5;
    }
LABEL_49:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  if (v5 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_49;
  }
LABEL_5:
  if (!v5) {
    goto LABEL_38;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0) {
    uint64_t v6 = v3;
  }
  if (!v4) {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v8 = v9;
  }
  if (v6 == v8)
  {
LABEL_38:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_55;
  }
  unint64_t v30 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0) {
    goto LABEL_56;
  }
  for (id result = *(id *)(v3 + 32); ; id result = (id)MEMORY[0x23ECDE500](0, v3))
  {
    v11 = result;
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    id v12 = (id)MEMORY[0x23ECDE500](0, a2);
LABEL_22:
    v13 = v12;
    sub_23C252E34();
    char v14 = sub_23C2553D0();

    if ((v14 & 1) == 0) {
      goto LABEL_49;
    }
    unint64_t v15 = v5 - 1;
    if (v5 == 1) {
      return (id)(v5 & 1);
    }
    if (((a2 | v3) & 0xC000000000000001) != 0)
    {
      uint64_t v16 = 0;
      unint64_t v17 = v5 - 2;
      while (v15 != v16)
      {
        unint64_t v5 = v16 + 1;
        if (v30) {
          id v18 = (id)MEMORY[0x23ECDE500](v16 + 1, v3);
        }
        else {
          id v18 = *(id *)(v3 + 40 + 8 * v16);
        }
        v19 = v18;
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v20 = (id)MEMORY[0x23ECDE500](v16 + 1, a2);
        }
        else
        {
          if (v5 >= *(void *)(v7 + 16)) {
            goto LABEL_54;
          }
          id v20 = *(id *)(a2 + 40 + 8 * v16);
        }
        v21 = v20;
        unint64_t v5 = sub_23C2553D0();

        if ((v5 & 1) != 0 && v17 != v16++) {
          continue;
        }
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      unint64_t v23 = *(void *)(v7 + 16);
      if (v23 <= 1) {
        unint64_t v23 = 1;
      }
      unint64_t v24 = v23 - 1;
      v25 = (void **)(v3 + 40);
      uint64_t v7 = a2 + 40;
      while (v15)
      {
        if (!v24) {
          goto LABEL_53;
        }
        v27 = *v25++;
        v26 = v27;
        v28 = *(void **)v7;
        v7 += 8;
        a2 = v26;
        uint64_t v3 = v28;
        unint64_t v5 = sub_23C2553D0();

        if (v5)
        {
          --v24;
          if (--v15) {
            continue;
          }
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    ;
  }
  if (*(void *)(v7 + 16))
  {
    id v12 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

void sub_23C251F34(void *a1@<X8>)
{
  *a1 = *v1;
}

void __swiftcall mergeCaptions(_:_:)(LiveTranscription::AXLTCaption *__return_ptr retstr, LiveTranscription::AXLTCaption *a2, LiveTranscription::AXLTCaption *a3)
{
  uint64_t countAndFlagsBits = a2->appID._countAndFlagsBits;
  Swift::Int id = a2->id;
  object = a2->appName._object;
  unint64_t v5 = a2->time._object;
  uint64_t v12 = a2->time._countAndFlagsBits;
  uint64_t v13 = a2->appName._countAndFlagsBits;
  rawValue = a2->segments._rawValue;
  uint64_t v11 = a2->placeholder._countAndFlagsBits;
  uint64_t v7 = a2->placeholder._object;
  LiveTranscription::AXLTCaptionActionsType actionType = a2->actionType;
  uint64_t v9 = a2->appID._object;
  Swift::String text = a2->text;
  swift_bridgeObjectRetain();
  sub_23C2553B0();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23C2553B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v8 = swift_bridgeObjectRetain();
  sub_23C2521C8(v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  retstr->Swift::Int id = id;
  retstr->appID._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->appID._object = v9;
  retstr->appName._uint64_t countAndFlagsBits = v13;
  retstr->appName._object = object;
  retstr->time._uint64_t countAndFlagsBits = v12;
  retstr->time._object = v5;
  retstr->Swift::String text = text;
  retstr->segments._rawValue = rawValue;
  retstr->placeholder._uint64_t countAndFlagsBits = v11;
  retstr->placeholder._object = v7;
  retstr->LiveTranscription::AXLTCaptionActionsType actionType = actionType;
}

Swift::String __swiftcall mergeStrings(_:_:)(Swift::String_optional a1, Swift::String_optional a2)
{
  if (a1.value._object) {
    uint64_t countAndFlagsBits = a1.value._countAndFlagsBits;
  }
  else {
    uint64_t countAndFlagsBits = 0;
  }
  if (a1.value._object) {
    object = a1.value._object;
  }
  else {
    object = (void *)0xE000000000000000;
  }
  uint64_t v7 = countAndFlagsBits;
  swift_bridgeObjectRetain();
  sub_23C2553B0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C2553B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = v7;
  unint64_t v5 = object;
  result._object = v5;
  result._uint64_t countAndFlagsBits = v4;
  return result;
}

uint64_t sub_23C2521C8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_23C255400();
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
    uint64_t v5 = sub_23C255400();
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
    unint64_t v4 = MEMORY[0x23ECDE510](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t v10 = sub_23C252394(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_23C255400();
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
      return MEMORY[0x270F9DBB8](v10);
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  uint64_t v10 = swift_bridgeObjectRelease();
  return MEMORY[0x270F9DBB8](v10);
}

uint64_t sub_23C252394(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_23C255400();
    Swift::String result = swift_bridgeObjectRelease();
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
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_23C255400();
      Swift::String result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_23C252E74();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_268B99EA0);
            uint64_t v10 = sub_23C252534(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_23C252E34();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_23C252534(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_23C2525E4(v6, a2, a3);
  return sub_23C25259C;
}

void sub_23C25259C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_23C2525E4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x23ECDE500](a2, a3);
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
    return sub_23C252664;
  }
  __break(1u);
  return result;
}

void sub_23C252664(id *a1)
{
}

BOOL _s17LiveTranscription11AXLTCaptionV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v26 = *(void *)(a1 + 64);
  uint64_t v27 = *(void *)(a1 + 56);
  uint64_t v23 = *(void *)(a1 + 80);
  int v19 = *(unsigned __int8 *)(a1 + 96);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v24 = *(void *)(a2 + 72);
  unint64_t v25 = *(void *)(a1 + 72);
  uint64_t v21 = *(void *)(a1 + 88);
  uint64_t v22 = *(void *)(a2 + 80);
  uint64_t v20 = *(void *)(a2 + 88);
  int v18 = *(unsigned __int8 *)(a2 + 96);
  if (*(void *)(a1 + 8) == *(void *)(a2 + 8) && *(void *)(a1 + 16) == *(void *)(a2 + 16)
    || (v12 = sub_23C255410(), BOOL result = 0, (v12 & 1) != 0))
  {
    if (v2 == v7 && v4 == v6 || (v14 = sub_23C255410(), BOOL result = 0, (v14 & 1) != 0))
    {
      if (v3 == v9 && v5 == v8 || (v15 = sub_23C255410(), BOOL result = 0, (v15 & 1) != 0))
      {
        if (v27 == v10 && v26 == v11 || (v16 = sub_23C255410(), BOOL result = 0, (v16 & 1) != 0))
        {
          if (sub_23C251C58(v25, v24))
          {
            if (v23 == v22 && v21 == v20) {
              return v19 == v18;
            }
            char v17 = sub_23C255410();
            BOOL result = 0;
            if (v17) {
              return v19 == v18;
            }
            return result;
          }
          return 0;
        }
      }
    }
  }
  return result;
}

unint64_t sub_23C252844()
{
  unint64_t result = qword_268B99E98;
  if (!qword_268B99E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268B99E98);
  }
  return result;
}

uint64_t sub_23C252898()
{
  return MEMORY[0x263F8D6D8];
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AXLTCaptionActionsType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AXLTCaptionActionsType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23C252A10);
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

uint64_t sub_23C252A38(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23C252A40(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AXLTCaptionActionsType()
{
  return &type metadata for AXLTCaptionActionsType;
}

uint64_t initializeBufferWithCopyOfBuffer for AXLTCaption(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AXLTCaption()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AXLTCaption(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AXLTCaption(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  return a1;
}

__n128 __swift_memcpy97_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(unsigned char *)(a1 + 96) = *((unsigned char *)a2 + 96);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for AXLTCaption(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for AXLTCaption(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 97)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AXLTCaption(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 96) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 97) = 1;
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
    *(unsigned char *)(result + 97) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AXLTCaption()
{
  return &type metadata for AXLTCaption;
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

unint64_t sub_23C252E34()
{
  unint64_t result = qword_268B99EA8;
  if (!qword_268B99EA8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268B99EA8);
  }
  return result;
}

unint64_t sub_23C252E74()
{
  unint64_t result = qword_268B99EB0;
  if (!qword_268B99EB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268B99EA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268B99EB0);
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

uint64_t appIDKey.getter()
{
  return 0x4449707061;
}

uint64_t appNameKey.getter()
{
  return 0x656D614E707061;
}

uint64_t textKey.getter()
{
  return 1954047348;
}

uint64_t timeKey.getter()
{
  return 1701669236;
}

uint64_t segmentTextKey.getter()
{
  return 0x54746E656D676573;
}

unint64_t segmentConfidenceKey.getter()
{
  return 0xD000000000000011;
}

uint64_t notificationValueKey.getter()
{
  return 0x65756C6176;
}

uint64_t placeholderID.getter()
{
  return 0x6C6F686563616C70;
}

uint64_t sub_23C252FD8()
{
  uint64_t result = sub_23C2532D4();
  qword_268B99EB8 = result;
  unk_268B99EC0 = v1;
  return result;
}

uint64_t placeholderName.getter()
{
  return sub_23C253168(&qword_268B99E70, &qword_268B99EB8);
}

uint64_t sub_23C25303C()
{
  uint64_t result = sub_23C2532D4();
  qword_268B99EC8 = result;
  unk_268B99ED0 = v1;
  return result;
}

uint64_t placeholderMicName.getter()
{
  return sub_23C253168(&qword_268B99E78, &qword_268B99EC8);
}

uint64_t sub_23C2530A0()
{
  uint64_t result = sub_23C2532D4();
  qword_268B99ED8 = result;
  unk_268B99EE0 = v1;
  return result;
}

uint64_t placeholderText.getter()
{
  return sub_23C253168(&qword_268B99E80, &qword_268B99ED8);
}

uint64_t sub_23C253104()
{
  uint64_t result = sub_23C2532D4();
  qword_268B99EE8 = result;
  unk_268B99EF0 = v1;
  return result;
}

uint64_t placeholderPausedText.getter()
{
  return sub_23C253168(&qword_268B99E88, &qword_268B99EE8);
}

uint64_t sub_23C253168(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t actionsInfoKey.getter()
{
  return 0x49736E6F69746361;
}

uint64_t actionSeparated.getter()
{
  return 0x65536E6F69746361;
}

uint64_t placeholderKey.getter()
{
  return 0x6C6F686563616C70;
}

uint64_t textLinesNumberMin.getter()
{
  return 1;
}

uint64_t textLinesNumberMax.getter()
{
  return 3;
}

uint64_t textLinesAccessibilityNumberMax.getter()
{
  return 3;
}

double textOnScreenTimeInterval.getter()
{
  return 5.0;
}

void sub_23C253240()
{
  qword_268B99EF8 = 0x4030000000000000;
}

double placeholderTimeInterval.getter()
{
  if (qword_268B99E90 != -1) {
    swift_once();
  }
  return *(double *)&qword_268B99EF8;
}

double captionTextTimeLimit.getter()
{
  return 30.0;
}

double micCaptionTextTimeLimit.getter()
{
  return 30.0;
}

double historyTimeIntervalMax.getter()
{
  return 60.0;
}

double historyTimeIntervalMaxBraille.getter()
{
  return 600.0;
}

double historyCheckTimeInterval.getter()
{
  return 10.0;
}

uint64_t sub_23C2532D4()
{
  uint64_t v0 = (void *)sub_23C255390();
  id v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

  if (!v1) {
    return 0;
  }
  unint64_t v2 = (void *)sub_23C255390();
  uint64_t v3 = (void *)sub_23C255390();
  uint64_t v4 = (void *)sub_23C255390();
  id v5 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, v3, v4);

  uint64_t v6 = sub_23C2553A0();
  return v6;
}

ValueMetadata *type metadata accessor for AXLTUtilities()
{
  return &type metadata for AXLTUtilities;
}

void handleInputBuffer_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_23C242000, a2, OS_LOG_TYPE_DEBUG, "HandleInputBuffer with packets: %i", (uint8_t *)v2, 8u);
}

uint64_t sub_23C255390()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23C2553A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23C2553B0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23C2553D0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_23C2553E0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23C2553F0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_23C255400()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23C255410()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23C255420()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23C255430()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23C255440()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AXLogLiveTranscription()
{
  return MEMORY[0x270F09320]();
}

OSStatus AudioQueueAllocateBuffer(AudioQueueRef inAQ, UInt32 inBufferByteSize, AudioQueueBufferRef *outBuffer)
{
  return MEMORY[0x270EE2170](inAQ, *(void *)&inBufferByteSize, outBuffer);
}

OSStatus AudioQueueDispose(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x270EE2178](inAQ, inImmediate);
}

OSStatus AudioQueueEnqueueBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs)
{
  return MEMORY[0x270EE2180](inAQ, inBuffer, *(void *)&inNumPacketDescs, inPacketDescs);
}

OSStatus AudioQueueFreeBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer)
{
  return MEMORY[0x270EE2198](inAQ, inBuffer);
}

OSStatus AudioQueueGetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x270EE21A8](inAQ, *(void *)&inID, outData, ioDataSize);
}

OSStatus AudioQueueNewInput(const AudioStreamBasicDescription *inFormat, AudioQueueInputCallback inCallbackProc, void *inUserData, CFRunLoopRef inCallbackRunLoop, CFStringRef inCallbackRunLoopMode, UInt32 inFlags, AudioQueueRef *outAQ)
{
  return MEMORY[0x270EE21B0](inFormat, inCallbackProc, inUserData, inCallbackRunLoop, inCallbackRunLoopMode, *(void *)&inFlags, outAQ);
}

OSStatus AudioQueueSetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x270EE21E0](inAQ, *(void *)&inID, inData, *(void *)&inDataSize);
}

OSStatus AudioQueueStart(AudioQueueRef inAQ, const AudioTimeStamp *inStartTime)
{
  return MEMORY[0x270EE21E8](inAQ, inStartTime);
}

OSStatus AudioQueueStop(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x270EE21F0](inAQ, inImmediate);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}