uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
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

void FCUIRegisterLogging()
{
  if (FCUIRegisterLogging_onceToken != -1) {
    dispatch_once(&FCUIRegisterLogging_onceToken, &__block_literal_global_2);
  }
}

void sub_21FEE1CE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21FEE25A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

void sub_21FEE290C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_21FEE2CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_21FEE3894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, id *a14, id *a15, id *location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  objc_destroyWeak((id *)(v51 - 248));
  _Unwind_Resume(a1);
}

void sub_21FEE6D40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21FEE9D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FEEA2A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FEEA35C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FEEA4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_21FEEA658(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t FCUIBundle()
{
  return [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.FocusUI"];
}

__CFString *FCUIPackageNameForActivity(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 activityIdentifier];
  if (BSEqualStrings())
  {
    uint64_t v3 = [v1 activitySymbolImageName];
    char v4 = BSEqualStrings();

    if (v4)
    {
      v5 = @"dnd_cg_02";
      goto LABEL_38;
    }
  }
  else
  {
  }
  v6 = [v1 activityIdentifier];
  if (BSEqualStrings())
  {
    v7 = [v1 activitySymbolImageName];
    char v8 = BSEqualStrings();

    if (v8)
    {
      v5 = @"work_cg_02";
      goto LABEL_38;
    }
  }
  else
  {
  }
  uint64_t v9 = [v1 activityIdentifier];
  if (BSEqualStrings())
  {
    v10 = [v1 activitySymbolImageName];
    char v11 = BSEqualStrings();

    if (v11)
    {
      v5 = @"driving_cg_03";
      goto LABEL_38;
    }
  }
  else
  {
  }
  v12 = [v1 activityIdentifier];
  if (BSEqualStrings())
  {
    v13 = [v1 activitySymbolImageName];
    char v14 = BSEqualStrings();

    if (v14)
    {
      v5 = @"gaming_cg_02";
      goto LABEL_38;
    }
  }
  else
  {
  }
  v15 = [v1 activityIdentifier];
  if (BSEqualStrings())
  {
    v16 = [v1 activitySymbolImageName];
    char v17 = BSEqualStrings();

    if (v17)
    {
      v5 = @"mindful_cg_02";
      goto LABEL_38;
    }
  }
  else
  {
  }
  v18 = [v1 activityIdentifier];
  if (BSEqualStrings())
  {
    v19 = [v1 activitySymbolImageName];
    char v20 = BSEqualStrings();

    if (v20)
    {
      v5 = @"personal_cg_02";
      goto LABEL_38;
    }
  }
  else
  {
  }
  v21 = [v1 activityIdentifier];
  if (BSEqualStrings())
  {
    v22 = [v1 activitySymbolImageName];
    char v23 = BSEqualStrings();

    if (v23)
    {
      v5 = @"reading_cg_02";
      goto LABEL_38;
    }
  }
  else
  {
  }
  v24 = [v1 activityIdentifier];
  if (BSEqualStrings())
  {
    v25 = [v1 activitySymbolImageName];
    char v26 = BSEqualStrings();

    if (v26)
    {
      v5 = @"sleep_cg_02";
      goto LABEL_38;
    }
  }
  else
  {
  }
  v27 = [v1 activityIdentifier];
  if (BSEqualStrings())
  {
    v28 = [v1 activitySymbolImageName];
    int v29 = BSEqualStrings();

    if (v29) {
      v5 = @"fitness_cg_02";
    }
    else {
      v5 = 0;
    }
  }
  else
  {

    v5 = 0;
  }
LABEL_38:

  return v5;
}

void sub_21FEEACD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_21FEEAEFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FEEF204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_21FEF1EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FEF21C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FEF3264(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __FCUIRegisterLogging_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.focusui", "Selection");
  uint64_t v1 = (void *)FCUILogSelection;
  FCUILogSelection = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.focusui", "Module");
  uint64_t v3 = (void *)FCUILogModule;
  FCUILogModule = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.focusui", "Discovery");
  uint64_t v5 = FCUILogDiscovery;
  FCUILogDiscovery = (uint64_t)v4;
  return MEMORY[0x270F9A758](v4, v5);
}

void sub_21FEFDE48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FEFE99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double FrameForBaubleAtIndex(void *a1, unint64_t a2, uint64_t a3, int a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  id v15 = a1;
  v16 = v15;
  if (a3)
  {
    [v15 scaledValueForValue:35.0];
    double v18 = v17;
    [v16 scaledValueForValue:6.0];
    double v20 = v18 * (double)a2 - v19 * (double)a2;
    if (a4)
    {
      v36.origin.x = a5;
      v36.origin.y = a6;
      v36.size.width = a7;
      v36.size.height = a8;
      double v20 = CGRectGetMaxX(v36) - v20 - v18;
    }
  }
  else
  {
    if (a2 == 2)
    {
      [v15 scaledValueForValue:15.0];
      double v26 = v25;
      v39.origin.x = a5;
      v39.origin.y = a6;
      v39.size.width = a7;
      v39.size.height = a8;
      double MinX = CGRectGetMinX(v39);
      double v28 = 25.0;
      if (a4) {
        double v28 = 19.0;
      }
      [v16 scaledValueForValue:v28];
      double v30 = MinX + v29;
      [v16 scaledValueForValue:4.0];
      double v20 = v30 + v31 * 0.5 - v26 * 0.5;
      v40.origin.x = a5;
      v40.origin.y = a6;
      v40.size.width = a7;
      v40.size.height = a8;
      CGRectGetMinY(v40);
      [v16 scaledValueForValue:3.0];
      [v16 scaledValueForValue:25.0];
      double v24 = 2.0;
    }
    else if (a2 == 1)
    {
      [v15 scaledValueForValue:19.0];
      v41.origin.x = a5;
      v41.origin.y = a6;
      v41.size.width = a7;
      v41.size.height = a8;
      double v20 = CGRectGetMinX(v41);
      if ((a4 & 1) == 0)
      {
        [v16 scaledValueForValue:25.0];
        double v33 = v20 + v32;
        [v16 scaledValueForValue:4.0];
        double v20 = v33 + v34;
      }
      v42.origin.x = a5;
      v42.origin.y = a6;
      v42.size.width = a7;
      v42.size.height = a8;
      CGRectGetMinY(v42);
      double v24 = 8.0;
    }
    else
    {
      if (a2)
      {
        double v20 = *MEMORY[0x263F001A8];
        goto LABEL_17;
      }
      [v15 scaledValueForValue:25.0];
      v37.origin.x = a5;
      v37.origin.y = a6;
      v37.size.width = a7;
      v37.size.height = a8;
      double v20 = CGRectGetMinX(v37);
      if (a4)
      {
        [v16 scaledValueForValue:19.0];
        double v22 = v20 + v21;
        [v16 scaledValueForValue:4.0];
        double v20 = v22 + v23;
      }
      v38.origin.x = a5;
      v38.origin.y = a6;
      v38.size.width = a7;
      v38.size.height = a8;
      CGRectGetMinY(v38);
      double v24 = 3.0;
    }
    [v16 scaledValueForValue:v24];
  }
LABEL_17:

  return v20;
}

uint64_t variable initialization expression of QuickStartViewController.delegate()
{
  return 0;
}

uint64_t QuickStartViewController.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC7FocusUI24QuickStartViewController_delegate;
  swift_beginAccess();
  return MEMORY[0x223C614B0](v1);
}

uint64_t QuickStartViewController.delegate.setter()
{
  return swift_unknownObjectRelease();
}

void (*QuickStartViewController.delegate.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC7FocusUI24QuickStartViewController_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x223C614B0](v5);
  return sub_21FEFF9FC;
}

void sub_21FEFF9FC(void **a1, char a2)
{
  uint64_t v3 = *a1;
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

id QuickStartViewController.__allocating_init(modeIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  swift_unknownObjectWeakInit();
  v6 = &v5[OBJC_IVAR____TtC7FocusUI24QuickStartViewController_modeIdentifier];
  *(void *)v6 = a1;
  *((void *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, 0, 0);
}

id QuickStartViewController.init(modeIdentifier:)(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakInit();
  uint64_t v5 = &v2[OBJC_IVAR____TtC7FocusUI24QuickStartViewController_modeIdentifier];
  *(void *)uint64_t v5 = a1;
  *((void *)v5 + 1) = a2;
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for QuickStartViewController();
  return objc_msgSendSuper2(&v7, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t type metadata accessor for QuickStartViewController()
{
  return self;
}

id sub_21FEFFC1C(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_21FEFFC60()
{
  swift_unknownObjectWeakInit();

  sub_21FF03588();
  __break(1u);
}

uint64_t sub_21FEFFD58()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC7FocusUI24QuickStartViewController_modeIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

Swift::Void __swiftcall QuickStartViewController.viewDidLoad()()
{
  v75.receiver = v0;
  v75.super_class = (Class)type metadata accessor for QuickStartViewController();
  objc_msgSendSuper2(&v75, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_view);
  if (!v1)
  {
    __break(1u);
    goto LABEL_20;
  }
  os_log_t v2 = v1;
  id v3 = self;
  id v4 = objc_msgSend(v3, sel_clearColor);
  objc_msgSend(v2, sel_setBackgroundColor_, v4);

  id v5 = objc_msgSend(v0, sel_view);
  if (!v5)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v6 = v5;
  objc_msgSend(v5, sel_frame);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, v8, v10, v12, v14);
  id v16 = objc_msgSend(v0, sel_view);
  if (!v16)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  double v17 = v16;
  objc_msgSend(v16, sel_addSubview_, v15);

  *(void *)(swift_allocObject() + 16) = v0;
  swift_bridgeObjectRetain();
  id v18 = v0;
  sub_21FF03428();
  *(void *)(swift_allocObject() + 16) = v18;
  sub_21FF006F0();
  id v73 = v18;
  sub_21FF034C8();
  swift_release();
  sub_21FF00744();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267F02738));
  sub_21FF0074C();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21FF00754(v74);
  double v19 = (void *)sub_21FF03488();
  objc_msgSend(v73, sel_addChildViewController_, v19);
  id v20 = objc_msgSend(v19, sel_view);
  if (!v20)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  double v21 = v20;
  id v22 = objc_msgSend(v3, sel_clearColor);
  objc_msgSend(v21, sel_setBackgroundColor_, v22);

  id v23 = objc_msgSend(v19, sel_view);
  if (!v23)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  double v24 = v23;
  id v25 = objc_msgSend(v73, sel_view);
  if (!v25)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  double v26 = v25;
  objc_msgSend(v25, sel_bounds);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  objc_msgSend(v24, sel_setFrame_, v28, v30, v32, v34);
  id v35 = objc_msgSend(v73, sel_view);
  if (!v35)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  CGRect v36 = v35;
  id v37 = objc_msgSend(v19, sel_view);
  if (!v37)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  CGRect v38 = v37;
  objc_msgSend(v36, sel_addSubview_, v37);

  objc_msgSend(v19, sel_didMoveToParentViewController_, v73);
  id v39 = objc_msgSend(v19, sel_view);
  if (!v39)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  CGRect v40 = v39;
  objc_msgSend(v39, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267F02740);
  uint64_t v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_21FF064B0;
  id v42 = objc_msgSend(v19, sel_view);
  if (!v42)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v43 = v42;
  id v44 = objc_msgSend(v42, sel_topAnchor);

  id v45 = objc_msgSend(v73, sel_view);
  if (!v45)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v46 = v45;
  id v47 = objc_msgSend(v45, sel_topAnchor);

  id v48 = objc_msgSend(v44, sel_constraintEqualToAnchor_, v47);
  *(void *)(v41 + 32) = v48;
  id v49 = objc_msgSend(v19, sel_view);
  if (!v49)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v50 = v49;
  id v51 = objc_msgSend(v49, sel_leadingAnchor);

  id v52 = objc_msgSend(v73, sel_view);
  if (!v52)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v53 = v52;
  id v54 = objc_msgSend(v52, sel_leadingAnchor);

  id v55 = objc_msgSend(v51, sel_constraintEqualToAnchor_, v54);
  *(void *)(v41 + 40) = v55;
  id v56 = objc_msgSend(v73, sel_view);
  if (!v56)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v57 = v56;
  id v58 = objc_msgSend(v56, sel_trailingAnchor);

  id v59 = objc_msgSend(v19, sel_view);
  if (!v59)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v60 = v59;
  id v61 = objc_msgSend(v59, sel_trailingAnchor);

  id v62 = objc_msgSend(v58, sel_constraintEqualToAnchor_, v61);
  *(void *)(v41 + 48) = v62;
  id v63 = objc_msgSend(v73, sel_view);
  if (!v63)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v64 = v63;
  id v65 = objc_msgSend(v63, sel_bottomAnchor);

  id v66 = objc_msgSend(v19, sel_view);
  if (v66)
  {
    v67 = v66;
    v68 = self;
    id v69 = objc_msgSend(v67, sel_bottomAnchor);

    id v70 = objc_msgSend(v65, sel_constraintEqualToAnchor_, v69);
    *(void *)(v41 + 56) = v70;
    sub_21FF03578();
    sub_21FF00764();
    v71 = (void *)sub_21FF03568();
    swift_bridgeObjectRelease();
    objc_msgSend(v68, sel_activateConstraints_, v71);

    id v72 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CB0]), sel_initWithTarget_action_, v73, sel_handleTap_);
    objc_msgSend(v15, sel_addGestureRecognizer_, v72);

    sub_21FF00744();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_21FF007A4(v74);

    return;
  }
LABEL_35:
  __break(1u);
}

uint64_t sub_21FF00604()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_21FF0063C(char a1)
{
  os_log_t v2 = *(void **)(v1 + 16);
  if (a1)
  {
    id v3 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x60))();
    if (v3)
    {
      objc_msgSend(v3, sel_requestDismissal_, v2);
      swift_unknownObjectRelease();
    }
  }
  return objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

id sub_21FF006D8()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_dismissViewControllerAnimated_completion_, 1, 0);
}

unint64_t sub_21FF006F0()
{
  unint64_t result = qword_267F02730;
  if (!qword_267F02730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F02730);
  }
  return result;
}

uint64_t sub_21FF00744()
{
  return swift_release();
}

uint64_t sub_21FF0074C()
{
  return swift_retain();
}

uint64_t sub_21FF00754(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_21FF00764()
{
  unint64_t result = qword_267F02748;
  if (!qword_267F02748)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267F02748);
  }
  return result;
}

uint64_t sub_21FF007A4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

Swift::Void __swiftcall QuickStartViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for QuickStartViewController();
  objc_msgSendSuper2(&v10, sel_viewWillAppear_, a1);
  id v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_21FF0097C;
  *(void *)(v5 + 24) = v4;
  v9[4] = sub_21FF009EC;
  v9[5] = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_21FF00A14;
  v9[3] = &block_descriptor;
  v6 = _Block_copy(v9);
  id v7 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_performWithoutAnimation_, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
}

void sub_21FF0097C()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_view);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v1, sel_layoutIfNeeded);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21FF009DC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21FF009EC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_21FF00A14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id QuickStartViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_21FF03548();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void QuickStartViewController.init(nibName:bundle:)()
{
}

id QuickStartViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QuickStartViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21FF00C04(uint64_t a1)
{
  return a1;
}

void sub_21FF00C2C()
{
}

void sub_21FF00C48()
{
  qword_267F02968 = 0x4042000000000000;
}

void sub_21FF00C58()
{
  qword_267F02978 = 0x4018000000000000;
}

void sub_21FF00C68()
{
  qword_267F02988 = 0x4039000000000000;
}

id ActivityEditViewController.__allocating_init(activityDescription:)(uint64_t a1)
{
  id v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_visibleHeight] = 0x4084000000000000;
  uint64_t v4 = &v3[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  *(void *)&v3[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_activityDescription] = a1;
  v6.receiver = v3;
  v6.super_class = v1;
  return objc_msgSendSuper2(&v6, sel_initWithNibName_bundle_, 0, 0);
}

id ActivityEditViewController.init(activityDescription:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_visibleHeight] = 0x4084000000000000;
  objc_super v2 = &v1[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock];
  *(void *)objc_super v2 = 0;
  *((void *)v2 + 1) = 0;
  *(void *)&v1[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_activityDescription] = a1;
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for ActivityEditViewController();
  return objc_msgSendSuper2(&v4, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t type metadata accessor for ActivityEditViewController()
{
  return self;
}

double variable initialization expression of ActivityEditViewController.visibleHeight()
{
  return 640.0;
}

uint64_t variable initialization expression of ActivityEditViewController.willDisappearBlock()
{
  return 0;
}

void sub_21FF00E18()
{
  *(void *)&v0[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_visibleHeight] = 0x4084000000000000;
  id v1 = &v0[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock];
  *(void *)id v1 = 0;
  *((void *)v1 + 1) = 0;

  sub_21FF03588();
  __break(1u);
}

uint64_t sub_21FF00F24()
{
  return swift_unknownObjectRetain();
}

double ActivityEditViewController.visibleHeight.getter()
{
  return *(double *)(v0 + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_visibleHeight);
}

uint64_t ActivityEditViewController.willDisappearBlock.getter()
{
  id v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_21FF00754(*v1);
  return v2;
}

void sub_21FF0108C(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t ActivityEditViewController.willDisappearBlock.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t *v5 = a1;
  v5[1] = a2;
  return sub_21FF007A4(v6);
}

uint64_t (*ActivityEditViewController.willDisappearBlock.modify())()
{
  return j__swift_endAccess;
}

Swift::Void __swiftcall ActivityEditViewController.viewDidLoad()()
{
  v52.receiver = v0;
  v52.super_class = (Class)type metadata accessor for ActivityEditViewController();
  objc_msgSendSuper2(&v52, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_view);
  if (!v1)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v2 = v1;
  id v3 = self;
  id v4 = objc_msgSend(v3, sel_clearColor);
  objc_msgSend(v2, sel_setBackgroundColor_, v4);

  id v5 = objc_msgSend(v0, sel_view);
  if (!v5)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v6 = v5;
  objc_msgSend(v5, sel_frame);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, v8, v10, v12, v14);
  id v16 = objc_msgSend(v0, sel_view);
  if (!v16)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  double v17 = v16;
  objc_msgSend(v16, sel_addSubview_, v15);

  id v18 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_activityDescription], sel_activityIdentifier);
  uint64_t v19 = sub_21FF03558();

  sub_21FF027AC(v19);
  *(void *)(swift_allocObject() + 16) = v0;
  sub_21FF02900();
  id v20 = v0;
  sub_21FF034C8();
  swift_release();
  swift_bridgeObjectRelease();
  id v21 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267F02770));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21FF00754(v51);
  id v22 = (void *)sub_21FF03488();
  objc_msgSend(v20, sel_addChildViewController_, v22);
  id v23 = objc_msgSend(v22, sel_view);
  if (!v23)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  double v24 = v23;
  id v25 = objc_msgSend(v3, sel_clearColor);
  objc_msgSend(v24, sel_setBackgroundColor_, v25);

  id v26 = objc_msgSend(v22, sel_view);
  if (!v26)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  double v27 = v26;
  id v28 = objc_msgSend(v20, sel_view);
  if (!v28)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  double v29 = v28;
  objc_msgSend(v28, sel_bounds);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  objc_msgSend(v27, sel_setFrame_, v31, v33, v35, v37);
  id v38 = objc_msgSend(v22, sel_view);
  if (!v38)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v39 = v38;
  objc_msgSend(v38, sel_frame);
  objc_msgSend(v39, sel_setFrame_);

  id v40 = objc_msgSend(v22, sel_view);
  if (!v40)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v41 = v40;
  id v42 = objc_msgSend(v20, sel_view);
  if (!v42)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v43 = v42;
  objc_msgSend(v42, sel_bounds);

  id v44 = objc_msgSend(v22, sel_view);
  if (!v44)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  id v45 = v44;
  objc_msgSend(v44, sel_frame);

  objc_msgSend(v41, sel_frame);
  objc_msgSend(v41, sel_setFrame_);

  id v46 = objc_msgSend(v20, sel_view);
  if (!v46)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v47 = v46;
  id v48 = objc_msgSend(v22, sel_view);
  if (v48)
  {
    id v49 = v48;
    objc_msgSend(v47, sel_addSubview_, v48);

    objc_msgSend(v22, sel_didMoveToParentViewController_, v20);
    id v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CB0]), sel_initWithTarget_action_, v20, sel_handleTap_);
    objc_msgSend(v15, sel_addGestureRecognizer_, v50);
    swift_release();
    swift_bridgeObjectRelease();

    sub_21FF007A4(v51);
    return;
  }
LABEL_25:
  __break(1u);
}

Swift::Void __swiftcall ActivityEditViewController.viewWillDisappear(_:)(Swift::Bool a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for ActivityEditViewController();
  id v3 = objc_msgSendSuper2(&v6, sel_viewWillDisappear_, a1);
  id v4 = (void (*)())(*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *v1) + 0x70))(v3);
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    v4();
    sub_21FF007A4(v5);
  }
}

Swift::Void __swiftcall ActivityEditViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for ActivityEditViewController();
  objc_msgSendSuper2(&v10, sel_viewWillAppear_, a1);
  id v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_21FF0097C;
  *(void *)(v5 + 24) = v4;
  v9[4] = sub_21FF009EC;
  v9[5] = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_21FF00A14;
  v9[3] = &block_descriptor_0;
  objc_super v6 = _Block_copy(v9);
  id v7 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_performWithoutAnimation_, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
}

id ActivityEditViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    objc_super v6 = (void *)sub_21FF03548();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void ActivityEditViewController.init(nibName:bundle:)()
{
}

id ActivityEditViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityEditViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21FF01C8C(uint64_t a1)
{
  return a1;
}

uint64_t sub_21FF01CC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_21FF03458();
  MEMORY[0x270FA5388](v6);
  double v8 = (uint64_t *)((char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F02778);
  MEMORY[0x270FA5388](v9 - 8);
  double v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)double v11 = sub_21FF03478();
  *((void *)v11 + 1) = 0;
  v11[16] = 1;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F02780);
  sub_21FF01ED4(a1, a2, (uint64_t)&v11[*(int *)(v12 + 44)]);
  if (qword_267F02980 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_267F02988;
  double v14 = (char *)v8 + *(int *)(v6 + 20);
  uint64_t v15 = *MEMORY[0x263F19860];
  uint64_t v16 = sub_21FF03468();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v14, v15, v16);
  *double v8 = v13;
  v8[1] = v13;
  uint64_t v17 = a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F02788) + 36);
  id v18 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_21FF02BD8((uint64_t)v8, v17, MEMORY[0x263F19048]);
  *(_WORD *)(v17 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F02790) + 36)) = 256;
  sub_21FF02E50((uint64_t)v11, a3, &qword_267F02778);
  sub_21FF02C40((uint64_t)v8, v18);
  return sub_21FF02EB4((uint64_t)v11, &qword_267F02778);
}

uint64_t sub_21FF01ED4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v47 = a2;
  uint64_t v54 = a3;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F02818);
  uint64_t v51 = *(void *)(v3 - 8);
  uint64_t v52 = v3;
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v49 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F02820);
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v50 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F02828);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  double v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v53 = (uint64_t)&v45 - v9;
  uint64_t v10 = sub_21FF03528();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F02830);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F02838);
  MEMORY[0x270FA5388](v16);
  id v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F02840);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  id v22 = (char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v45 = (uint64_t)&v45 - v23;
  uint64_t v24 = *MEMORY[0x263F19860];
  uint64_t v25 = sub_21FF03468();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104))(v12, v24, v25);
  if (qword_267F02960 != -1) {
    swift_once();
  }
  if (qword_267F02970 != -1) {
    swift_once();
  }
  sub_21FF03538();
  sub_21FF03438();
  id v26 = (uint64_t (*)(void))MEMORY[0x263F1B7A0];
  sub_21FF02BD8((uint64_t)v12, (uint64_t)v15, MEMORY[0x263F1B7A0]);
  double v27 = &v15[*(int *)(v13 + 36)];
  long long v28 = v58;
  *(_OWORD *)double v27 = v57;
  *((_OWORD *)v27 + 1) = v28;
  *((_OWORD *)v27 + 2) = v59;
  sub_21FF02C40((uint64_t)v12, v26);
  char v29 = sub_21FF034B8();
  sub_21FF02E50((uint64_t)v15, (uint64_t)v18, &qword_267F02830);
  double v30 = &v18[*(int *)(v16 + 36)];
  *double v30 = v29;
  *(_OWORD *)(v30 + 8) = 0u;
  *(_OWORD *)(v30 + 24) = 0u;
  v30[40] = 1;
  sub_21FF02EB4((uint64_t)v15, &qword_267F02830);
  int v31 = sub_21FF03498();
  sub_21FF02E50((uint64_t)v18, (uint64_t)v22, &qword_267F02838);
  *(_DWORD *)&v22[*(int *)(v19 + 36)] = v31;
  sub_21FF02EB4((uint64_t)v18, &qword_267F02838);
  uint64_t v32 = v45;
  uint64_t v33 = sub_21FF02DEC((uint64_t)v22, v45, &qword_267F02840);
  MEMORY[0x270FA5388](v33);
  uint64_t v34 = v47;
  *(&v45 - 2) = v46;
  *(&v45 - 1) = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F02848);
  unint64_t v35 = sub_21FF02D54();
  uint64_t v55 = MEMORY[0x263F3F3B0];
  unint64_t v56 = v35;
  swift_getOpaqueTypeConformance2();
  double v36 = v49;
  sub_21FF03448();
  sub_21FF02DA8(&qword_267F02858, &qword_267F02818);
  uint64_t v37 = (uint64_t)v50;
  uint64_t v38 = v52;
  sub_21FF034D8();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v36, v38);
  LOBYTE(v26) = sub_21FF034A8();
  sub_21FF02E50(v37, (uint64_t)v8, &qword_267F02820);
  id v39 = &v8[*(int *)(v48 + 36)];
  *id v39 = (char)v26;
  *(_OWORD *)(v39 + 8) = 0u;
  *(_OWORD *)(v39 + 24) = 0u;
  v39[40] = 1;
  sub_21FF02EB4(v37, &qword_267F02820);
  uint64_t v40 = v53;
  sub_21FF02DEC((uint64_t)v8, v53, &qword_267F02828);
  sub_21FF02E50(v32, (uint64_t)v22, &qword_267F02840);
  sub_21FF02E50(v40, (uint64_t)v8, &qword_267F02828);
  uint64_t v41 = v54;
  sub_21FF02E50((uint64_t)v22, v54, &qword_267F02840);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F02860);
  sub_21FF02E50((uint64_t)v8, v41 + *(int *)(v42 + 48), &qword_267F02828);
  uint64_t v43 = v41 + *(int *)(v42 + 64);
  *(void *)uint64_t v43 = 0;
  *(unsigned char *)(v43 + 8) = 1;
  sub_21FF02EB4(v40, &qword_267F02828);
  sub_21FF02EB4(v32, &qword_267F02840);
  sub_21FF02EB4((uint64_t)v8, &qword_267F02828);
  return sub_21FF02EB4((uint64_t)v22, &qword_267F02840);
}

uint64_t sub_21FF02580()
{
  return sub_21FF03508();
}

uint64_t sub_21FF0259C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_21FF03458();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (uint64_t *)((char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F02778);
  MEMORY[0x270FA5388](v6 - 8);
  double v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v1;
  uint64_t v9 = v1[1];
  *(void *)double v8 = sub_21FF03478();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F02780);
  sub_21FF01ED4(v10, v9, (uint64_t)&v8[*(int *)(v11 + 44)]);
  if (qword_267F02980 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_267F02988;
  uint64_t v13 = (char *)v5 + *(int *)(v3 + 20);
  uint64_t v14 = *MEMORY[0x263F19860];
  uint64_t v15 = sub_21FF03468();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);
  uint64_t *v5 = v12;
  v5[1] = v12;
  uint64_t v16 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F02788) + 36);
  uint64_t v17 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_21FF02BD8((uint64_t)v5, v16, MEMORY[0x263F19048]);
  *(_WORD *)(v16 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F02790) + 36)) = 256;
  sub_21FF02E50((uint64_t)v8, a1, &qword_267F02778);
  sub_21FF02C40((uint64_t)v5, v17);
  return sub_21FF02EB4((uint64_t)v8, &qword_267F02778);
}

uint64_t sub_21FF027AC(uint64_t a1)
{
  sub_21FF02F9C(0, &qword_267F02868);
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_appearance);
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel_clearColor);
  objc_msgSend(v2, sel_setBackgroundColor_, v4);

  sub_21FF02F9C(0, (unint64_t *)&unk_267F02870);
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_appearance);
  id v6 = objc_msgSend(v3, sel_clearColor);
  objc_msgSend(v5, sel_setBackgroundColor_, v6);

  return a1;
}

uint64_t sub_21FF028C8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_21FF02900()
{
  unint64_t result = qword_267F02768;
  if (!qword_267F02768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F02768);
  }
  return result;
}

uint64_t sub_21FF02954()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21FF02964()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for ConfigNavigationView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ConfigNavigationView()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ConfigNavigationView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ConfigNavigationView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfigNavigationView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ConfigNavigationView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for ConfigNavigationView()
{
  return &type metadata for ConfigNavigationView;
}

unint64_t sub_21FF02AC8()
{
  unint64_t result = qword_267F02800;
  if (!qword_267F02800)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F02788);
    sub_21FF02DA8(&qword_267F02808, &qword_267F02778);
    sub_21FF02DA8(&qword_267F02810, (uint64_t *)&unk_267F02790);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F02800);
  }
  return result;
}

uint64_t sub_21FF02B8C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21FF02BC4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_21FF02BD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21FF02C40(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21FF02CA0()
{
  swift_bridgeObjectRetain();
  sub_21FF03418();
  long long v8 = v4;
  long long v5 = v1;
  long long v6 = v2;
  char v7 = v3;
  sub_21FF02D54();
  sub_21FF03518();
  sub_21FF02F10((uint64_t)&v5);
  sub_21FF02F3C((uint64_t)&v6);
  return sub_21FF02F70((uint64_t)&v8);
}

unint64_t sub_21FF02D54()
{
  unint64_t result = qword_267F02850;
  if (!qword_267F02850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F02850);
  }
  return result;
}

uint64_t sub_21FF02DA8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_21FF02DEC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21FF02E50(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21FF02EB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21FF02F10(uint64_t a1)
{
  return a1;
}

uint64_t sub_21FF02F3C(uint64_t a1)
{
  return a1;
}

uint64_t sub_21FF02F70(uint64_t a1)
{
  return a1;
}

uint64_t sub_21FF02F9C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21FF03418()
{
  return MEMORY[0x270F2CFF8]();
}

uint64_t sub_21FF03428()
{
  return MEMORY[0x270F2D000]();
}

uint64_t sub_21FF03438()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_21FF03448()
{
  return MEMORY[0x270EFFB68]();
}

uint64_t sub_21FF03458()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_21FF03468()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_21FF03478()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_21FF03488()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_21FF03498()
{
  return MEMORY[0x270F01D30]();
}

uint64_t sub_21FF034A8()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_21FF034B8()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_21FF034C8()
{
  return MEMORY[0x270F2D008]();
}

uint64_t sub_21FF034D8()
{
  return MEMORY[0x270F2D010]();
}

uint64_t sub_21FF034E8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_21FF034F8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_21FF03508()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_21FF03518()
{
  return MEMORY[0x270F03B50]();
}

uint64_t sub_21FF03528()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_21FF03538()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_21FF03548()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21FF03558()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21FF03568()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21FF03578()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21FF03588()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t BNPresentableDescription()
{
  return MEMORY[0x270F10680]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x270F10780]();
}

uint64_t BSEqualArrays()
{
  return MEMORY[0x270F10798]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x270F107C8]();
}

uint64_t BSRectRoundForScale()
{
  return MEMORY[0x270F108D0]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x270F108D8]();
}

uint64_t BSSizeCeilForScale()
{
  return MEMORY[0x270F10950]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x270EFB7B0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x270EE9A80]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t SBSIsSystemApertureAvailable()
{
  return MEMORY[0x270F77180]();
}

uint64_t SBUISystemApertureDefaultContentSizeCategory()
{
  return MEMORY[0x270F77278]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x270F82CB8]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x270F82CC8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x270F82D20]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x270F82E70]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x270F82E80]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x270F82E88]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x270F82E90]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x270F82E98]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x270F82EC0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F82ED0]();
}

uint64_t UIRectRoundToScale()
{
  return MEMORY[0x270F82EE0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x270F82EF0]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x270F82F18]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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