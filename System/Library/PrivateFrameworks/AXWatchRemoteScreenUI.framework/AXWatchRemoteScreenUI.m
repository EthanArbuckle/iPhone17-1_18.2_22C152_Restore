void *__getAXWatchRemoteScreenIsPairedGizmoHasStingSupportSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *result;
  void v5[6];
  long long v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __AXWatchRemoteScreenServicesLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    v6 = xmmword_2649099F0;
    v7 = 0;
    AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v3 = (void *)v5[0];
    v2 = (void *)AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary;
    if (AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary;
LABEL_5:
  result = dlsym(v2, "AXWatchRemoteScreenIsPairedGizmoHasStingSupport");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXWatchRemoteScreenIsPairedGizmoHasStingSupportSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

uint64_t __AXWatchRemoteScreenServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary = result;
  return result;
}

double AXCSLUIKitSceneMetricsSystemMinimumMargin()
{
  return 0.0;
}

void AXWatchRemoteScreenBannerView(void *a1, void *a2, void *a3, double a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  NSClassFromString(&cfstr_Uiview.isa);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v10 = (void *)getAXUIBannerPresenterClass_softClass;
    uint64_t v19 = getAXUIBannerPresenterClass_softClass;
    if (!getAXUIBannerPresenterClass_softClass)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __getAXUIBannerPresenterClass_block_invoke;
      v15[3] = &unk_2649099D0;
      v15[4] = &v16;
      __getAXUIBannerPresenterClass_block_invoke((uint64_t)v15);
      v10 = (void *)v17[3];
    }
    v11 = v10;
    _Block_object_dispose(&v16, 8);
    v12 = (void *)[[v11 alloc] initWithContainingView:v7];
    v13 = [v12 containingView];
    v14 = [v13 layer];
    AXWatchRemoteScreenRemoveLayerFromAirplay(v14);

    [v12 presentBannerViewWithText:v8 secondaryText:v9 duration:0 fromUserAction:a4];
  }
}

void sub_22C04D7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AXWatchRemoteScreenRemoveLayerFromAirplay(void *a1)
{
  id v1 = a1;
  objc_msgSend(v1, "setDisableUpdateMask:", objc_msgSend(v1, "disableUpdateMask") | 0x10);
}

Class __getAXUIBannerPresenterClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AccessibilityUIUtilitiesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264909A28;
    uint64_t v6 = 0;
    AccessibilityUIUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("AXUIBannerPresenter");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getAXUIBannerPresenterClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAXUIBannerPresenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUIUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUIUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

id getAPRKStreamRenderingManagerClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getAPRKStreamRenderingManagerClass_softClass;
  uint64_t v7 = getAPRKStreamRenderingManagerClass_softClass;
  if (!getAPRKStreamRenderingManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAPRKStreamRenderingManagerClass_block_invoke;
    v3[3] = &unk_2649099D0;
    v3[4] = &v4;
    __getAPRKStreamRenderingManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_22C04DC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAPRKStreamRenderingManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AirPlayReceiverKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __AirPlayReceiverKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264909A60;
    uint64_t v5 = 0;
    AirPlayReceiverKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AirPlayReceiverKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getAPRKStreamRenderingManagerClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("APRKStreamRenderingManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getAPRKStreamRenderingManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AirPlayReceiverKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AirPlayReceiverKitLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_22C04E6E8()
{
  id v0 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x263F835E0]);
  id v1 = objc_msgSend(v0, sel_fontDescriptorWithSymbolicTraits_, objc_msgSend(v0, sel_symbolicTraits) | 0x8002);

  if (v1)
  {

    id v2 = objc_allocWithZone(MEMORY[0x263F828E0]);
    id v3 = v1;
    id v4 = objc_msgSend(v2, sel_init);
    sub_22C06CB70();
    uint64_t v5 = (void *)sub_22C06CAF0();
    MEMORY[0x230F5CC20]();
    uint64_t v7 = v6;

    if (v7)
    {
      id v8 = (void *)sub_22C06CCC0();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v8 = 0;
    }
    objc_msgSend(v4, sel_setText_, v8);

    objc_msgSend(v4, sel_setTextAlignment_, 1);
    objc_msgSend(v3, sel_pointSize);
    id v10 = objc_msgSend(self, sel_fontWithDescriptor_size_, v3, v9);

    objc_msgSend(v4, sel_setFont_, v10);
    objc_msgSend(v4, sel_setNumberOfLines_, 0);
    objc_msgSend(v4, sel_setAccessibilityTraits_, *MEMORY[0x263F83268]);
    id v11 = v4;
    objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  }
  else
  {
    __break(1u);
  }
}

id sub_22C04E8E4@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  id v3 = (void **)(*a1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel);
  swift_beginAccess();
  id v4 = *v3;
  *a2 = *v3;

  return v4;
}

void sub_22C04E948(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_22C04E954()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel);
  swift_beginAccess();
  id v2 = *v1;

  return v2;
}

void sub_22C04E9AC(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_22C04EA00())()
{
  return j__swift_endAccess;
}

id sub_22C04EA60()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_configurationWithPointSize_weight_scale_, 5, 3, 20.0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849DFB0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_22C06DDC0;
  id v3 = self;
  *(void *)(v2 + 32) = objc_msgSend(v3, sel_systemGrayColor);
  *(void *)(v2 + 40) = objc_msgSend(v3, sel_systemGray5Color);
  sub_22C06CD60();
  sub_22C0524D8(0, &qword_26849DFC8);
  id v4 = (void *)sub_22C06CD30();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v0, sel_configurationWithPaletteColors_, v4);

  id v6 = v1;
  uint64_t v7 = (void *)sub_22C06CCC0();
  id v8 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v7, v6);

  id v9 = objc_msgSend(v8, sel_imageByApplyingSymbolConfiguration_, v5);
  id v10 = objc_msgSend(self, sel_buttonWithType_, 0);
  objc_msgSend(v10, sel_setBackgroundImage_forState_, v9, 0);
  objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_22C06CB70();
  id v11 = v10;
  v12 = (void *)sub_22C06CAF0();
  sub_22C06CB00();

  v13 = (void *)sub_22C06CCC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setAccessibilityLabel_, v13);

  return v11;
}

id sub_22C04ED04@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  id v3 = (void **)(*a1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton);
  swift_beginAccess();
  id v4 = *v3;
  *a2 = *v3;

  return v4;
}

void sub_22C04ED68(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_22C04ED74()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_22C04EDCC(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_22C04EE20())()
{
  return j_j__swift_endAccess;
}

id sub_22C04EE7C@<X0>(void *a1@<X8>)
{
  id result = sub_22C04EEF8();
  *a1 = result;
  return result;
}

void sub_22C04EEA8(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v4 = *(id *)(*a2
             + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView);
  *(void *)(*a2
            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView) = *a1;
  id v3 = v2;
}

id sub_22C04EEF8()
{
  uint64_t v1 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView);
  }
  else
  {
    type metadata accessor for AXTwiceCompanionWatchView();
    id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_22C04EF70(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_22C04EF84(id *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = sub_22C04EEF8();
  return sub_22C04EFCC;
}

void sub_22C04EFCC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  id v3 = *(void **)(v1
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView);
  *(void *)(v1
            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView) = v2;
}

id sub_22C04EFE4@<X0>(void *a1@<X8>)
{
  id result = sub_22C04F064();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_22C04F010(long long *a1, void *a2)
{
  id v4 = *(id *)(*a2
             + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView);
  long long v2 = *a1;
  *(_OWORD *)(*a2
            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView) = *a1;
  id v3 = (id)v2;
}

id sub_22C04F064()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView;
  long long v2 = *(void **)(v0
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView);
  }
  else
  {
    _AXSTwiceRemoteScreenPlatform();
    id v4 = sub_22C04EEF8();
    id v5 = *(void **)v1;
    *(void *)uint64_t v1 = v4;
    *(void *)(v1 + 8) = &protocol witness table for AXTwiceCompanionWatchView;
    id v3 = v4;

    long long v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_22C04F0DC(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)(v2
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView);
  *id v3 = a1;
  v3[1] = a2;
  return MEMORY[0x270F9A790]();
}

uint64_t (*sub_22C04F0F4(id *a1))(uint64_t a1)
{
  a1[2] = v1;
  *a1 = sub_22C04F064();
  a1[1] = v3;
  return sub_22C04F13C;
}

uint64_t sub_22C04F13C(uint64_t a1)
{
  *(_OWORD *)(*(void *)(a1 + 16)
            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView) = *(_OWORD *)a1;
  return MEMORY[0x270F9A758]();
}

id sub_22C04F158()
{
  id v0 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x263F83570]);
  id v1 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v2 = v0;
  id v3 = objc_msgSend(v1, sel_init);
  id v4 = (void *)sub_22C06CCC0();
  objc_msgSend(v3, sel_setText_, v4);

  objc_msgSend(v3, sel_setTextAlignment_, 1);
  objc_msgSend(v2, sel_pointSize);
  id v6 = objc_msgSend(self, sel_fontWithDescriptor_size_, v2, v5);

  objc_msgSend(v3, sel_setFont_, v6);
  objc_msgSend(v3, sel_setNumberOfLines_, 0);
  objc_msgSend(v3, sel_setAdjustsFontSizeToFitWidth_, 1);
  objc_msgSend(v3, sel_setMinimumScaleFactor_, 0.5);
  objc_msgSend(v3, sel_setAccessibilityTraits_, *MEMORY[0x263F832B8]);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v7 = v3;
  objc_msgSend(v7, sel_setHidden_, 1);

  return v7;
}

id sub_22C04F308@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  id v3 = (void **)(*a1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel);
  swift_beginAccess();
  id v4 = *v3;
  *a2 = *v3;

  return v4;
}

void sub_22C04F36C(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

void sub_22C04F378(void **a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  double v5 = *a1;
  id v6 = (void **)(*a2 + *a5);
  swift_beginAccess();
  id v7 = *v6;
  *id v6 = v5;
  id v8 = v5;
}

id sub_22C04F3D8()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel);
  swift_beginAccess();
  id v2 = *v1;

  return v2;
}

void sub_22C04F430(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_22C04F484())()
{
  return j_j__swift_endAccess;
}

id sub_22C04F4E0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  id v1 = objc_msgSend(self, sel_systemBackgroundColor);
  objc_msgSend(v0, sel_setBackgroundColor_, v1);

  id v2 = objc_msgSend(v0, sel_layer);
  AXDisplayCornerRadiusWithMargin();
  objc_msgSend(v2, sel_setCornerRadius_);

  id v3 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v3, sel_setCornerCurve_, *MEMORY[0x263F15A20]);

  objc_msgSend(v0, sel_setClipsToBounds_, 1);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v0;
}

uint64_t type metadata accessor for AXTwiceCompanionMainViewController()
{
  return self;
}

void sub_22C04F6B0()
{
  id v1 = v0;
  v137.receiver = v0;
  v137.super_class = (Class)type metadata accessor for AXTwiceCompanionMainViewController();
  objc_msgSendSuper2(&v137, sel_viewDidLoad);
  objc_msgSend(v0, sel_setModalPresentationStyle_, 4);
  id v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v3 = v2;
  id v4 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v3, sel_setBackgroundColor_, v4);

  objc_msgSend(v1, sel_setTransitioningDelegate_, *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_pullToDismissManager]);
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82A00]), sel_initWithTarget_action_, v1, sel_cardSwipeDownWithGesture_);
  id v6 = (char *)sub_22C04EEF8();
  id v7 = (id *)&v6[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture];
  swift_beginAccess();
  id v8 = *v7;
  id v9 = *v7;

  if (v8)
  {
    objc_msgSend(v5, sel_requireGestureRecognizerToFail_, v9);
  }
  id v10 = (char *)sub_22C04EEF8();
  id v11 = (id *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture];
  swift_beginAccess();
  id v12 = *v11;
  id v13 = *v11;

  if (v12)
  {
    objc_msgSend(v5, sel_requireGestureRecognizerToFail_, v13);
  }
  uint64_t v14 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_cardBackgroundView;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_cardBackgroundView], sel_addGestureRecognizer_, v5);
  id v15 = objc_msgSend(v1, sel_view);
  if (!v15) {
    goto LABEL_18;
  }
  uint64_t v16 = v15;
  objc_msgSend(v15, sel_addSubview_, *(void *)&v1[v14]);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26849DFB0);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_22C06DDD0;
  id v18 = objc_msgSend(*(id *)&v1[v14], sel_centerXAnchor);
  id v19 = objc_msgSend(v1, sel_view);
  if (!v19)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v20 = v19;
  id v21 = objc_msgSend(v19, sel_centerXAnchor);

  id v22 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v21);
  *(void *)(v17 + 32) = v22;
  id v23 = objc_msgSend(*(id *)&v1[v14], sel_leadingAnchor);
  id v24 = objc_msgSend(v1, sel_view);
  if (!v24)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v25 = v24;
  id v26 = objc_msgSend(v24, sel_leadingAnchor);

  id v27 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v26, 6.0);
  *(void *)(v17 + 40) = v27;
  id v28 = objc_msgSend(*(id *)&v1[v14], sel_trailingAnchor);
  id v29 = objc_msgSend(v1, sel_view);
  if (!v29)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v30 = v29;
  id v31 = objc_msgSend(v29, sel_trailingAnchor);

  id v32 = objc_msgSend(v28, sel_constraintEqualToAnchor_constant_, v31, -6.0);
  *(void *)(v17 + 48) = v32;
  id v33 = objc_msgSend(*(id *)&v1[v14], sel_heightAnchor);
  id v34 = objc_msgSend(v1, sel_view);
  if (!v34)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v35 = v34;
  v135 = v5;
  id v36 = objc_msgSend(v34, sel_heightAnchor);

  id v37 = objc_msgSend(v33, sel_constraintLessThanOrEqualToAnchor_multiplier_, v36, 0.9);
  *(void *)(v17 + 56) = v37;
  id v38 = objc_msgSend(*(id *)&v1[v14], sel_bottomAnchor);
  id v39 = objc_msgSend(v1, sel_view);
  if (!v39)
  {
LABEL_23:
    __break(1u);
    return;
  }
  v40 = v39;
  id v136 = self;
  id v41 = objc_msgSend(v40, sel_bottomAnchor);

  id v42 = objc_msgSend(v38, sel_constraintEqualToAnchor_constant_, v41, -6.0);
  *(void *)(v17 + 64) = v42;
  sub_22C06CD60();
  sub_22C0524D8(0, &qword_26849DFB8);
  v43 = (void *)sub_22C06CD30();
  swift_bridgeObjectRelease();
  objc_msgSend(v136, sel_activateConstraints_, v43);

  v44 = *(void **)&v1[v14];
  v45 = (id *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton];
  swift_beginAccess();
  objc_msgSend(v44, sel_addSubview_, *v45);
  uint64_t v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_22C06DDC0;
  id v47 = objc_msgSend(*v45, sel_centerYAnchor);
  id v48 = objc_msgSend(*(id *)&v1[v14], sel_topAnchor);
  uint64_t v49 = v14;
  id v50 = objc_msgSend(v47, sel_constraintEqualToAnchor_constant_, v48, 32.0);

  *(void *)(v46 + 32) = v50;
  id v51 = objc_msgSend(*v45, sel_centerXAnchor);
  id v52 = objc_msgSend(*(id *)&v1[v49], sel_trailingAnchor);
  id v53 = objc_msgSend(v51, (SEL)0x264909307, v52, -32.0);

  *(void *)(v46 + 40) = v53;
  sub_22C06CD60();
  v54 = (void *)sub_22C06CD30();
  swift_bridgeObjectRelease();
  objc_msgSend(v136, sel_activateConstraints_, v54);

  id v55 = *(id *)&v1[v49];
  id v56 = sub_22C04F064();
  objc_msgSend(v55, sel_addSubview_, v56);

  id v57 = sub_22C04F064();
  uint64_t v59 = v58;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, double))(v59 + 16))(ObjectType, v59, 30.0);

  id v61 = sub_22C04F064();
  uint64_t v63 = v62;
  uint64_t v64 = swift_getObjectType();
  id v65 = sub_22C04F064();
  id v66 = objc_msgSend(v65, sel_leftAnchor);

  id v67 = objc_msgSend(*(id *)&v1[v49], sel_leftAnchor);
  id v68 = objc_msgSend(v66, sel_constraintEqualToAnchor_, v67);

  (*(void (**)(id, uint64_t, uint64_t))(v63 + 40))(v68, v64, v63);
  id v69 = sub_22C04F064();
  uint64_t v71 = v70;
  uint64_t v72 = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, double))(v71 + 64))(v72, v71, 15.0);

  id v73 = sub_22C04F064();
  uint64_t v75 = v74;
  uint64_t v76 = swift_getObjectType();
  id v77 = sub_22C04F064();
  id v78 = objc_msgSend(v77, sel_rightAnchor);

  id v79 = objc_msgSend(*(id *)&v1[v49], sel_rightAnchor);
  id v80 = objc_msgSend(v78, sel_constraintEqualToAnchor_, v79);

  (*(void (**)(id, uint64_t, uint64_t))(v75 + 88))(v80, v76, v75);
  id v81 = sub_22C04F064();
  uint64_t v83 = v82;
  uint64_t v84 = swift_getObjectType();
  v85 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v83 + 32))(v84, v83);

  if (v85)
  {
    id v86 = sub_22C04F064();
    uint64_t v88 = v87;
    uint64_t v89 = swift_getObjectType();
    v90 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v88 + 80))(v89, v88);

    if (v90)
    {
      uint64_t v91 = swift_allocObject();
      *(_OWORD *)(v91 + 16) = xmmword_22C06DDE0;
      *(void *)(v91 + 32) = v85;
      *(void *)(v91 + 40) = v90;
      id v92 = v85;
      id v93 = v90;
      id v94 = sub_22C04F064();
      id v95 = objc_msgSend(v94, sel_heightAnchor);

      id v96 = sub_22C04F064();
      id v97 = objc_msgSend(v96, sel_widthAnchor);

      id v98 = objc_msgSend(v95, sel_constraintEqualToAnchor_multiplier_, v97, 1.12);
      *(void *)(v91 + 48) = v98;
      sub_22C06CD60();
      v85 = (void *)sub_22C06CD30();
      swift_bridgeObjectRelease();
      objc_msgSend(v136, sel_activateConstraints_, v85);
    }
  }
  id v99 = sub_22C04EEF8();
  sub_22C05AA74(0.1);

  uint64_t v100 = v49;
  v101 = *(void **)&v1[v49];
  v102 = (id *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel];
  swift_beginAccess();
  objc_msgSend(v101, sel_addSubview_, *v102);
  uint64_t v103 = swift_allocObject();
  *(_OWORD *)(v103 + 16) = xmmword_22C06DDF0;
  id v104 = objc_msgSend(*v102, sel_leadingAnchor);
  id v105 = [*(id *)&v1[v49] (SEL)0x26490923ALL];
  id v106 = objc_msgSend(v104, sel_constraintEqualToAnchor_constant_, v105, 40.0);

  *(void *)(v103 + 32) = v106;
  id v107 = objc_msgSend(*v102, sel_trailingAnchor);
  id v108 = [*(id *)&v1[v49] (SEL)0x264909494];
  id v109 = objc_msgSend(v107, sel_constraintEqualToAnchor_constant_, v108, -45.0);

  *(void *)(v103 + 40) = v109;
  id v110 = objc_msgSend(*v102, sel_topAnchor);
  id v111 = [*(id *)&v1[v49] (SEL)0x264909533];
  id v112 = objc_msgSend(v110, sel_constraintEqualToAnchor_constant_, v111, 32.0);

  *(void *)(v103 + 48) = v112;
  id v113 = objc_msgSend(*v102, sel_bottomAnchor);
  id v114 = sub_22C04F064();
  id v115 = [v114 (SEL)0x264909533];

  id v116 = objc_msgSend(v113, sel_constraintEqualToAnchor_constant_, v115, -20.0);
  *(void *)(v103 + 56) = v116;
  sub_22C06CD60();
  v117 = (void *)sub_22C06CD30();
  swift_bridgeObjectRelease();
  objc_msgSend(v136, sel_activateConstraints_, v117);

  v118 = *(void **)&v1[v49];
  v119 = (id *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel];
  swift_beginAccess();
  objc_msgSend(v118, sel_addSubview_, *v119);
  uint64_t v120 = swift_allocObject();
  *(_OWORD *)(v120 + 16) = xmmword_22C06DDF0;
  id v121 = objc_msgSend(*v119, sel_leadingAnchor);
  id v122 = objc_msgSend(*(id *)&v1[v100], sel_leadingAnchor);
  id v123 = objc_msgSend(v121, sel_constraintEqualToAnchor_constant_, v122, 40.0);

  *(void *)(v120 + 32) = v123;
  id v124 = objc_msgSend(*v119, sel_trailingAnchor);
  id v125 = objc_msgSend(*(id *)&v1[v100], sel_trailingAnchor);
  id v126 = objc_msgSend(v124, sel_constraintEqualToAnchor_constant_, v125, -45.0);

  *(void *)(v120 + 40) = v126;
  id v127 = objc_msgSend(*v119, sel_topAnchor);
  id v128 = sub_22C04F064();
  id v129 = objc_msgSend(v128, sel_bottomAnchor);

  id v130 = objc_msgSend(v127, sel_constraintEqualToAnchor_constant_, v129, 20.0);
  *(void *)(v120 + 48) = v130;
  id v131 = objc_msgSend(*v119, sel_bottomAnchor);
  id v132 = objc_msgSend(*(id *)&v1[v100], sel_bottomAnchor);
  id v133 = objc_msgSend(v131, sel_constraintEqualToAnchor_constant_, v132, -32.0);

  *(void *)(v120 + 56) = v133;
  sub_22C06CD60();
  v134 = (void *)sub_22C06CD30();
  swift_bridgeObjectRelease();
  objc_msgSend(v136, sel_activateConstraints_, v134);
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

uint64_t sub_22C050620(uint64_t a1)
{
  uint64_t v2 = sub_22C06CBD0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x263F21EB0]
    || v6 == *MEMORY[0x263F21E98]
    || v6 == *MEMORY[0x263F21EA0]
    || v6 == *MEMORY[0x263F21EA8])
  {
    sub_22C06CB70();
    id v10 = (void *)sub_22C06CAF0();
    uint64_t v11 = sub_22C06CB00();
    uint64_t v13 = v12;

    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  else if (v6 == *MEMORY[0x263F21EC8])
  {
    sub_22C06CB70();
    uint64_t v16 = (void *)sub_22C06CAF0();
    uint64_t v11 = sub_22C06CB00();
    uint64_t v13 = v17;

    uint64_t v15 = 0xEC0000006F656469;
    uint64_t v14 = 0x7679616C70726961;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v11 = 0;
    uint64_t v13 = 0xE000000000000000;
  }
  sub_22C050CF4(v11, v13, v14, v15);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C050860(uint64_t a1, uint64_t a2)
{
  return sub_22C050CF4(a1, a2, 0xD000000000000016, 0x800000022C06E510);
}

void sub_22C05087C(uint64_t a1)
{
  uint64_t v2 = sub_22C06CBD0();
  uint64_t v3 = *(void **)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v29 = &v27[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v32 = &v27[-v7];
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  id v31 = &v27[-v9];
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v27[-v11];
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = &v27[-v13];
  uint64_t v15 = *MEMORY[0x263F21E98];
  v30 = (void (*)(unsigned char *, uint64_t, uint64_t))v3[13];
  v30(&v27[-v13], v15, v2);
  sub_22C051DCC((unint64_t *)&unk_26849E560, MEMORY[0x263F21ED0]);
  uint64_t v33 = a1;
  sub_22C06CD10();
  sub_22C06CD10();
  if (v36 == v34 && v37 == v35) {
    char v16 = 1;
  }
  else {
    char v16 = sub_22C06CFE0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v17 = (void (*)(unsigned char *, uint64_t))v3[1];
  v17(v14, v2);
  id v18 = (void (*)(unsigned char *, uint64_t, uint64_t))v3[2];
  uint64_t v19 = v33;
  v18(v12, v33, v2);
  if (v16) {
    goto LABEL_9;
  }
  v30(v31, *MEMORY[0x263F21EA0], v2);
  sub_22C06CD10();
  sub_22C06CD10();
  if (v36 == v34 && v37 == v35)
  {
    swift_bridgeObjectRelease_n();
    v17(v31, v2);
    uint64_t v19 = v33;
LABEL_9:
    v17(v12, v2);
    v20 = v32;
    v18(v32, v19, v2);
LABEL_10:
    char v21 = 1;
    goto LABEL_11;
  }
  int v28 = sub_22C06CFE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17(v31, v2);
  v17(v12, v2);
  v20 = v32;
  v18(v32, v33, v2);
  if (v28) {
    goto LABEL_10;
  }
  id v26 = v29;
  v30(v29, *MEMORY[0x263F21EA8], v2);
  sub_22C06CD10();
  sub_22C06CD10();
  if (v36 == v34 && v37 == v35) {
    char v21 = 1;
  }
  else {
    char v21 = sub_22C06CFE0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17(v26, v2);
LABEL_11:
  v17(v20, v2);
  id v22 = sub_22C04F064();
  uint64_t v24 = v23;
  uint64_t ObjectType = swift_getObjectType();
  sub_22C054F70(v21 & 1, ObjectType, v24);
}

uint64_t sub_22C050CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = a3;
  uint64_t v8 = sub_22C06CC20();
  uint64_t v23 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_22C06CC50();
  uint64_t v11 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C0524D8(0, (unint64_t *)&qword_26849E360);
  uint64_t v14 = (void *)sub_22C06CDF0();
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = v4;
  v15[3] = a1;
  uint64_t v16 = v21;
  v15[4] = a2;
  void v15[5] = v16;
  v15[6] = a4;
  aBlock[4] = sub_22C051DA4;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22C0510D0;
  aBlock[3] = &block_descriptor;
  uint64_t v17 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v18 = v4;
  swift_bridgeObjectRetain();
  swift_release();
  sub_22C06CC30();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22C051DCC((unint64_t *)&qword_26849E4D0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849DFC0);
  sub_22C051E14();
  sub_22C06CE70();
  MEMORY[0x230F5CF00](0, v13, v10, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v22);
}

void sub_22C050FE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = (id *)(a1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel);
  swift_beginAccess();
  objc_msgSend(*v9, sel_setHidden_, 0);
  id v10 = *v9;
  id v11 = sub_22C0522E8(a2, a3, a4, a5);
  objc_msgSend(v10, sel_setAttributedText_, v11);

  id v12 = *v9;
  uint64_t v13 = (void *)sub_22C06CCC0();
  objc_msgSend(v12, sel_setAccessibilityLabel_, v13);
}

uint64_t sub_22C0510D0(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_22C051114(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22C06CC00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_cardBackgroundView;
  objc_msgSend(a1, sel_translationInView_, *(void *)&v2[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_cardBackgroundView]);
  double v10 = v9;
  objc_msgSend(*(id *)&v2[v8], sel_bounds);
  double v11 = v10 / CGRectGetHeight(v28);
  sub_22C06C8C0();
  id v12 = sub_22C06CBF0();
  os_log_type_t v13 = sub_22C06CD90();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    v25 = a1;
    uint64_t v15 = v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v27 = v16;
    *(_DWORD *)uint64_t v15 = 136315394;
    uint64_t v26 = sub_22C0545D0(0xD000000000000017, 0x800000022C06E720, &v27);
    sub_22C06CE40();
    *(_WORD *)(v15 + 12) = 2048;
    uint64_t v26 = *(void *)&v11;
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v12, v13, "[TWICE] %s - %f", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v16, -1, -1);
    uint64_t v17 = v15;
    a1 = v25;
    MEMORY[0x230F5D900](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v18 = *(void *)&v2[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_pullToDismissManager];
  switch((unint64_t)objc_msgSend(a1, sel_state))
  {
    case 1uLL:
      *(unsigned char *)(v18 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_isInteractive) = 1;
      id v19 = objc_allocWithZone(MEMORY[0x263F82A28]);
      uint64_t v20 = v2;
      id v21 = objc_msgSend(v19, sel_init);
      uint64_t v22 = *(void **)(v18
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive);
      *(void *)(v18
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive) = v21;

      sub_22C051508();
      break;
    case 2uLL:
      objc_msgSend(*(id *)(v18+ OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive), sel_updateInteractiveTransition_, v11);
      break;
    case 3uLL:
      *(unsigned char *)(v18 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_isInteractive) = 0;
      uint64_t v23 = *(void **)(v18
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive);
      if (v11 <= 0.3) {
        goto LABEL_9;
      }
      objc_msgSend(v23, sel_finishInteractiveTransition);
      break;
    case 4uLL:
      *(unsigned char *)(v18 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_isInteractive) = 0;
      uint64_t v23 = *(void **)(v18
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive);
LABEL_9:
      objc_msgSend(v23, sel_cancelInteractiveTransition);
      break;
    default:
      return;
  }
}

id sub_22C051508()
{
  id v1 = v0;
  uint64_t v2 = sub_22C06CC00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  uint64_t v6 = sub_22C06CBF0();
  os_log_type_t v7 = sub_22C06CD90();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v12 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v11 = sub_22C0545D0(0xD000000000000015, 0x800000022C06E700, &v12);
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v6, v7, "[TWICE] %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v9, -1, -1);
    MEMORY[0x230F5D900](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return objc_msgSend(v1, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

void sub_22C0516F8()
{
  uint64_t v0 = sub_22C06CC00();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  uint64_t v4 = sub_22C06CBF0();
  os_log_type_t v5 = sub_22C06CDB0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v15 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v14 = sub_22C0545D0(0xD000000000000020, 0x800000022C06E6D0, &v15);
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v4, v5, "[TWICE] %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v7, -1, -1);
    MEMORY[0x230F5D900](v6, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  id v8 = sub_22C04F064();
  uint64_t v10 = v9;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v12 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 152))(ObjectType, v10);

  if (v12)
  {
    os_log_type_t v13 = (void *)MEMORY[0x230F5D960](&v12[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_delegate]);

    if (v13)
    {
      objc_msgSend(v13, sel_pullToDismissViewController);
      swift_unknownObjectRelease();
    }
  }
}

id AXTwiceCompanionMainViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_22C06CCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id AXTwiceCompanionMainViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel;
  id v7 = v3;
  sub_22C04E6E8();
  *(void *)&v3[v6] = v8;
  uint64_t v9 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton;
  *(void *)&v7[v9] = sub_22C04EA60();
  *(void *)&v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView] = 0;
  uint64_t v10 = &v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  uint64_t v11 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel;
  *(void *)&v7[v11] = sub_22C04F158();
  uint64_t v12 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_pullToDismissManager;
  *(void *)&v7[v12] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AXTwiceCompanionPullToDismissManager()), sel_init);
  uint64_t v13 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_cardBackgroundView;
  *(void *)&v7[v13] = sub_22C04F4E0();

  if (a2)
  {
    uint64_t v14 = (void *)sub_22C06CCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = 0;
  }
  v17.receiver = v7;
  v17.super_class = (Class)type metadata accessor for AXTwiceCompanionMainViewController();
  id v15 = objc_msgSendSuper2(&v17, sel_initWithNibName_bundle_, v14, a3);

  return v15;
}

id AXTwiceCompanionMainViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id AXTwiceCompanionMainViewController.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel;
  uint64_t v4 = v1;
  sub_22C04E6E8();
  *(void *)&v1[v3] = v5;
  uint64_t v6 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton;
  *(void *)&v4[v6] = sub_22C04EA60();
  *(void *)&v4[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView] = 0;
  id v7 = &v4[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView];
  *(void *)id v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel;
  *(void *)&v4[v8] = sub_22C04F158();
  uint64_t v9 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_pullToDismissManager;
  *(void *)&v4[v9] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AXTwiceCompanionPullToDismissManager()), sel_init);
  uint64_t v10 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_cardBackgroundView;
  *(void *)&v4[v10] = sub_22C04F4E0();

  v13.receiver = v4;
  v13.super_class = (Class)type metadata accessor for AXTwiceCompanionMainViewController();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithCoder_, a1);

  return v11;
}

id AXTwiceCompanionMainViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXTwiceCompanionMainViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22C051D5C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_22C051DA4()
{
  sub_22C050FE0(v0[2], v0[3], v0[4], v0[5], v0[6]);
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

uint64_t sub_22C051DCC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_22C051E14()
{
  unint64_t result = qword_26849E4E0;
  if (!qword_26849E4E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26849DFC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26849E4E0);
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

uint64_t method lookup function for AXTwiceCompanionMainViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AXTwiceCompanionMainViewController);
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.titleLabel.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.titleLabel.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.titleLabel.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.dismissButton.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.dismissButton.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.dismissButton.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.watchDeviceView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.watchDeviceView.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.watchDeviceView.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.deviceView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.deviceView.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.deviceView.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.statusLabel.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.statusLabel.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.statusLabel.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.updateStatus(state:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.updateStatusLabel(errorStr:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.updateSpinner(state:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.updateStatusLabel(text:systemImageName:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

_DWORD *sub_22C0522CC@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_22C0522DC(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

id sub_22C0522E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4
    && (swift_bridgeObjectRetain(),
        uint64_t v4 = (void *)sub_22C06CCC0(),
        swift_bridgeObjectRelease(),
        id v5 = objc_msgSend(self, sel_systemImageNamed_, v4),
        v4,
        v5))
  {
    id v6 = objc_allocWithZone(MEMORY[0x263F086A0]);
    swift_bridgeObjectRetain();
    id v7 = (void *)sub_22C06CCC0();
    swift_bridgeObjectRelease();
    id v8 = objc_msgSend(v6, sel_initWithString_, v7);

    id v9 = objc_allocWithZone(MEMORY[0x263F086A0]);
    uint64_t v10 = (void *)sub_22C06CCC0();
    id v11 = objc_msgSend(v9, sel_initWithString_, v10);

    id v12 = objc_msgSend(self, sel_textAttachmentWithImage_, v5);
    sub_22C0524D8(0, &qword_26849DFD0);
    id v13 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_attributedStringWithAttachment_, v12);
    objc_msgSend(v13, sel_appendAttributedString_, v11);
    objc_msgSend(v13, sel_appendAttributedString_, v8);
  }
  else
  {
    id v14 = objc_allocWithZone(MEMORY[0x263F086A0]);
    swift_bridgeObjectRetain();
    id v5 = (id)sub_22C06CCC0();
    swift_bridgeObjectRelease();
    id v13 = objc_msgSend(v14, sel_initWithString_, v5);
  }

  return v13;
}

uint64_t sub_22C0524D8(uint64_t a1, unint64_t *a2)
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

uint64_t initializeBufferWithCopyOfBuffer for AXTwiceHIDEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_22C052558(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_22C052578(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for AXHandEventType(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t sub_22C0525EC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_22C05260C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_22C052648(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_22C0526AC(void *a1)
{
  id v3 = objc_msgSend(a1, sel_viewControllerForKey_, *MEMORY[0x263F83C10]);
  if (v3)
  {
    id v25 = v3;
    id v4 = objc_msgSend(a1, sel_viewControllerForKey_, *MEMORY[0x263F83C00]);
    if (v4)
    {
      id v5 = v4;
      id v6 = objc_msgSend(a1, sel_containerView);
      id v7 = objc_msgSend(v5, sel_view);
      if (v7)
      {
        id v8 = v7;
        id v9 = objc_msgSend(v25, sel_view);
        if (v9)
        {
          uint64_t v10 = v9;
          objc_msgSend(v6, sel_insertSubview_belowSubview_, v8, v9);

          objc_msgSend(v6, sel_bounds);
          CGFloat x = v33.origin.x;
          CGFloat y = v33.origin.y;
          CGFloat width = v33.size.width;
          CGFloat height = v33.size.height;
          CGFloat v15 = CGRectGetHeight(v33);
          v34.origin.CGFloat x = x;
          v34.origin.CGFloat y = y;
          v34.size.CGFloat width = width;
          v34.size.CGFloat height = height;
          CGFloat v16 = CGRectGetWidth(v34);
          v35.origin.CGFloat x = x;
          v35.origin.CGFloat y = y;
          v35.size.CGFloat width = width;
          v35.size.CGFloat height = height;
          CGFloat v17 = CGRectGetHeight(v35);
          uint64_t v18 = self;
          id v19 = (CGFloat *)swift_allocObject();
          *((void *)v19 + 2) = v5;
          v19[3] = 0.0;
          v19[4] = v15;
          v19[5] = v16;
          v19[6] = v17;
          v30 = sub_22C053260;
          id v31 = v19;
          uint64_t aBlock = MEMORY[0x263EF8330];
          uint64_t v27 = 1107296256;
          CGRect v28 = sub_22C0510D0;
          id v29 = &block_descriptor_0;
          uint64_t v20 = _Block_copy(&aBlock);
          id v21 = v5;
          swift_release();
          uint64_t v22 = swift_allocObject();
          *(void *)(v22 + 16) = a1;
          *(void *)(v22 + 24) = v1;
          v30 = sub_22C0532C8;
          id v31 = (CGFloat *)v22;
          uint64_t aBlock = MEMORY[0x263EF8330];
          uint64_t v27 = 1107296256;
          CGRect v28 = sub_22C052B1C;
          id v29 = &block_descriptor_26;
          uint64_t v23 = _Block_copy(&aBlock);
          swift_unknownObjectRetain();
          id v24 = v1;
          swift_release();
          objc_msgSend(v18, sel_animateWithDuration_animations_completion_, v20, v23, 0.3);
          _Block_release(v23);
          _Block_release(v20);

          return;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      return;
    }
  }
}

void sub_22C0529E4(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = objc_msgSend(a1, sel_view);
  if (v9)
  {
    id v10 = v9;
    objc_msgSend(v9, sel_setFrame_, a2, a3, a4, a5);
  }
  else
  {
    __break(1u);
  }
}

id sub_22C052A70(int a1, id a2, uint64_t a3)
{
  unsigned int v5 = objc_msgSend(a2, sel_transitionWasCancelled);
  if ((v5 & 1) == 0)
  {
    id v6 = *(void **)(a3
                  + OBJC_IVAR____TtC21AXWatchRemoteScreenUI47AXTwiceCompanionPullToDismissAnimatedController_dismissedVC);
    if (v6)
    {
      type metadata accessor for AXTwiceCompanionMainViewController();
      if (swift_dynamicCastClass())
      {
        id v7 = v6;
        sub_22C0516F8();
      }
    }
  }

  return objc_msgSend(a2, sel_completeTransition_, v5 ^ 1);
}

uint64_t sub_22C052B1C(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_22C052C08()
{
  return sub_22C052D88(type metadata accessor for AXTwiceCompanionPullToDismissAnimatedController);
}

uint64_t type metadata accessor for AXTwiceCompanionPullToDismissAnimatedController()
{
  return self;
}

id sub_22C052D70()
{
  return sub_22C052D88(type metadata accessor for AXTwiceCompanionPullToDismissManager);
}

id sub_22C052D88(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for AXTwiceCompanionPullToDismissManager()
{
  return self;
}

char *sub_22C052DF4(void *a1)
{
  uint64_t v2 = sub_22C06CC00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unsigned int v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  id v6 = sub_22C06CBF0();
  os_log_type_t v7 = sub_22C06CDB0();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v17 = v9;
    *(_DWORD *)id v8 = 136315138;
    uint64_t v16 = sub_22C0545D0(0xD000000000000022, 0x800000022C06E970, &v17);
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v6, v7, "[TWICE] %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v9, -1, -1);
    MEMORY[0x230F5D900](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v10 = (objc_class *)type metadata accessor for AXTwiceCompanionPullToDismissAnimatedController();
  id v11 = (char *)objc_allocWithZone(v10);
  *(void *)&v11[OBJC_IVAR____TtC21AXWatchRemoteScreenUI47AXTwiceCompanionPullToDismissAnimatedController_dismissedVC] = 0;
  v18.receiver = v11;
  v18.super_class = v10;
  id v12 = a1;
  id v13 = (char *)objc_msgSendSuper2(&v18, sel_init);
  id v14 = *(void **)&v13[OBJC_IVAR____TtC21AXWatchRemoteScreenUI47AXTwiceCompanionPullToDismissAnimatedController_dismissedVC];
  *(void *)&v13[OBJC_IVAR____TtC21AXWatchRemoteScreenUI47AXTwiceCompanionPullToDismissAnimatedController_dismissedVC] = v12;

  return v13;
}

void *sub_22C05301C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22C06CC00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unsigned int v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  id v6 = sub_22C06CBF0();
  os_log_type_t v7 = sub_22C06CDB0();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v14 = v9;
    *(_DWORD *)id v8 = 136315138;
    uint64_t v13 = sub_22C0545D0(0xD000000000000029, 0x800000022C06E940, &v14);
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v6, v7, "[TWICE] %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v9, -1, -1);
    MEMORY[0x230F5D900](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_isInteractive) != 1) {
    return 0;
  }
  id v10 = *(void **)(v1
                 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive);
  if (v10) {
    id v11 = v10;
  }
  return v10;
}

uint64_t sub_22C053228()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_22C053260()
{
  sub_22C0529E4(*(void **)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
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

uint64_t sub_22C053288()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_22C0532C8(int a1)
{
  return sub_22C052A70(a1, *(id *)(v1 + 16), *(void *)(v1 + 24));
}

id sub_22C0532D8()
{
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for AXTwiceCompanionRendererView();
  objc_msgSendSuper2(&v5, sel_layoutSubviews);
  uint64_t v1 = self;
  objc_msgSend(v1, sel_begin);
  objc_msgSend(v1, sel_setDisableActions_, 1);
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer];
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v0, sel_bounds);
    objc_msgSend(v3, sel_setFrame_);
  }
  return objc_msgSend(v1, sel_commit);
}

uint64_t type metadata accessor for AXTwiceCompanionRendererView()
{
  return self;
}

void sub_22C053404(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer], sel_removeFromSuperlayer);
  uint64_t v4 = *(void **)&v1[v3];
  *(void *)&v1[v3] = a1;
  id v5 = a1;

  id v6 = *(void **)&v1[v3];
  if (v6)
  {
    id v7 = v6;
    objc_msgSend(v1, sel_bounds);
    objc_msgSend(v7, sel_setFrame_);

    id v8 = *(void **)&v1[v3];
    if (v8)
    {
      objc_msgSend(v8, sel_setContentsGravity_, *MEMORY[0x263F15E00]);
      uint64_t v9 = *(void **)&v1[v3];
      if (v9)
      {
        objc_msgSend(v9, sel_setNeedsDisplayOnBoundsChange_, 0);
        id v10 = *(void **)&v1[v3];
        if (v10)
        {
          double v11 = *(double *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_cornerRadiusRatio];
          id v12 = v10;
          objc_msgSend(v1, sel_frame);
          objc_msgSend(v12, sel_setCornerRadius_, v11 * CGRectGetWidth(v19));

          uint64_t v13 = *(void **)&v1[v3];
          if (v13)
          {
            objc_msgSend(v13, sel_setCornerCurve_, *MEMORY[0x263F15A20]);
            uint64_t v14 = *(void **)&v1[v3];
            if (v14)
            {
              objc_msgSend(v14, sel_setMasksToBounds_, 1);
              CGFloat v15 = *(void **)&v1[v3];
              if (v15)
              {
                id v17 = v15;
                id v16 = objc_msgSend(v1, sel_layer);
                objc_msgSend(v16, sel_insertSublayer_atIndex_, v17, 0);

                objc_msgSend(v1, sel_layoutSubviews);
              }
            }
          }
        }
      }
    }
  }
}

void sub_22C0535D0(unint64_t a1, char a2, double a3, double a4)
{
  objc_msgSend(v4, sel_bounds);
  double v10 = v9;
  objc_msgSend(v4, sel_bounds);
  objc_msgSend(v4, sel_convertPoint_toView_, 0, v10);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  objc_msgSend(v4, sel_frame);
  CGFloat v16 = v15 / a3;
  objc_msgSend(v4, sel_frame);
  CGFloat v18 = v17 / a4;
  CGAffineTransformMakeTranslation(&v29, v12, v14);
  CGAffineTransformMakeScale(&v28, v16, v18);
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_22C06CF70();
    if (!v19) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v19 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v19) {
      goto LABEL_10;
    }
  }
  if (v19 < 1)
  {
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v20 = 0;
  char v21 = a2 & 1;
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v22 = (id)MEMORY[0x230F5CFD0](v20, a1);
    }
    else {
      id v22 = *(id *)(a1 + 8 * v20 + 32);
    }
    uint64_t v23 = v22;
    ++v20;
    id v27 = v22;
    sub_22C053878(&v27, v4, v21, &v28.a, &v29.a, a3, a4, a3 * 0.5, a4 * 0.5);
  }
  while (v19 != v20);
LABEL_10:
  swift_bridgeObjectRelease();
  sub_22C053B6C(a1);
  id v24 = (void *)sub_22C06CD30();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setAccessibilityElements_, v24);

  if (_AXSCommandAndControlEnabled())
  {
    if (*MEMORY[0x263F21A08])
    {
      id v26 = (id)*MEMORY[0x263F21A08];
      UIAccessibilityPostNotification(*MEMORY[0x263F831C0], (id)*MEMORY[0x263F21A08]);

      return;
    }
LABEL_19:
    __break(1u);
    return;
  }
  UIAccessibilityNotifications v25 = *MEMORY[0x263F831C0];

  UIAccessibilityPostNotification(v25, v4);
}

void sub_22C053878(id *a1, void *a2, char a3, CGFloat *a4, CGFloat *a5, double a6, double a7, CGFloat a8, CGFloat a9)
{
  CGFloat v54 = *a5;
  CGFloat v50 = a5[2];
  CGFloat v51 = a5[1];
  CGFloat v48 = a5[4];
  CGFloat v49 = a5[3];
  CGFloat v46 = *a4;
  CGFloat v47 = a5[5];
  CGFloat v44 = a4[2];
  CGFloat v45 = a4[1];
  CGFloat v42 = a4[4];
  CGFloat v43 = a4[3];
  CGFloat v41 = a4[5];
  id v15 = *a1;
  objc_msgSend(*a1, sel_accessibilityFrame);
  double v19 = v18;
  double v21 = v20;
  double v22 = a6 - v16 - v18;
  double v23 = a7 - v17 - v20;
  int v24 = a3 & 1;
  if (v24) {
    double v25 = v17;
  }
  else {
    double v25 = v23;
  }
  if (v24) {
    double v26 = v16;
  }
  else {
    double v26 = v22;
  }
  objc_msgSend(a2, sel_frame);
  double v28 = v27 / a6;
  objc_msgSend(a2, sel_frame);
  objc_msgSend(v15, sel_setAccessibilityFrameInContainerSpace_, v26 * v28, v25 * (v29 / a7), v19 * v28, v21 * (v29 / a7));
  if (!v24)
  {
    long long v30 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v53.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v53.c = v30;
    *(_OWORD *)&v53.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    CGAffineTransformTranslate(&v52, &v53, a8, a9);
    CGAffineTransform v53 = v52;
    CGAffineTransformRotate(&v52, &v53, 3.14159265);
    CGAffineTransform v53 = v52;
    CGAffineTransformTranslate(&v52, &v53, -a8, -a9);
    long long v39 = *(_OWORD *)&v52.c;
    long long v40 = *(_OWORD *)&v52.a;
    tCGFloat x = v52.tx;
    tCGFloat y = v52.ty;
    id v33 = objc_msgSend(v15, sel_accessibilityPath);
    *(_OWORD *)&v53.a = v40;
    *(_OWORD *)&v53.c = v39;
    v53.tCGFloat x = tx;
    v53.tCGFloat y = ty;
    objc_msgSend(v33, sel_applyTransform_, &v53);
  }
  id v34 = objc_msgSend(v15, sel_accessibilityPath);
  v53.a = v46;
  v53.b = v45;
  v53.c = v44;
  v53.d = v43;
  v53.tCGFloat x = v42;
  v53.tCGFloat y = v41;
  objc_msgSend(v34, sel_applyTransform_, &v53);

  id v35 = objc_msgSend(v15, sel_accessibilityPath);
  v53.a = v54;
  v53.b = v51;
  v53.c = v50;
  v53.d = v49;
  v53.tCGFloat x = v48;
  v53.tCGFloat y = v47;
  objc_msgSend(v35, sel_applyTransform_, &v53);

  self;
  uint64_t v36 = swift_dynamicCastObjCClass();
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    id v38 = v15;
    objc_msgSend(v37, sel_setAxActionHandler_, a2);
    objc_msgSend(v37, sel_overrideAccessibilityMethodsForRemoteDevice);
  }
}

uint64_t sub_22C053B6C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_22C06CF70();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_22C054D90(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x230F5CFD0](i, a1);
        sub_22C054DB0();
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22C054D90(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_22C054D90(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_22C054DF0(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      id v8 = (id *)(a1 + 32);
      sub_22C054DB0();
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22C054D90(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_22C054D90(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_22C054DF0(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

id AXTwiceCompanionRendererView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

id AXTwiceCompanionRendererView.init(frame:)(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer] = 0;
  swift_unknownObjectWeakInit();
  sub_22C06CB70();
  id v9 = v4;
  unint64_t v10 = (void *)sub_22C06CAF0();
  char v11 = MEMORY[0x230F5CC60]();

  double v12 = 0.23;
  if (v11) {
    double v12 = 0.29;
  }
  *(double *)&v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_cornerRadiusRatio] = v12;

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for AXTwiceCompanionRendererView();
  return objc_msgSendSuper2(&v14, sel_initWithFrame_, a1, a2, a3, a4);
}

id AXTwiceCompanionRendererView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id AXTwiceCompanionRendererView.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer] = 0;
  swift_unknownObjectWeakInit();
  sub_22C06CB70();
  id v3 = v1;
  uint64_t v4 = (void *)sub_22C06CAF0();
  char v5 = MEMORY[0x230F5CC60]();

  double v6 = 0.23;
  if (v5) {
    double v6 = 0.29;
  }
  *(double *)&v3[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_cornerRadiusRatio] = v6;

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for AXTwiceCompanionRendererView();
  id v7 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);

  return v7;
}

id AXTwiceCompanionRendererView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXTwiceCompanionRendererView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL AXTwiceCompanionRendererView.perform(_:withValue:on:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_22C06CC00();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  double v12 = sub_22C06CBF0();
  os_log_type_t v13 = sub_22C06CDB0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v30 = a3;
    uint64_t v15 = v14;
    uint64_t v16 = swift_slowAlloc();
    v32[0] = v16;
    *(_DWORD *)uint64_t v15 = 136315394;
    uint64_t v29 = v8;
    uint64_t v31 = sub_22C0545D0(0xD000000000000018, 0x800000022C06EA00, v32);
    sub_22C06CE40();
    *(_WORD *)(v15 + 12) = 1024;
    LODWORD(v31) = a1;
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v12, v13, "[TWICE] %s %u", (uint8_t *)v15, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v16, -1, -1);
    uint64_t v17 = v15;
    a3 = v30;
    MEMORY[0x230F5D900](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v29);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  double v18 = (void *)MEMORY[0x230F5D960](v4 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_delegate);
  if (v18)
  {
    sub_22C054438(a2, (uint64_t)v32);
    uint64_t v19 = v33;
    if (v33)
    {
      double v20 = __swift_project_boxed_opaque_existential_0(v32, v33);
      uint64_t v21 = *(void *)(v19 - 8);
      MEMORY[0x270FA5388](v20);
      uint64_t v23 = a1;
      int v24 = (char *)&v28 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v21 + 16))(v24);
      uint64_t v25 = sub_22C06CFD0();
      double v26 = v24;
      a1 = v23;
      (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v19);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
    }
    else
    {
      uint64_t v25 = 0;
    }
    objc_msgSend(v18, sel_axActionPerformWithAction_value_bridgeElement_, a1, v25, a3);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  return v18 != 0;
}

uint64_t sub_22C054438(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26849E3D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

uint64_t sub_22C0545D0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22C0547AC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22C054968((uint64_t)v12, *a3);
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
      sub_22C054968((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t method lookup function for AXTwiceCompanionRendererView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AXTwiceCompanionRendererView);
}

uint64_t dispatch thunk of AXTwiceCompanionRendererView.addMirrorLayer(newLayer:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AXTwiceCompanionRendererView.addUIAccessibilityElements(_:rootViewSize:isCrownOnRightSide:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t sub_22C054724(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26849E3D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22C054784(uint64_t a1)
{
  return a1;
}

uint64_t sub_22C0547AC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_22C06CE50();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_22C0549C4(a5, a6);
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
  uint64_t v8 = sub_22C06CEE0();
  if (!v8)
  {
    sub_22C06CF50();
    __break(1u);
LABEL_17:
    uint64_t result = sub_22C06CFB0();
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

uint64_t sub_22C054968(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22C0549C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22C054A5C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22C054C3C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_22C054C3C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22C054A5C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_22C054BD4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_22C06CEC0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_22C06CF50();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_22C06CD00();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_22C06CFB0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_22C06CF50();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_22C054BD4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849E228);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22C054C3C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26849E228);
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
  uint64_t result = sub_22C06CFB0();
  __break(1u);
  return result;
}

uint64_t sub_22C054D90(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22C054E00(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

unint64_t sub_22C054DB0()
{
  unint64_t result = qword_26849E230;
  if (!qword_26849E230)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26849E230);
  }
  return result;
}

_OWORD *sub_22C054DF0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_22C054E00(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26849E238);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  os_log_type_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_22C06CFB0();
  __break(1u);
  return result;
}

void sub_22C054F70(int a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = v3;
  uint64_t v8 = sub_22C06CC20();
  uint64_t v21 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_22C06CC50();
  uint64_t v11 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  os_log_type_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 128))(a2, a3);
  unsigned int v15 = objc_msgSend(v14, sel_isHidden);

  if (((v15 ^ a1) & 1) == 0)
  {
    sub_22C055610();
    uint64_t v16 = (void *)sub_22C06CDF0();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a2;
    *(void *)(v17 + 24) = a3;
    *(void *)(v17 + 32) = v4;
    *(unsigned char *)(v17 + 40) = a1 & 1;
    aBlock[4] = sub_22C055688;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22C0510D0;
    aBlock[3] = &block_descriptor_1;
    double v18 = _Block_copy(aBlock);
    id v19 = v4;
    swift_release();
    sub_22C06CC30();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_22C0556B0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26849DFC0);
    sub_22C051E14();
    sub_22C06CE70();
    MEMORY[0x230F5CF00](0, v13, v10, v18);
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v20);
  }
}

void sub_22C055244(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  int64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 128);
  uint64_t v8 = (void *)v7(a3, a4);
  objc_msgSend(v8, sel_setHidden_, (a2 & 1) == 0);

  uint64_t v9 = (void *)v7(a3, a4);
  id v11 = v9;
  uint64_t v10 = &selRef_startAnimating;
  if ((a2 & 1) == 0) {
    uint64_t v10 = &selRef_stopAnimating;
  }
  [v9 *v10];
}

Swift::Void __swiftcall AXTwiceCompanionDeviceView.addScreenSubLayer(layer:)(CALayer layer)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  unint64_t v6 = *(void (**)(Class, uint64_t, uint64_t))(v2 + 184);
  int64_t v7 = layer.super.isa;
  v6(layer.super.isa, v4, v3);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 152))(v4, v3);
  if (v8)
  {
    id v9 = (id)v8;
    sub_22C053404(v7);
  }
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.leftPadding.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.leftPadding.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.leftPadding.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.leftConstraint.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.leftConstraint.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.leftConstraint.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rightPadding.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rightPadding.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rightPadding.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rightContraint.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rightContraint.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rightContraint.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.deviceChromeView.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.deviceChromeView.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.deviceChromeView.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.deviceSpinner.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.deviceSpinner.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.deviceSpinner.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 144))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rendererView.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rendererView.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 160))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rendererView.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 168))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.mirroringLayer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 176))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.mirroringLayer.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 184))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.mirroringLayer.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 192))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.makeViewAccessible(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 200))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.normalizedScreenPoint(normalizedPoint:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 208))();
}

unint64_t sub_22C055610()
{
  unint64_t result = qword_26849E360;
  if (!qword_26849E360)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26849E360);
  }
  return result;
}

uint64_t sub_22C055650()
{
  return MEMORY[0x270FA0238](v0, 41, 7);
}

void sub_22C055688()
{
  sub_22C055244(*(void *)(v0 + 32), *(unsigned char *)(v0 + 40), *(void *)(v0 + 16), *(void *)(v0 + 24));
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

unint64_t sub_22C0556B0()
{
  unint64_t result = qword_26849E4D0;
  if (!qword_26849E4D0)
  {
    sub_22C06CC20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26849E4D0);
  }
  return result;
}

Swift::Void __swiftcall AXTwiceCompanionWatchView.updateNanoCrownOrientation(shouldDelayUpdatingView:)(Swift::Bool shouldDelayUpdatingView)
{
  double v1 = 0.1;
  if (shouldDelayUpdatingView) {
    double v1 = 1.0;
  }
  sub_22C05AA74(v1);
}

void sub_22C055720()
{
  unint64_t v1 = (unint64_t)objc_msgSend(v0, sel_accessibilityTraits);
  if ((*MEMORY[0x263F83250] & ~v1) == 0)
  {
    uint64_t v2 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer;
    if (!*(void *)&v0[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer])
    {
      uint64_t v3 = self;
      double v4 = *(double *)&v0[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchInterval];
      uint64_t v5 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v9[4] = sub_22C05AE28;
      v9[5] = v5;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 1107296256;
      v9[2] = sub_22C055950;
      v9[3] = &block_descriptor_2;
      unint64_t v6 = _Block_copy(v9);
      swift_release();
      id v7 = objc_msgSend(v3, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v6, v4);
      _Block_release(v6);
      uint64_t v8 = *(void **)&v0[v2];
      *(void *)&v0[v2] = v7;
    }
  }
}

void sub_22C055870(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x230F5D960](v2);
  if (v3)
  {
    double v4 = (void *)v3;
    id v5 = objc_retain(*(id *)(v3
                           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer));

    objc_msgSend(v5, sel_invalidate);
  }
  swift_beginAccess();
  unint64_t v6 = (char *)MEMORY[0x230F5D960](v2);
  if (v6)
  {
    id v7 = *(void **)&v6[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer];
    *(void *)&v6[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer] = 0;
  }
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x230F5D960](v2);
  if (v8)
  {
    id v9 = (void *)v8;
    sub_22C055A00();
  }
}

void sub_22C055950(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_22C055A00()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_22C06CC00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  unint64_t v6 = sub_22C06CBF0();
  os_log_type_t v7 = sub_22C06CDB0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v13 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v12 = sub_22C0545D0(0xD00000000000001DLL, 0x800000022C06F6C0, &v13);
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v6, v7, "[TWICE] %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v9, -1, -1);
    MEMORY[0x230F5D900](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v1, sel_setAccessibilityTraits_, *MEMORY[0x263F83260]);
  UIAccessibilityNotifications v10 = *MEMORY[0x263F83188];
  id v11 = (void *)sub_22C06CCC0();
  UIAccessibilityPostNotification(v10, v11);
}

id AXTwiceWatchCrownButton.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

id AXTwiceWatchCrownButton.init(frame:)(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer] = 0;
  *(void *)&v4[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchInterval] = 0x3FF0000000000000;
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for AXTwiceWatchCrownButton();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

id AXTwiceWatchCrownButton.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id AXTwiceWatchCrownButton.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchInterval] = 0x3FF0000000000000;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AXTwiceWatchCrownButton();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id AXTwiceWatchCrownButton.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXTwiceWatchCrownButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22C055F04()
{
  unint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_22C055F4C(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_22C055F98())()
{
  return j_j__swift_endAccess;
}

double sub_22C055FF4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_22C05603C(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_22C056090())()
{
  return j_j__swift_endAccess;
}

void *sub_22C0560EC()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftConstraint);
  swift_beginAccess();
  objc_super v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_22C05613C(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftConstraint);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_22C056190())()
{
  return j_j__swift_endAccess;
}

double sub_22C0561EC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_22C056234(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_22C056288())()
{
  return j_j__swift_endAccess;
}

void *sub_22C0562E4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightContraint);
  swift_beginAccess();
  objc_super v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_22C056334(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightContraint);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_22C056388())()
{
  return j_j__swift_endAccess;
}

void *sub_22C0563E4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView);
  swift_beginAccess();
  objc_super v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_22C056434(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_22C056488())()
{
  return j__swift_endAccess;
}

id sub_22C0564E4()
{
  type metadata accessor for AXTwiceWatchCrownButton();
  id v0 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v1 = self;
  id v2 = v0;
  id v3 = objc_msgSend(v1, sel_clearColor);
  objc_msgSend(v2, sel_setBackgroundColor_, v3);

  objc_msgSend(v2, sel_setIsAccessibilityElement_, 0);
  sub_22C06CB70();
  id v4 = v2;
  objc_super v5 = (void *)sub_22C06CAF0();
  sub_22C06CB00();

  unint64_t v6 = (void *)sub_22C06CCC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setAccessibilityLabel_, v6);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26849E310);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_22C06E010;
  id v8 = v4;
  id v9 = (void *)sub_22C06CAF0();
  uint64_t v10 = sub_22C06CB00();
  uint64_t v12 = v11;

  *(void *)(v7 + 32) = v10;
  *(void *)(v7 + 40) = v12;
  uint64_t v13 = (void *)sub_22C06CD30();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setAccessibilityUserInputLabels_, v13);

  objc_msgSend(v8, sel_setAccessibilityTraits_, *MEMORY[0x263F83260]);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v8;
}

id sub_22C0566E4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton);
  swift_beginAccess();
  id v2 = *v1;

  return v2;
}

void sub_22C05673C(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_22C056790())()
{
  return j_j__swift_endAccess;
}

void *sub_22C0567EC()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_22C05683C(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_22C056890())()
{
  return j_j__swift_endAccess;
}

void *sub_22C0568EC()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_22C05693C(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_22C056990())()
{
  return j_j__swift_endAccess;
}

id sub_22C0569EC()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton);
  swift_beginAccess();
  id v2 = *v1;

  return v2;
}

void sub_22C056A44(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_22C056A98())()
{
  return j_j__swift_endAccess;
}

void *sub_22C056AF4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_22C056B44(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_22C056B98())()
{
  return j_j__swift_endAccess;
}

void *sub_22C056BF4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_mirroringLayer);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_22C056C44(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_mirroringLayer);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_22C056C98())()
{
  return j_j__swift_endAccess;
}

id sub_22C056CF4()
{
  uint64_t v1 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F823E8]), sel_initWithActivityIndicatorStyle_, 100);
    id v5 = objc_msgSend(self, sel_whiteColor);
    objc_msgSend(v4, sel_setColor_, v5);

    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v4, sel_stopAnimating);
    objc_msgSend(v4, sel_setHidden_, 1);
    unint64_t v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v7 = v2;
  return v3;
}

uint64_t sub_22C056DE4(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_22C056DF8(id *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = sub_22C056CF4();
  return sub_22C056E40;
}

void sub_22C056E40(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner);
  *(void *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner) = v2;
}

id sub_22C056E58(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  id v7 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v6, sel_setBackgroundColor_, v7);

  objc_msgSend(v6, sel_setIsAccessibilityElement_, 0);
  sub_22C06CB70();
  id v8 = v6;
  id v9 = (void *)sub_22C06CAF0();
  a3(a1, a2);

  uint64_t v10 = (void *)sub_22C06CCC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setAccessibilityLabel_, v10);

  objc_msgSend(v8, sel_setAccessibilityTraits_, *MEMORY[0x263F83260]);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v8;
}

id sub_22C056FA0()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_22C056FF8(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_22C05704C())()
{
  return j_j__swift_endAccess;
}

__CFString *sub_22C0570A8(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide;
  uint64_t v10 = v4;
  *((unsigned char *)v4 + v9) = AXIsCrownOrientationOnRightSide();
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding] = 0;
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftConstraint] = 0;
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding] = 0;
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightContraint] = 0;
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView] = 0;
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonTopConstraint] = 0;
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonHorizontalConstraint] = 0;
  uint64_t v11 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton;
  *(void *)&v10[v11] = sub_22C0564E4();
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture] = 0;
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture] = 0;
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonTopConstraint] = 0;
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonHorizontalConstraint] = 0;
  uint64_t v12 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton;
  *(void *)&v10[v12] = sub_22C056E58(0xD00000000000001ALL, 0x800000022C06F570, MEMORY[0x263F21DC8]);
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewLeftConstraint] = 0;
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewRightConstraint] = 0;
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView] = 0;
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_mirroringLayer] = 0;
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner] = 0;
  uint64_t v13 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_hasStingSupport;
  sub_22C06CB70();
  uint64_t v14 = (void *)sub_22C06CAF0();
  LOBYTE(v9) = MEMORY[0x230F5CC60]();

  v10[v13] = v9 & 1;
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonTopConstraint] = 0;
  *(void *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonHorizontalConstraint] = 0;
  uint64_t v15 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton;
  *(void *)&v10[v15] = sub_22C056E58(0xD00000000000001BLL, 0x800000022C06F550, MEMORY[0x263F21DD0]);

  uint64_t v16 = (objc_class *)type metadata accessor for AXTwiceCompanionWatchView();
  v180.receiver = v10;
  v180.super_class = v16;
  uint64_t v17 = (char *)objc_msgSendSuper2(&v180, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v18 = objc_msgSend(self, sel_watchView);
  id v19 = (id *)&v17[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView];
  swift_beginAccess();
  id v20 = *v19;
  *id v19 = v18;

  v167 = v19;
  if (*v19) {
    objc_msgSend(*v19, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  }
  v174 = v16;
  type metadata accessor for AXTwiceCompanionRendererView();
  id v21 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v22 = (id *)&v17[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView];
  swift_beginAccess();
  id v23 = *v22;
  *uint64_t v22 = v21;

  if (*v22)
  {
    objc_msgSend(*v22, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    if (*v22) {
      objc_msgSend(*v22, sel_setContentMode_, 1);
    }
  }
  v165 = v22;
  id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CB0]), sel_initWithTarget_action_, v17, sel_digitalCrownButtonTappedWithSender_);
  objc_msgSend(v24, sel_setNumberOfTapsRequired_, 1);
  objc_msgSend(v24, sel_setNumberOfTouchesRequired_, 1);
  uint64_t v25 = (id *)&v17[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton];
  swift_beginAccess();
  objc_msgSend(*v25, sel_addGestureRecognizer_, v24);
  sub_22C059CC4();
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CB0]), (SEL)&off_264909618, v17, sel_doubleCrownButtonTappedWithSender_);
  objc_msgSend(v26, sel_setNumberOfTapsRequired_, 2);
  objc_msgSend(v26, sel_setNumberOfTouchesRequired_, 1);
  objc_msgSend(v24, sel_requireGestureRecognizerToFail_, v26);
  objc_msgSend(*v25, sel_addGestureRecognizer_, v26);
  id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CB0]), sel_initWithTarget_action_, v17, sel_tripleCrownButtonTappedWithSender_);
  objc_msgSend(v27, sel_setNumberOfTapsRequired_, 3);
  objc_msgSend(v27, sel_setNumberOfTouchesRequired_, 1);
  v172 = v26;
  objc_msgSend(v26, sel_requireGestureRecognizerToFail_, v27);
  v173 = v24;
  objc_msgSend(v24, sel_requireGestureRecognizerToFail_, v27);
  v176 = v25;
  v171 = v27;
  objc_msgSend(*v25, sel_addGestureRecognizer_, v27);
  id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82C38]), sel_initWithTarget_action_, v17, sel_digitalCrownSwipeUpWithGesture_);
  uint64_t v29 = (id *)&v17[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture];
  swift_beginAccess();
  id v30 = *v29;
  *uint64_t v29 = v28;

  if (*v29)
  {
    objc_msgSend(*v29, sel_setDirection_, 4);
    if (*v29) {
      objc_msgSend(*v25, sel_addGestureRecognizer_);
    }
  }
  id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82C38]), sel_initWithTarget_action_, v17, sel_digitalCrownSwipeDownWithGesture_);
  id v32 = (id *)&v17[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture];
  swift_beginAccess();
  id v33 = *v32;
  *id v32 = v31;

  if (*v32)
  {
    objc_msgSend(*v32, sel_setDirection_, 8);
    if (*v32) {
      objc_msgSend(*v25, sel_addGestureRecognizer_);
    }
  }
  id v170 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82938]), sel_initWithTarget_action_, v17, sel_digitalCrownLongPressedWithGesture_);
  objc_msgSend(*v25, sel_addGestureRecognizer_);
  id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CB0]), sel_initWithTarget_action_, v17, sel_sideButtonTappedWithSender_);
  objc_msgSend(v34, sel_setNumberOfTapsRequired_, 1);
  objc_msgSend(v34, sel_setNumberOfTouchesRequired_, 1);
  id v35 = (id *)&v17[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton];
  swift_beginAccess();
  v169 = v34;
  objc_msgSend(*v35, sel_addGestureRecognizer_, v34);
  id v168 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82938]), sel_initWithTarget_action_, v17, sel_sideButtonLongPressedWithGesture_);
  objc_msgSend(*v35, sel_addGestureRecognizer_);
  v163 = v35;
  id v36 = *v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849DFB0);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_22C06E020;
  sub_22C0524D8(0, &qword_26849E2C8);
  id v38 = v36;
  long long v39 = (void *)sub_22C06CAF0();
  uint64_t v40 = sub_22C06CB00();
  uint64_t v42 = v41;

  v179 = v174;
  v178[0] = v17;
  CGFloat v43 = v17;
  *(void *)(v37 + 32) = sub_22C0586B8(v40, v42, v178, (uint64_t)sel_sideButtonAXLongPressed_);
  v178[0] = v37;
  sub_22C06CD60();
  CGFloat v44 = (void *)sub_22C06CD30();
  swift_bridgeObjectRelease();
  objc_msgSend(v38, sel_setAccessibilityCustomActions_, v44);

  uint64_t v162 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_hasStingSupport;
  if (*((unsigned char *)&v43->isa + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_hasStingSupport) == 1)
  {
    id v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CB0]), sel_initWithTarget_action_, v43, sel_stingButtonTappedWithSender_);
    objc_msgSend(v45, sel_setNumberOfTapsRequired_, 1);
    objc_msgSend(v45, sel_setNumberOfTouchesRequired_, 1);
    CGFloat v46 = (void **)((char *)&v43->isa
                  + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton);
    swift_beginAccess();
    v161 = v45;
    objc_msgSend(*v46, sel_addGestureRecognizer_, v45);
    id v160 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82938]), sel_initWithTarget_action_, v43, sel_stingButtonLongPressedWithGesture_);
    objc_msgSend(*v46, sel_addGestureRecognizer_);
    uint64_t v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = xmmword_22C06E020;
    CGFloat v48 = (void *)sub_22C06CAF0();
    uint64_t v49 = sub_22C06CB50();
    uint64_t v51 = v50;

    v179 = v174;
    v178[0] = v43;
    CGAffineTransform v52 = v43;
    *(void *)(v47 + 32) = sub_22C0586B8(v49, v51, v178, (uint64_t)sel_stingButtonAXKeycord_);
    v178[0] = v47;
    sub_22C06CD60();
    uint64_t v177 = v178[0];
    CGAffineTransform v53 = (void *)sub_22C06CAF0();
    uint64_t v54 = sub_22C06CB50();
    uint64_t v56 = v55;

    v179 = v174;
    v178[0] = v52;
    id v57 = v52;
    sub_22C0586B8(v54, v56, v178, (uint64_t)sel_stingButtonAXLongPressed_);
    MEMORY[0x230F5CE20]();
    if (*(void *)((v177 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v177 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_22C06CD70();
    }
    sub_22C06CD80();
    sub_22C06CD60();
    id v58 = *v46;
    uint64_t v59 = (void *)sub_22C06CD30();
    swift_bridgeObjectRelease();
    objc_msgSend(v58, sel_setAccessibilityCustomActions_, v59);
  }
  if (*v167)
  {
    v60 = *v165;
    if (*v165)
    {
      id v61 = *v167;
      id v62 = v60;
      [(__CFString *)v43 addSubview:v61];
      uint64_t v63 = self;
      uint64_t v64 = swift_allocObject();
      *(_OWORD *)(v64 + 16) = xmmword_22C06E030;
      id v65 = objc_msgSend(v61, sel_topAnchor);
      id v66 = [(__CFString *)v43 topAnchor];
      id v67 = v62;
      id v68 = objc_msgSend(v65, sel_constraintEqualToAnchor_, v66);

      *(void *)(v64 + 32) = v68;
      id v69 = objc_msgSend(v61, sel_leadingAnchor);
      id v70 = [(__CFString *)v43 leadingAnchor];
      id v71 = objc_msgSend(v69, sel_constraintEqualToAnchor_, v70);

      *(void *)(v64 + 40) = v71;
      id v72 = objc_msgSend(v61, sel_trailingAnchor);
      id v73 = [(__CFString *)v43 trailingAnchor];
      id v74 = objc_msgSend(v72, sel_constraintEqualToAnchor_, v73);

      *(void *)(v64 + 48) = v74;
      id v75 = objc_msgSend(v61, sel_bottomAnchor);
      id v76 = [(__CFString *)v43 bottomAnchor];
      id v77 = objc_msgSend(v75, sel_constraintEqualToAnchor_, v76);

      *(void *)(v64 + 56) = v77;
      id v78 = objc_msgSend(v61, sel_centerXAnchor);
      id v79 = [(__CFString *)v43 centerXAnchor];
      id v80 = objc_msgSend(v78, sel_constraintEqualToAnchor_, v79);

      *(void *)(v64 + 64) = v80;
      id v81 = objc_msgSend(v61, sel_centerYAnchor);
      id v82 = [(__CFString *)v43 centerYAnchor];
      id v83 = objc_msgSend(v81, sel_constraintEqualToAnchor_, v82);

      *(void *)(v64 + 72) = v83;
      v178[0] = v64;
      sub_22C06CD60();
      sub_22C0524D8(0, &qword_26849DFB8);
      uint64_t v84 = (void *)sub_22C06CD30();
      swift_bridgeObjectRelease();
      id v175 = v63;
      objc_msgSend(v63, sel_activateConstraints_, v84);

      id v85 = objc_msgSend(v67, sel_leftAnchor);
      id v86 = objc_msgSend(v61, sel_leftAnchor);
      id v87 = objc_msgSend(v85, sel_constraintEqualToAnchor_, v86);

      uint64_t v88 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewLeftConstraint;
      uint64_t v89 = *(void **)((char *)&v43->isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewLeftConstraint);
      *(void **)((char *)&v43->isa
               + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewLeftConstraint) = v87;

      id v90 = objc_msgSend(v67, sel_rightAnchor);
      id v91 = objc_msgSend(v61, sel_rightAnchor);
      id v92 = objc_msgSend(v90, sel_constraintEqualToAnchor_, v91);

      uint64_t v93 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewRightConstraint;
      id v94 = *(void **)((char *)&v43->isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewRightConstraint);
      *(void **)((char *)&v43->isa
               + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewRightConstraint) = v92;

      sub_22C058830();
      id v95 = *(void **)((char *)&v43->isa + v88);
      if (v95)
      {
        id v96 = *(void **)((char *)&v43->isa + v93);
        if (v96)
        {
          id v97 = v95;
          id v98 = v96;
          [(__CFString *)v43 addSubview:v67];
          uint64_t v99 = swift_allocObject();
          *(_OWORD *)(v99 + 16) = xmmword_22C06DDF0;
          *(void *)(v99 + 32) = v97;
          *(void *)(v99 + 40) = v98;
          id v166 = v97;
          id v164 = v98;
          id v100 = objc_msgSend(v67, sel_topAnchor);
          id v101 = objc_msgSend(v61, sel_topAnchor);
          v102 = (void *)sub_22C06CAF0();
          char v103 = MEMORY[0x230F5CC60]();

          if (v103) {
            double v104 = 25.0;
          }
          else {
            double v104 = 24.0;
          }
          id v105 = objc_msgSend(v100, sel_constraintEqualToAnchor_constant_, v101, v104);

          *(void *)(v99 + 48) = v105;
          id v106 = objc_msgSend(v67, sel_bottomAnchor);
          id v107 = objc_msgSend(v61, sel_bottomAnchor);
          id v108 = (void *)sub_22C06CAF0();
          char v109 = MEMORY[0x230F5CC60]();

          if (v109) {
            double v110 = 25.0;
          }
          else {
            double v110 = 24.0;
          }
          id v111 = objc_msgSend(v106, sel_constraintEqualToAnchor_constant_, v107, -v110);

          *(void *)(v99 + 56) = v111;
          v178[0] = v99;
          sub_22C06CD60();
          id v112 = (void *)sub_22C06CD30();
          swift_bridgeObjectRelease();
          objc_msgSend(v175, sel_activateConstraints_, v112);
        }
      }
      [(__CFString *)v43 addSubview:*v176];
      [(__CFString *)v43 addSubview:*v163];
      sub_22C0589AC();
      uint64_t v113 = swift_allocObject();
      *(_OWORD *)(v113 + 16) = xmmword_22C06DDF0;
      id v114 = objc_msgSend(*v176, sel_widthAnchor);
      id v115 = objc_msgSend(v114, sel_constraintEqualToConstant_, 45.0);

      *(void *)(v113 + 32) = v115;
      id v116 = objc_msgSend(*v176, sel_heightAnchor);
      id v117 = objc_msgSend(v67, sel_heightAnchor);
      id v118 = objc_msgSend(v116, sel_constraintEqualToAnchor_multiplier_, v117, 0.5);

      *(void *)(v113 + 40) = v118;
      id v119 = objc_msgSend(*v163, sel_widthAnchor);
      id v120 = objc_msgSend(*v176, sel_widthAnchor);
      id v121 = objc_msgSend(v119, sel_constraintEqualToAnchor_, v120);

      *(void *)(v113 + 48) = v121;
      id v122 = objc_msgSend(*v163, sel_heightAnchor);
      id v123 = objc_msgSend(*v176, sel_heightAnchor);
      id v124 = objc_msgSend(v122, sel_constraintEqualToAnchor_, v123);

      *(void *)(v113 + 56) = v124;
      v178[0] = v113;
      sub_22C06CD60();
      id v125 = (void *)sub_22C06CD30();
      swift_bridgeObjectRelease();
      objc_msgSend(v175, sel_activateConstraints_, v125);

      if (*((unsigned char *)&v43->isa + v162) == 1)
      {
        id v126 = (void **)((char *)&v43->isa
                       + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton);
        swift_beginAccess();
        [(__CFString *)v43 addSubview:*v126];
        sub_22C058F68();
        uint64_t v127 = swift_allocObject();
        *(_OWORD *)(v127 + 16) = xmmword_22C06DDC0;
        id v128 = objc_msgSend(*v126, sel_widthAnchor);
        id v129 = objc_msgSend(*v163, sel_widthAnchor);
        id v130 = objc_msgSend(v128, (SEL)0x2649092EELL, v129);

        *(void *)(v127 + 32) = v130;
        id v131 = objc_msgSend(*v126, sel_heightAnchor);
        id v132 = objc_msgSend(*v163, sel_heightAnchor);
        id v133 = objc_msgSend(v131, sel_constraintEqualToAnchor_, v132);

        *(void *)(v127 + 40) = v133;
        sub_22C06CD60();
        v134 = (void *)sub_22C06CD30();
        swift_bridgeObjectRelease();
        objc_msgSend(v175, sel_activateConstraints_, v134);
      }
      v135 = v43;
      id v136 = sub_22C056CF4();
      [(__CFString *)v135 addSubview:v136];

      uint64_t v137 = swift_allocObject();
      *(_OWORD *)(v137 + 16) = xmmword_22C06DDF0;
      id v138 = sub_22C056CF4();
      id v139 = objc_msgSend(v138, sel_centerXAnchor);

      id v140 = objc_msgSend(v67, sel_centerXAnchor);
      id v141 = objc_msgSend(v139, sel_constraintEqualToAnchor_, v140);

      *(void *)(v137 + 32) = v141;
      id v142 = sub_22C056CF4();
      id v143 = objc_msgSend(v142, sel_centerYAnchor);

      id v144 = objc_msgSend(v67, sel_centerYAnchor);
      id v145 = objc_msgSend(v143, (SEL)0x2649092EELL, v144);

      *(void *)(v137 + 40) = v145;
      id v146 = sub_22C056CF4();
      id v147 = objc_msgSend(v146, sel_widthAnchor);

      id v148 = objc_msgSend(v67, sel_widthAnchor);
      id v149 = objc_msgSend(v147, sel_constraintEqualToAnchor_multiplier_, v148, 0.5);

      *(void *)(v137 + 48) = v149;
      id v150 = sub_22C056CF4();
      id v151 = objc_msgSend(v150, sel_heightAnchor);

      id v152 = sub_22C056CF4();
      id v153 = objc_msgSend(v152, sel_heightAnchor);

      id v154 = objc_msgSend(v151, (SEL)0x2649092EELL, v153);
      *(void *)(v137 + 56) = v154;
      sub_22C06CD60();
      v155 = (void *)sub_22C06CD30();
      swift_bridgeObjectRelease();
      objc_msgSend(v175, sel_activateConstraints_, v155);
    }
  }
  uint64_t v156 = AXkNanoOrientationStatusNotificationID();
  if (v156)
  {
    v157 = (__CFString *)v156;
    v158 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v158, v43, (CFNotificationCallback)sub_22C05AA6C, v157, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  else
  {
    v157 = v43;
    v158 = (__CFNotificationCenter *)v168;
  }

  return v43;
}

id sub_22C0586B8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = (void *)sub_22C06CCC0();
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[3];
  if (v7)
  {
    id v8 = __swift_project_boxed_opaque_existential_0(a3, a3[3]);
    uint64_t v9 = *(void *)(v7 - 8);
    MEMORY[0x270FA5388](v8);
    uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    uint64_t v12 = sub_22C06CFD0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a3);
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithName_target_selector_, v6, v12, a4);

  swift_unknownObjectRelease();
  return v13;
}

void sub_22C058830()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewLeftConstraint);
  if (v2)
  {
    id v3 = (unsigned __int8 *)(v0
                           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
    swift_beginAccess();
    int v4 = *v3;
    sub_22C06CB70();
    id v5 = v2;
    id v6 = (void *)sub_22C06CAF0();
    char v7 = MEMORY[0x230F5CC60]();

    double v8 = 24.0;
    if (v7) {
      double v8 = 25.0;
    }
    double v9 = 41.0;
    if (v7) {
      double v9 = 44.0;
    }
    if (!v4) {
      double v8 = v9;
    }
    objc_msgSend(v5, sel_setConstant_, v8);
  }
  uint64_t v10 = *(void **)(v1
                 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewRightConstraint);
  if (v10)
  {
    uint64_t v11 = (unsigned __int8 *)(v1
                            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
    swift_beginAccess();
    int v12 = *v11;
    sub_22C06CB70();
    id v13 = v10;
    uint64_t v14 = (void *)sub_22C06CAF0();
    char v15 = MEMORY[0x230F5CC60]();

    double v16 = 41.0;
    if (v15) {
      double v16 = 44.0;
    }
    double v17 = 24.0;
    if (v15) {
      double v17 = 25.0;
    }
    if (!v12) {
      double v16 = v17;
    }
    objc_msgSend(v13, sel_setConstant_, -v16);
  }
}

void sub_22C0589AC()
{
  uint64_t v1 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonTopConstraint;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonTopConstraint);
  if (v2) {
    objc_msgSend(v2, sel_setActive_, 0);
  }
  id v3 = (id *)(v0
            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonHorizontalConstraint);
  int v4 = *(void **)(v0
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonHorizontalConstraint);
  if (v4) {
    objc_msgSend(v4, sel_setActive_, 0);
  }
  uint64_t v5 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonTopConstraint;
  id v6 = *(void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonTopConstraint);
  if (v6) {
    objc_msgSend(v6, sel_setActive_, 0);
  }
  char v7 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonHorizontalConstraint);
  double v8 = *(void **)(v0
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonHorizontalConstraint);
  if (v8) {
    objc_msgSend(v8, sel_setActive_, 0);
  }
  double v9 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView);
  swift_beginAccess();
  uint64_t v10 = *v9;
  if (*v9)
  {
    uint64_t v11 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
    swift_beginAccess();
    int v12 = *v11;
    if (*v11)
    {
      id v13 = (unsigned char *)(v0
                    + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
      swift_beginAccess();
      uint64_t v59 = v12;
      v60 = v10;
      if (*v13 == 1)
      {
        uint64_t v14 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton);
        swift_beginAccess();
        id v15 = *v14;
        id v16 = v10;
        id v17 = v12;
        id v18 = objc_msgSend(v15, sel_topAnchor);
        id v19 = [v17 (SEL)0x264909533];
        id v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

        id v21 = *(void **)(v0 + v1);
        *(void *)(v0 + v1) = v20;

        id v22 = objc_msgSend(*v14, sel_rightAnchor);
        id v23 = objc_msgSend(v16, byte_2649099DC);
        objc_msgSend(v16, sel_layoutMargins);
        id v25 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v23, v24);

        id v26 = *v3;
        *id v3 = v25;

        id v27 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton);
        swift_beginAccess();
        id v28 = objc_msgSend(*v27, sel_topAnchor);
        id v29 = objc_msgSend(*v14, sel_bottomAnchor);
        id v30 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v29);

        id v31 = *(void **)(v0 + v5);
        *(void *)(v0 + v5) = v30;

        id v32 = objc_msgSend(*v27, sel_rightAnchor);
        id v33 = objc_msgSend(*v14, sel_rightAnchor);
        id v34 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v33);
        id v35 = v7;
      }
      else
      {
        id v36 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton);
        swift_beginAccess();
        id v37 = *v36;
        id v38 = v10;
        id v39 = v12;
        id v40 = objc_msgSend(v37, sel_topAnchor);
        id v41 = [v39 (SEL)0x264909533];
        id v42 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v41);

        CGFloat v43 = *(void **)(v0 + v5);
        *(void *)(v0 + v5) = v42;

        id v44 = objc_msgSend(*v36, sel_leftAnchor);
        id v45 = objc_msgSend(v38, sel_leftAnchor);
        objc_msgSend(v38, sel_layoutMargins);
        id v47 = objc_msgSend(v44, sel_constraintEqualToAnchor_constant_, v45, -v46);

        id v48 = *v7;
        *char v7 = v47;

        uint64_t v49 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton);
        swift_beginAccess();
        id v50 = objc_msgSend(*v49, sel_topAnchor);
        id v51 = objc_msgSend(*v36, sel_bottomAnchor);
        id v52 = objc_msgSend(v50, sel_constraintEqualToAnchor_, v51);

        CGAffineTransform v53 = *(void **)(v0 + v1);
        *(void *)(v0 + v1) = v52;

        id v32 = objc_msgSend(*v49, sel_rightAnchor);
        id v33 = objc_msgSend(*v36, sel_rightAnchor);
        id v34 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v33);
        id v35 = v3;
      }
      id v54 = v34;

      uint64_t v55 = *v35;
      id *v35 = v54;

      uint64_t v56 = *(void **)(v0 + v1);
      if (v56) {
        objc_msgSend(v56, sel_setActive_, 1);
      }
      if (*v3) {
        objc_msgSend(*v3, sel_setActive_, 1);
      }
      id v57 = *(void **)(v0 + v5);
      if (v57) {
        objc_msgSend(v57, sel_setActive_, 1);
      }
      if (*v7)
      {
        id v58 = *v7;
        objc_msgSend(v58, sel_setActive_, 1);
      }
    }
  }
}

void sub_22C058F68()
{
  uint64_t v1 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonTopConstraint;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonTopConstraint);
  if (v2) {
    objc_msgSend(v2, sel_setActive_, 0);
  }
  uint64_t v3 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonHorizontalConstraint;
  int v4 = *(void **)(v0
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonHorizontalConstraint);
  if (v4) {
    objc_msgSend(v4, sel_setActive_, 0);
  }
  uint64_t v5 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView);
  swift_beginAccess();
  id v6 = *v5;
  if (*v5)
  {
    char v7 = (unsigned __int8 *)(v0
                           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
    swift_beginAccess();
    int v8 = *v7;
    double v9 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton);
    if (v8 == 1)
    {
      swift_beginAccess();
      id v10 = *v9;
      id v11 = v6;
      id v12 = objc_msgSend(v10, sel_topAnchor);
      id v13 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton);
      swift_beginAccess();
      id v14 = objc_msgSend(*v13, sel_topAnchor);
      id v15 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v14);

      id v16 = *(void **)(v0 + v1);
      *(void *)(v0 + v1) = v15;

      id v17 = objc_msgSend(*v9, sel_leftAnchor);
      id v18 = objc_msgSend(v11, sel_leftAnchor);
      objc_msgSend(v11, sel_layoutMargins);
      double v20 = -v19;
    }
    else
    {
      swift_beginAccess();
      id v21 = *v9;
      id v22 = v6;
      id v23 = objc_msgSend(v21, sel_topAnchor);
      double v24 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton);
      swift_beginAccess();
      id v25 = objc_msgSend(*v24, sel_topAnchor);
      id v26 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v25);

      id v27 = *(void **)(v0 + v1);
      *(void *)(v0 + v1) = v26;

      id v17 = objc_msgSend(*v9, sel_rightAnchor);
      id v18 = objc_msgSend(v22, sel_rightAnchor);
      objc_msgSend(v22, sel_layoutMargins);
      double v20 = v28;
    }
    id v29 = objc_msgSend(v17, sel_constraintEqualToAnchor_constant_, v18, v20);

    id v30 = *(void **)(v0 + v3);
    *(void *)(v0 + v3) = v29;

    id v31 = *(void **)(v0 + v1);
    if (v31) {
      objc_msgSend(v31, sel_setActive_, 1);
    }
    id v32 = *(void **)(v0 + v3);
    if (v32)
    {
      id v33 = v32;
      objc_msgSend(v33, sel_setActive_, 1);
    }
  }
}

id AXTwiceCompanionWatchView.__deallocating_deinit()
{
  uint64_t v1 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(v1, v0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for AXTwiceCompanionWatchView();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_22C0594EC(int a1)
{
  uint64_t v2 = v1;
  LODWORD(v3) = a1;
  uint64_t v4 = sub_22C06CC00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  int v8 = sub_22C06CBF0();
  os_log_type_t v9 = sub_22C06CDB0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    HIDWORD(v17) = v3;
    objc_super v3 = (uint8_t *)v10;
    uint64_t v11 = swift_slowAlloc();
    v19[0] = v11;
    *(_DWORD *)objc_super v3 = 136315138;
    uint64_t v18 = sub_22C0545D0(0xD000000000000016, 0x800000022C06ED50, v19);
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v8, v9, "[TWICE] %s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v11, -1, -1);
    id v12 = v3;
    LOBYTE(v3) = BYTE4(v17);
    MEMORY[0x230F5D900](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v13 = (id *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton);
  swift_beginAccess();
  objc_msgSend(*v13, sel_setIsAccessibilityElement_, v3 & 1);
  id v14 = (id *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton);
  swift_beginAccess();
  id result = objc_msgSend(*v14, sel_setIsAccessibilityElement_, v3 & 1);
  if (*(unsigned char *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_hasStingSupport) == 1)
  {
    id v16 = (id *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton);
    swift_beginAccess();
    return objc_msgSend(*v16, sel_setIsAccessibilityElement_, v3 & 1);
  }
  return result;
}

uint64_t sub_22C05977C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22C06CC00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  id v8 = a1;
  os_log_type_t v9 = sub_22C06CBF0();
  os_log_type_t v10 = sub_22C06CDB0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v26 = v2;
    uint64_t v12 = v11;
    id v13 = (void *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    v28[0] = v24;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v27 = sub_22C0545D0(0xD000000000000019, 0x800000022C06ED70, v28);
    uint64_t v25 = v5;
    sub_22C06CE40();
    *(_WORD *)(v12 + 12) = 2112;
    uint64_t v23 = v4;
    uint64_t v27 = (uint64_t)v8;
    id v14 = v8;
    sub_22C06CE40();
    void *v13 = v8;

    _os_log_impl(&dword_22C04B000, v9, v10, "[TWICE] %s %@", (uint8_t *)v12, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26849E3E0);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v13, -1, -1);
    uint64_t v15 = v24;
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v15, -1, -1);
    uint64_t v16 = v12;
    uint64_t v2 = v26;
    MEMORY[0x230F5D900](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v23);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v17 = (void **)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_mirroringLayer);
  swift_beginAccess();
  uint64_t v18 = *v17;
  char *v17 = v8;
  id v19 = v8;

  double v20 = (id *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
  swift_beginAccess();
  if (*v20)
  {
    id v21 = *v20;
    sub_22C053404(v19);
  }
  return sub_22C05AA74(1.0);
}

uint64_t sub_22C059A98(double a1, double a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
  swift_beginAccess();
  if (!*v5) {
    return 0;
  }
  uint64_t v6 = *(void **)(*v5 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer);
  if (!v6) {
    return 0;
  }
  char v7 = self;
  id v8 = v6;
  id v9 = objc_msgSend(v7, sel_mainScreen);
  objc_msgSend(v9, sel_bounds);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v38.origin.double x = v11;
  v38.origin.CGFloat y = v13;
  v38.size.CGFloat width = v15;
  v38.size.CGFloat height = v17;
  double v18 = CGRectGetWidth(v38) * a1;
  id v19 = objc_msgSend(v7, sel_mainScreen);
  objc_msgSend(v19, sel_bounds);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v39.origin.double x = v21;
  v39.origin.CGFloat y = v23;
  v39.size.CGFloat width = v25;
  v39.size.CGFloat height = v27;
  CGFloat v28 = CGRectGetHeight(v39) * a2;
  objc_msgSend(v8, sel_bounds);
  objc_msgSend(v8, sel_convertRect_toLayer_, 0);
  double x = v40.origin.x;
  CGFloat y = v40.origin.y;
  CGFloat width = v40.size.width;
  CGFloat height = v40.size.height;
  v37.double x = v18;
  v37.CGFloat y = v28;
  if (!CGRectContainsPoint(v40, v37))
  {

    return 0;
  }
  v41.origin.double x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double v33 = (v18 - x) / CGRectGetWidth(v41);
  v42.origin.double x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  CGRectGetHeight(v42);

  id v34 = (unsigned char *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
  swift_beginAccess();
  double v35 = 1.0 - v33;
  if (*v34) {
    double v35 = v33;
  }
  return *(void *)&v35;
}

void sub_22C059CC4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849DFB0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_22C06DDF0;
  sub_22C0524D8(0, &qword_26849E2C8);
  sub_22C06CB70();
  objc_super v3 = (void *)sub_22C06CAF0();
  uint64_t v4 = sub_22C06CB00();
  uint64_t v6 = v5;

  uint64_t v7 = type metadata accessor for AXTwiceCompanionWatchView();
  uint64_t v33 = v7;
  v32[0] = v1;
  id v8 = v1;
  *(void *)(v2 + 32) = sub_22C0586B8(v4, v6, v32, (uint64_t)sel_digitalCrownButtonScrollUp_);
  id v9 = (void *)sub_22C06CAF0();
  uint64_t v10 = sub_22C06CB00();
  uint64_t v12 = v11;

  uint64_t v33 = v7;
  v32[0] = v8;
  id v13 = v8;
  *(void *)(v2 + 40) = sub_22C0586B8(v10, v12, v32, (uint64_t)sel_digitalCrownButtonScrollDown_);
  double v14 = (void *)sub_22C06CAF0();
  uint64_t v15 = sub_22C06CB00();
  uint64_t v17 = v16;

  uint64_t v33 = v7;
  v32[0] = v13;
  id v18 = v13;
  *(void *)(v2 + 48) = sub_22C0586B8(v15, v17, v32, (uint64_t)sel_doubleDigitalCrownButtonTapped_);
  id v19 = (void *)sub_22C06CAF0();
  uint64_t v20 = sub_22C06CB00();
  uint64_t v22 = v21;

  uint64_t v33 = v7;
  v32[0] = v18;
  CGFloat v23 = (char *)v18;
  *(void *)(v2 + 56) = sub_22C0586B8(v20, v22, v32, (uint64_t)sel_tripleDigitalCrownButtonTapped_);
  v32[0] = v2;
  sub_22C06CD60();
  uint64_t v34 = v32[0];
  double v24 = (void *)sub_22C06CAF0();
  uint64_t v25 = sub_22C06CB00();
  uint64_t v27 = v26;

  uint64_t v33 = v7;
  v32[0] = v23;
  CGFloat v28 = v23;
  sub_22C0586B8(v25, v27, v32, (uint64_t)sel_digitalCrownAXLongPressed_);
  MEMORY[0x230F5CE20]();
  if (*(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_22C06CD70();
  }
  sub_22C06CD80();
  sub_22C06CD60();
  id v29 = (id *)&v23[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton];
  swift_beginAccess();
  id v30 = *v29;
  id v31 = (void *)sub_22C06CD30();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_setAccessibilityCustomActions_, v31);
}

void sub_22C05A464(uint64_t a1, SEL *a2)
{
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x230F5D960](a1);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = (id *)(v4 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
    swift_beginAccess();
    id v7 = *v6;
    id v8 = (char *)*v6;

    if (v7)
    {
      id v9 = (void *)MEMORY[0x230F5D960](&v8[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_delegate]);

      if (v9)
      {
        [v9 *a2];
        swift_unknownObjectRelease();
      }
    }
  }
}

void sub_22C05A52C(void *a1, uint64_t a2, void *a3, SEL *a4)
{
  swift_unknownObjectWeakInit();
  id v7 = a3;
  id v8 = a1;
  sub_22C05C25C(v7, (uint64_t)v9, a4);
  swift_unknownObjectWeakDestroy();
}

uint64_t (*sub_22C05A94C())()
{
  return j_j__swift_endAccess;
}

void (*sub_22C05A9AC(id **a1))(void *a1)
{
  uint64_t v2 = (id *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_22C056DF8(v2);
  return sub_22C05AA04;
}

void sub_22C05AA04(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_22C05AA50(double a1, double a2)
{
  return sub_22C059A98(a1, a2);
}

void sub_22C05AA6C(uint64_t a1, void *a2)
{
}

uint64_t sub_22C05AA74(double a1)
{
  uint64_t v3 = sub_22C06CC20();
  uint64_t v24 = *(void *)(v3 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22C06CC50();
  uint64_t v22 = *(void *)(v6 - 8);
  uint64_t v23 = v6;
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22C06CC70();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v21 - v14;
  sub_22C0524D8(0, (unint64_t *)&qword_26849E360);
  uint64_t v16 = (void *)sub_22C06CDF0();
  sub_22C06CC60();
  MEMORY[0x230F5CD90](v13, a1);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v10 + 8);
  v21(v13, v9);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v1;
  aBlock[4] = sub_22C05D448;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22C0510D0;
  aBlock[3] = &block_descriptor_95;
  id v18 = _Block_copy(aBlock);
  id v19 = v1;
  swift_release();
  sub_22C06CC30();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22C0556B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849DFC0);
  sub_22C051E14();
  sub_22C06CE70();
  MEMORY[0x230F5CED0](v15, v8, v5, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v23);
  return ((uint64_t (*)(char *, uint64_t))v21)(v15, v9);
}

uint64_t sub_22C05ADF0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22C05AE28(uint64_t a1)
{
  sub_22C055870(a1, v1);
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

uint64_t type metadata accessor for AXTwiceWatchCrownButton()
{
  return self;
}

uint64_t type metadata accessor for AXTwiceCompanionWatchView()
{
  return self;
}

id sub_22C05AE90(unsigned char *a1)
{
  uint64_t v2 = &a1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide];
  swift_beginAccess();
  int v3 = *v2;
  uint64_t v4 = (id *)&a1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView];
  swift_beginAccess();
  if (*v4)
  {
    if (v3) {
      double v5 = 0.0;
    }
    else {
      double v5 = 1.0;
    }
    id v6 = *v4;
    id v7 = objc_msgSend(v6, sel_layer);
    CATransform3DMakeRotation(&v9, 3.14159265, 0.0, 0.0, v5);
    objc_msgSend(v7, sel_setTransform_, &v9);
  }
  sub_22C05AFD0();
  sub_22C058830();
  sub_22C0589AC();
  if (a1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_hasStingSupport] == 1) {
    sub_22C058F68();
  }
  return objc_msgSend(a1, sel_setNeedsUpdateConstraints);
}

id sub_22C05AFD0()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftConstraint);
  swift_beginAccess();
  uint64_t v2 = *v1;
  if (v2)
  {
    int v3 = (unsigned char *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
    swift_beginAccess();
    if (*v3 == 1) {
      uint64_t v4 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding;
    }
    else {
      uint64_t v4 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding;
    }
    double v5 = (double *)(v0 + v4);
    swift_beginAccess();
    objc_msgSend(v2, sel_setConstant_, *v5);
  }
  id v6 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightContraint);
  id result = (id)swift_beginAccess();
  id v8 = *v6;
  if (v8)
  {
    CATransform3D v9 = (unsigned char *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
    swift_beginAccess();
    if (*v9 == 1) {
      uint64_t v10 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding;
    }
    else {
      uint64_t v10 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding;
    }
    uint64_t v11 = (double *)(v0 + v10);
    swift_beginAccess();
    return objc_msgSend(v8, sel_setConstant_, -*v11);
  }
  return result;
}

uint64_t sub_22C05B128@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  int v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_22C05B17C(char *a1, void *a2)
{
  char v2 = *a1;
  int v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
  uint64_t result = swift_beginAccess();
  *int v3 = v2;
  return result;
}

double sub_22C05B1CC@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_5Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding, a2);
}

uint64_t sub_22C05B1D8(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding);
}

id sub_22C05B1E4@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftConstraint, a2);
}

void sub_22C05B1F0(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

double sub_22C05B210@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_5Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding, a2);
}

double keypath_get_5Tm@<D0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (double *)(*a1 + *a2);
  swift_beginAccess();
  double result = *v4;
  *a3 = *(void *)v4;
  return result;
}

uint64_t sub_22C05B26C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding);
}

uint64_t keypath_set_6Tm(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  id v6 = (void *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *id v6 = v5;
  return result;
}

id sub_22C05B2CC@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightContraint, a2);
}

void sub_22C05B2D8(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_22C05B2F8@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView, a2);
}

void sub_22C05B304(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_22C05B324@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton, a2);
}

void sub_22C05B330(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_22C05B350@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture, a2);
}

void sub_22C05B35C(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_22C05B37C@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture, a2);
}

void sub_22C05B388(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_22C05B3A8@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton, a2);
}

void sub_22C05B3B4(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_22C05B3D4@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView, a2);
}

void sub_22C05B3E0(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_22C05B400@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_mirroringLayer, a2);
}

id keypath_get_7Tm@<X0>(void *a1@<X0>, void *a2@<X3>, void **a3@<X8>)
{
  uint64_t v4 = (void **)(*a1 + *a2);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *a3 = *v4;

  return v5;
}

void sub_22C05B46C(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_22C05B48C@<X0>(void *a1@<X8>)
{
  id result = sub_22C056CF4();
  *a1 = result;
  return result;
}

void sub_22C05B4B8(void **a1, void *a2)
{
  char v2 = *a1;
  id v4 = *(id *)(*a2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner);
  *(void *)(*a2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner) = *a1;
  id v3 = v2;
}

id sub_22C05B508@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton, a2);
}

void sub_22C05B514(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t method lookup function for AXTwiceWatchCrownButton(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AXTwiceWatchCrownButton);
}

uint64_t method lookup function for AXTwiceCompanionWatchView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AXTwiceCompanionWatchView);
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.isCrownOrientationOnRightSide.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.isCrownOrientationOnRightSide.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.isCrownOrientationOnRightSide.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.leftPadding.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.leftPadding.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.leftPadding.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.leftConstraint.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.leftConstraint.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.leftConstraint.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rightPadding.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rightPadding.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rightPadding.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rightContraint.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rightContraint.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rightContraint.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.deviceChromeView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.deviceChromeView.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.deviceChromeView.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchCrownButton.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchCrownButton.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchCrownButton.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.swipeUpCrownGesture.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.swipeUpCrownGesture.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.swipeUpCrownGesture.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.swipeDownCrownGesture.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.swipeDownCrownGesture.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.swipeDownCrownGesture.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchSideButton.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchSideButton.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x248))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchSideButton.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x250))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rendererView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x298))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rendererView.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rendererView.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.mirroringLayer.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.mirroringLayer.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.mirroringLayer.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.deviceSpinner.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.deviceSpinner.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.deviceSpinner.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchStingButton.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x310))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchStingButton.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x318))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchStingButton.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x320))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.makeViewAccessible(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x328))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.addScreenSubLayer(layer:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x330))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.normalizedScreenPoint(normalizedPoint:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x338))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.updateCrownAXActions(isGizmoSystemStateLocked:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x340))();
}

void sub_22C05C04C()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide;
  v1[v2] = AXIsCrownOrientationOnRightSide();
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightContraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonTopConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonHorizontalConstraint] = 0;
  uint64_t v3 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton;
  *(void *)&v1[v3] = sub_22C0564E4();
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonTopConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonHorizontalConstraint] = 0;
  uint64_t v4 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton;
  *(void *)&v1[v4] = sub_22C056E58(0xD00000000000001ALL, 0x800000022C06F570, MEMORY[0x263F21DC8]);
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewLeftConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewRightConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_mirroringLayer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner] = 0;
  uint64_t v5 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_hasStingSupport;
  sub_22C06CB70();
  id v6 = (void *)sub_22C06CAF0();
  char v7 = MEMORY[0x230F5CC60]();

  v1[v5] = v7 & 1;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonTopConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonHorizontalConstraint] = 0;
  uint64_t v8 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton;
  *(void *)&v1[v8] = sub_22C056E58(0xD00000000000001BLL, 0x800000022C06F550, MEMORY[0x263F21DD0]);

  sub_22C06CF60();
  __break(1u);
}

void sub_22C05C25C(void *a1, uint64_t a2, SEL *a3)
{
  uint64_t v6 = sub_22C06CC00();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v38 - v11;
  if (objc_msgSend(a1, sel_state) == (id)2)
  {
    id v13 = objc_msgSend(a1, sel_view);
    if (v13)
    {
      uint64_t v14 = v13;
      objc_msgSend(v13, sel_bounds);
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      objc_msgSend(a1, sel_locationInView_, v14);
      v46.double x = v23;
      v46.CGFloat y = v24;
      v47.origin.double x = v16;
      v47.origin.CGFloat y = v18;
      v47.size.CGFloat width = v20;
      v47.size.CGFloat height = v22;
      if (CGRectContainsPoint(v47, v46))
      {
      }
      else
      {
        uint64_t v43 = a2;
        sub_22C06C8C0();
        uint64_t v25 = sub_22C06CBF0();
        os_log_type_t v26 = sub_22C06CDB0();
        if (os_log_type_enabled(v25, v26))
        {
          CGRect v42 = (uint8_t *)swift_slowAlloc();
          uint64_t v27 = swift_slowAlloc();
          CGRect v39 = v25;
          uint64_t v40 = v27;
          uint64_t v45 = v27;
          CGRect v41 = a3;
          CGFloat v28 = v42;
          *(_DWORD *)CGRect v42 = 136315138;
          CGRect v38 = v28 + 4;
          uint64_t v44 = sub_22C0545D0(0xD000000000000029, 0x800000022C06F3A0, &v45);
          a3 = v41;
          sub_22C06CE40();
          os_log_type_t v29 = v26;
          id v30 = v42;
          _os_log_impl(&dword_22C04B000, v25, v29, "[TWICE] %s. Gesture is out of its bounds. Cancel the gesture!", v42, 0xCu);
          uint64_t v31 = v40;
          swift_arrayDestroy();
          MEMORY[0x230F5D900](v31, -1, -1);
          MEMORY[0x230F5D900](v30, -1, -1);
        }
        else
        {
        }
        (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
        objc_msgSend(a1, sel_setState_, 5);

        a2 = v43;
      }
    }
  }
  if (objc_msgSend(a1, sel_state) == (id)3)
  {
    sub_22C06C8C0();
    id v32 = sub_22C06CBF0();
    os_log_type_t v33 = sub_22C06CDB0();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v43 = a2;
      uint64_t v36 = v35;
      uint64_t v45 = v35;
      *(_DWORD *)uint64_t v34 = 136315138;
      uint64_t v44 = sub_22C0545D0(0xD000000000000029, 0x800000022C06F3A0, &v45);
      sub_22C06CE40();
      _os_log_impl(&dword_22C04B000, v32, v33, "[TWICE] %s", v34, 0xCu);
      swift_arrayDestroy();
      uint64_t v37 = v36;
      a2 = v43;
      MEMORY[0x230F5D900](v37, -1, -1);
      MEMORY[0x230F5D900](v34, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    sub_22C05A464(a2, a3);
  }
}

id sub_22C05C690(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_22C06CC00();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v34 - v9;
  if (objc_msgSend(a1, sel_state) == (id)2)
  {
    id v11 = objc_msgSend(a1, sel_view);
    if (v11)
    {
      uint64_t v12 = v11;
      objc_msgSend(v11, sel_bounds);
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      objc_msgSend(a1, sel_locationInView_, v12);
      v40.double x = v21;
      v40.CGFloat y = v22;
      v41.origin.double x = v14;
      v41.origin.CGFloat y = v16;
      v41.size.CGFloat width = v18;
      v41.size.CGFloat height = v20;
      if (!CGRectContainsPoint(v41, v40))
      {
        sub_22C06C8C0();
        CGFloat v23 = sub_22C06CBF0();
        os_log_type_t v24 = sub_22C06CDB0();
        if (os_log_type_enabled(v23, v24))
        {
          uint64_t v36 = (uint8_t *)swift_slowAlloc();
          uint64_t v35 = swift_slowAlloc();
          uint64_t v39 = v35;
          uint64_t v37 = v23;
          uint64_t v25 = v36;
          *(_DWORD *)uint64_t v36 = 136315138;
          uint64_t v34 = v25 + 4;
          uint64_t v38 = sub_22C0545D0(0xD000000000000029, 0x800000022C06F3A0, &v39);
          sub_22C06CE40();
          os_log_type_t v26 = v24;
          uint64_t v27 = v36;
          _os_log_impl(&dword_22C04B000, v37, v26, "[TWICE] %s. Gesture is out of its bounds. Cancel the gesture!", v36, 0xCu);
          uint64_t v28 = v35;
          swift_arrayDestroy();
          MEMORY[0x230F5D900](v28, -1, -1);
          MEMORY[0x230F5D900](v27, -1, -1);
        }
        else
        {
        }
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
        objc_msgSend(a1, sel_setState_, 5);
      }
    }
  }
  id result = objc_msgSend(a1, sel_state);
  if (result == (id)3)
  {
    sub_22C06C8C0();
    id v30 = sub_22C06CBF0();
    os_log_type_t v31 = sub_22C06CDB0();
    if (os_log_type_enabled(v30, v31))
    {
      id v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v39 = v33;
      *(_DWORD *)id v32 = 136315138;
      uint64_t v38 = sub_22C0545D0(0xD000000000000029, 0x800000022C06F3A0, &v39);
      sub_22C06CE40();
      _os_log_impl(&dword_22C04B000, v30, v31, "[TWICE] %s", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F5D900](v33, -1, -1);
      MEMORY[0x230F5D900](v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    return (id)(*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  return result;
}

void *sub_22C05CA9C(uint64_t a1, unint64_t a2, SEL *a3)
{
  uint64_t v7 = v3;
  uint64_t v8 = sub_22C06CC00();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  uint64_t v12 = sub_22C06CBF0();
  os_log_type_t v13 = sub_22C06CDB0();
  if (os_log_type_enabled(v12, v13))
  {
    CGFloat v20 = a3;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = v7;
    double v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc();
    v23[0] = v16;
    *(_DWORD *)double v15 = 136315138;
    uint64_t v22 = sub_22C0545D0(a1, a2, v23);
    a3 = v20;
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v12, v13, "[TWICE] %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v16, -1, -1);
    double v17 = v15;
    uint64_t v7 = v21;
    MEMORY[0x230F5D900](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  CGFloat v18 = (void *)(v7 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
  id result = (void *)swift_beginAccess();
  if (*v18)
  {
    id result = (void *)MEMORY[0x230F5D960](*v18 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_delegate);
    if (result)
    {
      [result *a3];
      return (void *)swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_22C05CCD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22C06CC00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  uint64_t v6 = sub_22C06CBF0();
  os_log_type_t v7 = sub_22C06CDB0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    v14[0] = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v13 = sub_22C0545D0(0xD00000000000001BLL, 0x800000022C06F2B0, v14);
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v6, v7, "[TWICE] %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v9, -1, -1);
    MEMORY[0x230F5D900](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = (id *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton);
  swift_beginAccess();
  objc_msgSend(*v10, sel_setAccessibilityTraits_, *MEMORY[0x263F83250]);
  LODWORD(v10) = *MEMORY[0x263F83188];
  id v11 = (void *)sub_22C06CCC0();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v10, v11);

  return 1;
}

uint64_t sub_22C05CF34(uint64_t a1, unint64_t a2, SEL *a3)
{
  uint64_t v7 = v3;
  uint64_t v8 = sub_22C06CC00();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  uint64_t v12 = sub_22C06CBF0();
  os_log_type_t v13 = sub_22C06CDB0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v21 = a3;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v22 = v7;
    double v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc();
    v24[0] = v16;
    *(_DWORD *)double v15 = 136315138;
    uint64_t v23 = sub_22C0545D0(a1, a2, v24);
    a3 = v21;
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v12, v13, "[TWICE] %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v16, -1, -1);
    double v17 = v15;
    uint64_t v7 = v22;
    MEMORY[0x230F5D900](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  CGFloat v18 = (void *)(v7 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
  swift_beginAccess();
  if (*v18)
  {
    double v19 = (void *)MEMORY[0x230F5D960](*v18 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_delegate);
    if (v19)
    {
      [v19 *a3];
      swift_unknownObjectRelease();
    }
  }
  return 1;
}

void sub_22C05D170(void *a1)
{
  uint64_t v2 = sub_22C06CC00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v6 = a1;
    int v7 = AXIsCrownOrientationOnRightSide();
    uint64_t v8 = &v6[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide];
    swift_beginAccess();
    if (v7 != *v8)
    {
      sub_22C06C8C0();
      uint64_t v9 = v6;
      uint64_t v10 = sub_22C06CBF0();
      os_log_type_t v11 = sub_22C06CDB0();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = swift_slowAlloc();
        uint64_t v15 = swift_slowAlloc();
        uint64_t v18 = v15;
        *(_DWORD *)uint64_t v12 = 136315650;
        uint64_t v16 = v9;
        uint64_t v17 = sub_22C0545D0(0xD000000000000026, 0x800000022C06F660, &v18);
        sub_22C06CE40();
        *(_WORD *)(v12 + 12) = 1024;
        LODWORD(v17) = *v8;
        sub_22C06CE40();

        *(_WORD *)(v12 + 18) = 1024;
        LODWORD(v17) = v7;
        sub_22C06CE40();
        _os_log_impl(&dword_22C04B000, v10, v11, "[TWICE] %s %{BOOL}d %{BOOL}d", (uint8_t *)v12, 0x18u);
        uint64_t v13 = v15;
        swift_arrayDestroy();
        MEMORY[0x230F5D900](v13, -1, -1);
        MEMORY[0x230F5D900](v12, -1, -1);
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      *uint64_t v8 = v7;
      sub_22C05AA74(0.1);
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22C05D410()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_22C05D448()
{
  return sub_22C05AE90(*(unsigned char **)(v0 + 16));
}

void sub_22C05D458()
{
  if (*MEMORY[0x263F8B120]) {
    qword_26849E630 = *MEMORY[0x263F8B120];
  }
  else {
    __break(1u);
  }
}

id sub_22C05D478()
{
  uint64_t v1 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___airplayReceiver;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___airplayReceiver);
  id v3 = v2;
  if (v2 == (void *)1)
  {
    id v3 = objc_msgSend(self, sel_sharedInstance);
    objc_msgSend(v3, sel_setDelegate_, v0);
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v5 = v3;
    sub_22C06C1D4(v4);
  }
  sub_22C06C1E4(v2);
  return v3;
}

double sub_22C05D510()
{
  uint64_t v1 = (unsigned char *)(v0
               + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___distanceHIDThreshold);
  if ((*(unsigned char *)(v0
                 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___distanceHIDThreshold
                 + 8) & 1) == 0)
    return *(double *)v1;
  double result = sub_22C06B61C();
  *(double *)uint64_t v1 = result;
  v1[8] = 0;
  return result;
}

id sub_22C05D554()
{
  uint64_t v1 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___eventProcessor;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___eventProcessor];
  id v3 = v2;
  if (v2 == (void *)1)
  {
    id v4 = objc_allocWithZone(MEMORY[0x263F22898]);
    id v5 = (void *)sub_22C06CCC0();
    id v3 = objc_msgSend(v4, sel_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority_, v5, 70, 0, 30);

    if (v3)
    {
      objc_msgSend(v3, sel_setHIDEventFilterMask_, 33);
      uint64_t v6 = swift_allocObject();
      *(void *)(v6 + 16) = v0;
      v13[4] = sub_22C06C1F4;
      v13[5] = v6;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 1107296256;
      v13[2] = sub_22C05E50C;
      v13[3] = &block_descriptor_51;
      int v7 = _Block_copy(v13);
      id v8 = v3;
      uint64_t v9 = v0;
      swift_release();
      objc_msgSend(v8, sel_setHIDEventHandler_, v7);
      _Block_release(v7);
    }
    uint64_t v10 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v3;
    id v11 = v3;
    sub_22C06C1D4(v10);
  }
  sub_22C06C1E4(v2);
  return v3;
}

void AXTwiceCompanionRootViewController.handleHIDEvent(_:)(uint64_t a1)
{
  uint64_t v158 = a1;
  uint64_t v1 = sub_22C06CBB0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (uint8_t **)((char *)&v152 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_22C06CC00();
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v159 = v5;
  uint64_t v160 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v152 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v152 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v152 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v152 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v152 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  os_log_type_t v24 = (char *)&v152 - v23;
  MEMORY[0x270FA5388](v22);
  os_log_type_t v26 = (char *)&v152 - v25;
  if (_AXSVoiceOverTouchEnabled())
  {
    sub_22C06C8C0();
    uint64_t v27 = sub_22C06CBF0();
    os_log_type_t v28 = sub_22C06CD90();
    if (os_log_type_enabled(v27, v28))
    {
      os_log_type_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v29 = 0;
      _os_log_impl(&dword_22C04B000, v27, v28, "[TWICE] VoiceOver is on. Not going to process the hid event.", v29, 2u);
      MEMORY[0x230F5D900](v29, -1, -1);
    }

    (*(void (**)(char *, unint64_t))(v160 + 8))(v9, v159);
    return;
  }
  id v30 = (void *)v158;
  id v154 = v4;
  uint64_t v155 = v2;
  uint64_t v156 = v1;
  if (_AXSAssistiveTouchScannerEnabled())
  {
    sub_22C06C8C0();
    os_log_type_t v31 = sub_22C06CBF0();
    os_log_type_t v32 = sub_22C06CD90();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_22C04B000, v31, v32, "[TWICE] Switch Control is on. Not going to process the hid event.", v33, 2u);
      MEMORY[0x230F5D900](v33, -1, -1);
    }

    (*(void (**)(char *, unint64_t))(v160 + 8))(v12, v159);
    return;
  }
  if (v30)
  {
    uint64_t v34 = v30;
    [v34 type];
    if (AXEventTypeIsHomeButtonPress())
    {
      sub_22C06C8C0();
      uint64_t v35 = sub_22C06CBF0();
      os_log_type_t v36 = sub_22C06CDB0();
      BOOL v37 = os_log_type_enabled(v35, v36);
      uint64_t v38 = v155;
      if (v37)
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl(&dword_22C04B000, v35, v36, "[TWICE] Home Button Pressed. Dismiss this view.", v39, 2u);
        MEMORY[0x230F5D900](v39, -1, -1);
      }

      (*(void (**)(char *, unint64_t))(v160 + 8))(v18, v159);
      CGPoint v40 = v154;
      uint64_t v41 = v156;
      (*(void (**)(uint8_t **, void, uint64_t))(v38 + 104))(v154, *MEMORY[0x263F21E80], v156);
      sub_22C05EE20(v40);

      (*(void (**)(uint8_t **, uint64_t))(v38 + 8))(v40, v41);
      return;
    }
    uint64_t v45 = v157;
    uint64_t v158 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC;
    id v46 = *(id *)(v157 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
    id v47 = sub_22C04F064();
    uint64_t v49 = v48;

    uint64_t ObjectType = swift_getObjectType();
    [v34 location];
    *(double *)&uint64_t v51 = COERCE_DOUBLE((*(uint64_t (**)(uint64_t, uint64_t))(v49 + 208))(ObjectType, v49));
    double v53 = v52;
    LOBYTE(v46) = v54;

    if (v46)
    {
      sub_22C06C8C0();
      id v75 = sub_22C06CBF0();
      os_log_type_t v76 = sub_22C06CD90();
      if (os_log_type_enabled(v75, v76))
      {
        id v77 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v77 = 0;
        _os_log_impl(&dword_22C04B000, v75, v76, "[TWICE] hid location is not inside device screen", v77, 2u);
        MEMORY[0x230F5D900](v77, -1, -1);
        id v78 = v34;
      }
      else
      {
        id v78 = v75;
        id v75 = v34;
      }
      unint64_t v80 = v159;
      uint64_t v79 = v160;

      (*(void (**)(char *, unint64_t))(v79 + 8))(v21, v80);
      return;
    }
    if ([v34 type] != 3001)
    {

      return;
    }
    double v55 = v53;
    uint64_t v56 = v45 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_lastHIDEvent;
    id v57 = &selRef_initWithCoder_;
    if ((*(unsigned char *)(v45 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_lastHIDEvent + 28) & 1) == 0)
    {
      id v58 = v24;
      id v153 = *(uint8_t **)v56;
      int v59 = *(_DWORD *)(v56 + 24);
      double v61 = *(double *)(v56 + 8);
      double v60 = *(double *)(v56 + 16);
      id v62 = [v34 handInfo];
      if (!v62)
      {
LABEL_63:
        __break(1u);
        return;
      }
      uint64_t v63 = v62;
      unsigned int v64 = objc_msgSend(v62, sel_eventType);

      BOOL v65 = v59 == v64;
      id v57 = &selRef_initWithCoder_;
      os_log_type_t v24 = v58;
      if (v65)
      {
        id v66 = [v34 HIDTime];
        double v67 = sub_22C06B754((unint64_t)v153, (unint64_t)v66);
        [v34 location];
        if (v67 != -1.0 && v67 < 60.0)
        {
          double v70 = sqrt((v61 - v68) * (v61 - v68) + (v60 - v69) * (v60 - v69));
          if (v70 < sub_22C05D510())
          {
            sub_22C06C8C0();
            id v71 = sub_22C06CBF0();
            os_log_type_t v72 = sub_22C06CD90();
            if (os_log_type_enabled(v71, v72))
            {
              uint64_t v73 = swift_slowAlloc();
              *(_DWORD *)uint64_t v73 = 134218240;
              v162[0] = v67;
              sub_22C06CE40();
              *(_WORD *)(v73 + 12) = 2048;
              v162[0] = v70;
              sub_22C06CE40();
              _os_log_impl(&dword_22C04B000, v71, v72, "[TWICE] Skip event interval:%f distance:%f", (uint8_t *)v73, 0x16u);
              MEMORY[0x230F5D900](v73, -1, -1);
              id v74 = v34;
            }
            else
            {
              id v74 = v71;
              id v71 = v34;
            }
            unint64_t v147 = v159;
            uint64_t v146 = v160;

            (*(void (**)(char *, unint64_t))(v146 + 8))(v26, v147);
            return;
          }
        }
      }
    }
    id v81 = [v34 HIDTime];
    [v34 location];
    uint64_t v83 = v82;
    uint64_t v85 = v84;
    id v86 = [v34 v57[129]];
    if (!v86) {
      goto LABEL_60;
    }
    id v87 = v86;
    double v88 = *(double *)&v51;
    double v89 = v55;
    unsigned int v90 = objc_msgSend(v86, sel_eventType);

    *(void *)uint64_t v56 = v81;
    *(void *)(v56 + 8) = v83;
    *(void *)(v56 + 16) = v85;
    *(_DWORD *)(v56 + 24) = v90;
    *(unsigned char *)(v56 + 28) = 0;
    sub_22C06C8C0();
    id v91 = v34;
    id v92 = sub_22C06CBF0();
    os_log_type_t v93 = sub_22C06CD90();
    if (os_log_type_enabled(v92, v93))
    {
      id v94 = v24;
      id v95 = (uint8_t *)swift_slowAlloc();
      *(double *)&uint64_t v96 = COERCE_DOUBLE(swift_slowAlloc());
      v162[0] = *(double *)&v96;
      *(_DWORD *)id v95 = 136315138;
      id v153 = v95 + 4;
      id v97 = [(uint8_t *)v91 description];
      uint64_t v98 = sub_22C06CCD0();
      unint64_t v100 = v99;

      uint64_t v161 = sub_22C0545D0(v98, v100, (uint64_t *)v162);
      sub_22C06CE40();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22C04B000, v92, v93, "[TWICE] handleHIDEvent %s", v95, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F5D900](v96, -1, -1);
      MEMORY[0x230F5D900](v95, -1, -1);

      (*(void (**)(char *, unint64_t))(v160 + 8))(v94, v159);
    }
    else
    {

      (*(void (**)(char *, unint64_t))(v160 + 8))(v24, v159);
    }
    uint64_t v101 = v156;
    -[uint8_t setLocation:](v91, sel_setLocation_, v88, v89);
    id v102 = [(uint8_t *)v91 handInfo];
    objc_msgSend(v102, sel_setHandPosition_, v88, v89);

    id v103 = [(uint8_t *)v91 handInfo];
    if (!v103) {
      goto LABEL_61;
    }
    double v104 = v103;
    id v105 = objc_msgSend(v103, sel_paths);

    if (!v105)
    {
LABEL_62:
      __break(1u);
      goto LABEL_63;
    }
    id v153 = v91;
    sub_22C0524D8(0, &qword_26849E330);
    unint64_t v106 = sub_22C06CD40();

    if (v106 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v107 = sub_22C06CF70();
      swift_bridgeObjectRelease();
      if (v107) {
        goto LABEL_41;
      }
    }
    else
    {
      uint64_t v107 = *(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v107)
      {
LABEL_41:
        if (v107 >= 1)
        {
          uint64_t v108 = 0;
          unint64_t v109 = v106 & 0xC000000000000001;
          unint64_t v159 = v106;
          uint64_t v160 = v107;
          while (1)
          {
            if (v109) {
              id v111 = (id)MEMORY[0x230F5CFD0](v108, v106);
            }
            else {
              id v111 = *(id *)(v106 + 8 * v108 + 32);
            }
            id v112 = v111;
            id v113 = *(id *)(v157 + v158);
            id v114 = (char *)sub_22C04EEF8();

            objc_msgSend(v112, sel_pathLocation);
            double v116 = v115;
            double v118 = v117;
            id v119 = &v114[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView];
            swift_beginAccess();
            if (*(void *)v119)
            {
              id v120 = *(void **)(*(void *)v119
                              + OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer);
              if (v120)
              {
                id v121 = self;
                id v110 = v120;
                id v122 = objc_msgSend(v121, sel_mainScreen);
                objc_msgSend(v122, sel_bounds);
                CGFloat v124 = v123;
                CGFloat v126 = v125;
                CGFloat v128 = v127;
                CGFloat v130 = v129;

                v164.origin.CGFloat x = v124;
                v164.origin.CGFloat y = v126;
                v164.size.CGFloat width = v128;
                v164.size.CGFloat height = v130;
                CGFloat v131 = v116 * CGRectGetWidth(v164);
                id v132 = objc_msgSend(v121, sel_mainScreen);
                objc_msgSend(v132, sel_bounds);
                CGFloat v134 = v133;
                CGFloat v136 = v135;
                CGFloat v138 = v137;
                CGFloat v140 = v139;

                v165.origin.CGFloat x = v134;
                v165.origin.CGFloat y = v136;
                v165.size.CGFloat width = v138;
                v165.size.CGFloat height = v140;
                CGFloat v141 = v118 * CGRectGetHeight(v165);
                objc_msgSend(v110, sel_bounds);
                objc_msgSend(v110, sel_convertRect_toLayer_, 0);
                CGFloat x = v166.origin.x;
                CGFloat y = v166.origin.y;
                CGFloat width = v166.size.width;
                CGFloat height = v166.size.height;
                v163.CGFloat x = v131;
                v163.CGFloat y = v141;
                if (CGRectContainsPoint(v166, v163))
                {
                  v167.origin.CGFloat x = x;
                  v167.origin.CGFloat y = y;
                  v167.size.CGFloat width = width;
                  v167.size.CGFloat height = height;
                  CGRectGetWidth(v167);
                  v168.origin.CGFloat x = x;
                  v168.origin.CGFloat y = y;
                  v168.size.CGFloat width = width;
                  v168.size.CGFloat height = height;
                  CGRectGetHeight(v168);

                  swift_beginAccess();
                  uint64_t v101 = v156;
                  unint64_t v106 = v159;
                  uint64_t v107 = v160;
                  goto LABEL_45;
                }

                uint64_t v101 = v156;
                unint64_t v106 = v159;
                uint64_t v107 = v160;
              }
              else
              {
                id v110 = v114;
                uint64_t v101 = v156;
              }
            }
            else
            {
              id v110 = v114;
            }

            objc_msgSend(v112, sel_pathLocation);
LABEL_45:
            ++v108;
            objc_msgSend(v112, sel_setPathLocation_);

            if (v107 == v108) {
              goto LABEL_58;
            }
          }
        }
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
        goto LABEL_62;
      }
    }
LABEL_58:
    swift_bridgeObjectRelease();
    id v149 = v154;
    uint64_t v148 = v155;
    id v150 = v153;
    *id v154 = v153;
    (*(void (**)(uint8_t **, void, uint64_t))(v148 + 104))(v149, *MEMORY[0x263F21E30], v101);
    id v151 = v150;
    sub_22C05EE20(v149);

    (*(void (**)(uint8_t **, uint64_t))(v148 + 8))(v149, v101);
    return;
  }
  sub_22C06C8C0();
  CGRect v42 = sub_22C06CBF0();
  os_log_type_t v43 = sub_22C06CDA0();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v44 = 0;
    _os_log_impl(&dword_22C04B000, v42, v43, "[TWICE] invalid HID event", v44, 2u);
    MEMORY[0x230F5D900](v44, -1, -1);
  }

  (*(void (**)(char *, unint64_t))(v160 + 8))(v15, v159);
}

uint64_t sub_22C05E50C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(a2) = v3(a2);
  swift_release();

  return a2 & 1;
}

uint64_t sub_22C05E568()
{
  uint64_t v1 = sub_22C06CBD0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22C06CC00();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  uint64_t v9 = v0;
  uint64_t v10 = sub_22C06CBF0();
  os_log_type_t v11 = sub_22C06CDB0();
  int v12 = v11;
  uint64_t v13 = &OBJC_IVAR____TtC21AXWatchRemoteScreenUI47AXTwiceCompanionPullToDismissAnimatedController_dismissedVC;
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v14 = swift_slowAlloc();
    int v34 = v12;
    uint64_t v15 = (uint8_t *)v14;
    uint64_t v35 = swift_slowAlloc();
    v38[0] = v35;
    uint64_t v36 = v5;
    *(_DWORD *)uint64_t v15 = 136315138;
    os_log_type_t v32 = v15 + 4;
    uint64_t v33 = v15;
    uint64_t v16 = &v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState];
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v16, v1);
    sub_22C06C56C(&qword_26849E500, MEMORY[0x263F21ED0]);
    uint64_t v17 = sub_22C06CFC0();
    uint64_t v18 = v6;
    unint64_t v20 = v19;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    uint64_t v37 = sub_22C0545D0(v17, v20, v38);
    sub_22C06CE40();

    swift_bridgeObjectRelease();
    uint64_t v21 = v33;
    _os_log_impl(&dword_22C04B000, v10, (os_log_type_t)v34, "[TWICE] AXTwiceCompanionRootViewController State is %s", v33, 0xCu);
    uint64_t v22 = v35;
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v22, -1, -1);
    MEMORY[0x230F5D900](v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v36);
    uint64_t v13 = &OBJC_IVAR____TtC21AXWatchRemoteScreenUI47AXTwiceCompanionPullToDismissAnimatedController_dismissedVC;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v23 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC;
  os_log_type_t v24 = *(void **)&v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC];
  uint64_t v25 = &v9[v13[118]];
  swift_beginAccess();
  os_log_type_t v26 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v26(v4, v25, v1);
  id v27 = v24;
  sub_22C050620((uint64_t)v4);

  os_log_type_t v28 = *(void (**)(char *, uint64_t))(v2 + 8);
  v28(v4, v1);
  os_log_type_t v29 = *(void **)&v9[v23];
  v26(v4, v25, v1);
  id v30 = v29;
  sub_22C05087C((uint64_t)v4);

  return ((uint64_t (*)(char *, uint64_t))v28)(v4, v1);
}

void sub_22C05E968()
{
  uint64_t v1 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___inactiveTimer;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___inactiveTimer);
  if (v2) {
    goto LABEL_4;
  }
  uint64_t v3 = v0;
  sub_22C0524D8(0, (unint64_t *)&qword_26849E360);
  id v4 = (void *)sub_22C06CDF0();
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F21398]), sel_initWithTargetSerialQueue_, v4);

  if (v5)
  {
    objc_msgSend(v5, sel_setAutomaticallyCancelPendingBlockUponSchedulingNewBlock_, 1);
    uint64_t v6 = *(void **)(v3 + v1);
    *(void *)(v3 + v1) = v5;
    v5;

    uint64_t v2 = 0;
LABEL_4:
    id v7 = v2;
    return;
  }
  __break(1u);
}

void sub_22C05EA2C()
{
  v22.receiver = v0;
  v22.super_class = (Class)type metadata accessor for AXTwiceCompanionRootViewController();
  objc_msgSendSuper2(&v22, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithWhite_alpha_, 0.0, 0.6);
    objc_msgSend(v2, sel_setBackgroundColor_, v3);

    id v4 = *(id *)&v0[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger];
    id v5 = v0;
    sub_22C06CAC0();

    uint64_t v6 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC;
    objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC], sel_setModalPresentationStyle_, 4);
    id v7 = (id *)(*(void *)&v5[v6]
              + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton);
    swift_beginAccess();
    objc_msgSend(*v7, sel_addTarget_action_forControlEvents_, v5, sel_dismissButtonTappedWithSender_, 64);
    id v8 = *(id *)&v5[v6];
    id v9 = sub_22C04F064();
    uint64_t v11 = v10;

    uint64_t ObjectType = swift_getObjectType();
    uint64_t v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 152))(ObjectType, v11);

    if (v13)
    {
      swift_unknownObjectWeakAssign();
    }
    AXDeviceRemoteScreenIsBluetoothOn();
    id v14 = objc_msgSend(self, sel_defaultCenter);
    if (qword_26849DF70 != -1) {
      swift_once();
    }
    uint64_t v15 = qword_26849E630;
    id v16 = objc_msgSend(self, sel_mainQueue);
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v5;
    aBlock[4] = sub_22C06B894;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22C05F1CC;
    aBlock[3] = &block_descriptor_3;
    uint64_t v18 = _Block_copy(aBlock);
    unint64_t v19 = v5;
    swift_release();
    id v20 = objc_msgSend(v14, sel_addObserverForName_object_queue_usingBlock_, v15, 0, v16, v18);
    _Block_release(v18);
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22C05ED34()
{
  uint64_t v0 = sub_22C06CBB0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F21E58], v0);
  sub_22C05EE20((uint64_t)v3);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_22C05EE20(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22C06CC20();
  uint64_t v21 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22C06CC50();
  uint64_t v19 = *(void *)(v7 - 8);
  uint64_t v20 = v7;
  MEMORY[0x270FA5388](v7);
  id v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22C06CBB0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  v18[1] = *(void *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_eventSerialQueue);
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  unint64_t v14 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v15 + v14, (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  aBlock[4] = sub_22C06C3DC;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22C0510D0;
  aBlock[3] = &block_descriptor_72;
  id v16 = _Block_copy(aBlock);
  swift_retain();
  sub_22C06CC30();
  uint64_t v22 = MEMORY[0x263F8EE78];
  sub_22C06C56C((unint64_t *)&qword_26849E4D0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849DFC0);
  sub_22C06C224((unint64_t *)&qword_26849E4E0, &qword_26849DFC0);
  sub_22C06CE70();
  MEMORY[0x230F5CF00](0, v9, v6, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v20);
  swift_release();
  return swift_release();
}

uint64_t sub_22C05F1CC(uint64_t a1)
{
  uint64_t v2 = sub_22C06C850();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_22C06C840();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_22C05F308(char a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26849E340);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)type metadata accessor for AXTwiceCompanionRootViewController();
  v16.receiver = v1;
  v16.super_class = v6;
  objc_msgSendSuper2(&v16, sel_viewDidAppear_, a1 & 1);
  sub_22C06C8A0();
  uint64_t v7 = sub_22C06C8B0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 0, 1, v7);
  uint64_t v8 = (uint64_t)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_viewDidAppearDate];
  swift_beginAccess();
  sub_22C06B8B4((uint64_t)v5, v8);
  swift_endAccess();
  id v9 = &v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_lastHIDEvent];
  *((void *)v9 + 1) = 0;
  *((void *)v9 + 2) = 0;
  *(void *)id v9 = 0;
  *((_DWORD *)v9 + 6) = 0;
  v9[28] = 1;
  uint64_t v10 = *(void **)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  aBlock[4] = sub_22C06B91C;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22C0510D0;
  aBlock[3] = &block_descriptor_6;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = v10;
  unint64_t v14 = v1;
  swift_release();
  objc_msgSend(v14, sel_presentViewController_animated_completion_, v13, 1, v12);
  _Block_release(v12);

  sub_22C05F600();
}

uint64_t sub_22C05F514()
{
  uint64_t v0 = sub_22C06CBB0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F21E78], v0);
  sub_22C05EE20((uint64_t)v3);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_22C05F600()
{
  uint64_t v1 = AXkMobileKeyBagLockStatusNotificationID();
  if (v1)
  {
    uint64_t v2 = (__CFString *)v1;
    uint64_t v3 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v3, v0, (CFNotificationCallback)sub_22C0608A8, v2, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    id v4 = objc_msgSend(self, sel_server);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = swift_allocObject();
      *(void *)(v6 + 16) = v0;
      v9[4] = sub_22C06C2D0;
      v9[5] = v6;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 1107296256;
      v9[2] = sub_22C060B14;
      v9[3] = &block_descriptor_63;
      uint64_t v7 = _Block_copy(v9);
      id v8 = v0;
      swift_release();
      objc_msgSend(v5, sel_screenLockStatus_passcodeStatusRequired_, v7, 1);
      _Block_release(v7);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_22C05F7A4(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22C06C8B0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v38 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26849E340);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v43 = (uint64_t)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  CGRect v42 = (char *)&v38 - v14;
  uint64_t v15 = sub_22C06CC00();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = (objc_class *)type metadata accessor for AXTwiceCompanionRootViewController();
  v46.receiver = v2;
  v46.super_class = v19;
  objc_msgSendSuper2(&v46, sel_viewDidDisappear_, a1 & 1);
  sub_22C06C8C0();
  uint64_t v20 = sub_22C06CBF0();
  os_log_type_t v21 = sub_22C06CDB0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v40 = v5;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v38 = v15;
    uint64_t v23 = (uint8_t *)v22;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v41 = v4;
    uint64_t v25 = v24;
    v45[0] = v24;
    uint64_t v39 = v2;
    *(_DWORD *)uint64_t v23 = 136315138;
    uint64_t v44 = sub_22C0545D0(0xD000000000000015, 0x800000022C06F710, v45);
    uint64_t v2 = v39;
    uint64_t v5 = v40;
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v20, v21, "[TWICE] %s", v23, 0xCu);
    swift_arrayDestroy();
    uint64_t v26 = v25;
    uint64_t v4 = v41;
    MEMORY[0x230F5D900](v26, -1, -1);
    MEMORY[0x230F5D900](v23, -1, -1);

    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v38);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  id v27 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(v27, v2);

  sub_22C05E968();
  os_log_type_t v29 = v28;
  objc_msgSend(v28, sel_cancel);

  uint64_t v30 = (uint64_t)v42;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v42, 1, 1, v4);
  uint64_t v31 = (uint64_t)&v2[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveDate];
  swift_beginAccess();
  sub_22C06B8B4(v30, v31);
  swift_endAccess();
  os_log_type_t v32 = &v2[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_viewDidAppearDate];
  swift_beginAccess();
  uint64_t v33 = (uint64_t)v32;
  uint64_t v34 = v43;
  sub_22C06C4A8(v33, v43, &qword_26849E340);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v34, 1, v4) == 1) {
    return sub_22C06B978(v34, &qword_26849E340);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v10, v34, v4);
  sub_22C06C8A0();
  sub_22C06CB70();
  uint64_t v36 = (void *)sub_22C06CAF0();
  sub_22C06CB40();

  uint64_t v37 = *(void (**)(char *, uint64_t))(v5 + 8);
  v37(v8, v4);
  return ((uint64_t (*)(char *, uint64_t))v37)(v10, v4);
}

id AXTwiceCompanionRootViewController.__deallocating_deinit()
{
  uint64_t v1 = v0;
  id v2 = *(id *)&v0[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger];
  sub_22C06CAB0();

  id v3 = sub_22C05D478();
  objc_msgSend(v3, sel_cleanup);

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AXTwiceCompanionRootViewController();
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

id AXTwiceCompanionRootViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_22C06CCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id AXTwiceCompanionRootViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = a2;
  uint64_t v30 = a3;
  v26[0] = a1;
  uint64_t v28 = sub_22C06CDE0();
  uint64_t v4 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22C06CDC0();
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = sub_22C06CC50();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v27 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_eventSerialQueue;
  v26[1] = sub_22C0524D8(0, (unint64_t *)&qword_26849E360);
  uint64_t v9 = v3;
  sub_22C06CC40();
  uint64_t v32 = MEMORY[0x263F8EE78];
  sub_22C06C56C(&qword_26849E368, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849E370);
  sub_22C06C224(&qword_26849E378, &qword_26849E370);
  sub_22C06CE70();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F130], v28);
  *(void *)(v26[2] + v27) = sub_22C06CE10();
  *(void *)&v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___airplayReceiver] = 1;
  uint64_t v10 = &v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_lastHIDEvent];
  *((void *)v10 + 1) = 0;
  *((void *)v10 + 2) = 0;
  *(void *)uint64_t v10 = 0;
  *((_DWORD *)v10 + 6) = 0;
  v10[28] = 1;
  *(void *)&v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_intervalHIDThreshold] = 0x404E000000000000;
  uint64_t v11 = &v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___distanceHIDThreshold];
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  uint64_t v12 = &v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_hidEventReason];
  *(void *)uint64_t v12 = 0xD000000000000022;
  *((void *)v12 + 1) = 0x800000022C06E0B0;
  *(void *)&v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___eventProcessor] = 1;
  *(void *)&v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_gizmoErrorRetryLimit] = 3;
  uint64_t v13 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger;
  sub_22C06CAE0();
  *(void *)&v9[v13] = sub_22C06CA90();
  sub_22C06CB90();
  uint64_t v14 = &v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_initialPingMessageIdentifier];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  uint64_t v15 = &v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveDate];
  uint64_t v16 = sub_22C06C8B0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v15, 1, 1, v16);
  *(void *)&v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveTimeInterval] = 0x4072C00000000000;
  *(void *)&v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___inactiveTimer] = 0;
  uint64_t v18 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC;
  type metadata accessor for AXTwiceCompanionMainViewController();
  id v19 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  *(void *)&v9[v18] = objc_msgSend(v19, sel_init, v26[0]);
  uint64_t v20 = v29;
  v17(&v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_viewDidAppearDate], 1, 1, v16);

  if (v20)
  {
    os_log_type_t v21 = (void *)sub_22C06CCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    os_log_type_t v21 = 0;
  }
  uint64_t v22 = (objc_class *)type metadata accessor for AXTwiceCompanionRootViewController();
  v31.receiver = v9;
  v31.super_class = v22;
  uint64_t v23 = v30;
  id v24 = objc_msgSendSuper2(&v31, sel_initWithNibName_bundle_, v21, v30);

  return v24;
}

id AXTwiceCompanionRootViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id AXTwiceCompanionRootViewController.init(coder:)(void *a1)
{
  id v24 = a1;
  uint64_t v23 = sub_22C06CDE0();
  uint64_t v2 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22C06CDC0();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_22C06CC50();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v22 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_eventSerialQueue;
  v21[0] = sub_22C0524D8(0, (unint64_t *)&qword_26849E360);
  uint64_t v7 = v1;
  sub_22C06CC40();
  uint64_t v26 = MEMORY[0x263F8EE78];
  sub_22C06C56C(&qword_26849E368, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849E370);
  sub_22C06C224(&qword_26849E378, &qword_26849E370);
  sub_22C06CE70();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F130], v23);
  *(void *)(v21[1] + v22) = sub_22C06CE10();
  *(void *)&v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___airplayReceiver] = 1;
  uint64_t v8 = &v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_lastHIDEvent];
  *((void *)v8 + 1) = 0;
  *((void *)v8 + 2) = 0;
  *(void *)uint64_t v8 = 0;
  *((_DWORD *)v8 + 6) = 0;
  v8[28] = 1;
  *(void *)&v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_intervalHIDThreshold] = 0x404E000000000000;
  uint64_t v9 = &v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___distanceHIDThreshold];
  *(void *)uint64_t v9 = 0;
  unsigned char v9[8] = 1;
  uint64_t v10 = &v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_hidEventReason];
  *(void *)uint64_t v10 = 0xD000000000000022;
  *((void *)v10 + 1) = 0x800000022C06E0B0;
  *(void *)&v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___eventProcessor] = 1;
  *(void *)&v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_gizmoErrorRetryLimit] = 3;
  uint64_t v11 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger;
  sub_22C06CAE0();
  *(void *)&v7[v11] = sub_22C06CA90();
  sub_22C06CB90();
  uint64_t v12 = &v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_initialPingMessageIdentifier];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  uint64_t v13 = &v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveDate];
  uint64_t v14 = sub_22C06C8B0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v13, 1, 1, v14);
  *(void *)&v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveTimeInterval] = 0x4072C00000000000;
  *(void *)&v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___inactiveTimer] = 0;
  uint64_t v16 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC;
  type metadata accessor for AXTwiceCompanionMainViewController();
  *(void *)&v7[v16] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v15(&v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_viewDidAppearDate], 1, 1, v14);

  uint64_t v17 = (objc_class *)type metadata accessor for AXTwiceCompanionRootViewController();
  v25.receiver = v7;
  v25.super_class = v17;
  uint64_t v18 = v24;
  id v19 = objc_msgSendSuper2(&v25, sel_initWithCoder_, v24);

  return v19;
}

void sub_22C0608A8(uint64_t a1, void *a2)
{
}

uint64_t sub_22C0608B0(char a1, char a2)
{
  uint64_t v4 = sub_22C06CBB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22C06CC00();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 & 1) != 0 && (a2)
  {
    sub_22C06C8C0();
    uint64_t v13 = sub_22C06CBF0();
    os_log_type_t v14 = sub_22C06CDB0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_22C04B000, v13, v14, "[TWICE] Device is locked, showing error", v15, 2u);
      MEMORY[0x230F5D900](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    uint64_t v16 = *MEMORY[0x263F21DF8];
    uint64_t v17 = sub_22C06CB80();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 104))(v7, v16, v17);
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F21E48], v4);
    sub_22C05EE20((uint64_t)v7);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return result;
}

uint64_t sub_22C060B14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);

  return swift_release();
}

void sub_22C060B74()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26849E340);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8A0();
  uint64_t v4 = sub_22C06C8B0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 0, 1, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveDate;
  swift_beginAccess();
  sub_22C06B8B4((uint64_t)v3, v5);
  swift_endAccess();
  sub_22C05E968();
  uint64_t v7 = v6;
  objc_msgSend(v6, sel_cancel);

  sub_22C05E968();
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_22C06C5BC;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22C0510D0;
  aBlock[3] = &block_descriptor_86;
  uint64_t v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v9, sel_afterDelay_processBlock_, v11, 300.0);
  _Block_release(v11);
}

void sub_22C060D40(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x230F5D960](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    sub_22C060D94();
  }
}

uint64_t sub_22C060D94()
{
  uint64_t v0 = sub_22C06CBB0();
  uint64_t v48 = *(void *)(v0 - 8);
  uint64_t v49 = v0;
  MEMORY[0x270FA5388](v0);
  id v47 = (char *)&v44 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26849E340);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22C06C8B0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  id v50 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v44 - v9;
  uint64_t v11 = sub_22C06CC00();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v51 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  double v52 = (char *)&v44 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v44 - v17;
  sub_22C06C8C0();
  id v19 = sub_22C06CBF0();
  os_log_type_t v20 = sub_22C06CDB0();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v44 = v12;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v45 = v5;
    uint64_t v46 = v6;
    uint64_t v22 = (uint8_t *)v21;
    uint64_t v23 = swift_slowAlloc();
    v55[0] = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    uint64_t v54 = sub_22C0545D0(0xD000000000000021, 0x800000022C06FFA0, v55);
    uint64_t v12 = v44;
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v19, v20, "[TWICE] %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v23, -1, -1);
    id v24 = v22;
    uint64_t v5 = v45;
    uint64_t v6 = v46;
    MEMORY[0x230F5D900](v24, -1, -1);
  }

  objc_super v25 = *(void (**)(char *, uint64_t))(v12 + 8);
  v25(v18, v11);
  uint64_t v26 = v53;
  uint64_t v27 = (uint64_t)v53 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveDate;
  swift_beginAccess();
  sub_22C06C4A8(v27, (uint64_t)v4, &qword_26849E340);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_22C06B978((uint64_t)v4, &qword_26849E340);
  }
  uint64_t v46 = v11;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v10, v4, v5);
  uint64_t v29 = v50;
  sub_22C06C8A0();
  sub_22C06C890();
  double v31 = v30;
  uint64_t v32 = *(void (**)(char *, uint64_t))(v6 + 8);
  v32(v29, v5);
  if (round(v31) >= 300.0)
  {
    sub_22C06C8C0();
    uint64_t v36 = v26;
    uint64_t v37 = sub_22C06CBF0();
    os_log_type_t v38 = sub_22C06CDB0();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 134217984;
      uint64_t v54 = 0x4072C00000000000;
      sub_22C06CE40();

      _os_log_impl(&dword_22C04B000, v37, v38, "[TWICE] Inactive for more than %fs. Dismiss the card.", v39, 0xCu);
      MEMORY[0x230F5D900](v39, -1, -1);
    }
    else
    {

      uint64_t v37 = v36;
    }

    v25(v52, v46);
    sub_22C06CB70();
    uint64_t v40 = (void *)sub_22C06CAF0();
    sub_22C06CB30();

    CGRect v42 = v47;
    uint64_t v41 = v48;
    uint64_t v43 = v49;
    (*(void (**)(char *, void, uint64_t))(v48 + 104))(v47, *MEMORY[0x263F21E80], v49);
    sub_22C05EE20(v42);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v43);
  }
  else
  {
    sub_22C06C8C0();
    uint64_t v33 = sub_22C06CBF0();
    os_log_type_t v34 = sub_22C06CDB0();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 134217984;
      uint64_t v54 = *(void *)&v31;
      sub_22C06CE40();
      MEMORY[0x230F5D900](v35, -1, -1);
    }

    v25(v51, v46);
  }
  return ((uint64_t (*)(char *, uint64_t))v32)(v10, v5);
}

uint64_t sub_22C061434(uint64_t a1, uint64_t a2)
{
  uint64_t v201 = a2;
  uint64_t v3 = sub_22C06CB80();
  uint64_t v177 = *(void *)(v3 - 8);
  uint64_t v178 = v3;
  MEMORY[0x270FA5388](v3);
  v176 = (char *)&v170 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26849E340);
  MEMORY[0x270FA5388](v5 - 8);
  v174 = (char *)&v170 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v184 = __swift_instantiateConcreteTypeFromMangledName(&qword_26849E508);
  MEMORY[0x270FA5388](v184);
  v199 = (char *)&v170 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v198 = sub_22C06CBB0();
  Class isa = v198[-1].isa;
  uint64_t v8 = MEMORY[0x270FA5388](v198);
  v188 = (char *)&v170 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v172 = (char *)&v170 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v170 - v12;
  uint64_t v14 = sub_22C06CBD0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v171 = (char *)&v170 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v185 = (char *)&v170 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v170 - v20;
  uint64_t v22 = sub_22C06CC00();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v196 = (char *)&v170 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v173 = (char *)&v170 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  id v175 = (char *)&v170 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v170 - v31;
  MEMORY[0x270FA5388](v30);
  os_log_type_t v34 = (char *)&v170 - v33;
  swift_beginAccess();
  uint64_t v35 = MEMORY[0x230F5D960](a1 + 16);
  if (v35)
  {
    uint64_t v36 = (char *)v35;
    uint64_t v197 = v22;
    sub_22C060B74();
    v189 = v36;
    uint64_t v37 = &v36[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState];
    swift_beginAccess();
    os_log_type_t v38 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    uint64_t v194 = v15 + 16;
    v195 = v37;
    v193 = v38;
    uint64_t v39 = ((uint64_t (*)(char *, char *, uint64_t))v38)(v21, v37, v14);
    v183 = (void (*)(char *, uint64_t))MEMORY[0x230F5CCC0](v39);
    unint64_t v41 = v40;
    uint64_t v186 = v15;
    CGRect v42 = *(void (**)(char *, uint64_t))(v15 + 8);
    v179 = v21;
    objc_super v180 = v42;
    uint64_t v190 = v14;
    uint64_t v182 = v15 + 8;
    v42(v21, v14);
    sub_22C06C8C0();
    Class v43 = isa;
    v191 = (void (*)(char *, uint64_t, NSObject *))*((void *)isa + 2);
    v192 = (char *)isa + 16;
    v191(v13, v201, v198);
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_22C06CBF0();
    os_log_type_t v45 = sub_22C06CDB0();
    BOOL v46 = os_log_type_enabled(v44, v45);
    uint64_t v187 = v23;
    if (v46)
    {
      uint64_t v47 = swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      v205 = (char *)v48;
      *(_DWORD *)uint64_t v47 = 136315394;
      swift_bridgeObjectRetain();
      v204[0] = sub_22C0545D0((uint64_t)v183, v41, (uint64_t *)&v205);
      sub_22C06CE40();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v47 + 12) = 2080;
      uint64_t v49 = sub_22C06CBA0();
      v204[0] = sub_22C0545D0(v49, v50, (uint64_t *)&v205);
      sub_22C06CE40();
      swift_bridgeObjectRelease();
      uint64_t v51 = v198;
      v181 = (void (*)(char *, NSObject *))*((void *)isa + 1);
      v181(v13, v198);
      _os_log_impl(&dword_22C04B000, v44, v45, "[TWICE] HANDLE_EVENT - from: %s, event: %s", (uint8_t *)v47, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x230F5D900](v48, -1, -1);
      uint64_t v52 = v47;
      Class v43 = isa;
      MEMORY[0x230F5D900](v52, -1, -1);

      v183 = *(void (**)(char *, uint64_t))(v187 + 8);
      v183(v32, v197);
      double v53 = v51;
    }
    else
    {
      swift_bridgeObjectRelease_n();
      double v53 = v198;
      v181 = (void (*)(char *, NSObject *))*((void *)v43 + 1);
      v181(v13, v198);

      v183 = *(void (**)(char *, uint64_t))(v23 + 8);
      v183(v32, v197);
    }
    id v58 = v199;
    int v59 = v195;
    double v61 = v185;
    uint64_t v60 = v186;
    uint64_t v62 = v184;
    uint64_t v63 = v190;
    v193(v185, v195, v190);
    unsigned int v64 = (unsigned int *)&v58[*(int *)(v62 + 48)];
    (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v58, v61, v63);
    v191((char *)v64, v201, v53);
    uint64_t v65 = (*(uint64_t (**)(char *, uint64_t))(v60 + 88))(v58, v63);
    uint64_t v66 = *MEMORY[0x263F21EB0];
    double v67 = v53;
    if (v65 == v66)
    {
      double v68 = (unsigned int (*)(unsigned int *, NSObject *))*((void *)v43 + 11);
      if (v68(v64, v53) == *MEMORY[0x263F21E78])
      {
        sub_22C062DD0();
        double v69 = (unsigned int *)MEMORY[0x263F21E98];
LABEL_11:
        uint64_t v70 = v186;
        id v71 = v179;
        uint64_t v72 = v190;
        (*(void (**)(char *, void, uint64_t))(v186 + 104))(v179, *v69, v190);
        int v59 = v195;
        swift_beginAccess();
        (*(void (**)(char *, char *, uint64_t))(v70 + 24))(v59, v71, v72);
        swift_endAccess();
LABEL_12:
        sub_22C05E568();
        uint64_t v73 = v180;
        v180(v71, v72);
LABEL_13:
        id v74 = v188;
        id v75 = v196;
LABEL_44:
        v73(v199, v72);
        uint64_t v102 = ((uint64_t (*)(char *, char *, uint64_t))v193)(v71, v59, v72);
        uint64_t v103 = MEMORY[0x230F5CCC0](v102);
        double v104 = v71;
        unint64_t v106 = v105;
        v73(v104, v72);
        sub_22C06C8C0();
        v191(v74, v201, v67);
        swift_bridgeObjectRetain();
        uint64_t v107 = sub_22C06CBF0();
        os_log_type_t v108 = sub_22C06CDB0();
        if (os_log_type_enabled(v107, v108))
        {
          unint64_t v109 = v74;
          uint64_t v110 = swift_slowAlloc();
          id v111 = v67;
          uint64_t v112 = swift_slowAlloc();
          v205 = (char *)v112;
          *(_DWORD *)uint64_t v110 = 136315394;
          swift_bridgeObjectRetain();
          v204[0] = sub_22C0545D0(v103, v106, (uint64_t *)&v205);
          sub_22C06CE40();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v110 + 12) = 2080;
          uint64_t v113 = sub_22C06CBA0();
          v204[0] = sub_22C0545D0(v113, v114, (uint64_t *)&v205);
          sub_22C06CE40();
          swift_bridgeObjectRelease();
          v181(v109, v111);
          _os_log_impl(&dword_22C04B000, v107, v108, "[TWICE] HANDLE_EVENT - to: %s, event: %s", (uint8_t *)v110, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x230F5D900](v112, -1, -1);
          MEMORY[0x230F5D900](v110, -1, -1);

          double v115 = v196;
        }
        else
        {
          swift_bridgeObjectRelease_n();

          v181(v74, v67);
          double v115 = v75;
        }
        return ((uint64_t (*)(char *, uint64_t))v183)(v115, v197);
      }
    }
    else
    {
      uint64_t v76 = v65;
      if (v65 == *MEMORY[0x263F21E98])
      {
        double v68 = (unsigned int (*)(unsigned int *, NSObject *))*((void *)v43 + 11);
        unsigned int v77 = v68(v64, v53);
        if (v77 == *MEMORY[0x263F21E60])
        {
          id v78 = v175;
          sub_22C06C8C0();
          uint64_t v79 = sub_22C06CBF0();
          os_log_type_t v80 = sub_22C06CDB0();
          BOOL v81 = os_log_type_enabled(v79, v80);
          id v75 = v196;
          if (v81)
          {
            uint64_t v82 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v82 = 0;
            _os_log_impl(&dword_22C04B000, v79, v80, "[TWICE] Device jumpstart", v82, 2u);
            MEMORY[0x230F5D900](v82, -1, -1);
          }

          v183(v78, v197);
          sub_22C062DD0();
          uint64_t v83 = v186;
          id v71 = v179;
          uint64_t v72 = v190;
          (*(void (**)(char *, uint64_t, uint64_t))(v186 + 104))(v179, v76, v190);
          int v59 = v195;
          swift_beginAccess();
          (*(void (**)(char *, char *, uint64_t))(v83 + 24))(v59, v71, v72);
          swift_endAccess();
          sub_22C05E568();
          uint64_t v73 = v180;
          v180(v71, v72);
          id v74 = v188;
          goto LABEL_44;
        }
        if (v77 == *MEMORY[0x263F21E68])
        {
          uint64_t v85 = *(void **)&v189[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger];
          __swift_instantiateConcreteTypeFromMangledName(&qword_26849E4E8);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_22C06E010;
          id v87 = v85;
          v205 = (char *)sub_22C06C9A0();
          uint64_t v206 = v88;
          sub_22C06CEA0();
          BOOL v89 = _AXSApplicationAccessibilityEnabled() != 0;
          *(void *)(inited + 96) = MEMORY[0x263F8D4F8];
          *(unsigned char *)(inited + 72) = v89;
          sub_22C0668FC(inited);
          MEMORY[0x230F5CB80]();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_22C063390();
          uint64_t v90 = v186;
          id v71 = v179;
          uint64_t v91 = v190;
          (*(void (**)(char *, void, uint64_t))(v186 + 104))(v179, *MEMORY[0x263F21EA0], v190);
          id v92 = v195;
          swift_beginAccess();
          (*(void (**)(char *, char *, uint64_t))(v90 + 24))(v92, v71, v91);
          swift_endAccess();
          sub_22C05E568();
          uint64_t v73 = v180;
          v180(v71, v91);
          uint64_t v72 = v91;
          int v59 = v92;
          goto LABEL_13;
        }
      }
      else if (v65 == *MEMORY[0x263F21EA0])
      {
        double v68 = (unsigned int (*)(unsigned int *, NSObject *))*((void *)v43 + 11);
        if (v68(v64, v53) == *MEMORY[0x263F21E70])
        {
          uint64_t v84 = v186;
          id v71 = v179;
          uint64_t v72 = v190;
          (*(void (**)(char *, void, uint64_t))(v186 + 104))(v179, *MEMORY[0x263F21EA8], v190);
          int v59 = v195;
          swift_beginAccess();
          (*(void (**)(char *, char *, uint64_t))(v84 + 24))(v59, v71, v72);
          swift_endAccess();
          goto LABEL_12;
        }
      }
      else if (v65 == *MEMORY[0x263F21EA8])
      {
        double v68 = (unsigned int (*)(unsigned int *, NSObject *))*((void *)v43 + 11);
        if (v68(v64, v53) == *MEMORY[0x263F21E90])
        {
          sub_22C0637EC();
          double v69 = (unsigned int *)MEMORY[0x263F21EC8];
          goto LABEL_11;
        }
      }
      else
      {
        if (v65 == *MEMORY[0x263F21EC8])
        {
          double v68 = (unsigned int (*)(unsigned int *, NSObject *))*((void *)v43 + 11);
          unsigned int v93 = v68(v64, v53);
          if (v93 == *MEMORY[0x263F21E30])
          {
            (*((void (**)(unsigned int *, NSObject *))v43 + 12))(v64, v53);
            id v94 = *(void **)v64;
            sub_22C0638F4(*(void **)v64);

LABEL_40:
            id v74 = v188;
            goto LABEL_41;
          }
          id v74 = v188;
          if (v93 == *MEMORY[0x263F21E38])
          {
            (*((void (**)(unsigned int *, NSObject *))v43 + 12))(v64, v53);
            id v95 = *(void **)v64;
            sub_22C063DB8(*(void *)v64);

LABEL_41:
            int v59 = v195;
            id v75 = v196;
LABEL_42:
            uint64_t v72 = v190;
            id v71 = v179;
LABEL_43:
            uint64_t v73 = v180;
            goto LABEL_44;
          }
          if (v93 == *MEMORY[0x263F21E40])
          {
            (*((void (**)(unsigned int *, NSObject *))v43 + 12))(v64, v53);
            uint64_t v164 = *v64;
            sub_22C06C440((uint64_t)(v64 + 2), (uint64_t)&v205);
            sub_22C06C440((uint64_t)(v64 + 10), (uint64_t)v204);
            sub_22C06C4A8((uint64_t)v204, (uint64_t)v203, &qword_26849E3D0);
            if (v203[3])
            {
              sub_22C0524D8(0, (unint64_t *)&unk_26849E3E8);
              if (swift_dynamicCast())
              {
                CGRect v165 = v202;
                sub_22C063EBC(v164, (uint64_t)&v205, v202);
              }
            }
            else
            {
              sub_22C06B978((uint64_t)v203, &qword_26849E3D0);
            }
            int v59 = v195;
            id v75 = v196;
            uint64_t v72 = v190;
            id v71 = v179;
            sub_22C06B978((uint64_t)v204, &qword_26849E3D0);
            sub_22C06B978((uint64_t)&v205, &qword_26849E3D0);
            goto LABEL_43;
          }
          if (v93 == *MEMORY[0x263F21E50])
          {
            (*((void (**)(unsigned int *, NSObject *))v43 + 12))(v64, v53);
            uint64_t v167 = *(void *)v64;
            unint64_t v168 = *((void *)v64 + 1);
            sub_22C064084(*(void *)v64, v168);
            unint64_t v169 = v168;
            id v74 = v188;
            sub_22C06BA2C(v167, v169);
            goto LABEL_41;
          }
          goto LABEL_36;
        }
        if (v65 == *MEMORY[0x263F21EC0])
        {
          v181((char *)v64, v53);
          id v74 = v188;
          goto LABEL_64;
        }
        double v68 = (unsigned int (*)(unsigned int *, NSObject *))*((void *)v43 + 11);
      }
    }
    id v74 = v188;
LABEL_36:
    unsigned int v96 = v68(v64, v53);
    if (v96 == *MEMORY[0x263F21E48])
    {
      (*((void (**)(unsigned int *, NSObject *))v43 + 12))(v64, v53);
      uint64_t v98 = (uint64_t)v176;
      uint64_t v97 = v177;
      uint64_t v99 = v178;
      (*(void (**)(char *, unsigned int *, uint64_t))(v177 + 32))(v176, v64, v178);
      sub_22C06436C(v98);
      (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v98, v99);
      goto LABEL_41;
    }
    if (v96 == *MEMORY[0x263F21E28])
    {
      (*((void (**)(unsigned int *, NSObject *))v43 + 12))(v64, v53);
      id v100 = *(id *)&v189[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC];
      id v101 = sub_22C04EEF8();

      sub_22C059CC4();
      goto LABEL_40;
    }
    if (v96 == *MEMORY[0x263F21E80])
    {
      uint64_t v116 = v186;
      id v71 = v179;
      uint64_t v72 = v190;
      (*(void (**)(char *, uint64_t, uint64_t))(v186 + 104))(v179, v66, v190);
      double v117 = v195;
      swift_beginAccess();
      (*(void (**)(char *, char *, uint64_t))(v116 + 24))(v117, v71, v72);
      swift_endAccess();
      double v118 = v189;
      sub_22C05E568();
      uint64_t v73 = v180;
      v180(v71, v72);
      _AXSTwiceRemoteScreenSetEnabled();
      sub_22C05E968();
      id v120 = v119;
      objc_msgSend(v119, sel_cancel);

      uint64_t v121 = sub_22C06C8B0();
      uint64_t v122 = (uint64_t)v174;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v121 - 8) + 56))(v174, 1, 1, v121);
      double v123 = &v118[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveDate];
      swift_beginAccess();
      uint64_t v124 = (uint64_t)v123;
      int v59 = v117;
      sub_22C06B8B4(v122, v124);
      swift_endAccess();
      double v125 = &v118[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_initialPingMessageIdentifier];
      *(void *)double v125 = 0;
      *((void *)v125 + 1) = 0;
      swift_bridgeObjectRelease();
      id v75 = v196;
      goto LABEL_44;
    }
    int v59 = v195;
    if (v96 == *MEMORY[0x263F21E88])
    {
      uint64_t v126 = v186;
      double v127 = v179;
      uint64_t v128 = v190;
      (*(void (**)(char *, uint64_t, uint64_t))(v186 + 104))(v179, v66, v190);
      swift_beginAccess();
      (*(void (**)(char *, char *, uint64_t))(v126 + 24))(v59, v127, v128);
      swift_endAccess();
      double v129 = v189;
      sub_22C05E568();
      uint64_t v73 = v180;
      v180(v127, v128);
      sub_22C06652C();
      CGFloat v130 = *(void **)&v129[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC];
      sub_22C06CB70();
      id v131 = v130;
      id v132 = (void *)sub_22C06CAF0();
      uint64_t v133 = sub_22C06CB00();
      uint64_t v135 = v134;

      uint64_t v136 = v133;
      id v74 = v188;
      sub_22C050CF4(v136, v135, 0xD000000000000016, 0x800000022C06E510);

      int v59 = v195;
      swift_bridgeObjectRelease();
      uint64_t v72 = v128;
      id v71 = v127;
      id v75 = v196;
      goto LABEL_44;
    }
    if (v96 == *MEMORY[0x263F21E58])
    {
      id v71 = v179;
      uint64_t v72 = v190;
      v193(v179, v195, v190);
      double v137 = v171;
      (*(void (**)(char *, uint64_t, uint64_t))(v186 + 104))(v171, v66, v72);
      sub_22C06C56C(&qword_26849E510, MEMORY[0x263F21ED0]);
      char v138 = sub_22C06CCB0();
      uint64_t v73 = v180;
      v180(v137, v72);
      v73(v71, v72);
      id v75 = v196;
      if ((v138 & 1) == 0)
      {
        double v139 = *(void **)&v189[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger];
        __swift_instantiateConcreteTypeFromMangledName(&qword_26849E4E8);
        uint64_t v140 = swift_initStackObject();
        *(_OWORD *)(v140 + 16) = xmmword_22C06E010;
        id v141 = v139;
        v205 = (char *)sub_22C06C9A0();
        uint64_t v206 = v142;
        sub_22C06CEA0();
        BOOL v143 = _AXSApplicationAccessibilityEnabled() != 0;
        *(void *)(v140 + 96) = MEMORY[0x263F8D4F8];
        *(unsigned char *)(v140 + 72) = v143;
        sub_22C0668FC(v140);
        MEMORY[0x230F5CB80]();

        id v74 = v188;
        int v59 = v195;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      goto LABEL_44;
    }
    id v144 = v173;
    sub_22C06C8C0();
    id v145 = v172;
    v191(v172, v201, v67);
    uint64_t v146 = v189;
    unint64_t v147 = sub_22C06CBF0();
    os_log_type_t v148 = sub_22C06CDA0();
    v198 = v147;
    LODWORD(v186) = v148;
    if (os_log_type_enabled(v147, v148))
    {
      uint64_t v149 = swift_slowAlloc();
      v185 = (char *)swift_slowAlloc();
      v205 = v185;
      *(_DWORD *)uint64_t v149 = 136315394;
      uint64_t v184 = v149 + 4;
      id v150 = v179;
      id v151 = v59;
      uint64_t v152 = v190;
      v193(v179, v151, v190);
      sub_22C06C56C(&qword_26849E500, MEMORY[0x263F21ED0]);
      id v153 = v145;
      uint64_t v154 = sub_22C06CFC0();
      unint64_t v156 = v155;
      v180(v150, v152);
      v204[0] = sub_22C0545D0(v154, v156, (uint64_t *)&v205);
      sub_22C06CE40();

      swift_bridgeObjectRelease();
      *(_WORD *)(v149 + 12) = 2080;
      uint64_t v157 = sub_22C06CBA0();
      v204[0] = sub_22C0545D0(v157, v158, (uint64_t *)&v205);
      int v59 = v195;
      sub_22C06CE40();
      swift_bridgeObjectRelease();
      unint64_t v159 = (void (*)(unsigned int *, NSObject *))v181;
      v181(v153, v67);
      uint64_t v160 = v198;
      _os_log_impl(&dword_22C04B000, v198, (os_log_type_t)v186, "[TWICE] unhandled event %s %s", (uint8_t *)v149, 0x16u);
      uint64_t v161 = v185;
      swift_arrayDestroy();
      MEMORY[0x230F5D900](v161, -1, -1);
      uint64_t v162 = v149;
      id v74 = v188;
      MEMORY[0x230F5D900](v162, -1, -1);

      CGPoint v163 = v173;
    }
    else
    {

      CGRect v166 = v145;
      unint64_t v159 = (void (*)(unsigned int *, NSObject *))v181;
      v181(v166, v67);

      CGPoint v163 = v144;
    }
    v183(v163, v197);
    v159(v64, v67);
LABEL_64:
    id v75 = v196;
    goto LABEL_42;
  }
  sub_22C06C8C0();
  uint64_t v54 = sub_22C06CBF0();
  os_log_type_t v55 = sub_22C06CDA0();
  if (os_log_type_enabled(v54, v55))
  {
    uint64_t v56 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v56 = 0;
    _os_log_impl(&dword_22C04B000, v54, v55, "[TWICE] self is nil", v56, 2u);
    MEMORY[0x230F5D900](v56, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v34, v22);
}

uint64_t sub_22C062DD0()
{
  uint64_t v1 = sub_22C06CBB0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22C06CC00();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int IsBluetoothOn = AXDeviceRemoteScreenIsBluetoothOn();
  int IsWifiOn = AXDeviceRemoteScreenIsWifiOn();
  uint64_t v49 = v0;
  uint64_t v46 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger;
  id v11 = objc_retain(*(id *)(v0
                          + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger));
  int v48 = sub_22C06CAA0();

  sub_22C06C8C0();
  uint64_t v12 = sub_22C06CBF0();
  os_log_type_t v13 = sub_22C06CDB0();
  BOOL v14 = os_log_type_enabled(v12, v13);
  int v47 = IsBluetoothOn;
  if (v14)
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v44 = v6;
    uint64_t v16 = v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v45 = v1;
    uint64_t v42 = v17;
    v51[0] = v17;
    *(_DWORD *)uint64_t v16 = 136315906;
    uint64_t v50 = sub_22C0545D0(0xD000000000000019, 0x800000022C06FD30, v51);
    uint64_t v43 = v5;
    sub_22C06CE40();
    *(_WORD *)(v16 + 12) = 1024;
    LODWORD(v50) = IsBluetoothOn;
    sub_22C06CE40();
    *(_WORD *)(v16 + 18) = 1024;
    LODWORD(v50) = IsWifiOn;
    sub_22C06CE40();
    *(_WORD *)(v16 + 24) = 1024;
    char v18 = v48;
    LODWORD(v50) = v48 & 1;
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v12, v13, "[TWICE] %s BT:%{BOOL}d, WF:%{BOOL}d, isConnected: %{BOOL}d", (uint8_t *)v16, 0x1Eu);
    uint64_t v19 = v42;
    swift_arrayDestroy();
    uint64_t v1 = v45;
    MEMORY[0x230F5D900](v19, -1, -1);
    MEMORY[0x230F5D900](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v44 + 8))(v8, v43);
    if ((v18 & 1) == 0)
    {
LABEL_3:
      uint64_t v20 = (unsigned int *)MEMORY[0x263F21E10];
      goto LABEL_11;
    }
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if ((v48 & 1) == 0) {
      goto LABEL_3;
    }
  }
  if (!v47)
  {
    uint64_t v34 = sub_22C06CBE0();
    if (IsWifiOn) {
      uint64_t v35 = (unsigned int *)MEMORY[0x263F21EF8];
    }
    else {
      uint64_t v35 = (unsigned int *)MEMORY[0x263F21F00];
    }
    (*(void (**)(char *, void, uint64_t))(*(void *)(v34 - 8) + 104))(v4, *v35, v34);
    uint64_t v40 = *MEMORY[0x263F21DE8];
    uint64_t v41 = sub_22C06CB80();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v41 - 8) + 104))(v4, v40, v41);
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F21E48], v1);
    goto LABEL_14;
  }
  if (IsWifiOn)
  {
    uint64_t v21 = v49;
    uint64_t v22 = *(void **)(v49 + v46);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26849E4E8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22C06E010;
    id v24 = v22;
    v51[0] = sub_22C06C930();
    v51[1] = v25;
    uint64_t v26 = MEMORY[0x263F8D310];
    sub_22C06CEA0();
    uint64_t v27 = sub_22C06C990();
    *(void *)(inited + 96) = v26;
    *(void *)(inited + 72) = v27;
    *(void *)(inited + 80) = v28;
    sub_22C0668FC(inited);
    uint64_t v29 = MEMORY[0x230F5CB80]();
    uint64_t v31 = v30;

    swift_bridgeObjectRelease();
    uint64_t v32 = (uint64_t *)(v21
                    + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_initialPingMessageIdentifier);
    *uint64_t v32 = v29;
    v32[1] = v31;
    return swift_bridgeObjectRelease();
  }
  uint64_t v36 = *MEMORY[0x263F21EF0];
  uint64_t v37 = sub_22C06CBE0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v37 - 8) + 104))(v4, v36, v37);
  uint64_t v20 = (unsigned int *)MEMORY[0x263F21DE8];
LABEL_11:
  uint64_t v38 = *v20;
  uint64_t v39 = sub_22C06CB80();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v39 - 8) + 104))(v4, v38, v39);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F21E48], v1);
LABEL_14:
  sub_22C05EE20(v4);
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_22C063390()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22C06CBB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22C06CC00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = sub_22C05D478();
  if (v10)
  {
    id v11 = v10;
    id v12 = objc_msgSend(v10, sel_start);

    uint64_t v13 = sub_22C06C880();
    unint64_t v15 = v14;

    sub_22C06C8C0();
    uint64_t v16 = sub_22C06CBF0();
    os_log_type_t v17 = sub_22C06CDB0();
    if (os_log_type_enabled(v16, v17))
    {
      char v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(void *)&long long v34 = v1;
      uint64_t v20 = v19;
      v36[0] = v19;
      unint64_t v33 = v15;
      *(_DWORD *)char v18 = 136315138;
      uint64_t v35 = sub_22C0545D0(0xD000000000000015, 0x800000022C06FD50, v36);
      unint64_t v15 = v33;
      sub_22C06CE40();
      _os_log_impl(&dword_22C04B000, v16, v17, "[TWICE] %s Received airplay data blob", v18, 0xCu);
      swift_arrayDestroy();
      uint64_t v21 = v20;
      uint64_t v1 = v34;
      MEMORY[0x230F5D900](v21, -1, -1);
      MEMORY[0x230F5D900](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26849E518);
    uint64_t inited = swift_initStackObject();
    long long v34 = xmmword_22C06E010;
    *(_OWORD *)(inited + 16) = xmmword_22C06E010;
    *(void *)(inited + 32) = sub_22C06C990();
    *(void *)(inited + 40) = v23;
    *(void *)(inited + 48) = v13;
    *(void *)(inited + 56) = v15;
    sub_22C06B9D4(v13, v15);
    unint64_t v24 = sub_22C066A40(inited);
    uint64_t v25 = *(void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26849E4E8);
    uint64_t v26 = swift_initStackObject();
    *(_OWORD *)(v26 + 16) = v34;
    id v27 = v25;
    v36[0] = sub_22C06C960();
    v36[1] = v28;
    sub_22C06CEA0();
    *(void *)(v26 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_26849E520);
    *(void *)(v26 + 72) = v24;
    sub_22C0668FC(v26);
    MEMORY[0x230F5CB80]();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_22C06BA2C(v13, v15);
  }
  else
  {
    uint64_t v30 = *MEMORY[0x263F21DF0];
    uint64_t v31 = sub_22C06CB80();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104))(v5, v30, v31);
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F21E48], v2);
    sub_22C05EE20(v5);
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_22C0637EC()
{
  id v1 = sub_22C05D554();
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = (void *)sub_22C06CCC0();
    objc_msgSend(v2, sel_beginHandlingHIDEventsForReason_, v3);
  }
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849E4E8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22C06E010;
  id v6 = v4;
  sub_22C06C9C0();
  uint64_t v7 = MEMORY[0x263F8D310];
  sub_22C06CEA0();
  uint64_t v8 = sub_22C06C990();
  *(void *)(inited + 96) = v7;
  *(void *)(inited + 72) = v8;
  *(void *)(inited + 80) = v9;
  sub_22C0668FC(inited);
  MEMORY[0x230F5CB80]();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_22C0638F4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v62 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a1, sel_type) != 3001)
  {
    *(void *)&long long v60 = 0;
    id v50 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a1, 1, &v60);
    id v51 = (id)v60;
    if (v50)
    {
      uint64_t v52 = sub_22C06C880();
      unint64_t v54 = v53;

      id v55 = objc_retain(*(id *)(v2
                              + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger));
      sub_22C06CAD0();

      sub_22C06BA2C(v52, v54);
      return;
    }
    uint64_t v56 = v51;
    id v57 = (void *)sub_22C06C860();

    swift_willThrow();
    goto LABEL_11;
  }
  id v4 = objc_msgSend(a1, sel_handInfo);
  if (!v4) {
    return;
  }
  uint64_t v5 = v4;
  objc_msgSend(v4, sel_setEncodePathsForCompatibility_, 1);
  *(void *)&long long v60 = 0;
  id v6 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v5, 1, &v60);
  id v7 = (id)v60;
  if (!v6)
  {
    id v58 = v7;
    id v57 = (void *)sub_22C06C860();

    swift_willThrow();
LABEL_11:

    return;
  }
  uint64_t v8 = sub_22C06C880();
  unint64_t v10 = v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_26849E530);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22C06E0C0;
  *(void *)(inited + 32) = sub_22C06CA50();
  *(void *)(inited + 40) = v12;
  uint64_t v13 = MEMORY[0x263F06F78];
  *(void *)(inited + 72) = MEMORY[0x263F06F78];
  *(void *)(inited + 48) = v8;
  *(void *)(inited + 56) = v10;
  sub_22C06B9D4(v8, v10);
  *(void *)(inited + 80) = sub_22C06C9D0();
  *(void *)(inited + 88) = v14;
  unsigned __int8 v15 = objc_msgSend(a1, sel_isGeneratedEvent);
  uint64_t v16 = MEMORY[0x263F8D4F8];
  *(void *)(inited + 120) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 96) = v15;
  *(void *)(inited + 128) = sub_22C06CA00();
  *(void *)(inited + 136) = v17;
  id v18 = objc_msgSend(a1, sel_generationCount);
  *(void *)(inited + 168) = MEMORY[0x263F8D6C8];
  *(void *)(inited + 144) = v18;
  *(void *)(inited + 176) = sub_22C06C9F0();
  *(void *)(inited + 184) = v19;
  unsigned int v20 = objc_msgSend(a1, sel_willUpdateMask);
  uint64_t v21 = MEMORY[0x263F8E8F8];
  *(void *)(inited + 216) = MEMORY[0x263F8E8F8];
  *(_DWORD *)(inited + 192) = v20;
  *(void *)(inited + 224) = sub_22C06C9E0();
  *(void *)(inited + 232) = v22;
  unsigned int v23 = objc_msgSend(a1, sel_didUpdateMask);
  *(void *)(inited + 264) = v21;
  *(_DWORD *)(inited + 240) = v23;
  *(void *)(inited + 272) = sub_22C06CA20();
  *(void *)(inited + 280) = v24;
  unsigned __int8 v25 = objc_msgSend(a1, sel_useOriginalHIDTime);
  *(void *)(inited + 312) = v16;
  *(unsigned char *)(inited + 288) = v25;
  *(void *)(inited + 320) = sub_22C06CA40();
  *(void *)(inited + 328) = v26;
  id v27 = objc_msgSend(a1, sel_HIDTime);
  uint64_t v28 = MEMORY[0x263F8E970];
  *(void *)(inited + 360) = MEMORY[0x263F8E970];
  *(void *)(inited + 336) = v27;
  *(void *)(inited + 368) = sub_22C06CA30();
  *(void *)(inited + 376) = v29;
  unsigned __int8 v30 = objc_msgSend(a1, sel_isDisplayIntegrated);
  *(void *)(inited + 408) = v16;
  *(unsigned char *)(inited + 384) = v30;
  *(void *)(inited + 416) = sub_22C06CA60();
  *(void *)(inited + 424) = v31;
  id v32 = objc_msgSend(a1, sel_senderID);
  *(void *)(inited + 456) = v28;
  *(void *)(inited + 432) = v32;
  *(void *)(inited + 464) = sub_22C06CA70();
  *(void *)(inited + 472) = v33;
  unsigned int v34 = objc_msgSend(a1, sel_contextId);
  *(void *)(inited + 504) = v21;
  *(_DWORD *)(inited + 480) = v34;
  unint64_t v35 = sub_22C066B68(inited);
  id v36 = objc_msgSend(a1, sel_HIDAttributeData);
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = sub_22C06C880();
    unint64_t v40 = v39;

    uint64_t v41 = sub_22C06CA10();
    uint64_t v42 = v13;
    uint64_t v44 = v43;
    uint64_t v61 = v42;
    *(void *)&long long v60 = v38;
    *((void *)&v60 + 1) = v40;
    sub_22C054DF0(&v60, v59);
    sub_22C06B9D4(v38, v40);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_22C06B274(v59, v41, v44, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_22C06BA2C(v38, v40);
  }
  uint64_t v46 = *(void **)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849E4E8);
  uint64_t v47 = swift_initStackObject();
  *(_OWORD *)(v47 + 16) = xmmword_22C06E010;
  id v48 = v46;
  *(void *)&long long v60 = sub_22C06C900();
  *((void *)&v60 + 1) = v49;
  sub_22C06CEA0();
  *(void *)(v47 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_26849E538);
  *(void *)(v47 + 72) = v35;
  sub_22C0668FC(v47);
  MEMORY[0x230F5CB80]();

  sub_22C06BA2C(v8, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void sub_22C063DB8(uint64_t a1)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  v10[0] = 0;
  id v2 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a1, 1, v10);
  id v3 = v10[0];
  if (v2)
  {
    uint64_t v4 = sub_22C06C880();
    unint64_t v6 = v5;

    id v7 = objc_retain(*(id *)(v1
                           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger));
    sub_22C06CAD0();

    sub_22C06BA2C(v4, v6);
  }
  else
  {
    uint64_t v8 = v3;
    unint64_t v9 = (void *)sub_22C06C860();

    swift_willThrow();
  }
}

void sub_22C063EBC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  v24[4] = *(id *)MEMORY[0x263EF8340];
  sub_22C06C4A8(a2, (uint64_t)v24, &qword_26849E3D0);
  id v7 = objc_msgSend(a3, sel_elementRefData);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_22C06C880();
    unint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v11 = 0xF000000000000000;
  }
  id v12 = objc_allocWithZone(MEMORY[0x263F81188]);
  id v13 = sub_22C06AB7C(a1, v24, v9, v11);
  uint64_t v14 = self;
  v24[0] = v13;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26849E550);
  uint64_t v15 = sub_22C06CE20();
  v24[0] = 0;
  id v16 = objc_msgSend(v14, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v15, 1, v24);
  swift_unknownObjectRelease();
  id v17 = v24[0];
  if (v16)
  {
    uint64_t v18 = sub_22C06C880();
    unint64_t v20 = v19;

    id v21 = objc_retain(*(id *)(v4
                            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger));
    sub_22C06CAD0();

    sub_22C06BA2C(v18, v20);
  }
  else
  {
    uint64_t v22 = v17;
    unsigned int v23 = (void *)sub_22C06C860();

    swift_willThrow();
  }
}

uint64_t sub_22C064084(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_22C06CC20();
  uint64_t v17 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22C06CC50();
  uint64_t v8 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  unint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C0524D8(0, (unint64_t *)&qword_26849E360);
  unint64_t v11 = (void *)sub_22C06CDF0();
  id v12 = (void *)swift_allocObject();
  _OWORD v12[2] = v2;
  uint64_t v12[3] = a1;
  v12[4] = a2;
  aBlock[4] = sub_22C06C560;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22C0510D0;
  aBlock[3] = &block_descriptor_78;
  id v13 = _Block_copy(aBlock);
  id v14 = v2;
  sub_22C06B9D4(a1, a2);
  swift_release();
  sub_22C06CC30();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22C06C56C((unint64_t *)&qword_26849E4D0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849DFC0);
  sub_22C06C224((unint64_t *)&qword_26849E4E0, &qword_26849DFC0);
  sub_22C06CE70();
  MEMORY[0x230F5CF00](0, v10, v7, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v16);
}

void sub_22C06436C(uint64_t a1)
{
  uint64_t v2 = sub_22C06CC00();
  uint64_t v134 = *(void *)(v2 - 8);
  uint64_t v135 = (void (*)(char *, uint64_t, uint64_t))v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  double v129 = (void (*)(char *, uint64_t, uint64_t))((char *)&v128 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v3);
  uint64_t v133 = (char *)&v128 - v5;
  uint64_t v6 = sub_22C06CBE0();
  id v7 = *(char **)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  double v139 = (void (**)(char *, void, uint64_t))((char *)&v128 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v128 - v10;
  uint64_t v12 = sub_22C06CBD0();
  uint64_t v141 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  CGFloat v130 = (char *)&v128 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  id v131 = (char *)&v128 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v136 = (char *)&v128 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  double v137 = (char *)&v128 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  unsigned int v23 = (char *)&v128 - v22;
  MEMORY[0x270FA5388](v21);
  unsigned __int8 v25 = (char *)&v128 - v24;
  uint64_t v26 = sub_22C06CB80();
  uint64_t v27 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)&v128 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned __int8 v30 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
  uint64_t v140 = a1;
  v30(v29, a1, v26);
  int v31 = (*(uint64_t (**)(char *, uint64_t))(v27 + 88))(v29, v26);
  if (v31 == *MEMORY[0x263F21E18])
  {
    (*(void (**)(char *, uint64_t))(v27 + 96))(v29, v26);
    double v139 = *(void (***)(char *, void, uint64_t))v29;
    uint64_t v32 = v142 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
    swift_beginAccess();
    uint64_t v33 = v141;
    (*(void (**)(char *, uint64_t, uint64_t))(v141 + 16))(v25, v32, v12);
    uint64_t v34 = *MEMORY[0x263F21EB0];
    char v138 = *(void (**)(char *, uint64_t, uint64_t))(v33 + 104);
    v138(v23, v34, v12);
    sub_22C06C56C(&qword_26849E510, MEMORY[0x263F21ED0]);
    char v35 = sub_22C06CCB0();
    id v36 = *(void (**)(char *, uint64_t))(v33 + 8);
    v36(v23, v12);
    v36(v25, v12);
    if (v35) {
      return;
    }
    v138(v25, v34, v12);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v141 + 24))(v32, v25, v12);
    swift_endAccess();
    sub_22C05E568();
    v36(v25, v12);
    sub_22C065BB0((uint64_t)v139);
    uint64_t v145 = 0;
    unint64_t v146 = 0xE000000000000000;
    goto LABEL_4;
  }
  uint64_t v37 = v23;
  uint64_t v132 = v12;
  uint64_t v38 = v142;
  char v138 = (void (*)(char *, uint64_t, uint64_t))v26;
  if (v31 == *MEMORY[0x263F21DE0])
  {
    (*(void (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v27 + 96))(v29, v138);
    uint64_t v136 = (char *)v6;
    double v137 = v7;
    unint64_t v39 = (void (*)(char *, char *, uint64_t))*((void *)v7 + 4);
    double v139 = (void (**)(char *, void, uint64_t))v11;
    v39(v11, v29, v6);
    uint64_t v40 = v38 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
    swift_beginAccess();
    uint64_t v41 = v141;
    uint64_t v42 = v132;
    (*(void (**)(char *, uint64_t, uint64_t))(v141 + 16))(v25, v40, v132);
    uint64_t v43 = *MEMORY[0x263F21EB0];
    uint64_t v135 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 104);
    v135(v37, v43, v42);
    sub_22C06C56C(&qword_26849E510, MEMORY[0x263F21ED0]);
    char v44 = sub_22C06CCB0();
    uint64_t v45 = *(void (**)(char *, uint64_t))(v41 + 8);
    v45(v37, v42);
    v45(v25, v42);
    if ((v44 & 1) == 0)
    {
      v135(v25, v43, v42);
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v41 + 24))(v40, v25, v42);
      swift_endAccess();
      sub_22C05E568();
      v45(v25, v42);
      uint64_t v46 = (void (*)(void, void, void))v139;
      sub_22C066024(0, (uint64_t)v139);
      uint64_t v145 = 0;
      unint64_t v146 = 0xE000000000000000;
      sub_22C06CF40();
      sub_22C06CCF0();
      uint64_t v47 = v136;
      sub_22C06CF40();
      (*((void (**)(void (*)(void, void, void), char *))v137 + 1))(v46, v47);
      goto LABEL_22;
    }
LABEL_10:
    (*((void (**)(void (**)(char *, void, uint64_t), char *))v137 + 1))(v139, v136);
    return;
  }
  if (v31 == *MEMORY[0x263F21DE8])
  {
    (*(void (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v27 + 96))(v29, v138);
    (*((void (**)(void, char *, uint64_t))v7 + 4))(v139, v29, v6);
    uint64_t v136 = (char *)v6;
    uint64_t v48 = v38 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
    swift_beginAccess();
    uint64_t v49 = v141;
    id v50 = *(void (**)(char *, uint64_t, uint64_t))(v141 + 16);
    double v137 = v7;
    uint64_t v51 = v132;
    v50(v25, v48, v132);
    uint64_t v52 = *MEMORY[0x263F21EB0];
    unint64_t v53 = v37;
    uint64_t v135 = *(void (**)(char *, uint64_t, uint64_t))(v49 + 104);
    v135(v37, v52, v51);
    sub_22C06C56C(&qword_26849E510, MEMORY[0x263F21ED0]);
    char v54 = sub_22C06CCB0();
    id v55 = *(void (**)(char *, uint64_t))(v49 + 8);
    v55(v53, v51);
    v55(v25, v51);
    if ((v54 & 1) == 0)
    {
      v135(v25, v52, v51);
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v49 + 24))(v48, v25, v51);
      swift_endAccess();
      sub_22C05E568();
      v55(v25, v51);
      unsigned int v64 = (void (*)(void, void, void))v139;
      sub_22C066024(1, (uint64_t)v139);
      uint64_t v145 = 0;
      unint64_t v146 = 0xE000000000000000;
      sub_22C06CF40();
      sub_22C06CCF0();
      uint64_t v65 = v136;
      sub_22C06CF40();
      (*((void (**)(void (*)(void, void, void), char *))v137 + 1))(v64, v65);
      goto LABEL_22;
    }
    goto LABEL_10;
  }
  uint64_t v56 = v142;
  if (v31 == *MEMORY[0x263F21E20])
  {
    uint64_t v57 = v142 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
    swift_beginAccess();
    uint64_t v58 = v141;
    uint64_t v59 = v132;
    (*(void (**)(char *, uint64_t, uint64_t))(v141 + 16))(v25, v57, v132);
    long long v60 = *(char **)(v58 + 104);
    uint64_t v61 = v37;
    LODWORD(v139) = *MEMORY[0x263F21EB0];
    double v137 = v60;
    ((void (*)(char *))v60)(v37);
    sub_22C06C56C(&qword_26849E510, MEMORY[0x263F21ED0]);
    char v62 = sub_22C06CCB0();
    uint64_t v63 = *(void (**)(char *, uint64_t))(v58 + 8);
    v63(v61, v59);
    v63(v25, v59);
    if (v62) {
      return;
    }
    ((void (*)(char *, void, uint64_t))v137)(v25, v139, v59);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v58 + 24))(v57, v25, v59);
    swift_endAccess();
    sub_22C05E568();
    v63(v25, v59);
    sub_22C06652C();
    goto LABEL_14;
  }
  if (v31 == *MEMORY[0x263F21DF8])
  {
    uint64_t v66 = v141;
    uint64_t v67 = v132;
    (*(void (**)(char *, void, uint64_t))(v141 + 104))(v25, *MEMORY[0x263F21EB8], v132);
    uint64_t v68 = v56 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v66 + 24))(v68, v25, v67);
    swift_endAccess();
    sub_22C05E568();
    (*(void (**)(char *, uint64_t))(v66 + 8))(v25, v67);
    sub_22C06652C();
    double v69 = *(void **)(v56 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
    sub_22C06CB70();
    id v70 = v69;
    id v71 = (void *)sub_22C06CAF0();
LABEL_18:
    uint64_t v72 = sub_22C06CB00();
    uint64_t v74 = v73;

    sub_22C050CF4(v72, v74, 0xD000000000000016, 0x800000022C06E510);
    swift_bridgeObjectRelease();
LABEL_21:
    v147[0] = 0;
    v147[1] = 0xE000000000000000;
    sub_22C06CF40();
    goto LABEL_22;
  }
  if (v31 == *MEMORY[0x263F21DF0])
  {
    uint64_t v75 = v141;
    uint64_t v76 = v132;
    (*(void (**)(char *, void, uint64_t))(v141 + 104))(v25, *MEMORY[0x263F21EA0], v132);
    uint64_t v77 = v56 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v75 + 24))(v77, v25, v76);
    swift_endAccess();
    sub_22C05E568();
    (*(void (**)(char *, uint64_t))(v75 + 8))(v25, v76);
    sub_22C063390();
    goto LABEL_21;
  }
  if (v31 == *MEMORY[0x263F21E08])
  {
    uint64_t v79 = (void (**)(char *, void, uint64_t))(v142
                                                        + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState);
    swift_beginAccess();
    uint64_t v80 = v141;
    BOOL v81 = *(void (**)(char *, void, uint64_t))(v141 + 16);
    double v139 = v79;
    uint64_t v82 = v132;
    uint64_t v128 = v81;
    v81(v137, v79, v132);
    uint64_t v83 = *MEMORY[0x263F21EA8];
    uint64_t v84 = v136;
    double v129 = *(void (**)(char *, uint64_t, uint64_t))(v80 + 104);
    v129(v136, v83, v82);
    sub_22C06C56C((unint64_t *)&unk_26849E560, MEMORY[0x263F21ED0]);
    sub_22C06CD10();
    sub_22C06CD10();
    if (v145 == v143 && v146 == v144) {
      char v85 = 1;
    }
    else {
      char v85 = sub_22C06CFE0();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unsigned int v93 = *(void (**)(char *, uint64_t))(v141 + 8);
    v93(v84, v82);
    id v94 = v137;
    double v137 = (char *)v93;
    v93(v94, v82);
    if (v85) {
      goto LABEL_40;
    }
    id v95 = v131;
    v128(v131, v139, v82);
    uint64_t v96 = *MEMORY[0x263F21EC8];
    uint64_t v97 = v130;
    uint64_t v136 = (char *)(v80 + 104);
    v129(v130, v96, v82);
    sub_22C06CD10();
    sub_22C06CD10();
    if (v145 == v143 && v146 == v144)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v98 = (void (*)(char *, uint64_t))v137;
      ((void (*)(char *, uint64_t))v137)(v97, v82);
      v98(v95, v82);
LABEL_40:
      unint64_t v114 = v133;
      sub_22C06C8C0();
      double v115 = sub_22C06CBF0();
      os_log_type_t v116 = sub_22C06CDA0();
      if (os_log_type_enabled(v115, v116))
      {
        double v117 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)double v117 = 0;
        _os_log_impl(&dword_22C04B000, v115, v116, "[TWICE] airplayDidStopStreamingError:", v117, 2u);
        MEMORY[0x230F5D900](v117, -1, -1);
      }

      (*(void (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v134 + 8))(v114, v135);
      uint64_t v118 = v132;
      v129(v25, *MEMORY[0x263F21EB0], v132);
      id v119 = (void (*)(void, void, void))v139;
      swift_beginAccess();
      (*(void (**)(void, char *, uint64_t))(v141 + 24))(v119, v25, v118);
      swift_endAccess();
      sub_22C05E568();
      ((void (*)(char *, uint64_t))v137)(v25, v118);
      sub_22C065BB0(1);
      uint64_t v145 = 0;
      unint64_t v146 = 0xE000000000000000;
      goto LABEL_4;
    }
    char v112 = sub_22C06CFE0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v113 = (void (*)(char *, uint64_t))v137;
    ((void (*)(char *, uint64_t))v137)(v97, v82);
    v113(v95, v82);
    if (v112) {
      goto LABEL_40;
    }
  }
  else if (v31 == *MEMORY[0x263F21DD8])
  {
    uint64_t v86 = v142 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
    swift_beginAccess();
    uint64_t v87 = v141;
    uint64_t v88 = v132;
    (*(void (**)(char *, uint64_t, uint64_t))(v141 + 16))(v25, v86, v132);
    BOOL v89 = *(char **)(v87 + 104);
    uint64_t v90 = v37;
    LODWORD(v139) = *MEMORY[0x263F21EB0];
    double v137 = v89;
    ((void (*)(char *))v89)(v37);
    sub_22C06C56C(&qword_26849E510, MEMORY[0x263F21ED0]);
    char v91 = sub_22C06CCB0();
    id v92 = *(void (**)(char *, uint64_t))(v87 + 8);
    v92(v90, v88);
    v92(v25, v88);
    if ((v91 & 1) == 0)
    {
      ((void (*)(char *, void, uint64_t))v137)(v25, v139, v88);
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v87 + 24))(v86, v25, v88);
      swift_endAccess();
      sub_22C05E568();
      v92(v25, v88);
      sub_22C065BB0(2);
LABEL_14:
      uint64_t v145 = 0;
      unint64_t v146 = 0xE000000000000000;
LABEL_4:
      sub_22C06CF40();
LABEL_22:
      sub_22C06CB70();
      id v78 = (void *)sub_22C06CAF0();
      sub_22C06CB10();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v99 = v141;
    if (v31 != *MEMORY[0x263F21E10])
    {
      if (v31 != *MEMORY[0x263F21E00])
      {
        double v123 = (char *)v129;
        sub_22C06C8C0();
        uint64_t v124 = sub_22C06CBF0();
        os_log_type_t v125 = sub_22C06CDA0();
        if (os_log_type_enabled(v124, v125))
        {
          uint64_t v126 = (uint8_t *)swift_slowAlloc();
          uint64_t v127 = swift_slowAlloc();
          v147[0] = v127;
          *(_DWORD *)uint64_t v126 = 136315138;
          uint64_t v145 = sub_22C0545D0(0xD000000000000013, 0x800000022C06FD70, v147);
          sub_22C06CE40();
          _os_log_impl(&dword_22C04B000, v124, v125, "[TWICE] %s @unknown default", v126, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x230F5D900](v127, -1, -1);
          MEMORY[0x230F5D900](v126, -1, -1);
        }

        (*(void (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v134 + 8))(v123, v135);
        (*(void (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v27 + 8))(v29, v138);
        goto LABEL_22;
      }
      uint64_t v120 = v132;
      (*(void (**)(char *, void, uint64_t))(v141 + 104))(v25, *MEMORY[0x263F21EB0], v132);
      uint64_t v121 = v38 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v99 + 24))(v121, v25, v120);
      swift_endAccess();
      sub_22C05E568();
      (*(void (**)(char *, uint64_t))(v99 + 8))(v25, v120);
      sub_22C06652C();
      uint64_t v122 = *(void **)(v38 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
      sub_22C06CB70();
      id v70 = v122;
      id v71 = (void *)sub_22C06CAF0();
      goto LABEL_18;
    }
    uint64_t v100 = v142 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
    swift_beginAccess();
    uint64_t v101 = v132;
    (*(void (**)(char *, uint64_t, uint64_t))(v99 + 16))(v25, v100, v132);
    uint64_t v102 = *MEMORY[0x263F21EB0];
    double v139 = *(void (***)(char *, void, uint64_t))(v99 + 104);
    ((void (*)(char *, uint64_t, uint64_t))v139)(v37, v102, v101);
    sub_22C06C56C(&qword_26849E510, MEMORY[0x263F21ED0]);
    char v103 = sub_22C06CCB0();
    double v104 = v37;
    unint64_t v105 = *(void (**)(char *, uint64_t))(v99 + 8);
    v105(v104, v101);
    v105(v25, v101);
    if ((v103 & 1) == 0)
    {
      ((void (*)(char *, uint64_t, uint64_t))v139)(v25, v102, v101);
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v99 + 24))(v100, v25, v101);
      swift_endAccess();
      sub_22C05E568();
      v105(v25, v101);
      sub_22C06652C();
      unint64_t v106 = *(void **)(v56 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
      sub_22C06CB70();
      id v107 = v106;
      os_log_type_t v108 = (void *)sub_22C06CAF0();
      uint64_t v109 = sub_22C06CB00();
      uint64_t v111 = v110;

      sub_22C050CF4(v109, v111, 0xD000000000000016, 0x800000022C06E510);
      swift_bridgeObjectRelease();
      uint64_t v145 = 0;
      unint64_t v146 = 0xE000000000000000;
      goto LABEL_4;
    }
  }
}

uint64_t sub_22C065BB0(uint64_t a1)
{
  uint64_t v23 = a1;
  uint64_t v26 = sub_22C06CC20();
  uint64_t v29 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22C06CC50();
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22C06CC10();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (uint64_t *)((char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_22C06CC70();
  uint64_t v24 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v23 - v16;
  sub_22C06652C();
  uint64_t v25 = *(void *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_eventSerialQueue);
  sub_22C06CC60();
  void *v10 = v23;
  (*(void (**)(void *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F018], v7);
  MEMORY[0x230F5CD80](v15, v10);
  (*(void (**)(void *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v18 = *(void (**)(char *, uint64_t))(v12 + 8);
  v18(v15, v11);
  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_22C06C5B4;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22C0510D0;
  aBlock[3] = &block_descriptor_82;
  uint64_t v20 = _Block_copy(aBlock);
  swift_retain();
  sub_22C06CC30();
  uint64_t v30 = MEMORY[0x263F8EE78];
  sub_22C06C56C((unint64_t *)&qword_26849E4D0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849DFC0);
  sub_22C06C224((unint64_t *)&qword_26849E4E0, &qword_26849DFC0);
  uint64_t v21 = v26;
  sub_22C06CE70();
  MEMORY[0x230F5CED0](v17, v6, v3, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v3, v21);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v28);
  v18(v17, v24);
  swift_release();
  return swift_release();
}

uint64_t sub_22C066024(char a1, uint64_t a2)
{
  uint64_t v4 = sub_22C06CC00();
  uint64_t v27 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22C06CBE0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)sub_22C06CCC0();
  MGGetBoolAnswer();

  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
  int v12 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v10, v7);
  if (v12 == *MEMORY[0x263F21EF8])
  {
    swift_bridgeObjectRelease();
LABEL_14:
    uint64_t v20 = *(void **)&v28[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC];
    sub_22C06CB70();
    id v21 = v20;
    uint64_t v22 = (void *)sub_22C06CAF0();
    uint64_t v23 = sub_22C06CB00();
    uint64_t v25 = v24;

    swift_bridgeObjectRelease();
    sub_22C050CF4(v23, v25, 0xD000000000000016, 0x800000022C06E510);

    return swift_bridgeObjectRelease();
  }
  if (v12 == *MEMORY[0x263F21EF0])
  {
    unint64_t v29 = 0;
    unint64_t v30 = 0xE000000000000000;
    sub_22C06CEB0();
    swift_bridgeObjectRelease();
    if (a1)
    {
      unint64_t v13 = 0xD000000000000024;
      uint64_t v14 = "AX_APPLE_WATCH_REMOTE_SCREEN_IPHONE_";
    }
    else
    {
      unint64_t v13 = 0xD000000000000023;
      uint64_t v14 = "AX_APPLE_WATCH_REMOTE_SCREEN_GIZMO_";
    }
    unint64_t v29 = v13;
    unint64_t v30 = (unint64_t)(v14 - 32) | 0x8000000000000000;
    goto LABEL_13;
  }
  if (v12 == *MEMORY[0x263F21F00])
  {
    unint64_t v29 = 0;
    unint64_t v30 = 0xE000000000000000;
    sub_22C06CEB0();
    sub_22C06CCF0();
LABEL_13:
    sub_22C06CCF0();
    swift_bridgeObjectRelease();
    sub_22C06CCF0();
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  sub_22C06C8C0();
  uint64_t v15 = sub_22C06CBF0();
  os_log_type_t v16 = sub_22C06CDA0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v28 = v17 + 4;
    unint64_t v29 = v18;
    uint64_t v31 = sub_22C0545D0(0xD000000000000033, 0x800000022C06FE20, (uint64_t *)&v29);
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v15, v16, "[TWICE] %s unknown status error", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v18, -1, -1);
    MEMORY[0x230F5D900](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_22C06652C()
{
  uint64_t v1 = sub_22C06CC20();
  uint64_t v23 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_22C06CC50();
  uint64_t v4 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C0524D8(0, (unint64_t *)&qword_26849E360);
  uint64_t v7 = (void *)sub_22C06CDF0();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v0;
  uint64_t v28 = sub_22C06C21C;
  uint64_t v29 = v8;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v25 = 1107296256;
  uint64_t v26 = sub_22C0510D0;
  uint64_t v27 = &block_descriptor_57;
  uint64_t v9 = _Block_copy(&aBlock);
  uint64_t v10 = v0;
  swift_release();
  sub_22C06CC30();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_22C06C56C((unint64_t *)&qword_26849E4D0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849DFC0);
  sub_22C06C224((unint64_t *)&qword_26849E4E0, &qword_26849DFC0);
  sub_22C06CE70();
  MEMORY[0x230F5CF00](0, v6, v3, v9);
  _Block_release(v9);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v22);
  uint64_t v11 = *(void **)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849E4E8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22C06E010;
  id v13 = v11;
  uint64_t aBlock = sub_22C06C970();
  uint64_t v25 = v14;
  uint64_t v15 = MEMORY[0x263F8D310];
  sub_22C06CEA0();
  uint64_t v16 = sub_22C06C990();
  *(void *)(inited + 96) = v15;
  *(void *)(inited + 72) = v16;
  *(void *)(inited + 80) = v17;
  sub_22C0668FC(inited);
  MEMORY[0x230F5CB80]();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v18 = sub_22C05D554();
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = (void *)sub_22C06CCC0();
    objc_msgSend(v19, sel_endHandlingHIDEventsForReason_, v20);
  }
  id v21 = sub_22C05D478();
  objc_msgSend(v21, sel_cleanup);
}

unint64_t sub_22C0668FC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849E4F0);
  uint64_t v2 = sub_22C06CFA0();
  uint64_t v3 = (void *)v2;
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
    sub_22C06C4A8(v6, (uint64_t)v15, &qword_26849E4F8);
    unint64_t result = sub_22C06AD0C((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_22C054DF0(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_22C066A40(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849E528);
  uint64_t v2 = (void *)sub_22C06CFA0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v7 = *(v4 - 1);
    unint64_t v8 = *v4;
    swift_bridgeObjectRetain();
    sub_22C06B9D4(v7, v8);
    unint64_t result = sub_22C06AD50(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (uint64_t *)(v2[7] + 16 * result);
    uint64_t *v12 = v7;
    v12[1] = v8;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_22C066B68(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849E540);
  uint64_t v2 = sub_22C06CFA0();
  uint64_t v3 = (void *)v2;
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
    sub_22C06C4A8(v6, (uint64_t)&v15, &qword_26849E548);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_22C06AD50(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_22C054DF0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

void sub_22C066CA0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  v70[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v6 = sub_22C06CC00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC;
  id v11 = *(id *)(a1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
  id v12 = sub_22C04F064();
  uint64_t v14 = v13;

  uint64_t ObjectType = swift_getObjectType();
  uint64_t v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v14 + 152))(ObjectType, v14);

  if (v16)
  {
    uint64_t v68 = v7;
    id v17 = objc_allocWithZone(MEMORY[0x263F811A0]);
    sub_22C06B9D4(a2, a3);
    id v18 = (void *)sub_22C06C870();
    id v19 = objc_msgSend(v17, sel_initWithHierarchyData_, v18);
    sub_22C06BA2C(a2, a3);

    v70[0] = 0;
    id v20 = objc_msgSend(v19, sel_decodeHierarchyWithContainer_error_, v16, v70);
    if (v20)
    {
      id v21 = v20;
      id v22 = v70[0];
      id v23 = objc_msgSend(v21, sel_accessibilityElements);
      if (v23
        && (uint64_t v24 = v23,
            uint64_t v25 = sub_22C06CD40(),
            v24,
            unint64_t v26 = sub_22C0671D8(v25),
            swift_bridgeObjectRelease(),
            v26))
      {
        sub_22C06C8C0();
        swift_bridgeObjectRetain_n();
        uint64_t v27 = sub_22C06CBF0();
        os_log_type_t v28 = sub_22C06CDB0();
        int v29 = v28;
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v67 = v27;
          uint64_t v30 = swift_slowAlloc();
          int v66 = v29;
          uint64_t v31 = (uint8_t *)v30;
          uint64_t v65 = (void *)swift_slowAlloc();
          v70[0] = v65;
          unsigned int v64 = v31;
          *(_DWORD *)uint64_t v31 = 136315138;
          uint64_t v63 = v31 + 4;
          uint64_t v32 = sub_22C0524D8(0, (unint64_t *)&qword_26849E230);
          uint64_t v33 = swift_bridgeObjectRetain();
          uint64_t v34 = MEMORY[0x230F5CE50](v33, v32);
          id v62 = v19;
          uint64_t v35 = v34;
          unint64_t v37 = v36;
          swift_bridgeObjectRelease();
          uint64_t v38 = v35;
          id v19 = v62;
          uint64_t v69 = sub_22C0545D0(v38, v37, (uint64_t *)v70);
          sub_22C06CE40();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          unint64_t v39 = v64;
          _os_log_impl(&dword_22C04B000, v67, (os_log_type_t)v66, "[TWICE] adding %s", v64, 0xCu);
          uint64_t v40 = v65;
          swift_arrayDestroy();
          MEMORY[0x230F5D900](v40, -1, -1);
          MEMORY[0x230F5D900](v39, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        (*(void (**)(char *, uint64_t))(v68 + 8))(v9, v6);
        id v43 = *(id *)(a1 + v10);
        id v44 = sub_22C04F064();
        uint64_t v46 = v45;

        uint64_t v47 = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 200))(1, v47, v46);

        id v48 = *(id *)(a1 + v10);
        id v49 = sub_22C04F064();
        uint64_t v51 = v50;

        uint64_t v52 = swift_getObjectType();
        unint64_t v53 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v51 + 152))(v52, v51);

        if (v53)
        {
          objc_msgSend(v21, sel_accessibilityFrame);
          double v55 = v54;
          double v57 = v56;
          id v58 = *(id *)(a1 + v10);
          uint64_t v59 = (char *)sub_22C04EEF8();

          long long v60 = &v59[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide];
          swift_beginAccess();
          LOBYTE(v60) = *v60;

          sub_22C0535D0(v26, (char)v60, v55, v57);
        }
        swift_bridgeObjectRelease();
      }
      else
      {
      }
    }
    else
    {
      id v41 = v70[0];
      uint64_t v42 = (void *)sub_22C06C860();

      swift_willThrow();
    }
  }
}

uint64_t sub_22C0671D8(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_22C06CF10();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_22C054968(i, (uint64_t)v5);
    sub_22C0524D8(0, (unint64_t *)&qword_26849E230);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_22C06CEF0();
    sub_22C06CF20();
    sub_22C06CF30();
    sub_22C06CF00();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

void sub_22C0672F4(uint64_t a1)
{
  id v1 = *(id *)(a1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
  id v5 = sub_22C04F064();
  uint64_t v3 = v2;

  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(void, uint64_t, uint64_t))(v3 + 200))(0, ObjectType, v3);
}

uint64_t sub_22C06737C(uint64_t a1)
{
  uint64_t v2 = sub_22C06CBB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_22C06CBD0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = a1 + 16;
  swift_beginAccess();
  uint64_t v11 = MEMORY[0x230F5D960](a1 + 16);
  if (v11)
  {
    id v12 = (char *)v11;
    (*(void (**)(unsigned char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F21EB0], v6);
    uint64_t v13 = &v12[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState];
    swift_beginAccess();
    (*(void (**)(char *, unsigned char *, uint64_t))(v7 + 24))(v13, v9, v6);
    swift_endAccess();
    sub_22C05E568();
    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  }
  swift_beginAccess();
  uint64_t result = MEMORY[0x230F5D960](v10);
  if (result)
  {
    uint64_t v15 = (void *)result;
    (*(void (**)(unsigned char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F21E78], v2);
    sub_22C05EE20(v5);

    return (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.twiceRemoteScreenReceiveMessage(_:)(Swift::OpaquePointer a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22C06CC00();
  uint64_t v117 = *(void *)(v4 - 8);
  uint64_t v118 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v113 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  double v115 = (char *)&v113 - v9;
  MEMORY[0x270FA5388](v8);
  id v119 = (char *)&v113 - v10;
  uint64_t v11 = sub_22C06CBB0();
  id v12 = *(void (***)(char *, uint64_t))(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v113 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = sub_22C06C9B0();
  unint64_t v121 = v15;
  sub_22C06CEA0();
  if (*((void *)a1._rawValue + 2) && (unint64_t v16 = sub_22C06AD0C((uint64_t)v122), (v17 & 1) != 0))
  {
    sub_22C054968(*((void *)a1._rawValue + 7) + 32 * v16, (uint64_t)&v123);
  }
  else
  {
    long long v123 = 0u;
    long long v124 = 0u;
  }
  sub_22C06B924((uint64_t)v122);
  if (*((void *)&v124 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0 && v120 == 1)
    {
      ((void (*)(char *, void, uint64_t))v12[13])(v14, *MEMORY[0x263F21E60], v11);
      sub_22C05EE20((uint64_t)v14);
      v12[1](v14, v11);
    }
  }
  else
  {
    sub_22C06B978((uint64_t)&v123, &qword_26849E3D0);
  }
  uint64_t v120 = sub_22C06C930();
  unint64_t v121 = v18;
  sub_22C06CEA0();
  if (*((void *)a1._rawValue + 2) && (unint64_t v19 = sub_22C06AD0C((uint64_t)v122), (v20 & 1) != 0))
  {
    sub_22C054968(*((void *)a1._rawValue + 7) + 32 * v19, (uint64_t)&v123);
  }
  else
  {
    long long v123 = 0u;
    long long v124 = 0u;
  }
  sub_22C06B924((uint64_t)v122);
  if (!*((void *)&v124 + 1))
  {
    sub_22C06B978((uint64_t)&v123, &qword_26849E3D0);
    goto LABEL_37;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849E3D8);
  if (swift_dynamicCast())
  {
    os_log_type_t v116 = v7;
    uint64_t v21 = v120;
    if (!*(void *)(v120 + 16)) {
      goto LABEL_30;
    }
    unint64_t v22 = sub_22C06AD50(21570, 0xE200000000000000);
    if (v23)
    {
      BOOL v24 = *(void *)(*(void *)(v21 + 56) + 8 * v22) == 1;
      if (!*(void *)(v21 + 16)) {
        goto LABEL_26;
      }
    }
    else
    {
      BOOL v24 = 0;
      if (!*(void *)(v21 + 16)) {
        goto LABEL_26;
      }
    }
    unint64_t v25 = sub_22C06AD50(18007, 0xE200000000000000);
    if (v26)
    {
      uint64_t v27 = *(void *)(*(void *)(v21 + 56) + 8 * v25);
      if (v24)
      {
        if (v27 == 1)
        {
          os_log_type_t v28 = (unsigned int *)MEMORY[0x263F21E68];
          goto LABEL_32;
        }
        goto LABEL_27;
      }
      if (v27 == 1)
      {
        int v29 = (unsigned int *)MEMORY[0x263F21EF8];
        goto LABEL_31;
      }
LABEL_30:
      int v29 = (unsigned int *)MEMORY[0x263F21F00];
      goto LABEL_31;
    }
LABEL_26:
    if (v24)
    {
LABEL_27:
      int v29 = (unsigned int *)MEMORY[0x263F21EF0];
LABEL_31:
      uint64_t v30 = *v29;
      uint64_t v31 = sub_22C06CBE0();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104))(v14, v30, v31);
      uint64_t v32 = *MEMORY[0x263F21DE0];
      uint64_t v33 = sub_22C06CB80();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 104))(v14, v32, v33);
      os_log_type_t v28 = (unsigned int *)MEMORY[0x263F21E48];
LABEL_32:
      uint64_t v34 = v12[13];
      ((void (*)(char *, void, uint64_t))v34)(v14, *v28, v11);
      unint64_t v114 = v2;
      sub_22C05EE20((uint64_t)v14);
      uint64_t v35 = v12[1];
      v35(v14, v11);
      uint64_t v36 = sub_22C06C8F0();
      if (*(void *)(v21 + 16) && (unint64_t v38 = sub_22C06AD50(v36, v37), (v39 & 1) != 0))
      {
        uint64_t v40 = *(void *)(*(void *)(v21 + 56) + 8 * v38);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        BOOL v41 = v40 == 1;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        BOOL v41 = 0;
      }
      char *v14 = v41;
      ((void (*)(char *, void, uint64_t))v34)(v14, *MEMORY[0x263F21E28], v11);
      uint64_t v42 = v114;
      sub_22C05EE20((uint64_t)v14);
      v35(v14, v11);
      uint64_t v2 = v42;
      uint64_t v7 = v116;
      goto LABEL_37;
    }
    goto LABEL_30;
  }
LABEL_37:
  uint64_t v120 = sub_22C06C960();
  unint64_t v121 = v43;
  sub_22C06CEA0();
  if (*((void *)a1._rawValue + 2) && (unint64_t v44 = sub_22C06AD0C((uint64_t)v122), (v45 & 1) != 0))
  {
    sub_22C054968(*((void *)a1._rawValue + 7) + 32 * v44, (uint64_t)&v123);
  }
  else
  {
    long long v123 = 0u;
    long long v124 = 0u;
  }
  sub_22C06B924((uint64_t)v122);
  if (*((void *)&v124 + 1))
  {
    if (swift_dynamicCast())
    {
      uint64_t v47 = v120;
      unint64_t v46 = v121;
      if (v47 == sub_22C06C950() && v46 == v48)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v49 = sub_22C06CFE0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v49 & 1) == 0)
        {
          uint64_t v51 = *MEMORY[0x263F21DF0];
          uint64_t v52 = sub_22C06CB80();
          (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v52 - 8) + 104))(v14, v51, v52);
          uint64_t v50 = (unsigned int *)MEMORY[0x263F21E48];
          goto LABEL_50;
        }
      }
      uint64_t v50 = (unsigned int *)MEMORY[0x263F21E70];
LABEL_50:
      ((void (*)(char *, void, uint64_t))v12[13])(v14, *v50, v11);
      sub_22C05EE20((uint64_t)v14);
      v12[1](v14, v11);
    }
  }
  else
  {
    sub_22C06B978((uint64_t)&v123, &qword_26849E3D0);
  }
  uint64_t v120 = sub_22C06C920();
  unint64_t v121 = v53;
  sub_22C06CEA0();
  if (*((void *)a1._rawValue + 2) && (unint64_t v54 = sub_22C06AD0C((uint64_t)v122), (v55 & 1) != 0))
  {
    sub_22C054968(*((void *)a1._rawValue + 7) + 32 * v54, (uint64_t)&v123);
  }
  else
  {
    long long v123 = 0u;
    long long v124 = 0u;
  }
  sub_22C06B924((uint64_t)v122);
  if (!*((void *)&v124 + 1))
  {
    sub_22C06B978((uint64_t)&v123, &qword_26849E3D0);
LABEL_61:
    if (!_AXSApplicationAccessibilityEnabled()) {
      goto LABEL_78;
    }
    goto LABEL_70;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_61;
  }
  os_log_type_t v116 = v7;
  uint64_t v56 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_gizmoErrorRetryLimit;
  if (*(uint64_t *)&v2[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_gizmoErrorRetryLimit] < 1)
  {
    id v62 = v115;
    sub_22C06C8C0();
    uint64_t v63 = sub_22C06CBF0();
    os_log_type_t v64 = sub_22C06CDA0();
    if (os_log_type_enabled(v63, v64))
    {
      uint64_t v65 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v65 = 0;
      _os_log_impl(&dword_22C04B000, v63, v64, "[TWICE] Gizmo retry limit. Disconnect!", v65, 2u);
      MEMORY[0x230F5D900](v65, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v117 + 8))(v62, v118);
    uint64_t v66 = *MEMORY[0x263F21E10];
    uint64_t v67 = sub_22C06CB80();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v67 - 8) + 104))(v14, v66, v67);
    ((void (*)(char *, void, uint64_t))v12[13])(v14, *MEMORY[0x263F21E48], v11);
    sub_22C05EE20((uint64_t)v14);
    v12[1](v14, v11);
  }
  else
  {
    double v115 = (char *)v12;
    uint64_t v57 = v120;
    sub_22C06C8C0();
    id v58 = v2;
    uint64_t v59 = sub_22C06CBF0();
    os_log_type_t v60 = sub_22C06CDB0();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v61 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v61 = 134217984;
      v122[0] = *(void *)&v2[v56];
      sub_22C06CE40();

      _os_log_impl(&dword_22C04B000, v59, v60, "[TWICE] Gizmo retry limit. Retry#%ld", v61, 0xCu);
      MEMORY[0x230F5D900](v61, -1, -1);
    }
    else
    {

      uint64_t v59 = v58;
    }

    (*(void (**)(char *, uint64_t))(v117 + 8))(v119, v118);
    *(void *)uint64_t v14 = v57;
    uint64_t v68 = *MEMORY[0x263F21E18];
    uint64_t v69 = sub_22C06CB80();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v69 - 8) + 104))(v14, v68, v69);
    id v70 = (void (**)(char *, uint64_t))v115;
    (*((void (**)(char *, void, uint64_t))v115 + 13))(v14, *MEMORY[0x263F21E48], v11);
    id v12 = v70;
    sub_22C05EE20((uint64_t)v14);
    v70[1](v14, v11);
    uint64_t v71 = *(void *)&v2[v56];
    BOOL v72 = __OFSUB__(v71, 1);
    uint64_t v73 = v71 - 1;
    if (v72)
    {
      __break(1u);
      return;
    }
    *(void *)&v2[v56] = v73;
  }
  uint64_t v7 = v116;
  if (_AXSApplicationAccessibilityEnabled())
  {
LABEL_70:
    uint64_t v120 = sub_22C06C940();
    unint64_t v121 = v74;
    sub_22C06CEA0();
    if (*((void *)a1._rawValue + 2) && (unint64_t v75 = sub_22C06AD0C((uint64_t)v122), (v76 & 1) != 0))
    {
      sub_22C054968(*((void *)a1._rawValue + 7) + 32 * v75, (uint64_t)&v123);
    }
    else
    {
      long long v123 = 0u;
      long long v124 = 0u;
    }
    sub_22C06B924((uint64_t)v122);
    if (*((void *)&v124 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v77 = v120;
        unint64_t v78 = v121;
        *(void *)uint64_t v14 = v120;
        *((void *)v14 + 1) = v78;
        ((void (*)(char *, void, uint64_t))v12[13])(v14, *MEMORY[0x263F21E50], v11);
        sub_22C06B9D4(v77, v78);
        sub_22C05EE20((uint64_t)v14);
        sub_22C06BA2C(v77, v78);
        v12[1](v14, v11);
      }
    }
    else
    {
      sub_22C06B978((uint64_t)&v123, &qword_26849E3D0);
    }
  }
LABEL_78:
  uint64_t v120 = sub_22C06C970();
  unint64_t v121 = v79;
  sub_22C06CEA0();
  if (*((void *)a1._rawValue + 2) && (unint64_t v80 = sub_22C06AD0C((uint64_t)v122), (v81 & 1) != 0))
  {
    sub_22C054968(*((void *)a1._rawValue + 7) + 32 * v80, (uint64_t)&v123);
  }
  else
  {
    long long v123 = 0u;
    long long v124 = 0u;
  }
  sub_22C06B924((uint64_t)v122);
  if (*((void *)&v124 + 1))
  {
    if (swift_dynamicCast())
    {
      uint64_t v83 = v120;
      unint64_t v82 = v121;
      if (v83 == sub_22C06C990() && v82 == v84)
      {
        swift_bridgeObjectRelease_n();
LABEL_89:
        ((void (*)(char *, void, uint64_t))v12[13])(v14, *MEMORY[0x263F21E88], v11);
        sub_22C05EE20((uint64_t)v14);
        v12[1](v14, v11);
        goto LABEL_90;
      }
      char v85 = sub_22C06CFE0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v85) {
        goto LABEL_89;
      }
    }
  }
  else
  {
    sub_22C06B978((uint64_t)&v123, &qword_26849E3D0);
  }
LABEL_90:
  uint64_t v120 = sub_22C06C910();
  unint64_t v121 = v86;
  sub_22C06CEA0();
  if (*((void *)a1._rawValue + 2) && (unint64_t v87 = sub_22C06AD0C((uint64_t)v122), (v88 & 1) != 0))
  {
    sub_22C054968(*((void *)a1._rawValue + 7) + 32 * v87, (uint64_t)&v123);
  }
  else
  {
    long long v123 = 0u;
    long long v124 = 0u;
  }
  sub_22C06B924((uint64_t)v122);
  if (!*((void *)&v124 + 1))
  {
    sub_22C06B978((uint64_t)&v123, &qword_26849E3D0);
    goto LABEL_102;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_102;
  }
  uint64_t v90 = v120;
  unint64_t v89 = v121;
  if (v90 == sub_22C06C980() && v89 == v91)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v92 = sub_22C06CFE0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v92 & 1) == 0) {
      goto LABEL_102;
    }
  }
  uint64_t v93 = *MEMORY[0x263F21E10];
  uint64_t v94 = sub_22C06CB80();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v94 - 8) + 104))(v14, v93, v94);
  ((void (*)(char *, void, uint64_t))v12[13])(v14, *MEMORY[0x263F21E48], v11);
  sub_22C05EE20((uint64_t)v14);
  v12[1](v14, v11);
LABEL_102:
  uint64_t v120 = sub_22C06C8F0();
  unint64_t v121 = v95;
  sub_22C06CEA0();
  if (*((void *)a1._rawValue + 2) && (unint64_t v96 = sub_22C06AD0C((uint64_t)v122), (v97 & 1) != 0))
  {
    sub_22C054968(*((void *)a1._rawValue + 7) + 32 * v96, (uint64_t)&v123);
  }
  else
  {
    long long v123 = 0u;
    long long v124 = 0u;
  }
  sub_22C06B924((uint64_t)v122);
  if (*((void *)&v124 + 1))
  {
    if (swift_dynamicCast())
    {
      char *v14 = v120 == 1;
      ((void (*)(char *, void, uint64_t))v12[13])(v14, *MEMORY[0x263F21E28], v11);
      sub_22C05EE20((uint64_t)v14);
      v12[1](v14, v11);
    }
  }
  else
  {
    sub_22C06B978((uint64_t)&v123, &qword_26849E3D0);
  }
  uint64_t v120 = sub_22C06C8E0();
  unint64_t v121 = v98;
  sub_22C06CEA0();
  if (*((void *)a1._rawValue + 2) && (unint64_t v99 = sub_22C06AD0C((uint64_t)v122), (v100 & 1) != 0))
  {
    sub_22C054968(*((void *)a1._rawValue + 7) + 32 * v99, (uint64_t)&v123);
  }
  else
  {
    long long v123 = 0u;
    long long v124 = 0u;
  }
  sub_22C06B924((uint64_t)v122);
  if (!*((void *)&v124 + 1)) {
    goto LABEL_128;
  }
  if (!swift_dynamicCast()) {
    return;
  }
  uint64_t v120 = sub_22C06C8D0();
  unint64_t v121 = v101;
  sub_22C06CEA0();
  if (*((void *)a1._rawValue + 2) && (unint64_t v102 = sub_22C06AD0C((uint64_t)v122), (v103 & 1) != 0))
  {
    sub_22C054968(*((void *)a1._rawValue + 7) + 32 * v102, (uint64_t)&v123);
  }
  else
  {
    long long v123 = 0u;
    long long v124 = 0u;
  }
  sub_22C06B924((uint64_t)v122);
  if (*((void *)&v124 + 1))
  {
    if (swift_dynamicCast())
    {
      unint64_t v104 = v121;
      uint64_t v105 = *(void *)&v2[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_initialPingMessageIdentifier
                          + 8];
      if (v105
        && ((uint64_t v106 = v120,
             v120 == *(void *)&v2[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_initialPingMessageIdentifier])
         && v105 == v121
         || (sub_22C06CFE0() & 1) != 0))
      {
        sub_22C06C8C0();
        swift_bridgeObjectRetain();
        id v107 = sub_22C06CBF0();
        os_log_type_t v108 = sub_22C06CD90();
        if (os_log_type_enabled(v107, v108))
        {
          uint64_t v109 = (uint8_t *)swift_slowAlloc();
          id v119 = (char *)swift_slowAlloc();
          v122[0] = (uint64_t)v119;
          os_log_type_t v116 = v7;
          *(_DWORD *)uint64_t v109 = 136315138;
          double v115 = (char *)(v109 + 4);
          swift_bridgeObjectRetain();
          *(void *)&long long v123 = sub_22C0545D0(v106, v104, v122);
          sub_22C06CE40();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_22C04B000, v107, v108, "[TWICE] Got timeout for message identifier matching initial ping (%s). Showing first unlock error.", v109, 0xCu);
          uint64_t v110 = v119;
          swift_arrayDestroy();
          MEMORY[0x230F5D900](v110, -1, -1);
          MEMORY[0x230F5D900](v109, -1, -1);

          (*(void (**)(char *, uint64_t))(v117 + 8))(v116, v118);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v117 + 8))(v7, v118);
        }
        uint64_t v111 = *MEMORY[0x263F21E00];
        uint64_t v112 = sub_22C06CB80();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v112 - 8) + 104))(v14, v111, v112);
        ((void (*)(char *, void, uint64_t))v12[13])(v14, *MEMORY[0x263F21E48], v11);
        sub_22C05EE20((uint64_t)v14);
        v12[1](v14, v11);
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
LABEL_128:
    sub_22C06B978((uint64_t)&v123, &qword_26849E3D0);
  }
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.airplayDidStartStreaming(withMirroringLayer:)(CALayer withMirroringLayer)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22C06CBB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v27[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_22C06CC00();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v27[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22C06C8C0();
  id v12 = withMirroringLayer.super.isa;
  uint64_t v13 = sub_22C06CBF0();
  os_log_type_t v14 = sub_22C06CDB0();
  int v15 = v14;
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v33 = v9;
    uint64_t v17 = v16;
    uint64_t v30 = (void *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v36 = v31;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v32 = v8;
    uint64_t v18 = sub_22C0545D0(0xD00000000000002DLL, 0x800000022C06F780, &v36);
    uint64_t v34 = v7;
    uint64_t v35 = v18;
    sub_22C06CE40();
    *(_WORD *)(v17 + 12) = 2112;
    os_log_t v29 = v13;
    uint64_t v35 = (uint64_t)v12;
    unint64_t v19 = v12;
    int v28 = v15;
    char v20 = v12;
    uint64_t v21 = v19;
    uint64_t v7 = v34;
    sub_22C06CE40();
    unint64_t v22 = v30;
    void *v30 = v20;

    id v12 = v20;
    os_log_t v23 = v29;
    _os_log_impl(&dword_22C04B000, v29, (os_log_type_t)v28, "[TWICE] %s %@", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26849E3E0);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v22, -1, -1);
    uint64_t v24 = v31;
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v24, -1, -1);
    MEMORY[0x230F5D900](v17, -1, -1);

    (*(void (**)(unsigned char *, uint64_t))(v33 + 8))(v11, v32);
  }
  else
  {

    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  }
  id v25 = *(id *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
  id v26 = sub_22C04F064();

  swift_getObjectType();
  AXTwiceCompanionDeviceView.addScreenSubLayer(layer:)((CALayer)v12);

  (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F21E90], v4);
  sub_22C05EE20((uint64_t)v7);
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.airplayDidStopStreaming()()
{
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.connectionWithClientServiceWasInterrupted()()
{
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.axuiserverWasRestarted()()
{
}

uint64_t sub_22C068EC8(uint64_t a1, unint64_t a2, const char *a3, unsigned int *a4)
{
  unint64_t v31 = a2;
  uint64_t v32 = a3;
  uint64_t v30 = a1;
  uint64_t v6 = v4;
  uint64_t v7 = sub_22C06CBB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22C06CC00();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  os_log_type_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  int v15 = sub_22C06CBF0();
  os_log_type_t v16 = sub_22C06CDB0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v26 = v11;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v27 = a4;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v28 = v6;
    uint64_t v20 = v19;
    uint64_t v34 = v19;
    uint64_t v29 = v7;
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v33 = sub_22C0545D0(v30, v31, &v34);
    uint64_t v7 = v29;
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v15, v16, v32, v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v20, -1, -1);
    uint64_t v21 = v18;
    a4 = v27;
    MEMORY[0x230F5D900](v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v26);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  uint64_t v22 = *a4;
  uint64_t v23 = sub_22C06CB80();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 104))(v10, v22, v23);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F21E48], v7);
  sub_22C05EE20((uint64_t)v10);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void AXTwiceCompanionRootViewController.prepareToDisappear(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_22C06CBD0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_22C06CC00();
  uint64_t v10 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  uint64_t v13 = sub_22C06CBF0();
  os_log_type_t v14 = sub_22C06CDB0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v27 = v6;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v29 = a2;
    os_log_type_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v30 = v3;
    uint64_t v18 = v17;
    aBlock[0] = v17;
    uint64_t v28 = a1;
    *(_DWORD *)os_log_type_t v16 = 136315138;
    uint64_t v32 = sub_22C0545D0(0xD00000000000001FLL, 0x800000022C06F820, aBlock);
    uint64_t v6 = v27;
    a1 = v28;
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v13, v14, "[TWICE] %s", v16, 0xCu);
    swift_arrayDestroy();
    uint64_t v19 = v18;
    uint64_t v3 = v30;
    MEMORY[0x230F5D900](v19, -1, -1);
    uint64_t v20 = v16;
    a2 = v29;
    MEMORY[0x230F5D900](v20, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v31);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F21EB0], v6);
  uint64_t v21 = v6;
  uint64_t v22 = &v3[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(v22, v9, v21);
  swift_endAccess();
  sub_22C05E568();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v21);
  sub_22C06652C();
  id v23 = objc_msgSend(v3, sel_view);
  if (v23)
  {
    uint64_t v24 = v23;
    id v25 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v24, sel_setBackgroundColor_, v25);

    if (a1)
    {
      aBlock[4] = a1;
      aBlock[5] = a2;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_22C0510D0;
      aBlock[3] = (uint64_t)&block_descriptor_9;
      uint64_t v26 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
    }
    else
    {
      uint64_t v26 = 0;
    }
    objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, v26);
    _Block_release(v26);
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.axElementActivate(_:)(CGPoint a1)
{
  uint64_t v2 = v1;
  double y = a1.y;
  double x = a1.x;
  uint64_t v5 = sub_22C06CBB0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (uint64_t *)((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_22C06CC00();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  uint64_t v13 = sub_22C06CBF0();
  os_log_type_t v14 = sub_22C06CDB0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v23 = v9;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v25 = v5;
    os_log_type_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v24 = v2;
    uint64_t v18 = v17;
    uint64_t v27 = v17;
    *(_DWORD *)os_log_type_t v16 = 136315138;
    uint64_t v26 = sub_22C0545D0(0xD000000000000015, 0x800000022C06F840, &v27);
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v13, v14, "[TWICE] %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F5D900](v18, -1, -1);
    uint64_t v19 = v16;
    uint64_t v5 = v25;
    MEMORY[0x230F5D900](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v23);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  id v20 = objc_msgSend(self, sel_tapGestureForInterfaceOrientedPoint_, x, y);
  *uint64_t v8 = v20;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F21E38], v5);
  id v21 = v20;
  sub_22C05EE20((uint64_t)v8);

  (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.crownButtonPressed()()
{
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.doubleCrownButtonPressed()()
{
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.tripleCrownButtonPressed()()
{
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.crownButtonScrollUp()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22C06CBB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_22C06CC00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  uint64_t v10 = sub_22C06CBF0();
  os_log_type_t v11 = sub_22C06CDB0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v27 = v6;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v29 = v2;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v28 = v3;
    uint64_t v15 = v14;
    v31[0] = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v30 = sub_22C0545D0(0xD000000000000015, 0x800000022C06F8C0, v31);
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v10, v11, "[TWICE] %s", v13, 0xCu);
    swift_arrayDestroy();
    uint64_t v16 = v15;
    uint64_t v3 = v28;
    MEMORY[0x230F5D900](v16, -1, -1);
    uint64_t v17 = v13;
    uint64_t v2 = v29;
    MEMORY[0x230F5D900](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v27);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  id v18 = objc_msgSend(self, sel_buttonRepresentationWithType_, 1100);
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = *(id *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
    id v21 = (char *)sub_22C04EEF8();

    uint64_t v22 = &v21[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide];
    swift_beginAccess();
    int v23 = *v22;

    if (v23) {
      uint64_t v24 = 100;
    }
    else {
      uint64_t v24 = -100;
    }
    objc_msgSend(v19, sel_setScrollAmount_, v24);
    *uint64_t v5 = v19;
    (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F21E30], v2);
    id v25 = v19;
    sub_22C05EE20((uint64_t)v5);

    (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  }
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.crownButtonScrollDown()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22C06CBB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_22C06CC00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  uint64_t v10 = sub_22C06CBF0();
  os_log_type_t v11 = sub_22C06CDB0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v27 = v6;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v29 = v2;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v28 = v3;
    uint64_t v15 = v14;
    v31[0] = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v30 = sub_22C0545D0(0xD000000000000017, 0x800000022C06F8E0, v31);
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v10, v11, "[TWICE] %s", v13, 0xCu);
    swift_arrayDestroy();
    uint64_t v16 = v15;
    uint64_t v3 = v28;
    MEMORY[0x230F5D900](v16, -1, -1);
    uint64_t v17 = v13;
    uint64_t v2 = v29;
    MEMORY[0x230F5D900](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v27);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  id v18 = objc_msgSend(self, sel_buttonRepresentationWithType_, 1100);
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = *(id *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
    id v21 = (char *)sub_22C04EEF8();

    uint64_t v22 = &v21[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide];
    swift_beginAccess();
    int v23 = *v22;

    if (v23) {
      uint64_t v24 = -100;
    }
    else {
      uint64_t v24 = 100;
    }
    objc_msgSend(v19, sel_setScrollAmount_, v24);
    *uint64_t v5 = v19;
    (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F21E30], v2);
    id v25 = v19;
    sub_22C05EE20((uint64_t)v5);

    (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  }
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.crownButtonLongPressed()()
{
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.sideButtonPressed()()
{
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.sideButtonLongPressed()()
{
}

uint64_t AXTwiceCompanionRootViewController.axActionPerform(action:value:bridgeElement:)(int a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  int v29 = a1;
  uint64_t v7 = sub_22C06CBB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_22C06CC00();
  uint64_t v11 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  uint64_t v14 = sub_22C06CBF0();
  os_log_type_t v15 = sub_22C06CDB0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v27 = v4;
    uint64_t v16 = swift_slowAlloc();
    id v25 = a3;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v26 = v7;
    uint64_t v19 = v18;
    uint64_t v31 = v18;
    uint64_t v24 = a2;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v30 = sub_22C0545D0(0xD00000000000002CLL, 0x800000022C06F960, &v31);
    a2 = v24;
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v14, v15, "[TWICE] %s", v17, 0xCu);
    swift_arrayDestroy();
    uint64_t v20 = v19;
    uint64_t v7 = v26;
    MEMORY[0x230F5D900](v20, -1, -1);
    id v21 = v17;
    a3 = v25;
    MEMORY[0x230F5D900](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v28);
  *(_DWORD *)uint64_t v10 = v29;
  sub_22C06C4A8(a2, (uint64_t)(v10 + 8), &qword_26849E3D0);
  *((void *)v10 + 8) = sub_22C0524D8(0, (unint64_t *)&unk_26849E3E8);
  *((void *)v10 + 5) = a3;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F21E40], v7);
  id v22 = a3;
  sub_22C05EE20((uint64_t)v10);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.pullToDismissViewController()()
{
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.stingButtonPressed()()
{
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.stingButtonLongPressed()()
{
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.stingButtonKeycord()()
{
}

id sub_22C06A830(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v28 = a1;
  unint64_t v29 = a2;
  uint64_t v5 = v3;
  uint64_t v6 = sub_22C06CBB0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (void *)((char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_22C06CC00();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  uint64_t v14 = sub_22C06CBF0();
  os_log_type_t v15 = sub_22C06CDB0();
  if (os_log_type_enabled(v14, v15))
  {
    v25[1] = v5;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v26 = v7;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v27 = v6;
    uint64_t v19 = v18;
    uint64_t v31 = v18;
    v25[0] = v10;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v30 = sub_22C0545D0(v28, v29, &v31);
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v14, v15, "[TWICE] %s", v17, 0xCu);
    swift_arrayDestroy();
    uint64_t v20 = v19;
    uint64_t v6 = v27;
    MEMORY[0x230F5D900](v20, -1, -1);
    id v21 = v17;
    uint64_t v7 = v26;
    MEMORY[0x230F5D900](v21, -1, -1);

    (*(void (**)(char *, void))(v11 + 8))(v13, v25[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  id result = objc_msgSend(self, sel_buttonRepresentationWithType_, a3);
  if (result)
  {
    int v23 = result;
    *uint64_t v9 = result;
    (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F21E30], v6);
    id v24 = v23;
    sub_22C05EE20((uint64_t)v9);

    return (id)(*(uint64_t (**)(void *, uint64_t))(v7 + 8))(v9, v6);
  }
  return result;
}

id sub_22C06AB7C(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = a2[3];
  if (v8)
  {
    uint64_t v10 = __swift_project_boxed_opaque_existential_0(a2, a2[3]);
    uint64_t v11 = *(void *)(v8 - 8);
    MEMORY[0x270FA5388](v10);
    uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v13);
    uint64_t v14 = sub_22C06CFD0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a2);
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (a4 >> 60 == 15)
  {
    os_log_type_t v15 = 0;
  }
  else
  {
    os_log_type_t v15 = (void *)sub_22C06C870();
    sub_22C06C50C(a3, a4);
  }
  id v16 = objc_msgSend(v4, sel_initWithAxAction_withValue_forElementRefData_, a1, v14, v15);
  swift_unknownObjectRelease();

  return v16;
}

unint64_t sub_22C06AD0C(uint64_t a1)
{
  uint64_t v2 = sub_22C06CE80();

  return sub_22C06ADC8(a1, v2);
}

unint64_t sub_22C06AD50(uint64_t a1, uint64_t a2)
{
  sub_22C06D000();
  sub_22C06CCE0();
  uint64_t v4 = sub_22C06D010();

  return sub_22C06AE90(a1, a2, v4);
}

unint64_t sub_22C06ADC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_22C06C274(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x230F5CF90](v9, a1);
      sub_22C06B924((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_22C06AE90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22C06CFE0() & 1) == 0)
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
      while (!v14 && (sub_22C06CFE0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_22C06AF74(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849E540);
  uint64_t v6 = sub_22C06CF90();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      id v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      id v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_22C054DF0(v24, v35);
      }
      else
      {
        sub_22C054968((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_22C06D000();
      sub_22C06CCE0();
      uint64_t result = sub_22C06D010();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      os_log_type_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *os_log_type_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_22C054DF0(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_22C06B274(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_22C06AD50(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_22C06B434();
      goto LABEL_7;
    }
    sub_22C06AF74(v15, a4 & 1);
    unint64_t v21 = sub_22C06AD50(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_22C06CFF0();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_22C054DF0(a1, v19);
  }
LABEL_13:
  sub_22C06B3C8(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_22C06B3C8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_22C054DF0(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

void *sub_22C06B434()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26849E540);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22C06CF80();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
      goto LABEL_30;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_22C054968(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_22C054DF0(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

double sub_22C06B61C()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_mainScreen);
  objc_msgSend(v1, sel_scale);
  double v3 = v2;

  double v4 = v3 * 5.0;
  id v5 = objc_msgSend(v0, sel_mainScreen);
  objc_msgSend(v5, sel_bounds);
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v26.origin.double x = v7;
  v26.origin.double y = v9;
  v26.size.CGFloat width = v11;
  v26.size.CGFloat height = v13;
  double v14 = v4 / CGRectGetWidth(v26);
  id v15 = objc_msgSend(v0, sel_mainScreen);
  objc_msgSend(v15, sel_bounds);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v27.origin.double x = v17;
  v27.origin.double y = v19;
  v27.size.CGFloat width = v21;
  v27.size.CGFloat height = v23;
  CGFloat Height = CGRectGetHeight(v27);
  return sqrt((0.0 - v14) * (0.0 - v14) + (0.0 - v4 / Height) * (0.0 - v4 / Height));
}

double sub_22C06B754(unint64_t a1, unint64_t a2)
{
  kern_return_t v4;
  double result;
  unint64_t v6;
  uint64_t v7;
  mach_timebase_info v8[2];

  v8[1] = *(mach_timebase_info *)MEMORY[0x263EF8340];
  v8[0] = 0;
  double v4 = mach_timebase_info(v8);
  uint64_t result = -1.0;
  if (!v4)
  {
    double v6 = a2 - a1;
    if (a2 < a1)
    {
      __break(1u);
    }
    else if ((v6 & 0x8000000000000000) == 0)
    {
      CGFloat v7 = v6 * v8[0].numer;
      if (((uint64_t)v6 * (unsigned __int128)v8[0].numer) >> 64 == v7 >> 63)
      {
        if (v8[0].denom) {
          return (double)(v7 / v8[0].denom) / 1000000.0;
        }
LABEL_11:
        __break(1u);
      }
LABEL_10:
      __break(1u);
      goto LABEL_11;
    }
    __break(1u);
    goto LABEL_10;
  }
  return result;
}

uint64_t type metadata accessor for AXTwiceCompanionRootViewController()
{
  uint64_t result = qword_26849E3F8;
  if (!qword_26849E3F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22C06B85C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22C06B894()
{
  return sub_22C05ED34();
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

uint64_t sub_22C06B8B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26849E340);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_22C06B91C()
{
  return sub_22C05F514();
}

uint64_t sub_22C06B924(uint64_t a1)
{
  return a1;
}

uint64_t sub_22C06B978(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22C06B9D4(uint64_t a1, unint64_t a2)
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

uint64_t sub_22C06BA2C(uint64_t a1, unint64_t a2)
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

uint64_t sub_22C06BA84()
{
  return type metadata accessor for AXTwiceCompanionRootViewController();
}

void sub_22C06BA8C()
{
  sub_22C06CBD0();
  if (v0 <= 0x3F)
  {
    sub_22C06BBE0();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for AXTwiceCompanionRootViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AXTwiceCompanionRootViewController);
}

void sub_22C06BBE0()
{
  if (!qword_26849E408)
  {
    sub_22C06C8B0();
    unint64_t v0 = sub_22C06CE30();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26849E408);
    }
  }
}

__n128 __swift_memcpy28_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 + 12);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for AXTwiceHIDEvent(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 28)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AXTwiceHIDEvent(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_DWORD *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 28) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AXTwiceHIDEvent()
{
  return &type metadata for AXTwiceHIDEvent;
}

void sub_22C06BCAC(void *a1)
{
  uint64_t v2 = sub_22C06CBB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22C06CC00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  CGFloat v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(self, sel_server);
  if (!v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  CGFloat v11 = v10;
  unsigned int v12 = objc_msgSend(v10, sel_isScreenLockedWithPasscode_, 0);

  if (!v12) {
    return;
  }
  sub_22C06C8C0();
  CGFloat v13 = sub_22C06CBF0();
  os_log_type_t v14 = sub_22C06CDB0();
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_22C04B000, v13, v14, "[TWICE] Device is locked. Dismissing Twice VC!", v15, 2u);
    MEMORY[0x230F5D900](v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (!a1)
  {
LABEL_9:
    __break(1u);
    return;
  }
  uint64_t v16 = *MEMORY[0x263F21E80];
  CGFloat v17 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  id v18 = a1;
  v17(v5, v16, v2);
  sub_22C05EE20((uint64_t)v5);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_22C06BF18(uint64_t a1, unint64_t a2)
{
  uint64_t v23 = a1;
  uint64_t v4 = v2;
  uint64_t v5 = sub_22C06CBB0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22C06CC00();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unsigned int v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C06C8C0();
  CGFloat v13 = sub_22C06CBF0();
  os_log_type_t v14 = sub_22C06CDB0();
  if (os_log_type_enabled(v13, v14))
  {
    v21[0] = v9;
    uint64_t v15 = swift_slowAlloc();
    v21[1] = v4;
    uint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v22 = v5;
    uint64_t v18 = v17;
    uint64_t v25 = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v24 = sub_22C0545D0(v23, a2, &v25);
    sub_22C06CE40();
    _os_log_impl(&dword_22C04B000, v13, v14, "[TWICE] %s", v16, 0xCu);
    swift_arrayDestroy();
    uint64_t v19 = v18;
    uint64_t v5 = v22;
    MEMORY[0x230F5D900](v19, -1, -1);
    MEMORY[0x230F5D900](v16, -1, -1);

    (*(void (**)(char *, void))(v10 + 8))(v12, v21[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F21E80], v5);
  sub_22C05EE20((uint64_t)v8);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_22C06C1D4(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_22C06C1E4(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_22C06C1F4(uint64_t a1)
{
  AXTwiceCompanionRootViewController.handleHIDEvent(_:)(a1);
  return v1 & 1;
}

void sub_22C06C21C()
{
  sub_22C0672F4(*(void *)(v0 + 16));
}

uint64_t sub_22C06C224(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_22C06C274(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22C06C2D0(char a1, char a2)
{
  return sub_22C0608B0(a1, a2);
}

uint64_t sub_22C06C2D8()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22C06C310()
{
  uint64_t v1 = sub_22C06CBB0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_22C06C3DC()
{
  uint64_t v1 = *(void *)(sub_22C06CBB0() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_22C061434(v2, v3);
}

uint64_t sub_22C06C440(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26849E3D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22C06C4A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22C06C50C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_22C06BA2C(a1, a2);
  }
  return a1;
}

uint64_t sub_22C06C520()
{
  sub_22C06BA2C(*(void *)(v0 + 24), *(void *)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_22C06C560()
{
  sub_22C066CA0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_22C06C56C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22C06C5B4()
{
  return sub_22C06737C(v0);
}

void sub_22C06C5BC()
{
  sub_22C060D40(v0);
}

uint64_t dispatch thunk of AXTwiceRootViewControllerProtocol.axuiserverWasRestarted()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AXTwiceRootViewControllerProtocol.connectionWithClientServiceWasInterrupted()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AXTwiceRootViewControllerProtocol.prepareToDisappear(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_22C06C658()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t __getAXUIBannerPresenterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXTwiceCompanionAirplayReceiver didStartStreamingWithRenderer:](v0);
}

void __getAPRKStreamRenderingManagerClass_block_invoke_cold_1()
{
}

uint64_t sub_22C06C840()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_22C06C850()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_22C06C860()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22C06C870()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_22C06C880()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22C06C890()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_22C06C8A0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_22C06C8B0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22C06C8C0()
{
  return MEMORY[0x270F09A40]();
}

uint64_t sub_22C06C8D0()
{
  return MEMORY[0x270F09A48]();
}

uint64_t sub_22C06C8E0()
{
  return MEMORY[0x270F09A50]();
}

uint64_t sub_22C06C8F0()
{
  return MEMORY[0x270F09A58]();
}

uint64_t sub_22C06C900()
{
  return MEMORY[0x270F09A60]();
}

uint64_t sub_22C06C910()
{
  return MEMORY[0x270F09A68]();
}

uint64_t sub_22C06C920()
{
  return MEMORY[0x270F09A70]();
}

uint64_t sub_22C06C930()
{
  return MEMORY[0x270F09A78]();
}

uint64_t sub_22C06C940()
{
  return MEMORY[0x270F09A80]();
}

uint64_t sub_22C06C950()
{
  return MEMORY[0x270F09A88]();
}

uint64_t sub_22C06C960()
{
  return MEMORY[0x270F09A90]();
}

uint64_t sub_22C06C970()
{
  return MEMORY[0x270F09A98]();
}

uint64_t sub_22C06C980()
{
  return MEMORY[0x270F09AA0]();
}

uint64_t sub_22C06C990()
{
  return MEMORY[0x270F09AA8]();
}

uint64_t sub_22C06C9A0()
{
  return MEMORY[0x270F09AB0]();
}

uint64_t sub_22C06C9B0()
{
  return MEMORY[0x270F09AB8]();
}

uint64_t sub_22C06C9C0()
{
  return MEMORY[0x270F09AC0]();
}

uint64_t sub_22C06C9D0()
{
  return MEMORY[0x270F09AC8]();
}

uint64_t sub_22C06C9E0()
{
  return MEMORY[0x270F09AD0]();
}

uint64_t sub_22C06C9F0()
{
  return MEMORY[0x270F09AD8]();
}

uint64_t sub_22C06CA00()
{
  return MEMORY[0x270F09AE0]();
}

uint64_t sub_22C06CA10()
{
  return MEMORY[0x270F09AE8]();
}

uint64_t sub_22C06CA20()
{
  return MEMORY[0x270F09AF0]();
}

uint64_t sub_22C06CA30()
{
  return MEMORY[0x270F09AF8]();
}

uint64_t sub_22C06CA40()
{
  return MEMORY[0x270F09B00]();
}

uint64_t sub_22C06CA50()
{
  return MEMORY[0x270F09B08]();
}

uint64_t sub_22C06CA60()
{
  return MEMORY[0x270F09B10]();
}

uint64_t sub_22C06CA70()
{
  return MEMORY[0x270F09B18]();
}

uint64_t sub_22C06CA80()
{
  return MEMORY[0x270F09B20]();
}

uint64_t sub_22C06CA90()
{
  return MEMORY[0x270F09B28]();
}

uint64_t sub_22C06CAA0()
{
  return MEMORY[0x270F09B30]();
}

uint64_t sub_22C06CAB0()
{
  return MEMORY[0x270F09B38]();
}

uint64_t sub_22C06CAC0()
{
  return MEMORY[0x270F09B40]();
}

uint64_t sub_22C06CAD0()
{
  return MEMORY[0x270F09B48]();
}

uint64_t sub_22C06CAE0()
{
  return MEMORY[0x270F09B50]();
}

uint64_t sub_22C06CAF0()
{
  return MEMORY[0x270F09B58]();
}

uint64_t sub_22C06CB00()
{
  return MEMORY[0x270F09B60]();
}

uint64_t sub_22C06CB10()
{
  return MEMORY[0x270F09B68]();
}

uint64_t sub_22C06CB20()
{
  return MEMORY[0x270F09B70]();
}

uint64_t sub_22C06CB30()
{
  return MEMORY[0x270F09B78]();
}

uint64_t sub_22C06CB40()
{
  return MEMORY[0x270F09B80]();
}

uint64_t sub_22C06CB50()
{
  return MEMORY[0x270F09B88]();
}

uint64_t sub_22C06CB60()
{
  return MEMORY[0x270F09B90]();
}

uint64_t sub_22C06CB70()
{
  return MEMORY[0x270F09B98]();
}

uint64_t sub_22C06CB80()
{
  return MEMORY[0x270F09BA0]();
}

uint64_t sub_22C06CB90()
{
  return MEMORY[0x270F09BA8]();
}

uint64_t sub_22C06CBA0()
{
  return MEMORY[0x270F09BB0]();
}

uint64_t sub_22C06CBB0()
{
  return MEMORY[0x270F09BB8]();
}

uint64_t sub_22C06CBC0()
{
  return MEMORY[0x270F09BC0]();
}

uint64_t sub_22C06CBD0()
{
  return MEMORY[0x270F09BC8]();
}

uint64_t sub_22C06CBE0()
{
  return MEMORY[0x270F09BD0]();
}

uint64_t sub_22C06CBF0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22C06CC00()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22C06CC10()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_22C06CC20()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22C06CC30()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22C06CC40()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t sub_22C06CC50()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22C06CC60()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_22C06CC70()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_22C06CC80()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_22C06CC90()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_22C06CCA0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_22C06CCB0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22C06CCC0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22C06CCD0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22C06CCE0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22C06CCF0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22C06CD00()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22C06CD10()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_22C06CD20()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_22C06CD30()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22C06CD40()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22C06CD50()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_22C06CD60()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22C06CD70()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_22C06CD80()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_22C06CD90()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_22C06CDA0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22C06CDB0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22C06CDC0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_22C06CDD0()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_22C06CDE0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_22C06CDF0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_22C06CE00()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22C06CE10()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_22C06CE20()
{
  return MEMORY[0x270F9E3B8]();
}

uint64_t sub_22C06CE30()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22C06CE40()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22C06CE50()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22C06CE60()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22C06CE70()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22C06CE80()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_22C06CE90()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_22C06CEA0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_22C06CEB0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22C06CEC0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22C06CED0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22C06CEE0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22C06CEF0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_22C06CF00()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_22C06CF10()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_22C06CF20()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_22C06CF30()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_22C06CF40()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_22C06CF50()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22C06CF60()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22C06CF70()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22C06CF80()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22C06CF90()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22C06CFA0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22C06CFB0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22C06CFC0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22C06CFD0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_22C06CFE0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22C06CFF0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_22C06D000()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22C06D010()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AXDeviceRemoteScreenIsBluetoothOn()
{
  return MEMORY[0x270F09BD8]();
}

uint64_t AXDeviceRemoteScreenIsWifiOn()
{
  return MEMORY[0x270F09BE0]();
}

uint64_t AXDisplayCornerRadiusWithMargin()
{
  return MEMORY[0x270F09BE8]();
}

uint64_t AXEventTypeIsHomeButtonPress()
{
  return MEMORY[0x270F0A0B8]();
}

uint64_t AXIsCrownOrientationOnRightSide()
{
  return MEMORY[0x270F09BF0]();
}

uint64_t AXLogTwiceRemoteScreen()
{
  return MEMORY[0x270F093C0]();
}

uint64_t AXkMobileKeyBagLockStatusNotificationID()
{
  return MEMORY[0x270F0A3C0]();
}

uint64_t AXkNanoOrientationStatusNotificationID()
{
  return MEMORY[0x270F09BF8]();
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB938](retstr, angle, x, y, z);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x270F90570]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x270F905B0]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x270F906C0]();
}

uint64_t _AXSTwiceRemoteScreenPlatform()
{
  return MEMORY[0x270F90B38]();
}

uint64_t _AXSTwiceRemoteScreenSetEnabled()
{
  return MEMORY[0x270F90B40]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}