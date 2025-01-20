void sub_2529F3850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2529F3EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2529F3EE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2529F3EF4(uint64_t a1)
{
}

void sub_2529F3EFC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v13 = objc_msgSend_description(v5, v10, v11, v12);
  uint64_t v17 = objc_msgSend_count(v6, v14, v15, v16);
  uint64_t v20 = objc_msgSend_stringByAppendingFormat_(v7, v18, @" - %@ %@ analyzers: %lu\n", v19, v9, v13, v17);
  uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v23 = v6;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v25)
  {
    uint64_t v29 = v25;
    uint64_t v30 = *(void *)v40;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(v23);
        }
        v32 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        v33 = objc_msgSend_description(*(void **)(*((void *)&v39 + 1) + 8 * v31), v26, v27, v28);
        uint64_t v36 = objc_msgSend_stringByAppendingFormat_(v32, v34, @"   - Analyzer %@\n", v35, v33);
        uint64_t v37 = *(void *)(*(void *)(a1 + 40) + 8);
        v38 = *(void **)(v37 + 40);
        *(void *)(v37 + 40) = v36;

        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v29);
  }
}

void sub_2529F4D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2529F4D60(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v6 = a3;
  id v7 = a2;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_sessionIDsForAnalyzerID_(*(void **)(a1 + 32), v9, (uint64_t)v7, v10);
  uint64_t v15 = objc_msgSend_allObjects(v11, v12, v13, v14);
  v18 = objc_msgSend_componentsJoinedByString_(v15, v16, @",", v17);
  v22 = objc_msgSend_description(v7, v19, v20, v21);

  v26 = objc_msgSend_description(v6, v23, v24, v25);

  uint64_t v29 = objc_msgSend_stringByAppendingFormat_(v5, v27, @" - %@ (%@) [%@] Analyzer %@\n", v28, v32, v18, v22, v26);
  uint64_t v30 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v29;
}

__CFString *sub_2529F5294(unint64_t a1)
{
  if (a1 > 2) {
    return &stru_2702E3F20;
  }
  else {
    return off_265387358[a1];
  }
}

uint64_t sub_2529F53EC(uint64_t a1, const char *a2)
{
  qword_26B2300B0 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x263F08AE8], a2, @"^[a-z]{2,3}([_-][A-Z][a-z]{3})?$", 0, 0);
  return MEMORY[0x270F9A758]();
}

uint64_t sub_2529F5584()
{
  qword_26B2300C0 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

uint64_t sub_2529F5684(uint64_t a1, const char *a2)
{
  qword_26B2300E0 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x263F08AE8], a2, @"^(([A-Z]{2})|([0-9]{3})|([A-Z][a-z]{3}))$", 0, 0);
  return MEMORY[0x270F9A758]();
}

uint64_t sub_2529F581C()
{
  qword_26B2300D0 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

void sub_2529F5A34(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_q_flushRecentActions(*(void **)(a1 + 32), a2, a3, a4);
  v8 = objc_msgSend_analyzer(*(void **)(a1 + 32), v5, v6, v7);
  objc_msgSend_enumerateAnalytics(v8, v9, v10, v11);

  uint64_t v15 = objc_msgSend_analyzer(*(void **)(a1 + 32), v12, v13, v14);
  objc_msgSend_reset(v15, v16, v17, v18);

  v22 = objc_msgSend_serverDelegate(*(void **)(a1 + 32), v19, v20, v21);
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    objc_msgSend_serverDelegate(*(void **)(a1 + 32), v24, v25, v26);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_didEndEnumeratingAnalytics(v30, v27, v28, v29);
  }
}

void sub_2529F5BE0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 40);
  objc_msgSend_analyzer(*(void **)(a1 + 32), a2, a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKeyboardTrialParameters_(v7, v5, v4, v6);
}

void sub_2529F6190(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, int a10, __int16 a11, __int16 a12, uint64_t a13)
{
  if (a2 == 1)
  {
    id v14 = objc_begin_catch(exception_object);
    uint64_t v15 = sub_252A05924();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      uint64_t v21 = *(void **)(v13 + 8);
      v22 = objc_msgSend_server(v21, v16, v17, v18);
      uint64_t v26 = objc_msgSend_description(v14, v23, v24, v25);
      LODWORD(a9) = 134218498;
      *(void *)((char *)&a9 + 4) = v21;
      WORD6(a9) = 2048;
      *(void *)((char *)&a9 + 14) = v22;
      a12 = 2112;
      a13 = (uint64_t)v26;
      _os_log_fault_impl(&dword_2529F1000, v15, OS_LOG_TYPE_FAULT, "flushAndSetLastAction called didAction on xpc client 0x%lx with server 0x%lx and failed with %@", (uint8_t *)&a9, 0x20u);
    }
    objc_msgSend_reportConnectionStatusSuccessful_(IAServerStats, v19, 0, v20);

    objc_end_catch();
    JUMPOUT(0x2529F613CLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2529F69CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F6AF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F6EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F747C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F7640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F774C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F7858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F7964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F7A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F7B7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F7E0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F8434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F855C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F8800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F8AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F8BFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F8D48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F8E6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F8F9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F90DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F91EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F9310(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v5 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend_setDictationBeganCount_(v6, a2, 1, a4);
    if (*(unsigned char *)(a1 + 49)) {
      objc_msgSend_setMultiModalDictationBeganCount_(*(void **)(a1 + 32), v7, 1, v8);
    }
  }
  else
  {
    objc_msgSend_setModelessUsedAtLeastOnceCount_(v6, a2, 1, a4);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  return MEMORY[0x270F9A6D0](v9, sel_mergeOrConsumeAction_, v10, v8);
}

uint64_t sub_2529F9468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_mergeOrConsumeAction_, *(void *)(a1 + 40), a4);
}

uint64_t sub_2529F9B98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2529F9BD0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_2529F9BF8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_2529F9C30(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_2529F9C50(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_2529F9C68(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_2529F9C80(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2529F9D50()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.inputAnalytics.signalAnalyticsClient", v2);
  v1 = (void *)qword_269C40260;
  qword_269C40260 = (uint64_t)v0;
}

void sub_2529FA66C(uint64_t a1, const char *a2)
{
  v5[44] = *MEMORY[0x263EF8340];
  v4[0] = @"EmojiKeyPlaneSwitched";
  v4[1] = @"GenmojiButtonPressed";
  v5[0] = &unk_2702EEBE8;
  v5[1] = &unk_2702EEC00;
  v4[2] = @"EmojiSearchInvoked";
  v4[3] = @"ExistingGenmojiLongPressedThenNewEmojiSelected";
  v5[2] = &unk_2702EEC18;
  v5[3] = &unk_2702EEC30;
  v4[4] = @"CreateNewEmojiButtonShown";
  v4[5] = @"EmojiSearchDismissed";
  v5[4] = &unk_2702EEC48;
  v5[5] = &unk_2702EEC60;
  v4[6] = @"CreateNewEmojiDismissed";
  v4[7] = @"CreateNewEmojiSelected";
  v5[6] = &unk_2702EEC78;
  v5[7] = &unk_2702EEC90;
  v4[8] = @"PersonIdentificationStarted";
  v4[9] = @"CancelButtonPressed";
  v5[8] = &unk_2702EECA8;
  v5[9] = &unk_2702EECC0;
  v4[10] = @"AmbiguousPersonFound";
  v4[11] = @"GenericPersonFound";
  v5[10] = &unk_2702EECD8;
  v5[11] = &unk_2702EECF0;
  v4[12] = @"TaggedPersonFound";
  v4[13] = @"PersonNotFound";
  v5[12] = &unk_2702EED08;
  v5[13] = &unk_2702EED20;
  v4[14] = @"PromptIsEmpty";
  v4[15] = @"ImageGenerated";
  v5[14] = &unk_2702EED38;
  v5[15] = &unk_2702EED50;
  v4[16] = @"ImageNotGenerated";
  v4[17] = @"PillSelected";
  v5[16] = &unk_2702EED68;
  v5[17] = &unk_2702EED80;
  v4[18] = @"ImageInserted";
  v4[19] = @"MenuButtonPressed";
  v5[18] = &unk_2702EED98;
  v5[19] = &unk_2702EEDB0;
  v4[20] = @"PlusCharacterButtonPressed";
  v4[21] = @"CharacterChosen";
  v5[20] = &unk_2702EEDC8;
  v5[21] = &unk_2702EEDE0;
  v4[22] = @"PreviouslySelectedCharacterChosen";
  v4[23] = @"PhotoChosen";
  v5[22] = &unk_2702EEDF8;
  v5[23] = &unk_2702EEE10;
  v4[24] = @"PhotoChosenFirstTime";
  v4[25] = @"PreviouslySelectedPhotoChosen";
  v5[24] = &unk_2702EEE28;
  v5[25] = &unk_2702EEE40;
  v4[26] = @"DoneButtonPressed";
  v4[27] = @"AppearanceSelected";
  v5[26] = &unk_2702EEE58;
  v5[27] = &unk_2702EEE70;
  v4[28] = @"SkinToneSelected";
  v4[29] = @"AddButtonPressed";
  v5[28] = &unk_2702EEE88;
  v5[29] = &unk_2702EEEA0;
  v4[30] = @"CharacterDeleted";
  v4[31] = @"PhotoPicked";
  v5[30] = &unk_2702EEEB8;
  v5[31] = &unk_2702EEED0;
  v4[32] = @"AllPhotosTabSelected";
  v4[33] = @"SuggestedPhotosTabSelected";
  v5[32] = &unk_2702EEEE8;
  v5[33] = &unk_2702EEF00;
  v4[34] = @"CopySelected";
  v4[35] = @"ShareSheetSelected";
  v5[34] = &unk_2702EEF18;
  v5[35] = &unk_2702EEF30;
  v4[36] = @"SaveToStickersSelected";
  v4[37] = @"AddCaptionSelected";
  v5[36] = &unk_2702EEF48;
  v5[37] = &unk_2702EEF60;
  v4[38] = @"ImageGenerationStarted";
  v4[39] = @"RetryRequested";
  v5[38] = &unk_2702EEF78;
  v5[39] = &unk_2702EEF90;
  v4[40] = @"UISuspended";
  v4[41] = @"UIResumed";
  v5[40] = &unk_2702EEFA8;
  v5[41] = &unk_2702EEFC0;
  v4[42] = @"BlobIndexChanged";
  v4[43] = @"DidPersonalizeStatus";
  v5[42] = &unk_2702EEFD8;
  v5[43] = &unk_2702EEFF0;
  uint64_t v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v5, (uint64_t)v4, 44);
  v3 = (void *)qword_269C40280;
  qword_269C40280 = v2;
}

void sub_2529FAADC(uint64_t a1, const char *a2)
{
  v5[29] = *MEMORY[0x263EF8340];
  v4[0] = @"InputSafety";
  v4[1] = @"InputCopyright";
  v5[0] = &unk_2702EEBE8;
  v5[1] = &unk_2702EEC00;
  v4[2] = @"FictionalCharacter";
  v4[3] = @"InputMultipleFaces";
  v5[2] = &unk_2702EEC18;
  v5[3] = &unk_2702EEC30;
  v4[4] = @"OutputImageHasMultipleFaces";
  v4[5] = @"OutputImageHasFace";
  v5[4] = &unk_2702EEC48;
  v5[5] = &unk_2702EEC60;
  v4[6] = @"OutputCaptionDescribesMultipleFaces";
  v4[7] = @"OutputCaptionDescribesPerson";
  v5[6] = &unk_2702EEC78;
  v5[7] = &unk_2702EEC90;
  v4[8] = @"OutputSafety";
  v4[9] = @"InputLanguage";
  v5[8] = &unk_2702EECA8;
  v5[9] = &unk_2702EECC0;
  v4[10] = @"InputLexicon";
  v4[11] = @"InputScript";
  v5[10] = &unk_2702EECD8;
  v5[11] = &unk_2702EECF0;
  v4[12] = @"RequiresRewrite";
  v4[13] = @"PromptErrorOther";
  v5[12] = &unk_2702EED08;
  v5[13] = &unk_2702EED20;
  v4[14] = @"PolicyViolationOther";
  v4[15] = @"PolicyViolationInputImagePersonalizationPolicy";
  v5[14] = &unk_2702EED38;
  v5[15] = &unk_2702EED50;
  v4[16] = @"PolicyViolationDetectedFacesPolicy";
  v4[17] = @"PolicyViolationNonPersonalizedGeneratedImageCaptionPolicy";
  v5[16] = &unk_2702EED68;
  v5[17] = &unk_2702EED80;
  v4[18] = @"Other";
  v4[19] = @"Timeout";
  v5[18] = &unk_2702EED98;
  v5[19] = &unk_2702EEDB0;
  v4[20] = @"Cancel";
  v4[21] = @"NoFaceDetectedInConditioningImage";
  v5[20] = &unk_2702EEDC8;
  v5[21] = &unk_2702EEDE0;
  v4[22] = @"PublicFigure";
  v4[23] = @"PromptErrorUnresolvedAmbiguities";
  v5[22] = &unk_2702EEDF8;
  v5[23] = &unk_2702EEE10;
  v4[24] = @"PromptErrorPersonalizationUnavailable";
  v4[25] = @"PromptErrorPersonalizationUnavailableForEntities";
  v5[24] = &unk_2702EEE28;
  v5[25] = &unk_2702EEE40;
  v4[26] = @"OtherDisallowedConcepts";
  v4[27] = @"OtherDisallowedConceptsGenericEntity";
  v5[26] = &unk_2702EEE58;
  v5[27] = &unk_2702EEE70;
  v4[28] = @"UserCancelled";
  v5[28] = &unk_2702EEE88;
  uint64_t v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v5, (uint64_t)v4, 29);
  v3 = (void *)qword_269C40290;
  qword_269C40290 = v2;
}

id sub_2529FB290(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_2529FB83C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AnalyticsSendEventLazy();
}

id sub_2529FB8D4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_2529FCF30(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v9 = objc_msgSend_null(MEMORY[0x263EFF9D0], v6, v7, v8);
  char isEqual = objc_msgSend_isEqual_(v5, v10, (uint64_t)v9, v11);

  if ((isEqual & 1) == 0)
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    uint64_t v30 = objc_msgSend_sessionActionsEnumFromSource_(IATextInputActionsUtils, v13, a3, v14);
    uint64_t v16 = v28[3];
    if (v16 == 1)
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = sub_2529FD08C;
      v22[3] = &unk_265387B38;
      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 48);
      uint64_t v25 = a3;
      uint64_t v26 = v17;
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v24 = &v27;
      v22[4] = v19;
      id v23 = v18;
      objc_msgSend_enumerateObjectsUsingBlock_(v5, v20, (uint64_t)v22, v21);
    }
    else
    {
      objc_msgSend_setObject_atIndexedSubscript_(*(void **)(a1 + 40), v15, MEMORY[0x263EFFA88], v16);
    }
    _Block_object_dispose(&v27, 8);
  }
}

void sub_2529FD074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2529FD08C(uint64_t *a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x263EFF9D0];
  id v6 = a2;
  uint64_t v10 = objc_msgSend_null(v5, v7, v8, v9);
  char isEqual = objc_msgSend_isEqual_(v6, v11, (uint64_t)v10, v12);

  if ((isEqual & 1) == 0)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend_sessionActionsEnumFromSource_type_(IATextInputActionsUtils, v14, a1[7], a3);
    uint64_t v17 = *(void *)(*(void *)(a1[6] + 8) + 24);
    if (v17 == 1)
    {
      uint64_t v20 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v15, v16, 1);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, a1[8], a1[4], @"IASTextInputActionsAnalyzer.m", 526, @"Received sessionActions of NotYetKnown despite providing action type");

      uint64_t v17 = *(void *)(*(void *)(a1[6] + 8) + 24);
    }
    uint64_t v18 = (void *)a1[5];
    uint64_t v19 = MEMORY[0x263EFFA88];
    objc_msgSend_setObject_atIndexedSubscript_(v18, v15, v19, v17);
  }
}

uint64_t sub_2529FD1A8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v8 = v5;
  if (a3)
  {
    uint64_t v21 = v5;
    id v5 = (char *)objc_msgSend_BOOLValue(v5, v5, v6, v7);
    uint64_t v8 = v21;
    if (v5)
    {
      uint64_t v11 = objc_msgSend_sessionActionsString(*(void **)(a1 + 32), v21, v9, v10);
      uint64_t v14 = objc_msgSend_stringForSessionActionsEnum_(IATextInputActionsUtils, v12, a3, v13);
      uint64_t v17 = objc_msgSend_stringByAppendingString_(v11, v15, (uint64_t)v14, v16);
      objc_msgSend_setSessionActionsString_(*(void **)(a1 + 32), v18, (uint64_t)v17, v19);

      uint64_t v8 = v21;
    }
  }
  return MEMORY[0x270F9A758](v5, v8);
}

void sub_2529FD4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2529FD4D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2529FD4E4(uint64_t a1)
{
}

void sub_2529FD4EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  uint64_t v10 = objc_msgSend_computeSessionActionsStringOnSession_(v6, v8, (uint64_t)v7, v9);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_2529FD5F8;
  v19[3] = &unk_265387C28;
  uint64_t v11 = *(void *)(a1 + 32);
  id v20 = v5;
  uint64_t v21 = v11;
  uint64_t v12 = *(void *)(a1 + 56);
  id v22 = v10;
  uint64_t v24 = v12;
  long long v18 = *(_OWORD *)(a1 + 40);
  id v13 = (id)v18;
  long long v23 = v18;
  id v14 = v10;
  id v15 = v5;
  objc_msgSend_enumerateObjectsUsingBlock_(v7, v16, (uint64_t)v19, v17);
}

void sub_2529FD5F8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v9 = objc_msgSend_null(MEMORY[0x263EFF9D0], v6, v7, v8);
  char isEqual = objc_msgSend_isEqual_(v5, v10, (uint64_t)v9, v11);

  if ((isEqual & 1) == 0)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_2529FD710;
    v22[3] = &unk_265387C00;
    id v13 = *(id *)(a1 + 32);
    uint64_t v28 = a3;
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = *(void **)(a1 + 48);
    id v23 = v13;
    uint64_t v24 = v14;
    id v16 = v15;
    uint64_t v17 = *(void *)(a1 + 72);
    id v25 = v16;
    uint64_t v27 = v17;
    long long v21 = *(_OWORD *)(a1 + 56);
    id v18 = (id)v21;
    long long v26 = v21;
    objc_msgSend_enumerateObjectsUsingBlock_(v5, v19, (uint64_t)v22, v20);
  }
}

void sub_2529FD710(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v9 = objc_msgSend_null(MEMORY[0x263EFF9D0], v6, v7, v8);
  char isEqual = objc_msgSend_isEqual_(v5, v10, (uint64_t)v9, v11);

  if ((isEqual & 1) == 0)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_2529FD82C;
    v22[3] = &unk_265387BD8;
    id v13 = *(id *)(a1 + 32);
    uint64_t v28 = *(void *)(a1 + 80);
    uint64_t v29 = a3;
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = *(void **)(a1 + 48);
    id v23 = v13;
    uint64_t v24 = v14;
    id v16 = v15;
    uint64_t v17 = *(void *)(a1 + 72);
    id v25 = v16;
    uint64_t v27 = v17;
    long long v21 = *(_OWORD *)(a1 + 56);
    id v18 = (id)v21;
    long long v26 = v21;
    objc_msgSend_enumerateObjectsUsingBlock_(v5, v19, (uint64_t)v22, v20);
  }
}

void sub_2529FD82C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v9 = objc_msgSend_null(MEMORY[0x263EFF9D0], v6, v7, v8);
  char isEqual = objc_msgSend_isEqual_(v5, v10, (uint64_t)v9, v11);

  if ((isEqual & 1) == 0)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_2529FD94C;
    v22[3] = &unk_265387BB0;
    id v13 = *(id *)(a1 + 32);
    uint64_t v28 = a3;
    long long v29 = *(_OWORD *)(a1 + 80);
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = *(void **)(a1 + 48);
    id v23 = v13;
    uint64_t v24 = v14;
    id v16 = v15;
    uint64_t v17 = *(void *)(a1 + 72);
    id v25 = v16;
    uint64_t v27 = v17;
    long long v21 = *(_OWORD *)(a1 + 56);
    id v18 = (id)v21;
    long long v26 = v21;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, v19, (uint64_t)v22, v20);
  }
}

void sub_2529FD94C(uint64_t a1, void *a2, void *a3)
{
  v171[27] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ((objc_msgSend_isAllZeroes(v6, v7, v8, v9) & 1) == 0)
  {
    id v166 = v5;
    uint64_t v12 = objc_msgSend_componentsSeparatedByString_(v5, v10, @"≡", v11);
    v167 = objc_msgSend_lookupAppBundle_(IAUtility, v13, *(void *)(a1 + 32), v14);
    uint64_t isEmojiSearchSetInFlagOptions = objc_msgSend_isEmojiSearchSetInFlagOptions_(IATextInputActionsUtils, v15, *(void *)(a1 + 80), v16);
    uint64_t isMarkedTextSetInFlagOptions = objc_msgSend_isMarkedTextSetInFlagOptions_(IATextInputActionsUtils, v18, *(void *)(a1 + 80), v19);
    id v158 = objc_alloc(MEMORY[0x263EFF9A0]);
    v170[0] = 0x2702E6A20;
    v163 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v21, *(void *)(a1 + 88), v22);
    v171[0] = v163;
    v170[1] = 0x2702E6A40;
    v162 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v23, *(void *)(a1 + 96), v24);
    v171[1] = v162;
    v170[2] = 0x2702E6A60;
    id v25 = NSNumber;
    uint64_t v29 = objc_msgSend_netCharacters(v6, v26, v27, v28);
    v161 = objc_msgSend_numberWithLong_(v25, v30, v29, v31);
    v171[2] = v161;
    v170[3] = 0x2702E6A80;
    id v32 = NSNumber;
    uint64_t v36 = objc_msgSend_userRemovedCharacters(v6, v33, v34, v35);
    v160 = objc_msgSend_numberWithLong_(v32, v37, v36, v38);
    v171[3] = v160;
    v170[4] = 0x2702E6AA0;
    long long v39 = NSNumber;
    uint64_t v43 = objc_msgSend_netEmojiCharacters(v6, v40, v41, v42);
    v159 = objc_msgSend_numberWithLong_(v39, v44, v43, v45);
    v171[4] = v159;
    v170[5] = 0x2702E6AC0;
    v46 = NSNumber;
    uint64_t v50 = objc_msgSend_userRemovedEmojiCharacters(v6, v47, v48, v49);
    v157 = objc_msgSend_numberWithLong_(v46, v51, v50, v52);
    v171[5] = v157;
    v170[6] = 0x2702E6AE0;
    v156 = objc_msgSend_numberWithBool_(NSNumber, v53, isEmojiSearchSetInFlagOptions, v54);
    v171[6] = v156;
    v170[7] = 0x2702E6B00;
    v155 = objc_msgSend_numberWithBool_(NSNumber, v55, isMarkedTextSetInFlagOptions, v56);
    v171[7] = v155;
    v170[8] = 0x2702E6B20;
    v57 = NSNumber;
    id v165 = v6;
    uint64_t v61 = objc_msgSend_inputActions(v6, v58, v59, v60);
    v154 = objc_msgSend_numberWithLong_(v57, v62, v61, v63);
    v171[8] = v154;
    v170[9] = 0x2702E6C80;
    v64 = NSNumber;
    uint64_t v67 = objc_msgSend_log10WholeNumberForUnsignedInt_(IATextInputActionsUtils, v65, *(void *)(*(void *)(a1 + 40) + 80), v66);
    v153 = objc_msgSend_numberWithUnsignedLong_(v64, v68, v67, v69);
    v171[9] = v153;
    v170[10] = 0x2702E6CA0;
    v70 = NSNumber;
    uint64_t v73 = objc_msgSend_log10WholeNumberForUnsignedInt_(IATextInputActionsUtils, v71, *(void *)(*(void *)(a1 + 40) + 88), v72);
    v152 = objc_msgSend_numberWithUnsignedLong_(v70, v74, v73, v75);
    v171[10] = v152;
    v170[11] = 0x2702E6CC0;
    v76 = NSNumber;
    uint64_t v79 = objc_msgSend_log10IntegerForInt_(IATextInputActionsUtils, v77, *(void *)(*(void *)(a1 + 40) + 96), v78);
    v151 = objc_msgSend_numberWithUnsignedLong_(v76, v80, v79, v81);
    v171[11] = v151;
    v170[12] = 0x2702E6CE0;
    uint64_t v84 = *(void *)(a1 + 40);
    uint64_t v85 = *(void *)(v84 + 112);
    if (v85 + *(void *)(v84 + 120)) {
      uint64_t v86 = MEMORY[0x263EFFA88];
    }
    else {
      uint64_t v86 = MEMORY[0x263EFFA80];
    }
    v171[12] = v86;
    v170[13] = 0x2702E6D00;
    v150 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v82, v85, v83);
    v171[13] = v150;
    v170[14] = 0x2702E6D20;
    v149 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v87, *(void *)(*(void *)(a1 + 40) + 120), v88);
    v171[14] = v149;
    v170[15] = 0x2702E6B40;
    v148 = objc_msgSend_numberWithBool_(NSNumber, v89, *(unsigned __int8 *)(*(void *)(a1 + 40) + 72), v90);
    v171[15] = v148;
    v170[16] = 0x2702E6B60;
    v147 = objc_msgSend_sessionActionsString(*(void **)(a1 + 48), v91, v92, v93);
    v171[16] = v147;
    v170[17] = 0x2702E6B80;
    v94 = NSNumber;
    uint64_t HasOnlyPrimaryInput = objc_msgSend_sessionHasOnlyPrimaryInput(*(void **)(a1 + 48), v95, v96, v97);
    v146 = objc_msgSend_numberWithBool_(v94, v99, HasOnlyPrimaryInput, v100);
    v171[17] = v146;
    v170[18] = 0x2702E6BA0;
    v101 = NSNumber;
    uint64_t HasDictation = objc_msgSend_sessionHasDictation(*(void **)(a1 + 48), v102, v103, v104);
    v108 = objc_msgSend_numberWithBool_(v101, v106, HasDictation, v107);
    v171[18] = v108;
    v170[19] = 0x2702E6160;
    v111 = objc_msgSend_objectAtIndexedSubscript_(v12, v109, 0, v110);
    v171[19] = v111;
    v170[20] = 0x2702E6180;
    v114 = objc_msgSend_objectAtIndexedSubscript_(v12, v112, 1, v113);
    v171[20] = v114;
    v170[21] = 0x2702E6BC0;
    v117 = objc_msgSend_objectAtIndexedSubscript_(v12, v115, 2, v116);
    v171[21] = v117;
    v170[22] = 0x2702E6BE0;
    v120 = objc_msgSend_objectAtIndexedSubscript_(v12, v118, 3, v119);
    v171[22] = v120;
    v170[23] = 0x2702E6C00;
    v123 = objc_msgSend_objectAtIndexedSubscript_(v12, v121, 4, v122);
    v171[23] = v123;
    v170[24] = 0x2702E6C20;
    v164 = v12;
    v126 = objc_msgSend_objectAtIndexedSubscript_(v12, v124, 5, v125);
    v171[24] = v126;
    v171[25] = v167;
    v170[25] = 0x2702E6360;
    v170[26] = 0x2702E6C40;
    v171[26] = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v128 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v127, (uint64_t)v171, (uint64_t)v170, 27);
    v131 = objc_msgSend_initWithDictionary_(v158, v129, (uint64_t)v128, v130);

    v135 = objc_msgSend_keyboardTrialParameters(*(void **)(a1 + 40), v132, v133, v134);

    if (v135)
    {
      v139 = objc_msgSend_keyboardTrialParameters(*(void **)(a1 + 40), v136, v137, v138);
      objc_msgSend_addEntriesFromDictionary_(v131, v140, (uint64_t)v139, v141);
    }
    uint64_t v142 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (v142)
    {
      uint64_t v168 = 0x2702E6C60;
      uint64_t v169 = v142;
      v143 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v136, (uint64_t)&v169, (uint64_t)&v168, 1);
      objc_msgSend_addEntriesFromDictionary_(v131, v144, (uint64_t)v143, v145);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    id v6 = v165;
    id v5 = v166;
  }
}

void sub_2529FE1A8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_2529FF470()
{
  if (qword_26B230120 != -1) {
    dispatch_once(&qword_26B230120, &unk_2702E38C8);
  }
  dispatch_queue_t v0 = (void *)qword_26B230128;
  return v0;
}

void sub_2529FF5F4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = sub_2529FF470();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 32)) {
      id v3 = @"success";
    }
    else {
      id v3 = @"failure";
    }
    *(_DWORD *)buf = 138477827;
    uint64_t v14 = v3;
    _os_log_impl(&dword_2529F1000, v2, OS_LOG_TYPE_INFO, "Logging %{private}@", buf, 0xCu);
  }

  id v5 = &unk_2702EF020;
  BOOL v6 = *(unsigned char *)(a1 + 32) == 0;
  uint64_t v10 = @"xpcFailureCount";
  uint64_t v11 = @"xpcSuccessCount";
  if (v6) {
    uint64_t v7 = &unk_2702EF008;
  }
  else {
    uint64_t v7 = &unk_2702EF020;
  }
  if (!v6) {
    id v5 = &unk_2702EF008;
  }
  v12[0] = v7;
  v12[1] = v5;
  uint64_t v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v4, (uint64_t)v12, (uint64_t)&v10, 2);
  objc_msgSend_dispatchEvent_payload_(IAEventDispatcher, v9, @"com.apple.inputAnalytics.serverStats", (uint64_t)v8, v10, v11);
}

uint64_t sub_2529FF994()
{
  os_log_t v0 = os_log_create("com.apple.inputAnalytics", "IAServerStats");
  uint64_t v1 = qword_26B230128;
  qword_26B230128 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id sub_252A01040(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t sub_252A01AAC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_punctuationCharacterSet(MEMORY[0x263F08708], a2, a3, a4);
  uint64_t v5 = qword_26B2300F0;
  qword_26B2300F0 = v4;
  return MEMORY[0x270F9A758](v4, v5);
}

void sub_252A01BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_252A01BE0(uint64_t result)
{
  return result;
}

void sub_252A01D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_252A01D40(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) += a4;
  return result;
}

void sub_252A0278C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_252A02A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_252A030F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_252A0358C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_252A03B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_252A04798(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_252A047B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void sub_252A047DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_252A047FC(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

id sub_252A04814()
{
  if (qword_269C402A8 != -1) {
    dispatch_once(&qword_269C402A8, &unk_2702E37E8);
  }
  os_log_t v0 = (void *)qword_269C402A0;
  return v0;
}

uint64_t sub_252A04868()
{
  os_log_t v0 = os_log_create("com.apple.inputAnalytics.server", "IASAnalyzerErrors");
  uint64_t v1 = qword_269C402A0;
  qword_269C402A0 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id sub_252A048AC()
{
  if (qword_26B230100 != -1) {
    dispatch_once(&qword_26B230100, &unk_2702E3788);
  }
  os_log_t v0 = (void *)qword_26B2300F8;
  return v0;
}

uint64_t sub_252A04900()
{
  os_log_t v0 = os_log_create("com.apple.inputAnalytics.server", "IATextInputActions");
  uint64_t v1 = qword_26B2300F8;
  qword_26B2300F8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id sub_252A04944()
{
  if (qword_269C402B8 != -1) {
    dispatch_once(&qword_269C402B8, &unk_2702E3A28);
  }
  os_log_t v0 = (void *)qword_269C402B0;
  return v0;
}

uint64_t sub_252A04998()
{
  os_log_t v0 = os_log_create("com.apple.inputAnalytics.server", "IASSessionManager");
  uint64_t v1 = qword_269C402B0;
  qword_269C402B0 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id sub_252A049DC()
{
  if (qword_269C402C8 != -1) {
    dispatch_once(&qword_269C402C8, &unk_2702E37C8);
  }
  os_log_t v0 = (void *)qword_269C402C0;
  return v0;
}

uint64_t sub_252A04A30()
{
  os_log_t v0 = os_log_create("com.apple.inputAnalytics.server", "IASTextInputUserPreference");
  uint64_t v1 = qword_269C402C0;
  qword_269C402C0 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id sub_252A04A74()
{
  if (qword_269C402D8 != -1) {
    dispatch_once(&qword_269C402D8, &unk_2702E3A48);
  }
  os_log_t v0 = (void *)qword_269C402D0;
  return v0;
}

uint64_t sub_252A04AC8()
{
  os_log_t v0 = os_log_create("com.apple.inputAnalytics.server.IASGenericAnalyzer", "IAGeneric");
  uint64_t v1 = qword_269C402D0;
  qword_269C402D0 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id sub_252A04B0C()
{
  if (qword_269C402E8 != -1) {
    dispatch_once(&qword_269C402E8, &unk_2702E3A68);
  }
  os_log_t v0 = (void *)qword_269C402E0;
  return v0;
}

uint64_t sub_252A04B60()
{
  os_log_t v0 = os_log_create("com.apple.inputAnalytics.server.IASStatelessSessionManager", "IAGeneric");
  uint64_t v1 = qword_269C402E0;
  qword_269C402E0 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_252A04C24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AnalyticsSendEventLazy();
}

id sub_252A04CBC(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_252A05094()
{
  v7[3] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263EFFA08]);
  v7[0] = @"IADataStoreBoolean";
  v7[1] = @"IADataStoreCounter";
  v7[2] = @"IADataStoreDaterange";
  id v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v1, (uint64_t)v7, 3);
  uint64_t v5 = objc_msgSend_initWithArray_(v0, v3, (uint64_t)v2, v4);
  BOOL v6 = (void *)qword_269C402F0;
  qword_269C402F0 = v5;
}

void sub_252A0543C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_252A05800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_252A05870(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id sub_252A0588C()
{
  if (qword_26B230108 != -1) {
    dispatch_once(&qword_26B230108, &unk_2702E3948);
  }
  id v0 = (void *)qword_26B230110;
  return v0;
}

uint64_t sub_252A058E0()
{
  os_log_t v0 = os_log_create("com.apple.inputAnalytics.client", "IAXPCClient");
  uint64_t v1 = qword_26B230110;
  qword_26B230110 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id sub_252A05924()
{
  if (qword_26B230130 != -1) {
    dispatch_once(&qword_26B230130, &unk_2702E3808);
  }
  os_log_t v0 = (void *)qword_26B230138;
  return v0;
}

uint64_t sub_252A05978()
{
  os_log_t v0 = os_log_create("com.apple.inputAnalytics.client", "IATextInputActions");
  uint64_t v1 = qword_26B230138;
  qword_26B230138 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id sub_252A059BC()
{
  if (qword_26B2300A0 != -1) {
    dispatch_once(&qword_26B2300A0, &unk_2702E3828);
  }
  os_log_t v0 = (void *)qword_26B230098;
  return v0;
}

uint64_t sub_252A05A10()
{
  os_log_t v0 = os_log_create("com.apple.inputAnalytics.client", "IASignalAnalytics");
  uint64_t v1 = qword_26B230098;
  qword_26B230098 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id sub_252A05A54()
{
  if (qword_269C40308 != -1) {
    dispatch_once(&qword_269C40308, &unk_2702E37A8);
  }
  os_log_t v0 = (void *)qword_269C40300;
  return v0;
}

uint64_t sub_252A05AA8()
{
  os_log_t v0 = os_log_create("com.apple.inputAnalytics.client", "GlomojiAnalytics");
  uint64_t v1 = qword_269C40300;
  qword_269C40300 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id sub_252A05AEC()
{
  if (qword_269C40318 != -1) {
    dispatch_once(&qword_269C40318, &unk_2702E3A88);
  }
  os_log_t v0 = (void *)qword_269C40310;
  return v0;
}

uint64_t sub_252A05B40()
{
  os_log_t v0 = os_log_create("com.apple.inputAnalytics.client", "IATextInputUserPreferenceAnalytics");
  uint64_t v1 = qword_269C40310;
  qword_269C40310 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id sub_252A05B84()
{
  if (qword_269C40328 != -1) {
    dispatch_once(&qword_269C40328, &unk_2702E3AA8);
  }
  os_log_t v0 = (void *)qword_269C40320;
  return v0;
}

uint64_t sub_252A05BD8()
{
  os_log_t v0 = os_log_create("com.apple.inputAnalytics.client", "IADefaultsDataStore");
  uint64_t v1 = qword_269C40320;
  qword_269C40320 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_252A05D14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AnalyticsSendEventLazy();
}

id sub_252A05DA8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_252A065E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_252A06620()
{
  os_log_t v0 = sub_252A0588C();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_252A11F7C();
  }
}

void sub_252A0666C()
{
  os_log_t v0 = sub_252A0588C();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_252A11FF0();
  }
}

void sub_252A066B8(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_252A0588C();
  id v3 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR)) {
    sub_252A12064(v2, v3, v4, v5);
  }
}

void sub_252A0691C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252A0693C(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = sub_252A0588C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_2529F1000, v2, OS_LOG_TYPE_INFO, "invalidateConnection successfully invalidated 0x%lx", (uint8_t *)&v4, 0xCu);
  }
}

void sub_252A06A44(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_252A08920(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v4 = *(void **)(a1 + 32);
  objc_msgSend_stringWithFormat_(NSString, a2, @"%@=%@", a4, a2, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v4, v5, (uint64_t)v7, v6);
}

void sub_252A0B854()
{
  os_log_t v0 = (void *)qword_269C40270;
  qword_269C40270 = (uint64_t)&unk_2702EF2F0;
}

uint64_t sub_252A0BC2C@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v59 = a7;
  uint64_t v60 = a6;
  uint64_t v58 = a5;
  uint64_t v61 = a8;
  uint64_t v62 = a3;
  uint64_t v11 = *(void *)(*(void *)(sub_252A0E788(&qword_269C40210) - 8) + 64);
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v63 = (uint64_t)v53 - v12;
  uint64_t v13 = sub_252A12230();
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  uint64_t v15 = v14((char *)v53 - v12, 1, 1, v13);
  uint64_t v16 = HIBYTE(a2) & 0xF;
  uint64_t v17 = (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))a1;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v16 = a1 & 0xFFFFFFFFFFFFLL;
  }
  id v18 = (unsigned int *)MEMORY[0x263F3C550];
  if (v16)
  {
    uint64_t v56 = v53;
    MEMORY[0x270FA5388](v15);
    v57 = (void *)((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v19 = (char *)v53 - v12;
    uint64_t v20 = sub_252A12240();
    v55 = v53;
    MEMORY[0x270FA5388](v20);
    uint64_t v22 = (uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))((char *)v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v54 = v17;
    void *v22 = v17;
    v22[1] = (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))a2;
    (*(void (**)(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t), void))(v23 + 104))(v22, *v18);
    uint64_t v24 = sub_252A0E788(&qword_269C40218);
    v53[1] = v53;
    MEMORY[0x270FA5388](v24 - 8);
    long long v26 = (char *)v53 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v27 = sub_252A12220();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, 1, 1, v27);
    swift_bridgeObjectRetain_n();
    id v18 = (unsigned int *)MEMORY[0x263F3C550];
    uint64_t v28 = v63;
    sub_252A12210();
    sub_252A0F80C(v28, &qword_269C40210);
    v14(v19, 0, 1, v13);
    uint64_t v29 = (uint64_t)v19;
    unint64_t v12 = (unint64_t)v57;
    uint64_t v15 = sub_252A0F868(v29, v28);
  }
  v57 = v53;
  MEMORY[0x270FA5388](v15);
  uint64_t v30 = (char *)v53 - v12;
  uint64_t v31 = v14((char *)v53 - v12, 1, 1, v13);
  uint64_t v32 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v32 = v62 & 0xFFFFFFFFFFFFLL;
  }
  if (v32)
  {
    uint64_t v56 = v53;
    MEMORY[0x270FA5388](v31);
    uint64_t v33 = sub_252A12240();
    v55 = v53;
    MEMORY[0x270FA5388](v33);
    uint64_t v35 = (void *)((char *)v53 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
    *uint64_t v35 = v62;
    v35[1] = a4;
    (*(void (**)(void *, void))(v36 + 104))(v35, *v18);
    uint64_t v37 = sub_252A0E788(&qword_269C40218);
    uint64_t v54 = v14;
    MEMORY[0x270FA5388](v37 - 8);
    long long v39 = (char *)v53 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v40 = sub_252A12220();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v39, 1, 1, v40);
    swift_bridgeObjectRetain_n();
    sub_252A12210();
    sub_252A0F80C((uint64_t)v30, &qword_269C40210);
    v54((char *)v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v13);
    sub_252A0F868((uint64_t)v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v30);
  }
  uint64_t v41 = sub_252A121F0();
  MEMORY[0x270FA5388](v41);
  uint64_t v44 = (*(uint64_t (**)(char *, uint64_t))(v43 + 16))((char *)v53 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0), v58);
  MEMORY[0x270FA5388](v44);
  unint64_t v45 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v46 = v63;
  uint64_t v47 = sub_252A0F8D0(v63, (uint64_t)v53 - v45);
  MEMORY[0x270FA5388](v47);
  sub_252A0F8D0((uint64_t)v30, (uint64_t)v53 - v45);
  objc_allocWithZone((Class)sub_252A12250());
  swift_bridgeObjectRetain();
  uint64_t v48 = sub_252A12200();
  sub_252A0F80C((uint64_t)v30, &qword_269C40210);
  sub_252A0F80C(v46, &qword_269C40210);
  uint64_t v49 = v61;
  *uint64_t v61 = v48;
  uint64_t v50 = *MEMORY[0x263F3C230];
  uint64_t v51 = sub_252A121E0();
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v51 - 8) + 104))(v49, v50, v51);
}

uint64_t sub_252A0C3E8()
{
  uint64_t v0 = sub_252A12280();
  sub_252A0F9E8(v0, qword_269C40338);
  sub_252A0F10C(v0, (uint64_t)qword_269C40338);
  return sub_252A12270();
}

id sub_252A0C4D0()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_252A12290();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_252A0C538(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = sub_252A122A0();
  id v7 = (uint64_t *)(a1 + *a4);
  uint64_t *v7 = v6;
  v7[1] = v8;
  return swift_bridgeObjectRelease();
}

id sub_252A0C658(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = &v8[OBJC_IVAR___IAFeedbackServiceSwiftBridge_modelInfo];
  *(void *)uint64_t v9 = 0;
  *((void *)v9 + 1) = 0;
  *(void *)&v8[OBJC_IVAR___IAFeedbackServiceSwiftBridge_featureDomain] = a1;
  *(void *)&v8[OBJC_IVAR___IAFeedbackServiceSwiftBridge_action] = a2;
  uint64_t v10 = 1701736270;
  if (a4) {
    uint64_t v11 = a3;
  }
  else {
    uint64_t v11 = 1701736270;
  }
  if (a4) {
    unint64_t v12 = a4;
  }
  else {
    unint64_t v12 = 0xE400000000000000;
  }
  uint64_t v13 = (uint64_t *)&v8[OBJC_IVAR___IAFeedbackServiceSwiftBridge_originalContent];
  uint64_t *v13 = v11;
  v13[1] = v12;
  if (a6)
  {
    uint64_t v10 = a5;
    unint64_t v14 = a6;
  }
  else
  {
    unint64_t v14 = 0xE400000000000000;
  }
  uint64_t v15 = (uint64_t *)&v8[OBJC_IVAR___IAFeedbackServiceSwiftBridge_generatedContent];
  *uint64_t v15 = v10;
  v15[1] = v14;
  *(void *)uint64_t v9 = a7;
  *((void *)v9 + 1) = a8;
  swift_bridgeObjectRelease();
  v17.receiver = v8;
  v17.super_class = (Class)IAFeedbackServiceSwiftBridge;
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t sub_252A0C7C8()
{
  *(void *)(v1 + 72) = v0;
  return MEMORY[0x270FA2498](sub_252A0C7E8, 0, 0);
}

uint64_t sub_252A0C7E8()
{
  uint64_t v62 = v0;
  if (qword_269C40330 != -1) {
    swift_once();
  }
  uint64_t v1 = (id *)(v0 + 9);
  id v2 = (void *)v0[9];
  uint64_t v3 = sub_252A12280();
  v0[10] = sub_252A0F10C(v3, (uint64_t)qword_269C40338);
  id v4 = v2;
  uint64_t v5 = sub_252A12260();
  os_log_type_t v6 = sub_252A12300();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[9];
  uint64_t v9 = &selRef_setTouchUpPoint_;
  uint64_t v10 = &selRef_setTouchUpPoint_;
  if (v7)
  {
    os_log_type_t typea = v6;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    uint64_t v61 = v57;
    *(_DWORD *)uint64_t v11 = 136315651;
    v0[5] = objc_msgSend(v8, sel_featureDomain);
    type metadata accessor for IAFBKSInteractionFeatureDomain(0);
    uint64_t v12 = sub_252A122B0();
    v0[6] = sub_252A0F144(v12, v13, &v61);
    sub_252A12320();
    swift_bridgeObjectRelease();

    *(_WORD *)(v11 + 12) = 2085;
    id v14 = objc_msgSend(v8, sel_originalContent);
    uint64_t v15 = sub_252A122A0();
    unint64_t v17 = v16;

    v0[7] = sub_252A0F144(v15, v17, &v61);
    sub_252A12320();
    swift_bridgeObjectRelease();

    *(_WORD *)(v11 + 22) = 2085;
    id v18 = objc_msgSend(v8, sel_generatedContent);
    uint64_t v19 = sub_252A122A0();
    unint64_t v21 = v20;

    uint64_t v22 = v19;
    uint64_t v9 = &selRef_setTouchUpPoint_;
    v0[8] = sub_252A0F144(v22, v21, &v61);
    sub_252A12320();
    uint64_t v10 = &selRef_setTouchUpPoint_;
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2529F1000, v5, typea, "reportPresented with domain '%s', input '%{sensitive}s', output '%{sensitive}s'", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2533C5E90](v57, -1, -1);
    MEMORY[0x2533C5E90](v11, -1, -1);
  }
  else
  {
  }
  uint64_t v23 = (void *)v0[9];
  uint64_t v24 = sub_252A121F0();
  v0[11] = v24;
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = swift_task_alloc();
  v0[12] = v26;
  id v27 = [v23 v9[199]];
  if (!v27)
  {
    uint64_t v28 = (unsigned int *)MEMORY[0x263F3C2A0];
    goto LABEL_10;
  }
  if (v27 == (id)1)
  {
    uint64_t v28 = (unsigned int *)MEMORY[0x263F3C290];
LABEL_10:
    uint64_t v29 = (void *)v0[9];
    (*(void (**)(uint64_t, void, uint64_t))(v25 + 104))(v26, *v28, v24);
    uint64_t v30 = sub_252A121E0();
    v0[13] = v30;
    v0[14] = *(void *)(v30 - 8);
    uint64_t v60 = (uint64_t *)swift_task_alloc();
    v0[15] = v60;
    id v31 = objc_msgSend(v29, sel_originalContent);
    unint64_t type = sub_252A122A0();
    unint64_t v33 = v32;

    id v34 = [v29 v10[202]];
    uint64_t v35 = sub_252A122A0();
    unint64_t v37 = v36;

    uint64_t v38 = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v38, v26, v24);
    id v39 = objc_msgSend(v29, sel_modelInfo);
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = sub_252A122A0();
      uint64_t v43 = v42;
    }
    else
    {
      uint64_t v41 = 0;
      uint64_t v43 = 0;
    }
    sub_252A0BC2C(type, v33, v35, v37, v38, v41, v43, v60);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v53 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    v0[16] = v53;
    v0[17] = (v25 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v53(v38, v24);
    swift_task_dealloc();
    uint64_t v54 = (void *)swift_task_alloc();
    v0[18] = v54;
    *uint64_t v54 = v0;
    v54[1] = sub_252A0CF14;
    return MEMORY[0x270F28898]();
  }
  id v44 = *v1;
  unint64_t v45 = sub_252A12260();
  os_log_type_t v46 = sub_252A12310();
  BOOL v47 = os_log_type_enabled(v45, v46);
  id v48 = *v1;
  if (v47)
  {
    uint64_t v49 = (uint8_t *)swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    uint64_t v61 = v50;
    *(_DWORD *)uint64_t v49 = 136315138;
    v0[2] = [v48 v9[199]];
    type metadata accessor for IAFBKSInteractionFeatureDomain(0);
    uint64_t v51 = sub_252A122B0();
    v0[3] = sub_252A0F144(v51, v52, &v61);
    sub_252A12320();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2529F1000, v45, v46, "Unexpected feature domain: %s.", v49, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533C5E90](v50, -1, -1);
    MEMORY[0x2533C5E90](v49, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  v55 = (uint64_t (*)(void))v0[1];
  return v55();
}

uint64_t sub_252A0CF14()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_252A0D0D0;
  }
  else {
    id v2 = sub_252A0D028;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_252A0D028()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[16];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[11];
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_252A0D0D0()
{
  uint64_t v1 = (void *)v0[19];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_252A12260();
  os_log_type_t v5 = sub_252A12310();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[19];
    BOOL v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v10;
    sub_252A12320();
    void *v8 = v10;

    _os_log_impl(&dword_2529F1000, v4, v5, "Unexpected error: %@.", v7, 0xCu);
    sub_252A0E788(&qword_269C40208);
    swift_arrayDestroy();
    MEMORY[0x2533C5E90](v8, -1, -1);
    MEMORY[0x2533C5E90](v7, -1, -1);
  }
  else
  {
    uint64_t v6 = (void *)v0[19];
  }
  uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[16];
  uint64_t v12 = v0[12];
  uint64_t v13 = v0[11];
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  v11(v12, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  id v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_252A0D424(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  os_log_type_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *os_log_type_t v5 = v2;
  v5[1] = sub_252A0FC50;
  v5[9] = v4;
  return MEMORY[0x270FA2498](sub_252A0C7E8, 0, 0);
}

uint64_t sub_252A0D4E8()
{
  *(void *)(v1 + 104) = v0;
  return MEMORY[0x270FA2498](sub_252A0D508, 0, 0);
}

uint64_t sub_252A0D508()
{
  uint64_t v75 = v0;
  if (qword_269C40330 != -1) {
    swift_once();
  }
  id v2 = (id *)(v0 + 13);
  uint64_t v1 = (void *)v0[13];
  uint64_t v3 = sub_252A12280();
  v0[14] = sub_252A0F10C(v3, (uint64_t)qword_269C40338);
  id v4 = v1;
  os_log_type_t v5 = sub_252A12260();
  os_log_type_t v6 = sub_252A12300();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[13];
  if (v7)
  {
    os_log_type_t type = v6;
    uint64_t v9 = swift_slowAlloc();
    uint64_t v68 = swift_slowAlloc();
    uint64_t v74 = v68;
    *(_DWORD *)uint64_t v9 = 136315907;
    v0[7] = objc_msgSend(v8, sel_featureDomain);
    type metadata accessor for IAFBKSInteractionFeatureDomain(0);
    uint64_t v10 = sub_252A122B0();
    v0[8] = sub_252A0F144(v10, v11, &v74);
    sub_252A12320();
    swift_bridgeObjectRelease();

    *(_WORD *)(v9 + 12) = 2080;
    v0[9] = objc_msgSend(v8, sel_action);
    type metadata accessor for IAFBKSEvaluationAction(0);
    uint64_t v12 = sub_252A122B0();
    v0[10] = sub_252A0F144(v12, v13, &v74);
    sub_252A12320();
    swift_bridgeObjectRelease();

    *(_WORD *)(v9 + 22) = 2085;
    id v14 = objc_msgSend(v8, sel_originalContent);
    uint64_t v15 = sub_252A122A0();
    unint64_t v17 = v16;

    v0[11] = sub_252A0F144(v15, v17, &v74);
    sub_252A12320();
    swift_bridgeObjectRelease();

    *(_WORD *)(v9 + 32) = 2085;
    id v18 = objc_msgSend(v8, sel_generatedContent);
    uint64_t v19 = sub_252A122A0();
    unint64_t v21 = v20;

    v0[12] = sub_252A0F144(v19, v21, &v74);
    sub_252A12320();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2529F1000, v5, type, "launchFeedback with domain '%s', action '%s', input '%{sensitive}s', output '%{sensitive}s'", (uint8_t *)v9, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x2533C5E90](v68, -1, -1);
    MEMORY[0x2533C5E90](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v22 = (void *)v0[13];
  uint64_t v23 = sub_252A121F0();
  v0[15] = v23;
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = swift_task_alloc();
  v0[16] = v25;
  uint64_t v26 = sub_252A121B0();
  v0[17] = v26;
  uint64_t v27 = *(void *)(v26 - 8);
  v0[18] = v27;
  uint64_t v28 = swift_task_alloc();
  v0[19] = v28;
  id v29 = objc_msgSend(v22, sel_featureDomain);
  if (v29)
  {
    if (v29 != (id)1)
    {
      id v47 = *v2;
      id v48 = sub_252A12260();
      os_log_type_t v49 = sub_252A12310();
      BOOL v50 = os_log_type_enabled(v48, v49);
      id v51 = *v2;
      if (v50)
      {
        unint64_t v52 = (uint8_t *)swift_slowAlloc();
        uint64_t v53 = swift_slowAlloc();
        uint64_t v74 = v53;
        *(_DWORD *)unint64_t v52 = 136315138;
        v0[2] = objc_msgSend(v51, sel_featureDomain);
        type metadata accessor for IAFBKSInteractionFeatureDomain(0);
        uint64_t v54 = sub_252A122B0();
        v0[3] = sub_252A0F144(v54, v55, &v74);
        sub_252A12320();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_2529F1000, v48, v49, "Unexpected feature domain: %s.", v52, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533C5E90](v53, -1, -1);
        MEMORY[0x2533C5E90](v52, -1, -1);
      }
      else
      {
      }
      goto LABEL_21;
    }
    uint64_t v30 = (unsigned int *)MEMORY[0x263F3C290];
  }
  else
  {
    uint64_t v30 = (unsigned int *)MEMORY[0x263F3C2A0];
  }
  id v31 = *v2;
  (*(void (**)(uint64_t, void, uint64_t))(v24 + 104))(v25, *v30, v23);
  unint64_t v32 = (char *)objc_msgSend(v31, sel_action);
  if ((unint64_t)(v32 - 1) < 3)
  {
    unint64_t v33 = (void *)v0[13];
    (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v28, **((unsigned int **)&unk_265388368 + (void)(v32 - 1)), v26);
    uint64_t v34 = sub_252A121E0();
    v0[20] = v34;
    v0[21] = *(void *)(v34 - 8);
    uint64_t v72 = (uint64_t *)swift_task_alloc();
    v0[22] = v72;
    id v35 = objc_msgSend(v33, sel_originalContent);
    unint64_t v71 = sub_252A122A0();
    unint64_t v37 = v36;

    id v38 = objc_msgSend(v33, sel_generatedContent);
    os_log_t log = (os_log_t)sub_252A122A0();
    unint64_t v40 = v39;

    uint64_t v41 = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v41, v25, v23);
    id v42 = objc_msgSend(v33, sel_modelInfo);
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = sub_252A122A0();
      uint64_t v46 = v45;
    }
    else
    {
      uint64_t v44 = 0;
      uint64_t v46 = 0;
    }
    sub_252A0BC2C(v71, v37, (uint64_t)log, v40, v41, v44, v46, v72);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v66 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v0[23] = v66;
    v0[24] = (v24 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v66(v41, v23);
    swift_task_dealloc();
    uint64_t v67 = (void *)swift_task_alloc();
    v0[25] = v67;
    *uint64_t v67 = v0;
    v67[1] = sub_252A0DEE4;
    return MEMORY[0x270F28880](v28, 1);
  }
  id v56 = *v2;
  uint64_t v57 = sub_252A12260();
  os_log_type_t v58 = sub_252A12310();
  BOOL v59 = os_log_type_enabled(v57, v58);
  id v60 = *v2;
  if (v59)
  {
    uint64_t v61 = (uint8_t *)swift_slowAlloc();
    uint64_t v73 = swift_slowAlloc();
    uint64_t v74 = v73;
    *(_DWORD *)uint64_t v61 = 136315138;
    v0[4] = objc_msgSend(v60, sel_action);
    type metadata accessor for IAFBKSEvaluationAction(0);
    uint64_t v62 = sub_252A122B0();
    v0[5] = sub_252A0F144(v62, v63, &v74);
    sub_252A12320();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2529F1000, v57, v58, "Unexpected action: %s.", v61, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533C5E90](v73, -1, -1);
    MEMORY[0x2533C5E90](v61, -1, -1);
  }
  else
  {
  }
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v23);
LABEL_21:
  swift_task_dealloc();
  swift_task_dealloc();
  v64 = (uint64_t (*)(void))v0[1];
  return v64();
}

uint64_t sub_252A0DEE4()
{
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_252A0E0D0;
  }
  else {
    id v2 = sub_252A0DFF8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_252A0DFF8()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[23];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[18];
  uint64_t v6 = v0[15];
  uint64_t v5 = v0[16];
  (*(void (**)(void, void))(v0[21] + 8))(v0[22], v0[20]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  v1(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_252A0E0D0()
{
  uint64_t v1 = (void *)v0[26];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_252A12260();
  os_log_type_t v5 = sub_252A12310();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[26];
    BOOL v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[6] = v10;
    sub_252A12320();
    void *v8 = v10;

    _os_log_impl(&dword_2529F1000, v4, v5, "Unexpected error: %@.", v7, 0xCu);
    sub_252A0E788(&qword_269C40208);
    swift_arrayDestroy();
    MEMORY[0x2533C5E90](v8, -1, -1);
    MEMORY[0x2533C5E90](v7, -1, -1);
  }
  else
  {
    uint64_t v6 = (void *)v0[26];
  }
  unint64_t v11 = (void (*)(uint64_t, uint64_t))v0[23];
  uint64_t v12 = v0[19];
  uint64_t v13 = v0[17];
  uint64_t v14 = v0[18];
  uint64_t v16 = v0[15];
  uint64_t v15 = v0[16];
  (*(void (**)(void, void))(v0[21] + 8))(v0[22], v0[20]);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  v11(v15, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_252A0E44C(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  os_log_type_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *os_log_type_t v5 = v2;
  v5[1] = sub_252A0E510;
  v5[13] = v4;
  return MEMORY[0x270FA2498](sub_252A0D508, 0, 0);
}

uint64_t sub_252A0E510()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  id v2 = *(void **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  id v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

void __swiftcall IAFeedbackServiceSwiftBridge.init()(IAFeedbackServiceSwiftBridge *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void IAFeedbackServiceSwiftBridge.init()()
{
}

unint64_t type metadata accessor for IAFeedbackServiceSwiftBridge()
{
  unint64_t result = qword_269C40350;
  if (!qword_269C40350)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269C40350);
  }
  return result;
}

uint64_t sub_252A0E788(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_252A0E7D0()
{
  id v2 = *(const void **)(v0 + 16);
  id v3 = *(void **)(v0 + 24);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *id v4 = v1;
  v4[1] = sub_252A0FC54;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_269C401C0 + dword_269C401C0);
  return v5(v2, v3);
}

uint64_t sub_252A0E87C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *id v4 = v3;
  v4[1] = sub_252A0FC54;
  return v6();
}

uint64_t sub_252A0E94C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  id v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_252A0FC54;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_269C401D0 + dword_269C401D0);
  return v6(v2, v3, v4);
}

uint64_t sub_252A0EA0C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_252A0FC54;
  return v7();
}

uint64_t sub_252A0EADC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_252A0FC54;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_269C401E0 + dword_269C401E0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_252A0EBA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_252A122F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_252A122E0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_252A0F80C(a1, &qword_269C401B8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_252A122D0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  return swift_task_create();
}

uint64_t sub_252A0ED54(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_252A0EE30;
  return v6(a1);
}

uint64_t sub_252A0EE30()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_252A0EF28()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_252A0EF60(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_252A0F018;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269C401F0 + dword_269C401F0);
  return v6(a1, v4);
}

uint64_t sub_252A0F018()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_252A0F10C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_252A0F144(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_252A0F218(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_252A0F988((uint64_t)v12, *a3);
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
      sub_252A0F988((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_252A0F938((uint64_t)v12);
  return v7;
}

uint64_t sub_252A0F218(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_252A12330();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_252A0F3D4(a5, a6);
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
  uint64_t v8 = sub_252A12350();
  if (!v8)
  {
    sub_252A12360();
    __break(1u);
LABEL_17:
    uint64_t result = sub_252A12370();
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

uint64_t sub_252A0F3D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_252A0F46C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_252A0F64C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_252A0F64C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_252A0F46C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_252A0F5E4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_252A12340();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_252A12360();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_252A122C0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_252A12370();
    __break(1u);
LABEL_14:
    uint64_t result = sub_252A12360();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_252A0F5E4(uint64_t a1, uint64_t a2)
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
  sub_252A0E788(&qword_269C40220);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_252A0F64C(char a1, int64_t a2, char a3, char *a4)
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
    sub_252A0E788(&qword_269C40220);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_252A12370();
  __break(1u);
  return result;
}

void type metadata accessor for IAFBKSInteractionFeatureDomain(uint64_t a1)
{
}

void type metadata accessor for IAFBKSEvaluationAction(uint64_t a1)
{
}

void sub_252A0F7C4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_252A0F80C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_252A0E788(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_252A0F868(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252A0E788(&qword_269C40210);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_252A0F8D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252A0E788(&qword_269C40210);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_252A0F938(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_252A0F988(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_252A0F9E8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_252A0FA50()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_252A0FA90()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_252A0FC54;
  size_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_269C40228 + dword_269C40228);
  return v5(v2, v3);
}

uint64_t sub_252A0FB44()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_252A0FB84(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_252A0F018;
  int64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_269C401E0 + dword_269C401E0);
  return v8(a1, v4, v5, v6);
}

void sub_252A0FC58(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_2529F1000, log, OS_LOG_TYPE_FAULT, "Please implement didAction in child class", v1, 2u);
}

void sub_252A0FC9C(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_UUIDString(a1, a2, a3, a4);
  int v6 = 138412290;
  uint64_t v7 = v5;
  _os_log_error_impl(&dword_2529F1000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Analyzer ID %@ does not exist. Unable to map", (uint8_t *)&v6, 0xCu);
}

void sub_252A0FD34(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2529F1000, a2, OS_LOG_TYPE_ERROR, "Analytics session ID %@ already mapped. Unable to associate with another session", (uint8_t *)&v2, 0xCu);
}

void sub_252A0FDAC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_2529F1000, a3, OS_LOG_TYPE_DEBUG, "createAnalyzerForSessionID found existing analyzer for session %@ of class %@", (uint8_t *)&v7, 0x16u);
}

void sub_252A0FE64()
{
  sub_2529F9BEC();
  sub_2529F9C80(&dword_2529F1000, v0, v1, "IATextInputActionsAnalytics analyticsDelegate is nil", v2, v3, v4, v5, v6);
}

void sub_252A0FE98(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v7 = 134218243;
  uint64_t v8 = objc_msgSend_flagOptions(a1, a2, a3, a4);
  __int16 v9 = 2113;
  uint64_t v10 = a1;
  sub_2529F9C68(&dword_2529F1000, a2, v6, "[IATextInputActionsAnalytics] mergeOrConsumeAction: Unacceptable flagOptions value of %lu set for new action:%{private}@", (uint8_t *)&v7);
}

void sub_252A0FF2C()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didSessionBegin", v2, v3, v4, v5, v6);
}

void sub_252A0FF60()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didSessionEnd", v2, v3, v4, v5, v6);
}

void sub_252A0FF94()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didOther", v2, v3, v4, v5, v6);
}

void sub_252A0FFC8()
{
  sub_2529F9C9C();
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_description(v1, (const char *)v1, v2, v3);
  sub_2529F9C18();
  sub_2529F9C68(&dword_2529F1000, v0, v5, "[IATextInputActionsAnalytics] didInsertText: selectedTextBefore:%{sensitive}@ withInputMode:%{private}@ called with nil text", v6);
}

void sub_252A10060()
{
  sub_2529F9BEC();
  sub_2529F9C80(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didDeleteBackwardText: called with nil text", v2, v3, v4, v5, v6);
}

void sub_252A10094(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138739971;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2529F1000, a2, OS_LOG_TYPE_DEBUG, "[IATextInputActionsAnalytics] didDeleteBackwardText:%{sensitive}@", (uint8_t *)&v2, 0xCu);
}

void sub_252A1010C()
{
  sub_2529F9C9C();
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend_stringForType_(IATextInputActionsUtils, v1, (uint64_t)v1, v2);
  sub_2529F9C18();
  sub_2529F9C50(&dword_2529F1000, v0, v4, "[IATextInputActionsAnalytics] didDeleteBackwardText:%{sensitive}@ withType:'%{private}@'", v5);
}

void sub_252A101AC(uint64_t a1, const char *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_stringForType_(IATextInputActionsUtils, a2, a1, a4);
  sub_2529F9C18();
  sub_2529F9C50(&dword_2529F1000, a3, v6, "[IATextInputActionsAnalytics] didDeleteBackwardCount:%lu withType:'%{private}@'", v7);
}

void sub_252A10250()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didCopy", v2, v3, v4, v5, v6);
}

void sub_252A10284()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didCut", v2, v3, v4, v5, v6);
}

void sub_252A102B8()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didPaste", v2, v3, v4, v5, v6);
}

void sub_252A102EC()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didUndo", v2, v3, v4, v5, v6);
}

void sub_252A10320()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didRedo", v2, v3, v4, v5, v6);
}

void sub_252A10354(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138740227;
  uint64_t v4 = a1;
  __int16 v5 = 2117;
  uint64_t v6 = 0;
  sub_2529F9C68(&dword_2529F1000, a2, a3, "[IATextInputActionsAnalytics] _didReplacementForText:%{sensitive}@ withText:%{sensitive}@ had disallowed nil replacement", (uint8_t *)&v3);
}

void sub_252A103D0()
{
  sub_2529F9BB8();
  sub_2529F9C30(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] _didReplacementForText:%{sensitive}@ withText:%{sensitive}@ had disallowed empty text");
}

void sub_252A10438(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138740227;
  uint64_t v4 = 0;
  __int16 v5 = 2117;
  uint64_t v6 = a1;
  sub_2529F9C68(&dword_2529F1000, a2, a3, "[IATextInputActionsAnalytics] _didReplacementForText:%{sensitive}@ withText:%{sensitive}@ had disallowed nil text", (uint8_t *)&v3);
}

void sub_252A104B4()
{
  sub_2529F9BB8();
  sub_2529F9BF8(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didCandidateBarReplacementForText:%{sensitive}@ withText:%{sensitive}@");
}

void sub_252A1051C()
{
  sub_2529F9BB8();
  sub_2529F9BF8(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didCalloutBarReplacementForText:%{sensitive}@ withText:%{sensitive}@");
}

void sub_252A10584()
{
  sub_2529F9BB8();
  sub_2529F9BF8(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didAutocorrectReplacementForText:%{sensitive}@ withText:%{sensitive}@");
}

void sub_252A105EC()
{
  sub_2529F9BB8();
  sub_2529F9BF8(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didAutocorrectTapOnCompletionReplacementForText:%{sensitive}@ withText:%{sensitive}@");
}

void sub_252A10654()
{
  sub_2529F9BB8();
  sub_2529F9BF8(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didInlineCompletionReplacementForText:%{sensitive}@ withText:%{sensitive}@");
}

void sub_252A106BC()
{
  sub_2529F9BB8();
  sub_2529F9BF8(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didInlineCompletionTapOnCompletionReplacementForText:%{sensitive}@ withText:%{sensitive}@");
}

void sub_252A10724()
{
  sub_2529F9BB8();
  sub_2529F9BF8(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didRevisionBubbleReplacementForText:%{sensitive}@ withText:%{sensitive}@");
}

void sub_252A1078C()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didRevisionBubbleTap", v2, v3, v4, v5, v6);
}

void sub_252A107C0(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_stringForReplaceWithCandidateType_(IATextInputActionsUtils, a2, a1, a4);
  int v6 = 138477827;
  uint64_t v7 = v5;
  _os_log_debug_impl(&dword_2529F1000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "[IATextInputActionsAnalytics] didReplaceWithCandidate:'%{private}@'", (uint8_t *)&v6, 0xCu);
}

void sub_252A10864()
{
  sub_2529F9BB8();
  sub_2529F9C30(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didConversionForMarkedText:%{sensitive}@ withText:%{sensitive}@ had disallowed nil replacement");
}

void sub_252A108CC()
{
  sub_2529F9BB8();
  sub_2529F9C30(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didConversionForMarkedText:%{sensitive}@ withText:%{sensitive}@ had disallowed empty text");
}

void sub_252A10934()
{
  sub_2529F9BB8();
  sub_2529F9C30(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didConversionForMarkedText:%{sensitive}@ withText:%{sensitive}@ marked text incorrectly set");
}

void sub_252A1099C()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didGlomojiTap", v2, v3, v4, v5, v6);
}

void sub_252A109D0()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didKBMenuAppear", v2, v3, v4, v5, v6);
}

void sub_252A10A04()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didKBMenuInteraction", v2, v3, v4, v5, v6);
}

void sub_252A10A38()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didKBMenuDismiss", v2, v3, v4, v5, v6);
}

void sub_252A10A6C()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didDictationBegin", v2, v3, v4, v5, v6);
}

void sub_252A10AA0()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didDictationEnd", v2, v3, v4, v5, v6);
}

void sub_252A10AD4()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didInsertionKeyPress", v2, v3, v4, v5, v6);
}

void sub_252A10B08()
{
  sub_2529F9C9C();
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend_stringForType_(IATextInputActionsUtils, v1, (uint64_t)v1, v2);
  sub_2529F9C18();
  sub_2529F9C50(&dword_2529F1000, v0, v4, "[IATextInputActionsAnalytics] didInsertionKeyPressOfKey:%{sensitive}@ withType:%{private}@", v5);
}

void sub_252A10BA8()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IATextInputActionsAnalytics] didDeletionKeyPress", v2, v3, v4, v5, v6);
}

void sub_252A10BDC()
{
  sub_2529F9C9C();
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend_stringForType_(IATextInputActionsUtils, v1, (uint64_t)v1, v2);
  sub_2529F9C18();
  sub_2529F9C50(&dword_2529F1000, v0, v4, "[IATextInputActionsAnalytics] didDeletionKeyPressOfKey:%{sensitive}@ withType:%{private}@", v5);
}

void sub_252A10C7C(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v5 = 134217984;
  uint64_t v6 = objc_msgSend_count(a1, a2, a3, a4);
  _os_log_debug_impl(&dword_2529F1000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "Stateless session manager initialized %lu analyzers", (uint8_t *)&v5, 0xCu);
}

void sub_252A10D08(void *a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  __int16 v9 = objc_msgSend_description(a1, v6, v7, v8);
  int v10 = 138740227;
  uint64_t v11 = v5;
  __int16 v12 = 2117;
  uint64_t v13 = v9;
  _os_log_debug_impl(&dword_2529F1000, a2, OS_LOG_TYPE_DEBUG, "didAction called with action object of class %{sensitive}@ and description %{sensitive}@\n", (uint8_t *)&v10, 0x16u);
}

void sub_252A10DD0()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IASTextInputActionsAnalyzer] Initialized analyzer", v2, v3, v4, v5, v6);
}

void sub_252A10E04()
{
  sub_2529FE190();
  sub_2529F9BF8(&dword_2529F1000, v0, v1, "[IASTextInputActionsAnalyzer] New key found - initializing new array for key \"%{private}@\" with capacity %lu");
}

void sub_252A10E6C()
{
  sub_2529FE190();
  sub_2529F9BF8(&dword_2529F1000, v0, v1, "[IASTextInputActionsAnalyzer] New key found - initializing new array for key %lu with capacity %lu", v2, v3);
}

void sub_252A10ED4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_count(a1, a2, a3, a4);
  sub_2529FE1A8(&dword_2529F1000, v4, v5, "Attempt to access index %lu, which is out of bounds for array with capacity %lu", v6, v7, v8, v9, 0);
}

void sub_252A10F60()
{
  sub_2529FE190();
  sub_2529F9BF8(&dword_2529F1000, v0, v1, "[IASTextInputActionsAnalyzer] New key found - initializing new dictionary for key %lu with capacity %lu", v2, v3);
}

void sub_252A10FC8()
{
  sub_2529F9BEC();
  _os_log_error_impl(&dword_2529F1000, v0, OS_LOG_TYPE_ERROR, "[IASTextInputActionsAnalyzer] Received nil input mode unique key", v1, 2u);
}

void sub_252A11008()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IASTextInputActionsAnalyzer] Cached keyboardTrialParameters", v2, v3, v4, v5, v6);
}

void sub_252A1103C()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IASTextInputActionsAnalyzer] Initial deletion latch", v2, v3, v4, v5, v6);
}

void sub_252A11070(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_analyzerSessionId(a1, a2, a3, a4);
  uint64_t v9 = objc_msgSend_description(v5, v6, v7, v8);
  uint64_t v19 = objc_msgSend_description(a2, v10, v11, v12);
  sub_2529FE1A8(&dword_2529F1000, v13, v14, "[%{private}@]nil inputMode passed to [IASTextInputActionsAnalyzer consumeAction:] in action '%{private}@'", v15, v16, v17, v18, 3u);
}

void sub_252A11134()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IASTextInputActionsAnalyzer] Reset analyzer", v2, v3, v4, v5, v6);
}

void sub_252A11168()
{
  sub_2529F9BEC();
  _os_log_error_impl(&dword_2529F1000, v0, OS_LOG_TYPE_ERROR, "[IASTextInputActionsAnalyzer] eventHandler nil", v1, 2u);
}

void sub_252A111A8()
{
  sub_2529F9BEC();
  sub_2529F9BD0(&dword_2529F1000, v0, v1, "[IASTextInputActionsAnalyzer] Enumerating TextInputActions...", v2, v3, v4, v5, v6);
}

void sub_252A111DC(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2529F1000, a2, OS_LOG_TYPE_ERROR, "Invalid error code '%{private}@'", (uint8_t *)&v2, 0xCu);
}

void sub_252A11254(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint8_t v6 = objc_msgSend_channelName(a1, a2, a3, a4);
  int v10 = objc_msgSend_signalName(a1, v7, v8, v9);
  sub_252A01A40();
  _os_log_debug_impl(&dword_2529F1000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "Handling channel %{private}@ signal %{private}@", v11, 0x16u);
}

void sub_252A11308(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint8_t v6 = objc_msgSend_signalName(a1, a2, a3, a4);
  int v10 = objc_msgSend_channelName(a1, v7, v8, v9);
  sub_252A01A40();
  _os_log_error_impl(&dword_2529F1000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "signal '%{private}@' not found in translator for channel '%{private}@'. Using default", v11, 0x16u);
}

void sub_252A113BC(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint8_t v6 = objc_msgSend_channelName(a1, a2, a3, a4);
  int v10 = objc_msgSend_signalName(a1, v7, v8, v9);
  sub_252A01A40();
  _os_log_fault_impl(&dword_2529F1000, (os_log_t)a2, OS_LOG_TYPE_FAULT, "Missing definitions in channelBasedPayloadKeyAllowList for channel '%{private}@' signal '%{private}@'", v11, 0x16u);
}

void sub_252A11470()
{
  sub_2529F9BEC();
  sub_252A0278C(&dword_2529F1000, v0, v1, "didAction called on IAXPCProtocolObject base class. Please implement this method", v2, v3, v4, v5, v6);
}

void sub_252A114A4()
{
  sub_2529F9BEC();
  sub_252A0278C(&dword_2529F1000, v0, v1, "didSessionBeginWithSessionMetadata called on IAXPCProtocolObject base class. Please implement this method", v2, v3, v4, v5, v6);
}

void sub_252A114D8()
{
  sub_2529F9BEC();
  sub_252A0278C(&dword_2529F1000, v0, v1, "didSessionEndWithSessionMetadata called on IAXPCProtocolObject base class. Please implement this method", v2, v3, v4, v5, v6);
}

void sub_252A1150C()
{
  sub_2529F9BEC();
  sub_252A0278C(&dword_2529F1000, v0, v1, "getDateWithReply called on IAXPCProtocolObject base class. Please implement this method", v2, v3, v4, v5, v6);
}

void sub_252A11540()
{
  sub_2529F9BEC();
  sub_252A0278C(&dword_2529F1000, v0, v1, "logMessage called on IAXPCProtocolObject base class. Please implement this method", v2, v3, v4, v5, v6);
}

void sub_252A11574()
{
  sub_2529F9BEC();
  sub_252A0278C(&dword_2529F1000, v0, v1, "reportStatus called on IAXPCProtocolObject base class. Please implement this method", v2, v3, v4, v5, v6);
}

void sub_252A115A8()
{
  sub_252A04808();
  sub_252A047FC(v1, v2, 5.7779e-34);
  sub_252A047B8(&dword_2529F1000, v3, (uint64_t)v3, "Unable to initlialize object with name %@", v4);
}

void sub_252A115F0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_name(a1, a2, a3, a4);
  sub_252A047D0();
  sub_252A04798(&dword_2529F1000, v5, v6, "Object with name %@ is destroyed/stale", v7, v8, v9, v10, v11);
}

void sub_252A11674(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_name(a1, a2, a3, a4);
  sub_252A047D0();
  sub_252A04798(&dword_2529F1000, v5, v6, "Unable to get strong reference to datastoreHandle for object with name %@", v7, v8, v9, v10, v11);
}

void sub_252A116F8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_2529F1000, log, OS_LOG_TYPE_FAULT, "Please implement type in child class", v1, 2u);
}

void sub_252A1173C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_name(a1, a2, a3, a4);
  sub_252A047D0();
  sub_252A04798(&dword_2529F1000, v5, v6, "Unable to persist base properties for object with name %@", v7, v8, v9, v10, v11);
}

void sub_252A117C0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_name(a1, a2, a3, a4);
  sub_252A047D0();
  sub_252A04798(&dword_2529F1000, v5, v6, "Unable to destroy base properties for object with name %@", v7, v8, v9, v10, v11);
}

void sub_252A11844(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_name(a1, a2, a3, a4);
  sub_252A047D0();
  sub_252A04798(&dword_2529F1000, v5, v6, "Counter with name %@ attempted to be set below 0", v7, v8, v9, v10, v11);
}

void sub_252A118C8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_name(a1, a2, a3, a4);
  sub_252A047D0();
  sub_252A047DC(&dword_2529F1000, v5, v6, "usageFrequency [%{private}@] daily failed", v7, v8, v9, v10, v11);
}

void sub_252A1194C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_name(a1, a2, a3, a4);
  sub_252A047D0();
  sub_252A047DC(&dword_2529F1000, v5, v6, "usageFrequency [%{private}@] week failed", v7, v8, v9, v10, v11);
}

void sub_252A119D0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_name(a1, a2, a3, a4);
  sub_252A047D0();
  sub_252A047DC(&dword_2529F1000, v5, v6, "usageFrequency [%{private}@] month failed", v7, v8, v9, v10, v11);
}

void sub_252A11A54(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_name(a1, a2, a3, a4);
  sub_252A047D0();
  sub_252A04798(&dword_2529F1000, v5, v6, "Unable to update start date for daterange with name %@", v7, v8, v9, v10, v11);
}

void sub_252A11AD8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_name(a1, a2, a3, a4);
  sub_252A047D0();
  sub_252A04798(&dword_2529F1000, v5, v6, "Negative time interval found when cycling daterange with name %@", v7, v8, v9, v10, v11);
}

void sub_252A11B5C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2529F1000, a2, OS_LOG_TYPE_ERROR, "No supported preferences for platform to report for requested userPreference %lu", (uint8_t *)&v2, 0xCu);
}

void sub_252A11BD4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138478083;
  uint64_t v3 = @"com.apple.";
  __int16 v4 = 2113;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_2529F1000, a2, OS_LOG_TYPE_FAULT, "IADefaultsDataStore datastoreName should start with '%{private}@', got '%{private}@'", (uint8_t *)&v2, 0x16u);
}

void sub_252A11C60()
{
  sub_252A047D0();
  sub_252A05870(&dword_2529F1000, v0, v1, "Object with name %@ already exists", v2, v3, v4, v5, v6);
}

void sub_252A11CC8()
{
  sub_252A047D0();
  sub_252A05870(&dword_2529F1000, v0, v1, "Object could not be initialized: %@", v2, v3, v4, v5, v6);
}

void sub_252A11D30()
{
  sub_252A047D0();
  sub_252A05870(&dword_2529F1000, v0, v1, "Type not recognized: %@", v2, v3, v4, v5, v6);
}

void sub_252A11D98()
{
  sub_252A047D0();
  sub_252A05870(&dword_2529F1000, v0, v1, "Object with name %@ not allowed", v2, v3, v4, v5, v6);
}

void sub_252A11E00(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_name(a1, a2, a3, a4);
  sub_252A047D0();
  sub_252A04798(&dword_2529F1000, v5, v6, "Object with name %@ cannot be deleted because it could not be destroyed", v7, v8, v9, v10, v11);
}

void sub_252A11E84(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_name(a1, a2, a3, a4);
  sub_252A047D0();
  sub_252A04798(&dword_2529F1000, v5, v6, "Object with name %@ cannot be deleted because it does not exist", v7, v8, v9, v10, v11);
}

void sub_252A11F08()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_252A047D0();
  _os_log_debug_impl(&dword_2529F1000, v0, OS_LOG_TYPE_DEBUG, "Object with name %@ cannot be acquired because it does not exist, creating it instead", v1, 0xCu);
}

void sub_252A11F7C()
{
  sub_252A06A44(*MEMORY[0x263EF8340]);
  sub_252A06A6C();
  _os_log_error_impl(&dword_2529F1000, v0, OS_LOG_TYPE_ERROR, "Interrupted 0x%lx _connection 0x%lx _server 0x%lx", v1, 0x20u);
}

void sub_252A11FF0()
{
  sub_252A06A44(*MEMORY[0x263EF8340]);
  sub_252A06A6C();
  _os_log_error_impl(&dword_2529F1000, v0, OS_LOG_TYPE_ERROR, "Invalidated 0x%lx _connection 0x%lx _server 0x%lx", v1, 0x20u);
}

void sub_252A12064(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_localizedDescription(a1, a2, a3, a4);
  uint64_t v10 = objc_msgSend_localizedFailureReason(a1, v7, v8, v9);
  int v11 = 138478083;
  uint64_t v12 = v6;
  __int16 v13 = 2113;
  uint64_t v14 = v10;
  _os_log_error_impl(&dword_2529F1000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Error on remote object proxy: %{private}@ %{private}@", (uint8_t *)&v11, 0x16u);
}

void sub_252A12128(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2529F1000, log, OS_LOG_TYPE_ERROR, "reportStateForUserPreference: is deprecated!", v1, 2u);
}

void sub_252A1216C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2529F1000, log, OS_LOG_TYPE_ERROR, "reportStateForUserPreferences: is deprecated!", v1, 2u);
}

uint64_t sub_252A121B0()
{
  return MEMORY[0x270F28858]();
}

uint64_t sub_252A121E0()
{
  return MEMORY[0x270F288B0]();
}

uint64_t sub_252A121F0()
{
  return MEMORY[0x270F28908]();
}

uint64_t sub_252A12200()
{
  return MEMORY[0x270F28910]();
}

uint64_t sub_252A12210()
{
  return MEMORY[0x270F28990]();
}

uint64_t sub_252A12220()
{
  return MEMORY[0x270F289B0]();
}

uint64_t sub_252A12230()
{
  return MEMORY[0x270F289D0]();
}

uint64_t sub_252A12240()
{
  return MEMORY[0x270F28A28]();
}

uint64_t sub_252A12250()
{
  return MEMORY[0x270F28A48]();
}

uint64_t sub_252A12260()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_252A12270()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_252A12280()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_252A12290()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_252A122A0()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_252A122B0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_252A122C0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_252A122D0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_252A122E0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_252A122F0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_252A12300()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_252A12310()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_252A12320()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_252A12330()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_252A12340()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_252A12350()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_252A12360()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_252A12370()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
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