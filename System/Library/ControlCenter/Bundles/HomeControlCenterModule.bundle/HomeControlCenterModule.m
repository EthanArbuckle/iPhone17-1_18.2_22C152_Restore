void HUCCUpdateRunningState(int a1, uint64_t a2, uint64_t a3)
{
  HUCCUpdateRunningStateWithAppleMediaAccessories(a1, 0, a3);
}

void HUCCPerformCommonInitialization()
{
  if (qword_26AFC7DA0 != -1) {
    dispatch_once(&qword_26AFC7DA0, &unk_26F4C8060);
  }
}

BOOL sub_24065F794(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend_hf_prettyDescription(v2, v5, v6);
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_24065C000, v4, OS_LOG_TYPE_DEFAULT, "HUCCSmartGridItemManager hiding item %@", (uint8_t *)&v9, 0xCu);
    }
  }

  return (isKindOfClass & 1) == 0;
}

uint64_t sub_2406600D8(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  v10 = objc_msgSend_predictionsItemProvider(v5, v8, v9);
  v12 = objc_msgSend_itemPriority_(v10, v11, (uint64_t)v7);

  v15 = objc_msgSend_predictionsItemProvider(*(void **)(a1 + 32), v13, v14);
  v17 = objc_msgSend_itemPriority_(v15, v16, (uint64_t)v6);

  uint64_t v19 = objc_msgSend_compare_(v12, v18, (uint64_t)v17);
  return v19;
}

id sub_2406606E8(void *a1, const char *a2, uint64_t a3)
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2406607C4;
  v11[3] = &unk_2650CBF90;
  v11[4] = a3;
  v11[5] = a1;
  id v6 = sub_2406607C4((uint64_t)v11, a2);
  if ((unint64_t)(a3 - 3) <= 2)
  {
    id v7 = objc_msgSend__hucc_sizeSubclassSearchOrderForBaseSizeSubclass_(a1, v5, a3 - 3);
    uint64_t v9 = objc_msgSend_arrayByAddingObjectsFromArray_(v6, v8, (uint64_t)v7);

    id v6 = (void *)v9;
  }

  return v6;
}

id sub_2406607C4(uint64_t a1, const char *a2)
{
  id v2 = &unk_26F4CBF78;
  switch(*(void *)(a1 + 32))
  {
    case 0:
      break;
    case 1:
      id v2 = &unk_26F4CBF90;
      break;
    case 2:
      id v2 = &unk_26F4CBFA8;
      break;
    case 3:
      id v2 = &unk_26F4CBFC0;
      break;
    case 4:
      id v2 = &unk_26F4CBFD8;
      break;
    case 5:
      id v2 = &unk_26F4CBFF0;
      break;
    case 6:
      v3 = objc_msgSend__hucc_sizeSubclassSearchOrderForBaseSizeSubclass_(*(void **)(a1 + 40), a2, 2);
      id v2 = objc_msgSend_arrayByAddingObjectsFromArray_(&unk_26F4CC008, v4, (uint64_t)v3);

      break;
    default:
      id v2 = (void *)MEMORY[0x263EFFA68];
      break;
  }

  return v2;
}

double sub_2406608BC(void *a1, const char *a2, uint64_t a3)
{
  v3 = objc_msgSend_hucc_objectForSizeSubclass_(a1, a2, a3);
  id v6 = v3;
  if (!v3) {
    v3 = &unk_26F4CBE70;
  }
  objc_msgSend_doubleValue(v3, v4, v5);
  double v8 = v7;

  return v8;
}

id sub_24066090C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (objc_msgSend_count(a1, a2, a3))
  {
    uint64_t v5 = objc_opt_class();
    objc_msgSend__hucc_sizeSubclassSearchOrderForBaseSizeSubclass_(v5, v6, a3);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(a1, v10, *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
          if (v14)
          {
            v15 = (void *)v14;
            goto LABEL_12;
          }
        }
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v21, 16);
        if (v11) {
          continue;
        }
        break;
      }
    }
    v15 = 0;
LABEL_12:
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

BOOL _HUCCLayoutStyleForModuleViewWidth(double a1, uint64_t a2, const char *a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_currentDevice(MEMORY[0x263F1C5C0], a3, a4);
  uint64_t v8 = objc_msgSend_userInterfaceIdiom(v5, v6, v7);

  if (v8 == 1) {
    return 0;
  }
  uint64_t v12 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], v9, v10);
  v15 = objc_msgSend_fixedCoordinateSpace(v12, v13, v14);
  objc_msgSend_bounds(v15, v16, v17);
  BOOL v11 = v18 < a1;

  return v11;
}

uint64_t HUCCSizeSubclassForModuleViewWidth(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  BOOL v4 = _HUCCLayoutStyleForModuleViewWidth(a4, a1, a2, a3);
  uint64_t v7 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], v5, v6);
  uint64_t v10 = objc_msgSend_fixedCoordinateSpace(v7, v8, v9);
  objc_msgSend_bounds(v10, v11, v12);

  uint64_t v13 = HUViewSizeSubclassForViewSize();
  uint64_t v14 = 1;
  if (v13 != 1) {
    uint64_t v14 = 2;
  }
  uint64_t v15 = 4;
  if (v13 != 1) {
    uint64_t v15 = 5;
  }
  if (!v13)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 3;
  }
  if (v4) {
    return v15;
  }
  else {
    return v14;
  }
}

void sub_240660C68()
{
  id v4 = objc_alloc_init(MEMORY[0x263F49B80]);
  id v2 = objc_msgSend_sharedInstance(MEMORY[0x263F49AF8], v0, v1);
  objc_msgSend_setStatusBarVisibilityHandler_(v2, v3, (uint64_t)v4);
}

id sub_240660D18(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    id v6 = a2;
    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24065C000, v7, OS_LOG_TYPE_DEFAULT, "HUCCControlCenterModule loading preview asset", buf, 2u);
    }

    id v8 = objc_alloc(MEMORY[0x263F1C318]);
    uint64_t v9 = (void *)MEMORY[0x263F086E0];
    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_bundleForClass_(v9, v11, v10);
    uint64_t v14 = objc_msgSend_initWithName_bundle_(v8, v13, (uint64_t)v6, v12);

    uint64_t v15 = (void *)MEMORY[0x263F15838];
    double v18 = objc_msgSend_data(v14, v16, v17);
    uint64_t v19 = *MEMORY[0x263F15EF0];
    uint64_t v32 = 0;
    v21 = objc_msgSend_packageWithData_type_options_error_(v15, v20, (uint64_t)v18, v19, MEMORY[0x263EFFA78], &v32);
    uint64_t v22 = v32;

    v23 = HFLogForCategory();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v24)
      {
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_24065C000, v23, OS_LOG_TYPE_DEFAULT, "HUCCControlCenterModule could not load HomeLargeXL asset", v30, 2u);
      }

      uint64_t v26 = objc_msgSend_emptyPreviewForGridSize_(MEMORY[0x263F49B20], v25, a3, a4);
    }
    else
    {
      if (v24)
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_24065C000, v23, OS_LOG_TYPE_DEFAULT, "HUCCControlCenterModule loaded HomeLargeXL asset", v31, 2u);
      }

      uint64_t v26 = objc_msgSend_previewWithPackage_forGridSize_(MEMORY[0x263F49B20], v27, (uint64_t)v21, a3, a4);
    }
    v28 = (void *)v26;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

uint64_t sub_240661348(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend_hf_isHomePod(v2, v3, v4)) {
    uint64_t isAppleTV = 1;
  }
  else {
    uint64_t isAppleTV = objc_msgSend_hf_isAppleTV(v2, v5, v6);
  }

  return isAppleTV;
}

void sub_2406618C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2406618F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = objc_msgSend_mainThreadScheduler(MEMORY[0x263F581B8], v4, v5);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2406619D8;
  v9[3] = &unk_2650CBFF8;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  id v7 = v3;
  id v10 = v7;
  objc_msgSend_performBlock_(v6, v8, (uint64_t)v9);

  objc_destroyWeak(&v11);
}

void sub_2406619C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2406619D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_setCharacteristicRegistrationObject_(WeakRetained, v2, v1);
}

void sub_240661C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_240661CA8(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_setCharacteristicRegistrationScheduledCancelation_(WeakRetained, v2, 0);
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = WeakRetained;
    _os_log_impl(&dword_24065C000, v3, OS_LOG_TYPE_DEFAULT, "%@:CharacteristicRegistration deregistering characteristic notifications", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v6 = objc_msgSend_characteristicRegistrationObject(WeakRetained, v4, v5);
  objc_msgSend_cancelRegistration_(WeakRetained, v7, (uint64_t)v6);

  objc_msgSend_setCharacteristicRegistrationObject_(WeakRetained, v8, 0);
  objc_msgSend_endHomeKitActiveAssertion(WeakRetained, v9, v10);
}

void sub_2406623B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = objc_msgSend_context(*(void **)(a1 + 32), v4, v5);
  uint64_t v7 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_24066246C;
  v10[3] = &unk_2650CC070;
  id v11 = v3;
  id v8 = v3;
  objc_msgSend_openURL_completionHandler_(v6, v9, v7, v10);
}

void sub_24066246C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, 0);
  }
  else
  {
    objc_msgSend_na_genericError(MEMORY[0x263F087E8], a2, a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
  }
}

void sub_240662824(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_itemManager(*(void **)(a1 + 32), a2, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)objc_msgSend_reloadAndUpdateAllItemsFromSenderSelector_(v6, v4, *(void *)(a1 + 40));
}

uint64_t sub_240662A08(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  if (v5) {
    uint64_t v8 = objc_msgSend_shouldShowAsEmptyHome(v5, v6, v7) ^ 1;
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

id sub_240663990(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)HUCCSmartGridViewController;
  id v3 = objc_msgSendSuper2(&v5, sel_prepareToPerformToggleActionForItem_sourceItem_, v2, v1);

  return v3;
}

void sub_240663CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_240663CF4(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v7 = objc_msgSend_home(*(void **)(a1 + 32), v5, v6);
  objc_msgSend__showDashboardControllerForHome_(WeakRetained, v8, (uint64_t)v7);

  objc_msgSend_finishWithNoResult(v4, v9, v10);
}

uint64_t sub_240664988(uint64_t a1, const char *a2)
{
  return objc_msgSend_requiresUnlockToPerformActionForItem_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

void sub_240664994(void **a1, const char *a2, uint64_t a3)
{
  id v4 = objc_msgSend_delegate(a1[4], a2, a3);
  uint64_t v6 = objc_msgSend_prepareForActionRequiringDeviceUnlockForGridViewController_(v4, v5, (uint64_t)a1[4]);

  uint64_t v9 = objc_msgSend_copy(a1[5], v7, v8);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_240664A78;
  v13[3] = &unk_2650CC180;
  id v14 = a1[6];
  id v15 = v9;
  id v10 = v9;
  id v12 = (id)objc_msgSend_addSuccessBlock_(v6, v11, (uint64_t)v13);
}

id sub_240664A78(uint64_t a1, const char *a2)
{
  return (id)objc_msgSend_presentQuickControlWithContext_animated_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), 1);
}

id sub_240664D84(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = objc_msgSend_collectionView(*(void **)(a1 + 32), v4, v5);
  uint64_t v8 = objc_msgSend_cellForItemAtIndexPath_(v6, v7, (uint64_t)v3);
  if (objc_msgSend_conformsToProtocol_(v8, v9, (uint64_t)&unk_26F505880)) {
    id v10 = v8;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    id v14 = objc_msgSend_itemManager(*(void **)(a1 + 32), v12, v13);
    v16 = objc_msgSend_displayedItemAtIndexPath_(v14, v15, (uint64_t)v3);

    uint64_t v19 = objc_msgSend_item(v11, v17, v18);

    if (v19 == v16)
    {
      v25 = 0;
    }
    else
    {
      uint64_t v22 = NSString;
      v23 = objc_msgSend_item(v11, v20, v21);
      v25 = objc_msgSend_stringWithFormat_(v22, v24, @"Cell item %@ at index path %@ does not match item manager's item %@!", v23, v3, v16);
    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

void sub_240664EBC(uint64_t a1)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  uint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_240675ED0();
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v70, v82, 16);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v71;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v71 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v70 + 1) + 8 * v8);
        id v10 = HFLogForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v81 = v9;
          _os_log_error_impl(&dword_24065C000, v10, OS_LOG_TYPE_ERROR, "  %@", buf, 0xCu);
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v11, (uint64_t)&v70, v82, 16);
    }
    while (v6);
  }

  id v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_240675E9C();
  }

  if (*(void *)(a1 + 40))
  {
    uint64_t v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_240675E68();
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v16 = objc_msgSend_changes(*(void **)(a1 + 40), v14, v15);
    uint64_t v19 = objc_msgSend_allOperations(v16, v17, v18);

    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v66, v79, 16);
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v67;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v67 != v23) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = *(void *)(*((void *)&v66 + 1) + 8 * v24);
          uint64_t v26 = HFLogForCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            sub_240675E10((uint64_t)buf, v25);
          }

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v27, (uint64_t)&v66, v79, 16);
      }
      while (v22);
    }

    v28 = HFLogForCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_240675DDC();
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v31 = objc_msgSend_changes(*(void **)(a1 + 40), v29, v30);
    v34 = objc_msgSend_fromGroups(v31, v32, v33);

    id obj = v34;
    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v62, v78, 16);
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v55 = *(void *)v63;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v63 != v55) {
            objc_enumerationMutation(obj);
          }
          v39 = *(void **)(*((void *)&v62 + 1) + 8 * v38);
          v40 = HFLogForCategory();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            sub_240675D84((uint64_t)v77, (uint64_t)v39);
          }

          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          v43 = objc_msgSend_diffableItems(v39, v41, v42);
          uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v58, v76, 16);
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v59;
            do
            {
              uint64_t v48 = 0;
              do
              {
                if (*(void *)v59 != v47) {
                  objc_enumerationMutation(v43);
                }
                uint64_t v49 = *(void *)(*((void *)&v58 + 1) + 8 * v48);
                v50 = HFLogForCategory();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v74 = 138412290;
                  uint64_t v75 = v49;
                  _os_log_error_impl(&dword_24065C000, v50, OS_LOG_TYPE_ERROR, "  %@", v74, 0xCu);
                }

                ++v48;
              }
              while (v46 != v48);
              uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v51, (uint64_t)&v58, v76, 16);
            }
            while (v46);
          }

          v52 = HFLogForCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
            sub_240675D44(&v56, v57, v52);
          }

          ++v38;
        }
        while (v38 != v37);
        uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v62, v78, 16);
      }
      while (v37);
    }
  }
}

BOOL sub_2406654FC(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_type(a2, (const char *)a2, a3) == 1;
}

void sub_240665520(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  uint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_240676144();
  }

  HFLogForCategory();
  id v3 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR)) {
    sub_2406760AC(a1, v3, v4);
  }

  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_240676010((uint64_t)v5, v6, v7);
  }

  uint64_t v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_240675FDC();
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v11 = objc_msgSend_changes(*(void **)(a1 + 40), v9, v10);
  id v14 = objc_msgSend_allOperations(v11, v12, v13);

  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v64, v74, 16);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v65;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v65 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void *)(*((void *)&v64 + 1) + 8 * v19);
        uint64_t v21 = HFLogForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_240675E10((uint64_t)v73, v20);
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v22, (uint64_t)&v64, v74, 16);
    }
    while (v17);
  }

  uint64_t v23 = HFLogForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_240675DDC();
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v51 = a1;
  uint64_t v26 = objc_msgSend_changes(*(void **)(a1 + 40), v24, v25);
  v29 = objc_msgSend_fromGroups(v26, v27, v28);

  id obj = v29;
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v60, v72, 16);
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v53 = *(void *)v61;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v61 != v53) {
          objc_enumerationMutation(obj);
        }
        v34 = *(void **)(*((void *)&v60 + 1) + 8 * v33);
        v35 = HFLogForCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_240675D84((uint64_t)v71, (uint64_t)v34);
        }

        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        uint64_t v38 = objc_msgSend_diffableItems(v34, v36, v37);
        uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v56, v70, 16);
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v57;
          do
          {
            uint64_t v43 = 0;
            do
            {
              if (*(void *)v57 != v42) {
                objc_enumerationMutation(v38);
              }
              uint64_t v44 = *(void *)(*((void *)&v56 + 1) + 8 * v43);
              uint64_t v45 = HFLogForCategory();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v69 = v44;
                _os_log_error_impl(&dword_24065C000, v45, OS_LOG_TYPE_ERROR, "  %@", buf, 0xCu);
              }

              ++v43;
            }
            while (v41 != v43);
            uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v46, (uint64_t)&v56, v70, 16);
          }
          while (v41);
        }

        uint64_t v47 = HFLogForCategory();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_240675D44(&v54, v55, v47);
        }

        ++v33;
      }
      while (v33 != v32);
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v60, v72, 16);
    }
    while (v32);
  }

  HFLogForCategory();
  uint64_t v49 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR)) {
    sub_240675F10(v51, v49, v50);
  }
}

void sub_240665D3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_240665D58(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t sub_240665D78(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_240665D98(uint64_t result, float a2)
{
  float *v3 = a2;
  *uint64_t v2 = result;
  return result;
}

void sub_240665DA4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2406661F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24066620C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_24065C000, v2, OS_LOG_TYPE_DEFAULT, "Lock state has changed, checking access.", v5, 2u);
  }

  objc_msgSend__updateAccessAllowedForLockState(WeakRetained, v3, v4);
}

void sub_24066644C(uint64_t a1, const char *a2, uint64_t a3)
{
  id v3 = objc_msgSend_configuration(MEMORY[0x263F47B60], a2, a3);
  id v17 = (id)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_setAdaptive_(v17, v6, 1);
  objc_msgSend_setConfiguration_(MEMORY[0x263F47B60], v7, (uint64_t)v17);
  uint64_t v10 = objc_msgSend_sharedDispatcher(MEMORY[0x263F47B60], v8, v9);
  objc_msgSend_warmup(v10, v11, v12);

  uint64_t v15 = objc_msgSend_sharedInstance(MEMORY[0x263F47B48], v13, v14);
  objc_msgSend_setRunningState_(v15, v16, 1);
}

void HUCCUpdateRunningStateWithAppleMediaAccessories(int a1, const char *a2, uint64_t a3)
{
  uint64_t v5 = objc_msgSend_sharedInstance(MEMORY[0x263F47B48], a2, a3);
  uint64_t v8 = objc_msgSend_runningState(v5, v6, v7);

  if (v8 != (a1 ^ 1))
  {
    if (a1)
    {
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        uint64_t v13 = objc_msgSend_sharedManager(MEMORY[0x263F47B10], v11, v12);
        objc_msgSend_enableNotificationsForSelectedHomeWithReason_numberOfAppleMediaAccessories_(v13, v14, *MEMORY[0x263F47A98], a2);
      }
      objc_msgSend_sharedInstance(MEMORY[0x263F47B48], v11, v12);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_executionEnvironmentWillEnterForeground(v23, v15, v16);
    }
    else
    {
      id v17 = objc_msgSend_sharedInstance(MEMORY[0x263F47B48], v9, v10);
      objc_msgSend_executionEnvironmentDidEnterBackground(v17, v18, v19);

      if (_os_feature_enabled_impl()) {
        return;
      }
      objc_msgSend_sharedManager(MEMORY[0x263F47B10], v20, v21);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_disableNotificationsForSelectedHomeWithReason_(v23, v22, *MEMORY[0x263F47A90]);
    }
  }
}

void launchHomeAppForModuleViewController(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (a2)
  {
    id v4 = a2;
    uint64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_24065C000, v5, OS_LOG_TYPE_DEFAULT, "Launching Home app for moduleViewController %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v7 = objc_msgSend_URLWithString_(NSURL, v6, @"com.apple.home://");
    objc_msgSend_openURL_completionHandler_(v4, v8, (uint64_t)v7, 0);
  }
}

__CFString *HUCCStringForOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_2650CC260[a1 - 1];
  }
}

void sub_240667A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_240667A54(uint64_t a1)
{
  uint64_t v2 = HULocalizedBiometryString();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_240667B2C;
  block[3] = &unk_2650CC288;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  id v6 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v7);
}

void sub_240667B2C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = objc_msgSend_lockSecurityView(WeakRetained, v2, v3);
  objc_msgSend_updateUIWithInfoText_andActionText_(v4, v5, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

id sub_240667EB4(void *a1, const char *a2, uint64_t a3, double a4)
{
  v146[2] = *MEMORY[0x263EF8340];
  id v7 = objc_msgSend_defaultOptionsForViewSize_(MEMORY[0x263F49B50], a2, a3);
  uint64_t v10 = HUCCSizeSubclassForModuleViewWidth((uint64_t)v7, v8, v9, a4);
  uint64_t v128 = objc_msgSend_controlCenterGridLayoutForItemType_sizeSubclass_(a1, v11, a3, v10);
  uint64_t v12 = NSNumber;
  uint64_t v14 = objc_msgSend__controlCenterModuleHCFNumberOfColumnsForSizeSubclass_(a1, v13, v10);
  uint64_t v16 = objc_msgSend_numberWithUnsignedInteger_(v12, v15, v14);
  objc_msgSend_setOverrideNumberOfColumns_(v7, v17, (uint64_t)v16);

  v145[0] = &unk_26F4CBE88;
  v145[1] = &unk_26F4CBEB8;
  v146[0] = &unk_26F4CBEA0;
  v146[1] = &unk_26F4CBED0;
  uint64_t v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, (uint64_t)v146, v145, 2);
  objc_msgSend_hucc_constantForSizeSubclass_(v19, v20, v10);
  double v22 = v21;

  objc_msgSend_setRowSpacing_(v7, v23, v24, v22);
  objc_msgSend_setColumnSpacing_(v7, v25, v26, v22);
  objc_msgSend_setSectionLeadingMargin_(v7, v27, v28, 0.0);
  objc_msgSend_setSectionTrailingMargin_(v7, v29, v30, 0.0);
  objc_msgSend_setSectionBottomMargin_(v7, v31, v32, 0.0);
  objc_msgSend_setSectionTopMargin_(v7, v33, v34, 0.0);
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  uint64_t v37 = objc_msgSend_serviceCellOptions(v7, v35, v36);
  v143[0] = v37;
  v129 = v7;
  uint64_t v40 = objc_msgSend_sceneCellOptions(v7, v38, v39);
  v143[1] = v40;
  uint64_t v42 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v41, (uint64_t)v143, 2);

  uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v133, v144, 16);
  if (v44)
  {
    uint64_t v47 = v44;
    uint64_t v132 = *(void *)v134;
    uint64_t v130 = *MEMORY[0x263F1D270];
    uint64_t v131 = *MEMORY[0x263F1D278];
    uint64_t v48 = *MEMORY[0x263F1D280];
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v134 != v132) {
          objc_enumerationMutation(v42);
        }
        uint64_t v50 = *(void **)(*((void *)&v133 + 1) + 8 * i);
        uint64_t v51 = objc_msgSend_backgroundDisplayOptions(v50, v45, v46);
        objc_msgSend_setDisplayStyle_(v51, v52, 2);

        uint64_t v55 = objc_msgSend_controlCenterSecondaryVibrancyEffect(MEMORY[0x263F1CB58], v53, v54);
        objc_msgSend_setVibrancyEffect_(v50, v56, (uint64_t)v55);

        long long v59 = objc_msgSend_controlCenterSecondaryVibrancyEffect(MEMORY[0x263F1CB58], v57, v58);
        objc_msgSend_setSecondaryVibrancyEffect_(v50, v60, (uint64_t)v59);

        v141[0] = &unk_26F4CBE88;
        v141[1] = &unk_26F4CBEB8;
        v142[0] = &unk_26F4CBED0;
        v142[1] = &unk_26F4CBEE8;
        long long v62 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v61, (uint64_t)v142, v141, 2);
        objc_msgSend_hucc_constantForSizeSubclass_(v62, v63, v10);
        objc_msgSend_setCellInnerMargin_(v50, v64, v65);

        v139[0] = &unk_26F4CBE88;
        v139[1] = &unk_26F4CBEB8;
        v140[0] = v131;
        v140[1] = v130;
        v139[2] = &unk_26F4CBF00;
        v140[2] = v48;
        long long v67 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v66, (uint64_t)v140, v139, 3);
        uint64_t v69 = objc_msgSend_hucc_objectForSizeSubclass_(v67, v68, v10);

        long long v71 = objc_msgSend_defaultFontDescriptorWithTextStyle_addingSymbolicTraits_options_(MEMORY[0x263F1C660], v70, (uint64_t)v69, 2, 0);
        long long v73 = objc_msgSend_fontWithDescriptor_size_(MEMORY[0x263F1C658], v72, (uint64_t)v71, 0.0);
        objc_msgSend_setFont_(v50, v74, (uint64_t)v73);
      }
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v133, v144, 16);
    }
    while (v47);
  }

  v77 = objc_msgSend_sceneCellOptions(v129, v75, v76);
  uint64_t v79 = objc_msgSend_controlCenterGridLayoutForItemType_sizeSubclass_(a1, v78, 0, v10);
  uint64_t v81 = v80;
  unint64_t v83 = objc_msgSend_numberOfColumns(v129, v80, v82);
  objc_msgSend_preferredSectionHeightForNumberOfServiceRows_spanningColumns_(v129, v84, v79, v83 / (unint64_t)v81);
  double v86 = v85;
  objc_msgSend_rowSpacing(v129, v87, v88);
  objc_msgSend_setCellHeight_(v77, v90, v91, (v86 - (double)(unint64_t)(v128 - 1) * v89) / (double)(unint64_t)v128);
  objc_msgSend_setNumberOfTitleLines_(v77, v92, 2);
  v95 = objc_msgSend_font(v77, v93, v94);
  objc_msgSend_setDescriptionFont_(v77, v96, (uint64_t)v95);

  v99 = objc_msgSend_font(v77, v97, v98);
  objc_msgSend_lineHeight(v99, v100, v101);
  objc_msgSend_setTitleInterLineSpacing_(v77, v102, v103);

  v106 = objc_msgSend_font(v77, v104, v105);
  objc_msgSend_lineHeight(v106, v107, v108);
  objc_msgSend_setTitleDescriptionLineSpacing_(v77, v109, v110);

  v113 = objc_msgSend_serviceCellOptions(v129, v111, v112);
  v137[0] = &unk_26F4CBE88;
  v137[1] = &unk_26F4CBF30;
  v138[0] = &unk_26F4CBF18;
  v138[1] = &unk_26F4CC020;
  v137[2] = &unk_26F4CBF48;
  v137[3] = &unk_26F4CBF60;
  v138[2] = &unk_26F4CBF18;
  v138[3] = &unk_26F4CC020;
  v115 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v114, (uint64_t)v138, v137, 4);
  objc_msgSend_hucc_constantForSizeSubclass_(v115, v116, v10);
  double v118 = v117;

  v121 = objc_msgSend_font(v113, v119, v120);
  objc_msgSend_lineHeight(v121, v122, v123);
  objc_msgSend_setLineSpacing_(v113, v125, v126, v118 * v124);

  return v129;
}

uint64_t sub_240668454(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_controlCenterGridLayoutForItemType_sizeSubclass_(a1, a2, 1, a3);
  id v6 = v5;
  objc_msgSend_controlCenterGridLayoutForItemType_sizeSubclass_(a1, v5, 0, a3);

  return MEMORY[0x270F3C4B8](v6);
}

uint64_t sub_2406684B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 3;
  if (a3 == 1)
  {
    if (v4 < 3) {
      return 3;
    }
    else {
      return 4;
    }
  }
  else if (v4 > 2)
  {
    return 3;
  }
  else
  {
    return 2;
  }
}

double sub_240668500(void *a1, const char *a2, uint64_t a3, double a4)
{
  uint64_t v6 = HUCCSizeSubclassForModuleViewWidth((uint64_t)a1, a2, a3, a4);
  uint64_t v8 = objc_msgSend_controlCenterLayoutOptionsForViewSize_itemType_(a1, v7, 0, a4, *MEMORY[0x263F1D7C8]);
  uint64_t v10 = objc_msgSend_controlCenterGridLayoutForItemType_sizeSubclass_(a1, v9, 0, v6);
  uint64_t v12 = v11;
  unint64_t v14 = objc_msgSend_numberOfColumns(v8, v11, v13);
  objc_msgSend_preferredSectionHeightForNumberOfServiceRows_spanningColumns_(v8, v15, v10, v14 / (unint64_t)v12);
  double v17 = v16;

  return v17;
}

void sub_240668A30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_240668A4C(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = HFLogForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_240676178(v2);
    }
  }
  return 0;
}

void sub_240668AA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend__configureAndAddRemoteViewController_forHome_(WeakRetained, v5, (uint64_t)v3, *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_2406761BC(v6);
    }
  }
}

void sub_240668CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_240668CF4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend_setTransitionSubviewFrames_(WeakRetained, v4, (uint64_t)v3);
}

void sub_24066912C(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_serviceViewControllerProxy(*(void **)(a1 + 32), a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lockAuthenticationCompleted_(v5, v4, (uint64_t)a2);
}

void sub_240669CFC(uint64_t a1, const char *a2, uint64_t a3)
{
  if (objc_msgSend_isExpanded(*(void **)(a1 + 32), a2, a3)) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  objc_msgSend_smartGridViewController(*(void **)(a1 + 32), v4, v5);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_view(v12, v7, v8);
  objc_msgSend_setAlpha_(v9, v10, v11, v6);
}

uint64_t sub_24066A26C(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F1CB60];
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_24066A314;
  v5[3] = &unk_2650CC370;
  v5[4] = *(void *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_24066A314(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_transitionDeviceCornerRadius(*(void **)(a1 + 32), a2, a3);
  double v5 = v4;
  uint64_t v8 = objc_msgSend_view(*(void **)(a1 + 32), v6, v7);
  uint64_t v11 = objc_msgSend_animationView(v8, v9, v10);
  objc_msgSend__setContinuousCornerRadius_(v11, v12, v13, v5);

  CCUIExpandedModuleContinuousCornerRadius();
  double v15 = v14;
  uint64_t v18 = objc_msgSend_view(*(void **)(a1 + 32), v16, v17);
  double v21 = objc_msgSend_expandedView(v18, v19, v20);
  objc_msgSend__setContinuousCornerRadius_(v21, v22, v23, v15);

  uint64_t v26 = objc_msgSend_dashboardContainerViewController(*(void **)(a1 + 32), v24, v25);
  objc_msgSend_expandedContentFrame(v26, v27, v28);
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  uint64_t v39 = objc_msgSend_view(*(void **)(a1 + 32), v37, v38);
  uint64_t v42 = objc_msgSend_animationView(v39, v40, v41);
  objc_msgSend_setFrame_(v42, v43, v44, v30, v32, v34, v36);

  uint64_t v47 = objc_msgSend_dashboardContainerViewController(*(void **)(a1 + 32), v45, v46);
  objc_msgSend_expandedContentFrame(v47, v48, v49);
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;
  long long v60 = objc_msgSend_view(*(void **)(a1 + 32), v58, v59);
  long long v63 = objc_msgSend_expandedView(v60, v61, v62);
  objc_msgSend_setFrame_(v63, v64, v65, v51, v53, v55, v57);

  long long v68 = objc_msgSend_view(*(void **)(a1 + 32), v66, v67);
  long long v71 = objc_msgSend_expandedView(v68, v69, v70);
  objc_msgSend_setAlpha_(v71, v72, v73, 1.0);

  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v74, v75);
  double v77 = v76;
  double v79 = v78;
  double v81 = v80;
  double v83 = v82;
  double v86 = objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(*(void **)(a1 + 32), v84, v85);
  objc_msgSend_setFrame_(v86, v87, v88, v77, v79, v81, v83);

  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v89, v90);
  double v92 = v91;
  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v93, v94);
  double v96 = v95;
  v99 = objc_msgSend_transitionNavigationHeaderHomeNameLabel(*(void **)(a1 + 32), v97, v98);
  objc_msgSend_setFrame_(v99, v100, v101, 0.0, 0.0, v92, v96);

  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v102, v103);
  double v105 = v104;
  double v107 = v106;
  double v109 = v108;
  double v111 = v110;
  v114 = objc_msgSend_transitionGridCellHomeNameLabelEffectView(*(void **)(a1 + 32), v112, v113);
  objc_msgSend_setFrame_(v114, v115, v116, v105, v107, v109, v111);

  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v117, v118);
  double v120 = v119;
  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v121, v122);
  double v124 = v123;
  v127 = objc_msgSend_transitionGridCellHomeNameLabel(*(void **)(a1 + 32), v125, v126);
  objc_msgSend_setFrame_(v127, v128, v129, 0.0, 0.0, v120, v124);

  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v130, v131);
  double v133 = v132;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v134, v135);
  double v137 = v136;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v138, v139);
  double v141 = v140 + 50.0;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v142, v143);
  double v145 = v144;
  v148 = objc_msgSend_transitionNavigationHeaderRoomNameLabelEffectView(*(void **)(a1 + 32), v146, v147);
  objc_msgSend_setFrame_(v148, v149, v150, v133, v137, v141, v145);

  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v151, v152);
  double v154 = v153 + 50.0;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v155, v156);
  double v158 = v157;
  v161 = objc_msgSend_transitionNavigationHeaderRoomNameLabel(*(void **)(a1 + 32), v159, v160);
  objc_msgSend_setFrame_(v161, v162, v163, 0.0, 0.0, v154, v158);

  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v164, v165);
  double v167 = v166;
  double v169 = v168;
  double v171 = v170;
  double v173 = v172;
  v176 = objc_msgSend_transitionGridCellRoomNameLabelEffectView(*(void **)(a1 + 32), v174, v175);
  objc_msgSend_setFrame_(v176, v177, v178, v167, v169, v171, v173);

  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v179, v180);
  double v182 = v181;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v183, v184);
  double v186 = v185;
  v189 = objc_msgSend_transitionGridCellRoomNameLabel(*(void **)(a1 + 32), v187, v188);
  objc_msgSend_setFrame_(v189, v190, v191, 0.0, 0.0, v182, v186);

  objc_msgSend__iconViewInNavigationHeaderViewFrame(*(void **)(a1 + 32), v192, v193);
  double v195 = v194;
  double v197 = v196;
  double v199 = v198;
  double v201 = v200;
  objc_msgSend_transitionIconView(*(void **)(a1 + 32), v202, v203);
  id v206 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v206, v204, v205, v195, v197, v199, v201);
}

uint64_t sub_24066A724(uint64_t a1, const char *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_24066A7F0;
  v4[3] = &unk_2650CC370;
  uint64_t v5 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_24066ADDC;
  v3[3] = &unk_2650CC320;
  v3[4] = v5;
  return objc_msgSend_animateKeyframesWithDuration_delay_options_animations_completion_(MEMORY[0x263F1CB60], a2, 0, v4, v3, 0.0, 0.0);
}

uint64_t sub_24066A7F0(uint64_t a1, const char *a2)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_24066A93C;
  v8[3] = &unk_2650CC370;
  v8[4] = *(void *)(a1 + 32);
  objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x263F1CB60], a2, (uint64_t)v8, 0.0, 0.0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24066AAA8;
  v7[3] = &unk_2650CC370;
  v7[4] = *(void *)(a1 + 32);
  objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x263F1CB60], v3, (uint64_t)v7, 0.05, 0.2);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_24066AC1C;
  v6[3] = &unk_2650CC370;
  v6[4] = *(void *)(a1 + 32);
  return objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x263F1CB60], v4, (uint64_t)v6, 0.02, 0.1);
}

uint64_t sub_24066A93C(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F1CB60];
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_24066A9E4;
  v5[3] = &unk_2650CC370;
  v5[4] = *(void *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_24066A9E4(uint64_t a1, const char *a2, uint64_t a3)
{
  double v4 = objc_msgSend_view(*(void **)(a1 + 32), a2, a3);
  uint64_t v7 = objc_msgSend_animationView(v4, v5, v6);
  objc_msgSend_setHidden_(v7, v8, 0);

  uint64_t v11 = objc_msgSend_view(*(void **)(a1 + 32), v9, v10);
  double v14 = objc_msgSend_expandedView(v11, v12, v13);
  objc_msgSend_setHidden_(v14, v15, 0);

  objc_msgSend_smartGridViewController(*(void **)(a1 + 32), v16, v17);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = objc_msgSend_homeCell(v22, v18, v19);
  objc_msgSend_setHidden_(v20, v21, 1);
}

uint64_t sub_24066AAA8(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F1CB60];
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_24066AB50;
  v5[3] = &unk_2650CC370;
  v5[4] = *(void *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_24066AB50(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_transitionCompressedViewFrame(*(void **)(a1 + 32), a2, a3);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v14 = objc_msgSend_view(*(void **)(a1 + 32), v12, v13);
  uint64_t v17 = objc_msgSend_compressedView(v14, v15, v16);
  objc_msgSend_setFrame_(v17, v18, v19, v5, v7, v9, v11);

  objc_msgSend_view(*(void **)(a1 + 32), v20, v21);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = objc_msgSend_compressedView(v27, v22, v23);
  objc_msgSend_setAlpha_(v24, v25, v26, 0.0);
}

uint64_t sub_24066AC1C(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F1CB60];
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_24066ACC4;
  v5[3] = &unk_2650CC370;
  v5[4] = *(void *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_24066ACC4(uint64_t a1, const char *a2, uint64_t a3)
{
  double v4 = objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_setAlpha_(v4, v5, v6, 1.0);

  double v9 = objc_msgSend_transitionNavigationHeaderHomeNameLabel(*(void **)(a1 + 32), v7, v8);
  objc_msgSend_setAlpha_(v9, v10, v11, 1.0);

  double v14 = objc_msgSend_transitionGridCellHomeNameLabelEffectView(*(void **)(a1 + 32), v12, v13);
  objc_msgSend_setAlpha_(v14, v15, v16, 0.0);

  uint64_t v19 = objc_msgSend_transitionGridCellHomeNameLabel(*(void **)(a1 + 32), v17, v18);
  objc_msgSend_setAlpha_(v19, v20, v21, 0.0);

  uint64_t v24 = objc_msgSend_transitionNavigationHeaderRoomNameLabelEffectView(*(void **)(a1 + 32), v22, v23);
  objc_msgSend_setAlpha_(v24, v25, v26, 1.0);

  double v29 = objc_msgSend_transitionNavigationHeaderRoomNameLabel(*(void **)(a1 + 32), v27, v28);
  objc_msgSend_setAlpha_(v29, v30, v31, 1.0);

  double v34 = objc_msgSend_transitionGridCellRoomNameLabelEffectView(*(void **)(a1 + 32), v32, v33);
  objc_msgSend_setAlpha_(v34, v35, v36, 0.0);

  objc_msgSend_transitionGridCellRoomNameLabel(*(void **)(a1 + 32), v37, v38);
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v41, v39, v40, 0.0);
}

void sub_24066ADDC(uint64_t a1, const char *a2, uint64_t a3)
{
  double v4 = objc_msgSend_dashboardContainerViewController(*(void **)(a1 + 32), a2, a3);
  uint64_t isExpanded = objc_msgSend_isExpanded(*(void **)(a1 + 32), v5, v6);
  objc_msgSend_willFinishTransition_forCompactModule_(v4, v8, isExpanded, 0);

  if ((objc_msgSend_isAnIPad(MEMORY[0x263F47C58], v9, v10) & 1) == 0)
  {
    CCUIExpandedModuleContinuousCornerRadius();
    double v14 = v13;
    uint64_t v17 = objc_msgSend_view(*(void **)(a1 + 32), v15, v16);
    uint64_t v20 = objc_msgSend_expandedView(v17, v18, v19);
    objc_msgSend__setContinuousCornerRadius_(v20, v21, v22, v14);

    objc_msgSend_transitionDeviceCornerRadius(*(void **)(a1 + 32), v23, v24);
    double v26 = v25;
    double v29 = objc_msgSend_view(*(void **)(a1 + 32), v27, v28);
    double v32 = objc_msgSend_animationView(v29, v30, v31);
    objc_msgSend__setContinuousCornerRadius_(v32, v33, v34, v26);
  }
  double v35 = *MEMORY[0x263F00148];
  double v36 = *(double *)(MEMORY[0x263F00148] + 8);
  uint64_t v37 = objc_msgSend_view(*(void **)(a1 + 32), v11, v12);
  uint64_t v40 = objc_msgSend_compressedView(v37, v38, v39);
  objc_msgSend_setFrameOrigin_(v40, v41, v42, v35, v36);

  uint64_t v45 = objc_msgSend_transitionIconView(*(void **)(a1 + 32), v43, v44);
  objc_msgSend_setHidden_(v45, v46, 1);

  uint64_t v49 = objc_msgSend_transitionGridCellRoomNameLabel(*(void **)(a1 + 32), v47, v48);
  objc_msgSend_setHidden_(v49, v50, 1);

  double v53 = objc_msgSend_transitionGridCellRoomNameLabelEffectView(*(void **)(a1 + 32), v51, v52);
  objc_msgSend_setHidden_(v53, v54, 1);

  double v57 = objc_msgSend_transitionGridCellHomeNameLabel(*(void **)(a1 + 32), v55, v56);
  objc_msgSend_setHidden_(v57, v58, 1);

  long long v61 = objc_msgSend_transitionGridCellHomeNameLabelEffectView(*(void **)(a1 + 32), v59, v60);
  objc_msgSend_setHidden_(v61, v62, 1);

  uint64_t v65 = objc_msgSend_transitionNavigationHeaderRoomNameLabel(*(void **)(a1 + 32), v63, v64);
  objc_msgSend_setHidden_(v65, v66, 1);

  uint64_t v69 = objc_msgSend_transitionNavigationHeaderRoomNameLabelEffectView(*(void **)(a1 + 32), v67, v68);
  objc_msgSend_setHidden_(v69, v70, 1);

  uint64_t v73 = objc_msgSend_transitionNavigationHeaderHomeNameLabel(*(void **)(a1 + 32), v71, v72);
  objc_msgSend_setHidden_(v73, v74, 1);

  objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(*(void **)(a1 + 32), v75, v76);
  id v78 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v78, v77, 1);
}

uint64_t sub_24066B004(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F1CB60];
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_24066B0AC;
  v5[3] = &unk_2650CC370;
  v5[4] = *(void *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_24066B0AC(uint64_t a1, const char *a2, uint64_t a3)
{
  double v4 = objc_msgSend_smartGridViewController(*(void **)(a1 + 32), a2, a3);
  double v7 = objc_msgSend_homeCell(v4, v5, v6);
  objc_msgSend__continuousCornerRadius(v7, v8, v9);
  double v11 = v10;
  double v14 = objc_msgSend_view(*(void **)(a1 + 32), v12, v13);
  uint64_t v17 = objc_msgSend_animationView(v14, v15, v16);
  objc_msgSend__setContinuousCornerRadius_(v17, v18, v19, v11);

  double v20 = *MEMORY[0x263F00148];
  double v21 = *(double *)(MEMORY[0x263F00148] + 8);
  uint64_t v24 = objc_msgSend_view(*(void **)(a1 + 32), v22, v23);
  id v27 = objc_msgSend_compressedView(v24, v25, v26);
  objc_msgSend_setFrameOrigin_(v27, v28, v29, v20, v21);

  double v32 = objc_msgSend_view(*(void **)(a1 + 32), v30, v31);
  double v35 = objc_msgSend_compressedView(v32, v33, v34);
  objc_msgSend_setAlpha_(v35, v36, v37, 1.0);

  uint64_t v40 = objc_msgSend_view(*(void **)(a1 + 32), v38, v39);
  objc_msgSend_compressedAnimationStartFrame(v40, v41, v42);
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v53 = objc_msgSend_view(*(void **)(a1 + 32), v51, v52);
  uint64_t v56 = objc_msgSend_animationView(v53, v54, v55);
  objc_msgSend_setFrame_(v56, v57, v58, v44, v46, v48, v50);

  objc_msgSend__homeNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v59, v60);
  double v62 = v61;
  double v64 = v63;
  double v66 = v65;
  double v68 = v67;
  long long v71 = objc_msgSend_transitionGridCellHomeNameLabelEffectView(*(void **)(a1 + 32), v69, v70);
  objc_msgSend_setFrame_(v71, v72, v73, v62, v64, v66, v68);

  objc_msgSend__homeNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v74, v75);
  double v77 = v76;
  objc_msgSend__homeNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v78, v79);
  double v81 = v80;
  v84 = objc_msgSend_transitionGridCellHomeNameLabel(*(void **)(a1 + 32), v82, v83);
  objc_msgSend_setFrame_(v84, v85, v86, 0.0, 0.0, v77, v81);

  objc_msgSend__homeNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v87, v88);
  double v90 = v89;
  objc_msgSend__homeNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v91, v92);
  double v94 = v93;
  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v95, v96);
  double v98 = v97;
  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v99, v100);
  double v102 = v101;
  double v105 = objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(*(void **)(a1 + 32), v103, v104);
  objc_msgSend_setFrame_(v105, v106, v107, v90, v94, v98, v102);

  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v108, v109);
  double v111 = v110;
  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v112, v113);
  double v115 = v114;
  uint64_t v118 = objc_msgSend_transitionNavigationHeaderHomeNameLabel(*(void **)(a1 + 32), v116, v117);
  objc_msgSend_setFrame_(v118, v119, v120, 0.0, 0.0, v111, v115);

  objc_msgSend__roomNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v121, v122);
  double v124 = v123;
  double v126 = v125;
  double v128 = v127;
  double v130 = v129;
  double v133 = objc_msgSend_transitionGridCellRoomNameLabelEffectView(*(void **)(a1 + 32), v131, v132);
  objc_msgSend_setFrame_(v133, v134, v135, v124, v126, v128, v130);

  objc_msgSend__roomNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v136, v137);
  double v139 = v138;
  objc_msgSend__roomNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v140, v141);
  double v143 = v142;
  v146 = objc_msgSend_transitionGridCellRoomNameLabel(*(void **)(a1 + 32), v144, v145);
  objc_msgSend_setFrame_(v146, v147, v148, 0.0, 0.0, v139, v143);

  objc_msgSend__roomNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v149, v150);
  double v152 = v151;
  objc_msgSend__roomNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v153, v154);
  double v156 = v155;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v157, v158);
  double v160 = v159;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v161, v162);
  double v164 = v163;
  double v167 = objc_msgSend_transitionNavigationHeaderRoomNameLabelEffectView(*(void **)(a1 + 32), v165, v166);
  objc_msgSend_setFrame_(v167, v168, v169, v152, v156, v160, v164);

  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v170, v171);
  double v173 = v172;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v174, v175);
  double v177 = v176;
  uint64_t v180 = objc_msgSend_transitionNavigationHeaderRoomNameLabel(*(void **)(a1 + 32), v178, v179);
  objc_msgSend_setFrame_(v180, v181, v182, 0.0, 0.0, v173, v177);

  objc_msgSend__iconViewInHomeGridCellFrame(*(void **)(a1 + 32), v183, v184);
  double v186 = v185;
  double v188 = v187;
  double v190 = v189;
  double v192 = v191;
  objc_msgSend_transitionIconView(*(void **)(a1 + 32), v193, v194);
  id v197 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v197, v195, v196, v186, v188, v190, v192);
}

uint64_t sub_24066B494(uint64_t a1, const char *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_24066B560;
  v4[3] = &unk_2650CC370;
  uint64_t v5 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_24066BBA4;
  v3[3] = &unk_2650CC320;
  v3[4] = v5;
  return objc_msgSend_animateKeyframesWithDuration_delay_options_animations_completion_(MEMORY[0x263F1CB60], a2, 0, v4, v3, 0.0, 0.0);
}

uint64_t sub_24066B560(uint64_t a1, const char *a2)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_24066B6A8;
  v8[3] = &unk_2650CC370;
  v8[4] = *(void *)(a1 + 32);
  objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x263F1CB60], a2, (uint64_t)v8, 0.0, 0.0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24066B8DC;
  v7[3] = &unk_2650CC370;
  v7[4] = *(void *)(a1 + 32);
  objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x263F1CB60], v3, (uint64_t)v7, 0.0, 0.15);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_24066B9E4;
  v6[3] = &unk_2650CC370;
  v6[4] = *(void *)(a1 + 32);
  return objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x263F1CB60], v4, (uint64_t)v6, 0.3, 0.1);
}

uint64_t sub_24066B6A8(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F1CB60];
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_24066B750;
  v5[3] = &unk_2650CC370;
  v5[4] = *(void *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_24066B750(uint64_t a1, const char *a2, uint64_t a3)
{
  if ((objc_msgSend_isAnIPad(MEMORY[0x263F47C58], a2, a3) & 1) == 0)
  {
    objc_msgSend_transitionDeviceCornerRadius(*(void **)(a1 + 32), v4, v5);
    double v7 = v6;
    double v10 = objc_msgSend_view(*(void **)(a1 + 32), v8, v9);
    uint64_t v13 = objc_msgSend_expandedView(v10, v11, v12);
    objc_msgSend__setContinuousCornerRadius_(v13, v14, v15, v7);
  }
  uint64_t v16 = objc_msgSend_transitionIconView(*(void **)(a1 + 32), v4, v5);
  objc_msgSend_setHidden_(v16, v17, 0);

  double v20 = objc_msgSend_transitionGridCellRoomNameLabel(*(void **)(a1 + 32), v18, v19);
  objc_msgSend_setHidden_(v20, v21, 0);

  uint64_t v24 = objc_msgSend_transitionGridCellRoomNameLabelEffectView(*(void **)(a1 + 32), v22, v23);
  objc_msgSend_setHidden_(v24, v25, 0);

  uint64_t v28 = objc_msgSend_transitionGridCellHomeNameLabel(*(void **)(a1 + 32), v26, v27);
  objc_msgSend_setHidden_(v28, v29, 0);

  double v32 = objc_msgSend_transitionGridCellHomeNameLabelEffectView(*(void **)(a1 + 32), v30, v31);
  objc_msgSend_setHidden_(v32, v33, 0);

  double v36 = objc_msgSend_transitionNavigationHeaderRoomNameLabel(*(void **)(a1 + 32), v34, v35);
  objc_msgSend_setHidden_(v36, v37, 0);

  uint64_t v40 = objc_msgSend_transitionNavigationHeaderRoomNameLabelEffectView(*(void **)(a1 + 32), v38, v39);
  objc_msgSend_setHidden_(v40, v41, 0);

  double v44 = objc_msgSend_transitionNavigationHeaderHomeNameLabel(*(void **)(a1 + 32), v42, v43);
  objc_msgSend_setHidden_(v44, v45, 0);

  objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(*(void **)(a1 + 32), v46, v47);
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v49, v48, 0);
}

uint64_t sub_24066B8DC(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F1CB60];
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_24066B984;
  v5[3] = &unk_2650CC370;
  v5[4] = *(void *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_24066B984(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_view(*(void **)(a1 + 32), a2, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend_expandedView(v8, v3, v4);
  objc_msgSend_setAlpha_(v5, v6, v7, 0.0);
}

uint64_t sub_24066B9E4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F1CB60];
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_24066BA8C;
  v5[3] = &unk_2650CC370;
  v5[4] = *(void *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_24066BA8C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_transitionGridCellHomeNameLabelEffectView(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_setAlpha_(v4, v5, v6, 1.0);

  uint64_t v9 = objc_msgSend_transitionGridCellHomeNameLabel(*(void **)(a1 + 32), v7, v8);
  objc_msgSend_setAlpha_(v9, v10, v11, 1.0);

  double v14 = objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(*(void **)(a1 + 32), v12, v13);
  objc_msgSend_setAlpha_(v14, v15, v16, 0.0);

  uint64_t v19 = objc_msgSend_transitionNavigationHeaderHomeNameLabel(*(void **)(a1 + 32), v17, v18);
  objc_msgSend_setAlpha_(v19, v20, v21, 0.0);

  uint64_t v24 = objc_msgSend_transitionGridCellRoomNameLabelEffectView(*(void **)(a1 + 32), v22, v23);
  objc_msgSend_setAlpha_(v24, v25, v26, 1.0);

  uint64_t v29 = objc_msgSend_transitionGridCellRoomNameLabel(*(void **)(a1 + 32), v27, v28);
  objc_msgSend_setAlpha_(v29, v30, v31, 1.0);

  uint64_t v34 = objc_msgSend_transitionNavigationHeaderRoomNameLabelEffectView(*(void **)(a1 + 32), v32, v33);
  objc_msgSend_setAlpha_(v34, v35, v36, 0.0);

  objc_msgSend_transitionNavigationHeaderRoomNameLabel(*(void **)(a1 + 32), v37, v38);
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v41, v39, v40, 0.0);
}

uint64_t sub_24066BBA4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_dashboardContainerViewController(*(void **)(a1 + 32), a2, a3);
  uint64_t isExpanded = objc_msgSend_isExpanded(*(void **)(a1 + 32), v5, v6);
  objc_msgSend_willFinishTransition_forCompactModule_(v4, v8, isExpanded, 0);

  uint64_t v11 = objc_msgSend_view(*(void **)(a1 + 32), v9, v10);
  double v14 = objc_msgSend_animationView(v11, v12, v13);
  objc_msgSend_setHidden_(v14, v15, 1);

  uint64_t v18 = objc_msgSend_smartGridViewController(*(void **)(a1 + 32), v16, v17);
  uint64_t v21 = objc_msgSend_homeCell(v18, v19, v20);
  objc_msgSend_setHidden_(v21, v22, 0);

  objc_msgSend_setIsTransitioningToHomeControlService_(*(void **)(a1 + 32), v23, 0);
  uint64_t v25 = *(void *)(a1 + 32);

  return MEMORY[0x270F9A6D0](v25, sel__cleanupTransitionSubviews, v24);
}

void sub_24066BDE0(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_24066BE9C;
  v4[3] = &unk_2650CC398;
  objc_copyWeak(&v5, v1);
  objc_msgSend_requestAuthenticationIfLockedWithCompletionHandler_(WeakRetained, v3, (uint64_t)v4);
  objc_destroyWeak(&v5);
}

void sub_24066BE88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_24066BE9C(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend__showLockSecurityView_(WeakRetained, v3, a2 ^ 1u);
}

void sub_24066D910(uint64_t a1, const char *a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    NAEmptyResult();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithResult_(v3, v4, (uint64_t)v6);
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    objc_msgSend_cancel(v5, a2, a3);
  }
}

uint64_t sub_24066DFEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_24066E2D4(uint64_t a1, void *a2, uint64_t a3)
{
  objc_msgSend_hf_characteristicValueManager(a2, (const char *)a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelInFlightReadRequests(v5, v3, v4);
}

void sub_24066E43C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_msgSend_delegate(WeakRetained, v1, v2);
  objc_msgSend_launchHomeAppForSmartGridContentViewController_(v3, v4, (uint64_t)WeakRetained);
}

uint64_t type metadata accessor for HUCCAccessoryControlsContainerViewController()
{
  uint64_t result = qword_268C8D3A8;
  if (!qword_268C8D3A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24066EA90()
{
  return swift_initClassMetadata2();
}

void sub_24066EADC(void *a1, int a2, int a3, void *aBlock)
{
  id v5 = _Block_copy(aBlock);
  if (v5)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    id v5 = sub_24066F19C;
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = a1;
  uint64_t v8 = sub_2406762A8();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = v5;
  void v9[4] = v6;
  aBlocka[4] = sub_24066F0A8;
  aBlocka[5] = v9;
  aBlocka[0] = MEMORY[0x263EF8330];
  aBlocka[1] = 1107296256;
  aBlocka[2] = sub_24066F1A8;
  aBlocka[3] = &unk_26F4C8110;
  uint64_t v10 = _Block_copy(aBlocka);
  swift_retain();
  sub_24066F104((uint64_t)v5);
  swift_release();
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for HUCCAccessoryControlsContainerViewController();
  objc_msgSendSuper2(&v11, sel_dismissViewControllerAnimated_completion_, 0, v10);
  _Block_release(v10);
  swift_release();
  sub_24066F008((uint64_t)v5);
}

void sub_24066EC50(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  if (*(unsigned char *)(v3 + qword_268C8D3A0))
  {
    if (a2) {
      a2();
    }
  }
  else
  {
    *(unsigned char *)(v3 + qword_268C8D3A0) = 1;
    if (a2)
    {
      uint64_t v6 = swift_allocObject();
      *(void *)(v6 + 16) = a2;
      *(void *)(v6 + 24) = a3;
      id v7 = sub_24066F174;
    }
    else
    {
      id v7 = nullsub_1;
      uint64_t v6 = 0;
    }
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    *(void *)(v8 + 24) = v6;
    sub_24066F104((uint64_t)a2);
    sub_240676298();
    swift_release();
  }
}

void sub_24066ED80(void *a1, int a2, uint64_t a3, void *aBlock)
{
  uint64_t v6 = (void (*)(void))_Block_copy(aBlock);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = (void (*)(void))sub_24066F050;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a1;
  sub_24066EC50(a3, v6, v7);
  sub_24066F008((uint64_t)v6);
}

void *sub_24066EE3C(uint64_t a1)
{
  uint64_t v3 = sub_240676278();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = objc_allocWithZone(v1);
  v7[qword_268C8D3A0] = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  id v8 = (void *)sub_240676498();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  id v10 = v8;
  v9(a1, v3);
  if (v8) {

  }
  return v8;
}

id sub_24066EF70(unsigned char *a1, uint64_t a2, uint64_t a3)
{
  a1[qword_268C8D3A0] = 0;
  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for HUCCAccessoryControlsContainerViewController();
  return objc_msgSendSuper2(&v5, sel_initWithCoder_, a3);
}

id sub_24066EFC8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HUCCAccessoryControlsContainerViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24066F000()
{
  return type metadata accessor for HUCCAccessoryControlsContainerViewController();
}

uint64_t sub_24066F008(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24066F018()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24066F050()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_24066F060()
{
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24066F0A8()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 24);
  uint64_t result = sub_2406762C8();
  if (v1) {
    return v1(result);
  }
  return result;
}

uint64_t sub_24066F0EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_24066F0FC()
{
  return swift_release();
}

uint64_t sub_24066F104(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24066F114()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24066F14C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24066F174()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24066F1A8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id HUCCSmartGridViewController.presentAccessoryControls(for:)(void *a1)
{
  uint64_t v2 = v1;
  sub_24066F464(&qword_26AFC7D80);
  MEMORY[0x270FA5388]();
  objc_super v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(v2, sel_unwrappedItemForAccessoryControls_, a1);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = sub_240676568();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = v2;
    v9[3] = v7;
    void v9[4] = a1;
    id v10 = v2;
    id v11 = v7;
    id v12 = a1;
    sub_24066F464(&qword_268C8D498);
    uint64_t v13 = (void *)sub_240676308();
    swift_release();
    sub_240670544((uint64_t)v5, &qword_26AFC7D80);
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v10;
    aBlock[4] = sub_24066FBE4;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24066FF9C;
    aBlock[3] = &unk_26F4C8200;
    uint64_t v15 = _Block_copy(aBlock);
    id v16 = v10;
    swift_release();
    id v17 = objc_msgSend(v13, sel_flatMap_, v15);
    _Block_release(v15);

    return v17;
  }
  else
  {
    id v19 = objc_msgSend(self, sel_futureWithNoResult);
    id v20 = objc_msgSend(v19, sel_asGeneric);

    return v20;
  }
}

uint64_t sub_24066F464(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24066F4A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  return MEMORY[0x270FA2498](sub_24066F4CC, 0, 0);
}

uint64_t sub_24066F4CC()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = (void *)v0[16];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24066F5DC;
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24066F9F4;
  v0[13] = &unk_2650CC500;
  v0[14] = v4;
  objc_msgSend(v3, sel_accessoryControlViewControllerFor_tileItem_completionHandler_, v2, v1, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24066F5DC()
{
  return MEMORY[0x270FA2498](sub_24066F6BC, 0, 0);
}

uint64_t sub_24066F6BC()
{
  if (*(void *)(v0 + 120))
  {
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    uint64_t v3 = sub_2406762B8();
    sub_2406714C0(&qword_268C8D500, MEMORY[0x263F47D40]);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v3 - 8) + 104))(v4, *MEMORY[0x263F47D38], v3);
    swift_willThrow();
    objc_super v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_24066F7FC()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24066F844()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 16);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_24066F8F8;
  *(void *)(v3 + 144) = v2;
  *(_OWORD *)(v3 + 128) = v4;
  return MEMORY[0x270FA2498](sub_24066F4CC, 0, 0);
}

uint64_t sub_24066F8F8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_24066F9F4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(v2 + 64) + 40);
  id v4 = a2;
  sub_240671508((uint64_t)&v6, v3);
  return swift_continuation_resume();
}

id sub_24066FA50(void *a1, void *a2)
{
  sub_24066F464(&qword_26AFC7D80);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F58190]), sel_init);
  uint64_t v7 = sub_240676568();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  sub_240676548();
  id v8 = a2;
  id v9 = a1;
  id v10 = v6;
  uint64_t v11 = sub_240676538();
  id v12 = (void *)swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v8;
  v12[5] = v9;
  v12[6] = v10;
  sub_240671584((uint64_t)v5, (uint64_t)&unk_268C8D4F8, (uint64_t)v12);
  swift_release();
  return v10;
}

uint64_t sub_24066FBAC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_24066FBE4(void *a1)
{
  return sub_24066FA50(a1, *(void **)(v1 + 16));
}

uint64_t sub_24066FBEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[9] = a5;
  v6[10] = a6;
  v6[8] = a4;
  sub_240676548();
  v6[11] = sub_240676538();
  uint64_t v8 = sub_240676528();
  return MEMORY[0x270FA2498](sub_24066FC88, v8, v7);
}

id sub_24066FC88()
{
  uint64_t v1 = (void *)v0[8];
  uint64_t v2 = v0[9];
  swift_release();
  objc_msgSend(v1, sel_configureWithAccessoryControlViewController_, v2);
  id result = objc_msgSend(v1, sel_hu_presentPreloadableViewController_animated_, v2, objc_msgSend(v1, sel_controlsWantSystemPresentationAnimations));
  if (result)
  {
    uint64_t v4 = result;
    id v6 = (void *)v0[9];
    uint64_t v5 = (void *)v0[10];
    uint64_t v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = v7;
    v8[3] = v6;
    v8[4] = v5;
    v0[6] = sub_2406714B4;
    v0[7] = v8;
    v0[2] = MEMORY[0x263EF8330];
    v0[3] = 1107296256;
    v0[4] = sub_24066FF1C;
    v0[5] = &unk_26F4C8368;
    id v9 = _Block_copy(v0 + 2);
    id v10 = v6;
    id v11 = v5;
    swift_release();
    id v12 = objc_msgSend(v4, sel_addCompletionBlock_, v9);
    _Block_release(v9);

    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return (id)v13();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_24066FE3C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v7 = a3 + 16;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x2455F37C0](v7);
  if (v8)
  {
    id v9 = (void *)v8;
    type metadata accessor for HUCCAccessoryControlsContainerViewController();
    uint64_t v10 = swift_dynamicCastClass();
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = a4;
      id v13 = objc_msgSend(v9, sel_delegate);
      if (v13)
      {
        objc_msgSend(v13, sel_willPresentAccessoryControlsViewController_, v11);

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
    objc_msgSend(a5, sel_finishWithNoResult);
  }
}

uint64_t sub_24066FF1C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

id sub_24066FF9C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t sub_240670004(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_240670014()
{
  return swift_release();
}

uint64_t HUCCSmartGridViewController.accessoryControlViewController(for:tileItem:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  sub_24066F464(&qword_268C8D4A8);
  uint64_t v5 = swift_task_alloc();
  void v3[5] = v5;
  uint64_t v6 = sub_240676278();
  v3[6] = v6;
  v3[7] = *(void *)(v6 - 8);
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  v3[11] = sub_240676548();
  v3[12] = sub_240676538();
  sub_2406764A8();
  uint64_t v7 = (void *)swift_task_alloc();
  v3[13] = v7;
  void *v7 = v3;
  v7[1] = sub_2406701FC;
  return MEMORY[0x270F3C488](v5, a1);
}

uint64_t sub_2406701FC()
{
  swift_task_dealloc();
  uint64_t v1 = sub_240676528();
  return MEMORY[0x270FA2498](sub_240670338, v1, v0);
}

uint64_t sub_240670338()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[5];
  swift_release();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_240670544(v0[5], &qword_268C8D4A8);
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = v0[9];
    uint64_t v6 = v0[10];
    uint64_t v8 = v0[7];
    uint64_t v7 = v0[8];
    uint64_t v9 = v0[6];
    uint64_t v11 = (void *)v0[3];
    uint64_t v10 = (void *)v0[4];
    id v12 = (void *)v0[2];
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 32))(v6, v0[5], v9);
    sub_2406764C8();
    swift_allocObject();
    id v13 = v11;
    id v14 = v10;
    sub_2406764B8();
    uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    v15(v5, v6, v9);
    id v16 = objc_allocWithZone((Class)type metadata accessor for HUCCAccessoryControlsContainerViewController());
    v16[qword_268C8D3A0] = 0;
    v15(v7, v5, v9);
    id v17 = v12;
    id v4 = (void *)sub_240676498();
    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    id v19 = v4;
    v18(v5, v9);
    if (v4) {

    }
    v18(v0[10], v0[6]);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v20 = (uint64_t (*)(void *))v0[1];
  return v20(v4);
}

uint64_t sub_240670544(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24066F464(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_240670724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  sub_240676548();
  v4[6] = sub_240676538();
  uint64_t v6 = sub_240676528();
  return MEMORY[0x270FA2498](sub_2406707C0, v6, v5);
}

uint64_t sub_2406707C0()
{
  uint64_t v1 = (void *)v0[5];
  uint64_t v3 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[4];
  id v4 = (void *)v0[2];
  swift_release();
  v0[7] = _Block_copy(v2);
  id v5 = v4;
  id v6 = v3;
  id v7 = v1;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[8] = v8;
  void *v8 = v0;
  v8[1] = sub_24067088C;
  uint64_t v10 = v0[2];
  uint64_t v9 = v0[3];
  return HUCCSmartGridViewController.accessoryControlViewController(for:tileItem:)(v10, v9);
}

uint64_t sub_24067088C(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 56);
  id v4 = *(void **)(*v1 + 40);
  id v5 = *(void **)(*v1 + 24);
  id v6 = *(void **)(*v1 + 16);
  uint64_t v9 = *v1;
  swift_task_dealloc();

  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  id v7 = *(uint64_t (**)(void))(v9 + 8);
  return v7();
}

Swift::Void __swiftcall HUCCSmartGridViewController.willDismiss(viewController:)(UIViewController *viewController)
{
  uint64_t v2 = sub_2406764D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  id v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2406764F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240670CE4();
  uint64_t v10 = (void *)sub_2406765B8();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = viewController;
  *(void *)(v12 + 24) = v11;
  aBlock[4] = sub_240670E68;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24066F1A8;
  aBlock[3] = &unk_26F4C8278;
  id v13 = _Block_copy(aBlock);
  id v14 = viewController;
  swift_release();
  sub_2406764E8();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2406714C0(&qword_268C8D4B8, MEMORY[0x263F8F030]);
  sub_24066F464(&qword_268C8D4C0);
  sub_240670E70();
  sub_240676628();
  MEMORY[0x2455F2E70](0, v9, v5, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_240670CE4()
{
  unint64_t result = qword_268C8D4B0;
  if (!qword_268C8D4B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C8D4B0);
  }
  return result;
}

uint64_t sub_240670D24()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_240670D5C(void *a1, uint64_t a2)
{
  type metadata accessor for HUCCAccessoryControlsContainerViewController();
  uint64_t v4 = swift_dynamicCastClass();
  if (v4)
  {
    uint64_t v5 = v4;
    swift_beginAccess();
    uint64_t v6 = MEMORY[0x2455F37C0](a2 + 16);
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      id v8 = a1;
      id v9 = objc_msgSend(v7, sel_delegate);

      if (v9)
      {
        objc_msgSend(v9, sel_willDismissAccessoryControlsViewController_, v5);

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
  }
}

uint64_t sub_240670E28()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_240670E68()
{
  sub_240670D5C(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_240670E70()
{
  unint64_t result = qword_268C8D4C8;
  if (!qword_268C8D4C8)
  {
    sub_240670ECC(&qword_268C8D4C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C8D4C8);
  }
  return result;
}

uint64_t sub_240670ECC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_240670F7C()
{
  _Block_release(*(const void **)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_240670FCC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_240671580;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_268C8D4D0 + dword_268C8D4D0);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_240671090()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_240671580;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_268C8D618 + dword_268C8D618);
  return v6(v2, v3, v4);
}

uint64_t sub_240671154()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_240671194(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_240671260;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_268C8D620 + dword_268C8D620);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_240671260()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_240671354()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2406713A4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_240671580;
  return sub_24066FBEC(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_24067146C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2406714B4(uint64_t a1, uint64_t a2)
{
  sub_24066FE3C(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t sub_2406714C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_240671508(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24066F464(&qword_268C8D508);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_240671584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_240676568();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_240676558();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2406754EC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_240676528();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t HUCCControlCenterModule.register(for:items:in:currentRegistration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_240671750, 0, 0);
}

uint64_t sub_240671750()
{
  id v1 = objc_msgSend(self, sel_sharedDispatcher);
  id v2 = objc_msgSend(v1, sel_homeManager);

  if (v2)
  {
    sub_240676338();
    v0[7] = sub_240676328();
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((int)*MEMORY[0x263F47820] + MEMORY[0x263F47820]);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[8] = v3;
    void *v3 = v0;
    v3[1] = sub_240671894;
    uint64_t v5 = v0[3];
    uint64_t v4 = v0[4];
    return v8(v5, v4);
  }
  else
  {
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7(0);
  }
}

uint64_t sub_240671894()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_2406719AC, 0, 0);
}

uint64_t sub_2406719AC()
{
  if (v0[5])
  {
    sub_2406763A8();
    swift_unknownObjectRetain();
    uint64_t v1 = swift_dynamicCastClass();
    if (!v1) {
      swift_unknownObjectRelease();
    }
  }
  else
  {
    uint64_t v1 = 0;
  }
  v0[9] = v1;
  id v2 = (void *)swift_task_alloc();
  v0[10] = v2;
  *id v2 = v0;
  v2[1] = sub_240671A94;
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[2];
  return sub_240671BFC(v5, v3, v4, v1);
}

uint64_t sub_240671A94(uint64_t a1)
{
  *(void *)(*(void *)v1 + 88) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_240671B94, 0, 0);
}

uint64_t sub_240671B94()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_release();
  id v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_240671BFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[6] = a4;
  v5[7] = v4;
  v5[4] = a2;
  void v5[5] = a3;
  v5[3] = a1;
  sub_240676358();
  v5[8] = sub_240676348();
  sub_240675604(&qword_268C8D600, MEMORY[0x263F47848]);
  uint64_t v7 = sub_240676528();
  v5[9] = v7;
  v5[10] = v6;
  return MEMORY[0x270FA2498](sub_240671CCC, v7, v6);
}

uint64_t sub_240671CCC()
{
  uint64_t v1 = v0[6];
  if (v1)
  {
    sub_240675C44(0, &qword_268C8D668);
    swift_retain();
    id v2 = (void *)sub_240676398();
    char v3 = sub_2406765E8();

    if (v3)
    {
      uint64_t v4 = v0[3];
      swift_release();
      uint64_t v5 = sub_240676378();
      sub_240674110(v5, v4);
      LOBYTE(v4) = v6;
      swift_bridgeObjectRelease();
      if ((v4 & 1) == 0)
      {
        sub_240672B24(v0[3], v0[4]);
        sub_240676368();
      }
      uint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
      return v7(v1);
    }
    else
    {
      sub_2406763F8();
      v0[11] = sub_2406763E8();
      uint64_t v11 = (void *)swift_task_alloc();
      v0[12] = v11;
      *uint64_t v11 = v0;
      v11[1] = sub_240671ED4;
      return MEMORY[0x270F3A090](v1);
    }
  }
  else
  {
    sub_240676548();
    v0[13] = sub_240676538();
    uint64_t v10 = sub_240676528();
    return MEMORY[0x270FA2498](sub_2406720B4, v10, v9);
  }
}

uint64_t sub_240671ED4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 72);
  return MEMORY[0x270FA2498](sub_240672018, v3, v2);
}

uint64_t sub_240672018()
{
  swift_release();
  sub_240676548();
  *(void *)(v0 + 104) = sub_240676538();
  uint64_t v2 = sub_240676528();
  return MEMORY[0x270FA2498](sub_2406720B4, v2, v1);
}

uint64_t sub_2406720B4()
{
  uint64_t v1 = *(void **)(v0 + 56);
  swift_release();
  id v2 = objc_msgSend(v1, sel_currentContentViewController);
  if (v2)
  {
    uint64_t v3 = v2;
    self;
    uint64_t v4 = (void *)swift_dynamicCastObjCClass();
    if (v4)
    {
      id v5 = objc_msgSend(v4, sel_fullDescription);
      uint64_t v6 = sub_240676508();
      uint64_t v8 = v7;

      goto LABEL_6;
    }
  }
  id v9 = objc_msgSend(*(id *)(v0 + 56), sel_currentContentViewController);
  *(void *)(v0 + 16) = v9;
  sub_24066F464(&qword_268C8D660);
  uint64_t v6 = sub_2406765F8();
  uint64_t v8 = v10;

LABEL_6:
  *(void *)(v0 + 112) = v8;
  *(void *)(v0 + 120) = v6;
  uint64_t v11 = *(void *)(v0 + 72);
  uint64_t v12 = *(void *)(v0 + 80);
  return MEMORY[0x270FA2498](sub_2406721D4, v11, v12);
}

uint64_t sub_2406721D4()
{
  uint64_t v1 = v0[4];
  id v2 = (void *)v0[5];
  uint64_t v3 = v0[3];
  sub_2406763A8();
  swift_allocObject();
  id v4 = v2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_240676388();
  v0[16] = v5;
  sub_240672B24(v3, v1);
  sub_2406763F8();
  v0[17] = sub_2406763E8();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[18] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2406722F0;
  return MEMORY[0x270F3A088](v5);
}

uint64_t sub_2406722F0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 72);
  return MEMORY[0x270FA2498](sub_240672434, v3, v2);
}

uint64_t sub_240672434()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24067263C(int a1, int a2, void *a3, uint64_t a4, void *aBlock, void *a6)
{
  v6[3] = a4;
  v6[4] = a6;
  v6[2] = a3;
  void v6[5] = _Block_copy(aBlock);
  sub_240675C44(0, &qword_268C8D5E0);
  sub_24067573C(&qword_268C8D5E8, &qword_268C8D5E0);
  uint64_t v10 = sub_240676588();
  v6[6] = v10;
  sub_240675C44(0, &qword_268C8D5C0);
  sub_24067573C(&qword_268C8D5C8, &qword_268C8D5C0);
  uint64_t v11 = sub_240676588();
  v6[7] = v11;
  id v12 = a3;
  swift_unknownObjectRetain();
  id v13 = a6;
  uint64_t v14 = (void *)swift_task_alloc();
  v6[8] = v14;
  *uint64_t v14 = v6;
  v14[5] = a4;
  v14[6] = v13;
  v14[3] = v11;
  v14[4] = v12;
  v14[1] = sub_240672808;
  v14[2] = v10;
  return MEMORY[0x270FA2498](sub_240671750, 0, 0);
}

uint64_t sub_240672808(uint64_t a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 40);
  uint64_t v4 = *(void **)(*v1 + 32);
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v8 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  v3[2](v3, a1);
  _Block_release(v3);
  swift_unknownObjectRelease();
  uint64_t v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

uint64_t sub_2406729D8()
{
  return MEMORY[0x270FA2498](sub_2406729F4, 0, 0);
}

uint64_t sub_2406729F4()
{
  sub_240676338();
  *(void *)(v0 + 16) = sub_240676328();
  sub_240675604(&qword_268C8D658, MEMORY[0x263F47828]);
  uint64_t v2 = sub_240676528();
  return MEMORY[0x270FA2498](sub_240672AB8, v2, v1);
}

uint64_t sub_240672AB8()
{
  sub_240676318();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_240672B24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_240676418();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0xC000000000000001) != 0 && sub_240676648() < 0)
  {
    sub_2406766A8();
    __break(1u);
  }
  sub_240672CC0(a2);
  sub_240676408();
  sub_240675604(&qword_268C8D670, MEMORY[0x263F49AA8]);
  sub_240676288();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_240672CC0(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_240676638();
    sub_240675C44(0, &qword_268C8D5C0);
    sub_24067573C(&qword_268C8D5C8, &qword_268C8D5C0);
    sub_240676598();
    uint64_t v1 = v18;
    uint64_t v17 = v19;
    uint64_t v2 = v20;
    uint64_t v3 = v21;
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
    uint64_t v3 = 0;
  }
  int64_t v16 = (unint64_t)(v2 + 64) >> 6;
  while (1)
  {
    uint64_t v12 = v3;
    if ((v1 & 0x8000000000000000) == 0) {
      break;
    }
    if (!sub_240676668()) {
      goto LABEL_31;
    }
    sub_240675C44(0, &qword_268C8D5C0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v10 = v23;
    swift_unknownObjectRelease();
    if (!v23) {
      goto LABEL_31;
    }
LABEL_10:
    self;
    uint64_t v11 = swift_dynamicCastObjCClass();

    if (v11) {
      goto LABEL_31;
    }
  }
  if (v4)
  {
    unint64_t v8 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    unint64_t v9 = v8 | (v3 << 6);
LABEL_9:
    id v10 = *(id *)(*(void *)(v1 + 48) + 8 * v9);
    if (!v10) {
      goto LABEL_31;
    }
    goto LABEL_10;
  }
  int64_t v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v16) {
      goto LABEL_31;
    }
    unint64_t v14 = *(void *)(v17 + 8 * v13);
    ++v3;
    if (!v14)
    {
      uint64_t v3 = v12 + 2;
      if (v12 + 2 >= v16) {
        goto LABEL_31;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v3);
      if (!v14)
      {
        uint64_t v3 = v12 + 3;
        if (v12 + 3 >= v16) {
          goto LABEL_31;
        }
        unint64_t v14 = *(void *)(v17 + 8 * v3);
        if (!v14)
        {
          uint64_t v3 = v12 + 4;
          if (v12 + 4 >= v16) {
            goto LABEL_31;
          }
          unint64_t v14 = *(void *)(v17 + 8 * v3);
          if (!v14)
          {
            uint64_t v3 = v12 + 5;
            if (v12 + 5 >= v16) {
              goto LABEL_31;
            }
            unint64_t v14 = *(void *)(v17 + 8 * v3);
            if (!v14)
            {
              uint64_t v15 = v12 + 6;
              while (v16 != v15)
              {
                unint64_t v14 = *(void *)(v17 + 8 * v15++);
                if (v14)
                {
                  uint64_t v3 = v15 - 1;
                  goto LABEL_28;
                }
              }
LABEL_31:
              sub_240675C80();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    unint64_t v4 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v3 << 6);
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t sub_240672FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_240672FF8, 0, 0);
}

uint64_t sub_240672FF8()
{
  *(void *)(v0 + 24) = sub_2406763F8();
  sub_240676358();
  *(void *)(v0 + 32) = sub_240676348();
  sub_240675604(&qword_268C8D600, MEMORY[0x263F47848]);
  uint64_t v2 = sub_240676528();
  return MEMORY[0x270FA2498](sub_2406730C8, v2, v1);
}

uint64_t sub_2406730C8()
{
  swift_release();
  v0[5] = sub_2406763E8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[6] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_240673174;
  uint64_t v2 = v0[2];
  return MEMORY[0x270F3A090](v2);
}

uint64_t sub_240673174()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24067353C()
{
  sub_24066F464(&qword_26AFC7D80);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_240676568();
  uint64_t v4 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v0;
  int v6 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  id v7 = v0;
  if (v6 == 1)
  {
    sub_2406754EC((uint64_t)v2);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    sub_240676558();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    if (v5[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_240676528();
      uint64_t v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = &unk_268C8D5A0;
  *(void *)(v11 + 24) = v5;
  if (v9 | v8)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v8;
    v13[3] = v9;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_240673774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_240673794, 0, 0);
}

uint64_t sub_240673794()
{
  sub_240676448();
  *(void *)(v0 + 24) = sub_240676428();
  *(void *)(v0 + 32) = sub_24067573C(&qword_26AFC7D88, (unint64_t *)&unk_26AFC7D90);
  sub_240675604((unint64_t *)&unk_26AFC7D70, MEMORY[0x263F49AB0]);
  uint64_t v2 = sub_240676528();
  return MEMORY[0x270FA2498](sub_24067388C, v2, v1);
}

uint64_t sub_24067388C()
{
  sub_240676438();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t HUCCControlCenterModule.configuration.getter(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  v2[6] = swift_getObjectType();
  uint64_t v3 = sub_2406762F8();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_240673A0C, 0, 0);
}

uint64_t sub_240673A0C()
{
  id v1 = objc_msgSend(*(id *)(v0 + 40), sel_currentContentViewController);
  *(void *)(v0 + 80) = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    self;
    uint64_t v3 = swift_dynamicCastObjCClass();
    *(void *)(v0 + 88) = v3;
    if (v3)
    {
      *(void *)(v0 + 96) = sub_240676548();
      id v4 = v2;
      *(void *)(v0 + 104) = sub_240676538();
      uint64_t v6 = sub_240676528();
      return MEMORY[0x270FA2498](sub_240673B6C, v6, v5);
    }
  }
  uint64_t v7 = *(void *)(v0 + 32);
  uint64_t v8 = sub_240676478();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_240673B6C()
{
  id v1 = (void *)v0[10];
  uint64_t v2 = (void *)v0[11];
  swift_release();
  v0[14] = objc_msgSend(v2, sel_itemManager);

  return MEMORY[0x270FA2498](sub_240673BF8, 0, 0);
}

uint64_t sub_240673BF8()
{
  uint64_t v28 = v0;
  id v1 = *(void **)(v0 + 112);
  sub_240676468();
  uint64_t v2 = swift_dynamicCastClass();
  *(void *)(v0 + 120) = v2;
  if (v2)
  {
    id v3 = v1;
    *(void *)(v0 + 128) = sub_240676538();
    uint64_t v5 = sub_240676528();
    return MEMORY[0x270FA2498](sub_240673F4C, v5, v4);
  }
  else
  {
    sub_2406762D8();
    id v6 = v1;
    uint64_t v7 = sub_2406762E8();
    os_log_type_t v8 = sub_2406765A8();
    BOOL v9 = os_log_type_enabled(v7, v8);
    uint64_t v10 = *(void **)(v0 + 112);
    uint64_t v11 = *(void *)(v0 + 72);
    uint64_t v12 = *(void *)(v0 + 56);
    uint64_t v13 = *(void *)(v0 + 64);
    if (v9)
    {
      uint64_t v26 = *(void *)(v0 + 72);
      uint64_t v24 = *(void **)(v0 + 80);
      uint64_t v25 = *(void *)(v0 + 56);
      uint64_t v14 = swift_slowAlloc();
      unint64_t v22 = (void *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v27 = v23;
      *(_DWORD *)uint64_t v14 = 136315394;
      uint64_t v15 = sub_2406766C8();
      *(void *)(v0 + 16) = sub_240674B88(v15, v16, &v27);
      sub_240676608();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2112;
      *(void *)(v0 + 24) = v10;
      id v17 = v10;
      sub_240676608();
      *unint64_t v22 = v10;

      _os_log_impl(&dword_24065C000, v7, v8, "%s: Failed to unwrap item manager to ControlCenterModuleItemManager: %@", (uint8_t *)v14, 0x16u);
      sub_24066F464((uint64_t *)&unk_268C8D588);
      swift_arrayDestroy();
      MEMORY[0x2455F3710](v22, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2455F3710](v23, -1, -1);
      MEMORY[0x2455F3710](v14, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v26, v25);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
    uint64_t v18 = *(void *)(v0 + 32);
    uint64_t v19 = sub_240676478();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
    swift_task_dealloc();
    uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
    return v20();
  }
}

uint64_t sub_240673F4C()
{
  swift_release();
  sub_240676458();
  return MEMORY[0x270FA2498](sub_240673FC0, 0, 0);
}

uint64_t sub_240673FC0()
{
  uint64_t v1 = *(void **)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 32);

  uint64_t v3 = sub_240676478();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 0, 1, v3);
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_240674078(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_240671580;
  return HUCCControlCenterModule.configuration.getter(a1);
}

void sub_240674110(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0) {
      uint64_t v5 = a1;
    }
    else {
      uint64_t v5 = a1 & 0xFFFFFFFFFFFFFF8;
    }
    if (v4)
    {
      if (a2 < 0) {
        uint64_t v6 = a2;
      }
      else {
        uint64_t v6 = a2 & 0xFFFFFFFFFFFFFF8;
      }
      goto LABEL_57;
    }
    uint64_t v7 = v5;
    uint64_t v8 = a2;
    goto LABEL_18;
  }
  if (v4)
  {
    if (a2 < 0) {
      uint64_t v7 = a2;
    }
    else {
      uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t v8 = a1;
LABEL_18:
    sub_240674448(v7, v8);
    return;
  }
  if (a1 == a2 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  uint64_t v28 = a1 + 56;
  uint64_t v9 = 1 << *(unsigned char *)(a1 + 32);
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(a1 + 56);
  uint64_t v6 = sub_240675C44(0, &qword_268C8D5E0);
  int64_t v12 = 0;
  int64_t v29 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = a2 + 56;
  while (1)
  {
    if (v11)
    {
      unint64_t v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_46;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_56;
    }
    if (v16 >= v29) {
      return;
    }
    unint64_t v17 = *(void *)(v28 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v29) {
        return;
      }
      unint64_t v17 = *(void *)(v28 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v29) {
          return;
        }
        unint64_t v17 = *(void *)(v28 + 8 * v12);
        if (!v17)
        {
          int64_t v12 = v16 + 3;
          if (v16 + 3 >= v29) {
            return;
          }
          unint64_t v17 = *(void *)(v28 + 8 * v12);
          if (!v17) {
            break;
          }
        }
      }
    }
LABEL_45:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_46:
    id v19 = *(id *)(*(void *)(a1 + 48) + 8 * v15);
    uint64_t v20 = sub_2406765D8();
    uint64_t v21 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v22 = v20 & ~v21;
    if (((*(void *)(v13 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
      goto LABEL_53;
    }
    int64_t v30 = v12;
    id v23 = *(id *)(*(void *)(a2 + 48) + 8 * v22);
    char v24 = sub_2406765E8();

    if ((v24 & 1) == 0)
    {
      uint64_t v25 = ~v21;
      while (1)
      {
        unint64_t v22 = (v22 + 1) & v25;
        if (((*(void *)(v13 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
          break;
        }
        id v26 = *(id *)(*(void *)(a2 + 48) + 8 * v22);
        char v27 = sub_2406765E8();

        if (v27) {
          goto LABEL_27;
        }
      }
LABEL_53:

      return;
    }
LABEL_27:

    int64_t v12 = v30;
  }
  int64_t v18 = v16 + 4;
  if (v18 >= v29) {
    return;
  }
  unint64_t v17 = *(void *)(v28 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_45;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v29) {
      return;
    }
    unint64_t v17 = *(void *)(v28 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_45;
    }
  }
LABEL_56:
  __break(1u);
LABEL_57:
  MEMORY[0x270F9E868](v6, v5);
}

void sub_240674448(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3 != sub_240676648()) {
    return;
  }
  int64_t v4 = 0;
  uint64_t v5 = a2 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a2 + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    unint64_t v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v11 = v10 | (v4 << 6);
LABEL_6:
    id v12 = *(id *)(*(void *)(a2 + 48) + 8 * v11);
    char v13 = sub_240676678();

    if ((v13 & 1) == 0) {
      return;
    }
  }
  int64_t v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v14 >= v9) {
    return;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v14);
  ++v4;
  if (v15) {
    goto LABEL_19;
  }
  int64_t v4 = v14 + 1;
  if (v14 + 1 >= v9) {
    return;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v4);
  if (v15)
  {
LABEL_19:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v4 << 6);
    goto LABEL_6;
  }
  int64_t v16 = v14 + 2;
  if (v16 >= v9) {
    return;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v16);
  if (v15)
  {
    int64_t v4 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v4 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v4 >= v9) {
      return;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v4);
    ++v16;
    if (v15) {
      goto LABEL_19;
    }
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_24067459C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  int64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_240674678;
  return v6(a1);
}

uint64_t sub_240674678()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_240674770(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_240671580;
  return v6();
}

uint64_t sub_24067483C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_240671580;
  return v7();
}

uint64_t sub_240674908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_240676568();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_240676558();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2406754EC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_240676528();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_240674AAC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_240675C94;
  return v6(a1);
}

uint64_t sub_240674B88(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_240674C5C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_240675B08((uint64_t)v12, *a3);
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
      sub_240675B08((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_240675AB8((uint64_t)v12);
  return v7;
}

uint64_t sub_240674C5C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_240676618();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_240674E18(a5, a6);
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
  uint64_t v8 = sub_240676698();
  if (!v8)
  {
    sub_2406766A8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2406766B8();
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

uint64_t sub_240674E18(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_240674EB0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_240675090(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_240675090(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_240674EB0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_240675028(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_240676688();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2406766A8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_240676518();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2406766B8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2406766A8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_240675028(uint64_t a1, uint64_t a2)
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
  sub_24066F464(&qword_268C8D638);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_240675090(char a1, int64_t a2, char a3, char *a4)
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
    sub_24066F464(&qword_268C8D638);
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
  char v13 = a4 + 32;
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
  uint64_t result = sub_2406766B8();
  __break(1u);
  return result;
}

uint64_t _sSo23HUCCControlCenterModuleC011HomeControlbC0E22resetFetchedMediaItemsyyF_0()
{
  sub_24066F464(&qword_26AFC7D80);
  MEMORY[0x270FA5388]();
  uint64_t v1 = (char *)v10 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_240676568();
  uint64_t v3 = *(void *)(v2 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_2406754EC((uint64_t)v1);
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    sub_240676558();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v1, v2);
    if (*(void *)(v4 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v5 = sub_240676528();
      uint64_t v6 = v7;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
    }
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = &unk_268C8D648;
  *(void *)(v8 + 24) = v4;
  if (v6 | v5)
  {
    v10[0] = 0;
    v10[1] = 0;
    v10[2] = v5;
    v10[3] = v6;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_240675404()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_240675444()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_240671580;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_240673794, 0, 0);
}

uint64_t sub_2406754EC(uint64_t a1)
{
  uint64_t v2 = sub_24066F464(&qword_26AFC7D80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24067554C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_240671580;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268C8D5A8 + dword_268C8D5A8);
  return v6(a1, v4);
}

uint64_t sub_240675604(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24067564C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_240675684(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_240671260;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268C8D5A8 + dword_268C8D5A8);
  return v6(a1, v4);
}

uint64_t sub_24067573C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_240675C44(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_240675780()
{
  unint64_t result = qword_268C8D5D8;
  if (!qword_268C8D5D8)
  {
    sub_240670ECC(&qword_268C8D5D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C8D5D8);
  }
  return result;
}

uint64_t sub_2406757DC()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24067581C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_240671580;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_240672FF8, 0, 0);
}

uint64_t sub_2406758C4()
{
  swift_unknownObjectRelease();
  _Block_release(*(const void **)(v0 + 48));

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_240675924()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = v0[5];
  uint64_t v7 = (void *)v0[6];
  uint64_t v6 = (void *)v0[7];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  void *v8 = v1;
  v8[1] = sub_240671580;
  int64_t v9 = (uint64_t (*)(int, int, void *, uint64_t, void *, void *))((char *)&dword_268C8D608 + dword_268C8D608);
  return v9(v2, v3, v4, v5, v7, v6);
}

uint64_t sub_240675A00(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_240671580;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268C8D628 + dword_268C8D628);
  return v6(a1, v4);
}

uint64_t sub_240675AB8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_240675B08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_240675B68()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_240675BA0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_240671580;
  return MEMORY[0x270FA2498](sub_2406729F4, 0, 0);
}

uint64_t sub_240675C44(uint64_t a1, unint64_t *a2)
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

uint64_t sub_240675C80()
{
  return swift_release();
}

uint64_t sub_240675C98()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_240675CCC(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24065C000, a2, OS_LOG_TYPE_ERROR, "%@: No items to display", (uint8_t *)&v2, 0xCu);
}

void sub_240675D44(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_24065C000, log, OS_LOG_TYPE_ERROR, ")", buf, 2u);
}

void sub_240675D84(uint64_t a1, uint64_t a2)
{
  int v2 = (void *)sub_240665D78(a1, a2);
  uint64_t v5 = objc_msgSend_groupIdentifier(v2, v3, v4);
  sub_240665D98((uint64_t)v5, 5.7779e-34);
  sub_240665D58(&dword_24065C000, v6, v7, "%@: (");
}

void sub_240675DDC()
{
  sub_240665D8C();
  sub_240665D3C(&dword_24065C000, v0, v1, "), initial state:", v2, v3, v4, v5, v6);
}

void sub_240675E10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)sub_240665D78(a1, a2);
  uint64_t v5 = objc_msgSend_operationDescription(v2, v3, v4);
  sub_240665D98((uint64_t)v5, 5.7779e-34);
  sub_240665D58(&dword_24065C000, v6, v7, "  %@");
}

void sub_240675E68()
{
  sub_240665D8C();
  sub_240665D3C(&dword_24065C000, v0, v1, "Triggered by item updates: (", v2, v3, v4, v5, v6);
}

void sub_240675E9C()
{
  sub_240665D8C();
  sub_240665D3C(&dword_24065C000, v0, v1, ")", v2, v3, v4, v5, v6);
}

void sub_240675ED0()
{
  sub_240665D8C();
  _os_log_fault_impl(&dword_24065C000, v0, OS_LOG_TYPE_FAULT, "ERROR: Inconsistencies detected between item manager state and collection view state! This is bad. Asserts: (", v1, 2u);
}

void sub_240675F10(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_itemManager(*(void **)(a1 + 32), a2, a3);
  uint64_t v8 = objc_msgSend_itemManager(*(void **)(a1 + 32), v6, v7);
  int v11 = 138412546;
  uint64_t v12 = v5;
  __int16 v13 = 2048;
  uint64_t v14 = objc_msgSend_numberOfSections(v8, v9, v10);
  _os_log_error_impl(&dword_24065C000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Item manager: %@ believes there are %lu sections", (uint8_t *)&v11, 0x16u);
}

void sub_240675FDC()
{
  sub_240665D8C();
  sub_240665D3C(&dword_24065C000, v0, v1, "The update request contains:", v2, v3, v4, v5, v6);
}

void sub_240676010(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_isMainThread(MEMORY[0x263F08B88], a2, a3);
  sub_240665DA4(&dword_24065C000, v3, v4, "Is Main thread: %@", v5, v6, v7, v8, 2u);
}

void sub_2406760AC(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_itemType(*(void **)(a1 + 32), a2, a3);
  sub_240665DA4(&dword_24065C000, v3, v4, "Control Center mode: %@", v5, v6, v7, v8, 2u);
}

void sub_240676144()
{
  sub_240665D8C();
  sub_240665D3C(&dword_24065C000, v0, v1, "Error: we're processing an update request with no insertions while the collection view says it has 0 sections before the update. UIKit will assert next.", v2, v3, v4, v5, v6);
}

void sub_240676178(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_24065C000, log, OS_LOG_TYPE_ERROR, "Timeout trying to load Remote Dashboard View Controller", v1, 2u);
}

void sub_2406761BC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_24065C000, log, OS_LOG_TYPE_ERROR, "Unable to load Remote Dashboard View Controller", v1, 2u);
}

void sub_240676200(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24065C000, a2, OS_LOG_TYPE_ERROR, "Remote Dashboard View Controller View Service terminated  (error: %@)", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_240676278()
{
  return MEMORY[0x270F3A128]();
}

uint64_t sub_240676288()
{
  return MEMORY[0x270F3AD80]();
}

uint64_t sub_240676298()
{
  return MEMORY[0x270F3A130]();
}

uint64_t sub_2406762A8()
{
  return MEMORY[0x270F3A138]();
}

uint64_t sub_2406762B8()
{
  return MEMORY[0x270F3A140]();
}

uint64_t sub_2406762C8()
{
  return MEMORY[0x270F3A148]();
}

uint64_t sub_2406762D8()
{
  return MEMORY[0x270F3C440]();
}

uint64_t sub_2406762E8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2406762F8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_240676308()
{
  return MEMORY[0x270F39FF8]();
}

uint64_t sub_240676318()
{
  return MEMORY[0x270F3A000]();
}

uint64_t sub_240676328()
{
  return MEMORY[0x270F3A008]();
}

uint64_t sub_240676338()
{
  return MEMORY[0x270F3A010]();
}

uint64_t sub_240676348()
{
  return MEMORY[0x270F3A048]();
}

uint64_t sub_240676358()
{
  return MEMORY[0x270F3A050]();
}

uint64_t sub_240676368()
{
  return MEMORY[0x270F3A058]();
}

uint64_t sub_240676378()
{
  return MEMORY[0x270F3A060]();
}

uint64_t sub_240676388()
{
  return MEMORY[0x270F3A068]();
}

uint64_t sub_240676398()
{
  return MEMORY[0x270F3A070]();
}

uint64_t sub_2406763A8()
{
  return MEMORY[0x270F3A078]();
}

uint64_t sub_2406763B8()
{
  return MEMORY[0x270F3A080]();
}

uint64_t sub_2406763E8()
{
  return MEMORY[0x270F3A098]();
}

uint64_t sub_2406763F8()
{
  return MEMORY[0x270F3A0A0]();
}

uint64_t sub_240676408()
{
  return MEMORY[0x270F3C448]();
}

uint64_t sub_240676418()
{
  return MEMORY[0x270F3C450]();
}

uint64_t sub_240676428()
{
  return MEMORY[0x270F3C458]();
}

uint64_t sub_240676438()
{
  return MEMORY[0x270F3C460]();
}

uint64_t sub_240676448()
{
  return MEMORY[0x270F3C468]();
}

uint64_t sub_240676458()
{
  return MEMORY[0x270F3C470]();
}

uint64_t sub_240676468()
{
  return MEMORY[0x270F3C478]();
}

uint64_t sub_240676478()
{
  return MEMORY[0x270F3C480]();
}

uint64_t sub_240676498()
{
  return MEMORY[0x270F3C490]();
}

uint64_t sub_2406764A8()
{
  return MEMORY[0x270F3C498]();
}

uint64_t sub_2406764B8()
{
  return MEMORY[0x270F3C4A0]();
}

uint64_t sub_2406764C8()
{
  return MEMORY[0x270F3C4A8]();
}

uint64_t sub_2406764D8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2406764E8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2406764F8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_240676508()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_240676518()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_240676528()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_240676538()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_240676548()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_240676558()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_240676568()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_240676578()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_240676588()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_240676598()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_2406765A8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2406765B8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2406765C8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2406765D8()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_2406765E8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2406765F8()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_240676608()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_240676618()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_240676628()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_240676638()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_240676648()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_240676668()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_240676678()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_240676688()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_240676698()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2406766A8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2406766B8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2406766C8()
{
  return MEMORY[0x270FA0128]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x270EFB7B0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CCUICompactModuleContinuousCornerRadius()
{
  return MEMORY[0x270F18830]();
}

uint64_t CCUIDefaultExpandedContentModuleWidth()
{
  return MEMORY[0x270F18840]();
}

uint64_t CCUIExpandedModuleContinuousCornerRadius()
{
  return MEMORY[0x270F18850]();
}

uint64_t CCUIExpandedModuleEdgeInsets()
{
  return MEMORY[0x270F18858]();
}

uint64_t CCUIIsPortrait()
{
  return MEMORY[0x270F18860]();
}

uint64_t CCUIItemEdgeSize()
{
  return MEMORY[0x270F18868]();
}

uint64_t CCUIMaximumExpandedContentModuleHeight()
{
  return MEMORY[0x270F18880]();
}

uint64_t CCUIScreenBounds()
{
  return MEMORY[0x270F188A0]();
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

uint64_t HFLogForCategory()
{
  return MEMORY[0x270F3A108]();
}

uint64_t HUDefaultSizeForIconSize()
{
  return MEMORY[0x270F3C4E0]();
}

uint64_t HULocalizedBiometryString()
{
  return MEMORY[0x270F3C4C0]();
}

uint64_t HULocalizedModelString()
{
  return MEMORY[0x270F3C4C8]();
}

uint64_t HUViewSizeSubclassForViewSize()
{
  return MEMORY[0x270F3C4D8]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x270F95FD0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

uint64_t NAEmptyResult()
{
  return MEMORY[0x270F4DC60]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F05F20]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

void objc_enumerationMutation(id obj)
{
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}