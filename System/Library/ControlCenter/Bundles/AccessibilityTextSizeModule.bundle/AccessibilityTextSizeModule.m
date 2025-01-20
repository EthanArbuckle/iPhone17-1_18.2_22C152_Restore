id AXCCLocalizedString(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t vars8;

  v1 = (void *)MEMORY[0x263F086E0];
  v2 = a1;
  v3 = objc_opt_class();
  v6 = objc_msgSend_bundleForClass_(v1, v4, v3, v5);
  v8 = objc_msgSend_localizedStringForKey_value_table_(v6, v7, (uint64_t)v2, (uint64_t)&stru_26F4BC1F8, @"Accessibility");

  return v8;
}

uint64_t sub_2406069A8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int isEqualToString = objc_msgSend_isEqualToString_(*(void **)(a1 + 40), a2, *MEMORY[0x263F83468], a4);
  double v9 = 0.0;
  if (isEqualToString) {
    double v9 = 1.0;
  }
  v10 = *(void **)(*(void *)(a1 + 32) + 1000);

  return objc_msgSend_setAlpha_(v10, v6, v7, v8, v9);
}

uint64_t sub_240607D34(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__commitTextSizeIfNeeded(*(void **)(a1 + 32), a2, a3, a4);
}

double AXCCSizeCeilToViewScale(void *a1)
{
  id v1 = a1;
  UICeilToViewScale();
  double v3 = v2;
  UICeilToViewScale();

  return v3;
}

void sub_240609B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

id sub_240609B6C(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x263F824C0];
  double v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_bounds(WeakRetained, v5, v6, v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  id v16 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_compactContinuousCornerRadius(v16, v17, v18, v19);
  objc_msgSend__bezierPathWithPillRect_cornerRadius_(v2, v20, v21, v22, v9, v11, v13, v15, v23);
  v24 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  v25 = (UIView *)objc_loadWeakRetained(v3);
  v26 = UIAccessibilityConvertPathToScreenCoordinates(v24, v25);

  return v26;
}

void sub_240609D2C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_endTransitionToSize_withTransitionCoordinator_(*(void **)(*(void *)(a1 + 32) + 1032), a2, *(void *)(a1 + 40), a4, *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend_textSizeDelegate(*(void **)(a1 + 32), v5, v6, v7);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_moduleDidExpand(v11, v8, v9, v10);
}

void sub_24060AA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_24060AF78(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!qword_268C8B6C8)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = sub_24060B0B8;
    v5[4] = &unk_2650C77A0;
    v5[5] = v5;
    long long v6 = xmmword_2650C7788;
    uint64_t v7 = 0;
    qword_268C8B6C8 = _sl_dlopen();
    double v3 = (void *)v5[0];
    double v2 = (void *)qword_268C8B6C8;
    if (qword_268C8B6C8)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      double v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  double v2 = (void *)qword_268C8B6C8;
LABEL_5:
  result = dlsym(v2, "AXFrontBoardRunningAppProcesses");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_268C8B6C0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_24060B0B8()
{
  uint64_t result = _sl_dlopen();
  qword_268C8B6C8 = result;
  return result;
}

uint64_t sub_24060B7B8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int isEqualToString = objc_msgSend_isEqualToString_(*(void **)(a1 + 40), a2, *MEMORY[0x263F83468], a4);
  double v9 = 0.0;
  if (isEqualToString) {
    double v9 = 1.0;
  }
  uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 1000);

  return objc_msgSend_setAlpha_(v10, v6, v7, v8, v9);
}

void sub_24060D4A8(void *a1, double a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v15 = a4;
  objc_msgSend_setAlpha_(a1, v8, v9, v10, a2);
  objc_msgSend__setDrawsAsBackdropOverlayWithBlendMode_(a1, v11, a5, v12);
  objc_msgSend_setBackgroundColor_(a1, v13, (uint64_t)v15, v14);
}

void sub_24060D520(void *a1, double a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v15 = a4;
  objc_msgSend_setAlpha_(a1, v8, v9, v10, a2);
  objc_msgSend__setDrawsAsBackdropOverlayWithBlendMode_(a1, v11, a5, v12);
  objc_msgSend_setTextColor_(a1, v13, (uint64_t)v15, v14);
}

void sub_24060D598(void *a1, double a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v15 = a4;
  objc_msgSend_setAlpha_(a1, v8, v9, v10, a2);
  objc_msgSend__setDrawsAsBackdropOverlayWithBlendMode_(a1, v11, a5, v12);
  objc_msgSend_setTintColor_(a1, v13, (uint64_t)v15, v14);
}

void sub_24060D610(void *a1, double a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v15 = a4;
  objc_msgSend_setAlpha_(a1, v8, v9, v10, a2);
  objc_msgSend__setDrawsAsBackdropOverlayWithBlendMode_(a1, v11, a5, v12);
  objc_msgSend_setColor_(a1, v13, (uint64_t)v15, v14);
}

uint64_t sub_24060E228(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 456)) {
    return objc_msgSend_setFrame_(a2, (const char *)a2, a3, a4, *(double *)(a1 + 72) + *(double *)(a1 + 80) * (double)(unint64_t)a3, 0.0, *(double *)(a1 + 80), *(double *)(a1 + 88));
  }
  else {
    return objc_msgSend_setFrame_(a2, (const char *)a2, a3, a4, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
}

uint64_t sub_24060E26C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 456)) {
    return objc_msgSend_setFrame_(a2, (const char *)a2, a3, a4, 0.0, *(double *)(a1 + 72) + (*(double *)(a1 + 80) + *(double *)(v4 + 600)) * (double)(unint64_t)a3, *(double *)(a1 + 88), *(double *)(v4 + 600));
  }
  else {
    return objc_msgSend_setFrame_(a2, (const char *)a2, a3, a4, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
}

void sub_24060E8B4(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 504);
  id v6 = a2;
  objc_msgSend_objectAtIndexedSubscript_(v5, v7, a3, v8);
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend_title(v6, v9, v10, v11);
  objc_msgSend_setTitle_(v47, v13, (uint64_t)v12, v14);

  uint64_t v18 = objc_msgSend_packageName(v6, v15, v16, v17);
  objc_msgSend_setPackageName_(v47, v19, (uint64_t)v18, v20);

  objc_msgSend_setStylingProvider_(v47, v21, *(void *)(*(void *)(a1 + 32) + 496), v22);
  v26 = objc_msgSend_image(v6, v23, v24, v25);

  objc_msgSend_setImage_(v47, v27, (uint64_t)v26, v28);
  objc_msgSend_setImageSize_(v47, v29, v30, v31, *(double *)(*(void *)(a1 + 32) + 592), *(double *)(*(void *)(a1 + 32) + 600));
  uint64_t v35 = objc_msgSend__buttonLayoutAxis(*(void **)(a1 + 32), v32, v33, v34);
  objc_msgSend_setAxis_(v47, v36, v35, v37);
  uint64_t v41 = objc_msgSend_contentVerticalAlignment(*(void **)(a1 + 32), v38, v39, v40);
  objc_msgSend_setContentVerticalAlignment_(v47, v42, v41, v43);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 461)) {
    objc_msgSend_controlCenterApplyPrimaryContentShadow(v47, v44, v45, v46);
  }
}

uint64_t sub_24060EBFC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = objc_msgSend__layoutLabels(*(void **)(a1 + 32), a2, a3, a4);
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v9 = *(void **)(a1 + 32);
    return objc_msgSend__layoutSelectionView(v9, v6, v7, v8);
  }
  return result;
}

void sub_24060EC4C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v11 = a2;
  uint64_t v8 = objc_msgSend_accessibilityTraits(v11, v5, v6, v7);
  if (v4 == a3) {
    objc_msgSend_setAccessibilityTraits_(v11, v9, *MEMORY[0x263F832A8] | v8, v10);
  }
  else {
    objc_msgSend_setAccessibilityTraits_(v11, v9, v8 & ~*MEMORY[0x263F832A8], v10);
  }
}

uint64_t sub_24060F11C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend__updateButtonsVisiblity(*(void **)(a1 + 32), a2, a3, a4);
  objc_msgSend_updateVisualStyling(*(void **)(a1 + 32), v5, v6, v7);
  id v11 = *(void **)(a1 + 32);

  return objc_msgSend__updateSelectionVisiblity(v11, v8, v9, v10);
}

uint64_t sub_24060F26C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__layoutSelectionView(*(void **)(a1 + 32), a2, a3, a4);
}

uint64_t sub_24060F340(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_24060F438;
  v9[3] = &unk_2650C76D0;
  v9[4] = *(void *)(a1 + 32);
  objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x263F82E00], a2, (uint64_t)v9, a4, 0.0, 0.1);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_24060F444;
  v8[3] = &unk_2650C76D0;
  v8[4] = *(void *)(a1 + 32);
  return objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x263F82E00], v5, (uint64_t)v8, v6, 0.9, 0.1);
}

uint64_t sub_24060F438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_setDisplayMessage_, 1, a4);
}

uint64_t sub_24060F444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_setDisplayMessage_, 0, a4);
}

BOOL sub_24060F738(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_frame(a2, (const char *)a2, a3, a4);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

uint64_t sub_24060F774(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    double v2 = 0.0;
    double v3 = *(double *)(a1 + 40) / 6.0;
  }
  else
  {
    double v3 = 0.0;
    double v2 = *(double *)(a1 + 40) / 6.0;
  }
  CGAffineTransformMakeTranslation(&v13, v3, v2);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 528);
  CGAffineTransform v12 = v13;
  uint64_t result = objc_msgSend_setTransform_(v4, v5, (uint64_t)&v12, v6);
  if (*(unsigned char *)(a1 + 57))
  {
    objc_msgSend_setSelectedOptionIndex_(*(void **)(a1 + 32), v8, *(void *)(a1 + 48), v9);
    return objc_msgSend__animateGlyphStateSelected_(*(void **)(a1 + 32), v10, 1, v11);
  }
  return result;
}

uint64_t sub_24060FA14(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_setSelectedOptionIndex_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40) == 0, a4);
}

uint64_t sub_24060FA24(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_setSelectedOptionIndex_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), a4);
}

BOOL sub_24060FC34(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_frame(a2, (const char *)a2, a3, a4);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  objc_msgSend_location(*(void **)(a1 + 32), v13, v14, v15);
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v20 = v6;
  uint64_t v21 = v8;
  uint64_t v22 = v10;
  uint64_t v23 = v12;

  return CGRectContainsPoint(*(CGRect *)&v20, *(CGPoint *)&v17);
}

void sub_240610000(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 456))
  {
    BOOL v6 = *(void *)(v5 + 472) != a3;
    id v7 = a2;
    objc_msgSend_setUserInteractionEnabled_(v7, v8, v6, v9);
    objc_msgSend_setAlpha_(v7, v10, v11, v12, 1.0);
    objc_msgSend_setSelected_(v7, v13, *(void *)(*(void *)(a1 + 32) + 472) == a3, v14);
    BOOL v17 = *(unsigned char *)(*(void *)(a1 + 32) + 459) != 0;
  }
  else
  {
    id v18 = a2;
    BOOL v17 = 1;
    objc_msgSend_setUserInteractionEnabled_(v18, v19, 1, v20);
    double v24 = 0.0;
    if (*(void *)(*(void *)(a1 + 32) + 472) == a3) {
      double v24 = 1.0;
    }
    objc_msgSend_setAlpha_(v18, v21, v22, v23, v24);
    objc_msgSend_setSelected_(v18, v25, *(void *)(*(void *)(a1 + 32) + 472) == a3, v26);
  }
  objc_msgSend_setLabelHidden_(a2, v15, v17, v16);
  uint64_t isEnabled = objc_msgSend_isEnabled(*(void **)(a1 + 32), v27, v28, v29);
  objc_msgSend_setEnabled_(a2, v31, isEnabled, v32);
}

uint64_t sub_240610A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(*(void *)(a1 + 32) + 472) == a3) {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v4 = 0;
  }
  return MEMORY[0x270F9A6D0](a2, sel_setGlyphState_, v4, a4);
}

uint64_t sub_240610AF0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend__layoutSelectionView(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 528);
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v10[0] = *MEMORY[0x263F000D0];
  v10[1] = v6;
  v10[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return objc_msgSend_setTransform_(v5, v7, (uint64_t)v10, v8);
}

void sub_24061164C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_view(*(void **)(a1 + 32), a2, a3, a4);
  objc_msgSend_setNeedsLayout(v5, v6, v7, v8);

  objc_msgSend_view(*(void **)(a1 + 32), v9, v10, v11);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutIfNeeded(v15, v12, v13, v14);
}

void sub_2406116B4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_textSizeDelegate(*(void **)(a1 + 32), a2, a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_moduleDidExpand(v7, v4, v5, v6);
}

uint64_t sub_240611C98(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (unint64_t)(double)(unint64_t)objc_msgSend_indexOfObject_(*(void **)(*(void *)(a1 + 32) + 984), a2, *(void *)(a1 + 40), a4);
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 1056);

  return objc_msgSend_setStep_(v8, v5, v6, v7);
}

uint64_t sub_24061220C(uint64_t a1, uint64_t a2)
{
  sub_2406140E0(&qword_268C8B640);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = sub_240615320();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v6 = sub_2406140E0(&qword_268C8B648);
  sub_2406123D4(a1, a2, (uint64_t)&v5[*(int *)(v6 + 44)]);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_240615270();
  swift_release();
  swift_release();
  swift_release();
  v9[2] = v9[3];
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  sub_240614FB0(&qword_268C8B650, &qword_268C8B640);
  swift_retain();
  sub_240615380();
  swift_release();
  return sub_240614CC0((uint64_t)v5, &qword_268C8B640);
}

uint64_t sub_2406123D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v59 = a3;
  uint64_t v5 = sub_2406140E0(&qword_268C8B658);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2406140E0(&qword_268C8B660) - 8;
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_240615310();
  uint64_t v58 = v12;
  LODWORD(v56) = v13;
  uint64_t v57 = v14;
  type metadata accessor for AppPickerButtonModel();
  sub_240614088();
  sub_2406152B0();
  swift_getKeyPath();
  sub_2406152C0();
  swift_release();
  swift_release();
  uint64_t v64 = v67;
  uint64_t v65 = v68;
  int v66 = v69;
  uint64_t v62 = a1;
  uint64_t v63 = a2;
  sub_2406140E0(&qword_268C8B668);
  sub_240614B50();
  sub_2406153B0();
  uint64_t v15 = sub_240615390();
  uint64_t KeyPath = swift_getKeyPath();
  BOOL v17 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v61 = v11;
  v17(v11, v8, v5);
  id v18 = (uint64_t *)&v11[*(int *)(v9 + 44)];
  *id v18 = KeyPath;
  v18[1] = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v58 = sub_240615320();
  sub_240615310();
  uint64_t v19 = sub_240615330();
  uint64_t v51 = v19;
  uint64_t v21 = v20;
  uint64_t v52 = v22;
  LOBYTE(KeyPath) = v23 & 1;
  sub_240615310();
  uint64_t v24 = sub_240615330();
  uint64_t v50 = v25;
  uint64_t v60 = v26;
  LOBYTE(v8) = v27 & 1;
  sub_240615310();
  uint64_t v28 = sub_240615330();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  LOBYTE(v67) = KeyPath;
  char v34 = v33 & 1;
  LOBYTE(v64) = (_BYTE)v8;
  LOBYTE(v72[0]) = v33 & 1;
  sub_240614D1C(v19, v21, KeyPath);
  swift_bridgeObjectRetain();
  uint64_t v35 = v24;
  uint64_t v55 = v24;
  uint64_t v36 = v24;
  uint64_t v37 = v50;
  sub_240614D1C(v36, v50, (char)v8);
  swift_bridgeObjectRetain();
  uint64_t v56 = v30;
  sub_240614D1C(v28, v30, v34);
  uint64_t v57 = v32;
  swift_bridgeObjectRetain();
  sub_240614D2C(v28, v30, v34);
  swift_bridgeObjectRelease();
  uint64_t v38 = v37;
  sub_240614D2C(v35, v37, (char)v8);
  swift_bridgeObjectRelease();
  uint64_t v39 = v51;
  uint64_t v40 = v21;
  sub_240614D2C(v51, v21, KeyPath);
  uint64_t v41 = v52;
  swift_bridgeObjectRelease();
  char v75 = 1;
  char v74 = v67;
  char v73 = v64;
  char v71 = v72[0];
  uint64_t v54 = sub_2406153D0();
  uint64_t v53 = v42;
  char v43 = v75;
  char v44 = v74;
  LOBYTE(v35) = v73;
  LOBYTE(v21) = v71;
  uint64_t v45 = v59;
  sub_240614C5C((uint64_t)v61, v59, &qword_268C8B660);
  uint64_t v46 = v45 + *(int *)(sub_2406140E0(&qword_268C8B698) + 36);
  *(void *)uint64_t v46 = v58;
  *(void *)(v46 + 8) = 0;
  *(unsigned char *)(v46 + 16) = v43;
  *(_DWORD *)(v46 + 17) = v67;
  *(_DWORD *)(v46 + 20) = *(_DWORD *)((char *)&v67 + 3);
  *(void *)(v46 + 24) = v39;
  *(void *)(v46 + 32) = v40;
  *(unsigned char *)(v46 + 40) = v44;
  *(_DWORD *)(v46 + 41) = v64;
  *(_DWORD *)(v46 + 44) = *(_DWORD *)((char *)&v64 + 3);
  uint64_t v47 = v55;
  *(void *)(v46 + 48) = v41;
  *(void *)(v46 + 56) = v47;
  *(void *)(v46 + 64) = v38;
  *(unsigned char *)(v46 + 72) = v35;
  *(_DWORD *)(v46 + 76) = *(_DWORD *)((char *)v72 + 3);
  *(_DWORD *)(v46 + 73) = v72[0];
  *(void *)(v46 + 80) = v60;
  *(void *)(v46 + 88) = v28;
  *(void *)(v46 + 96) = v56;
  *(unsigned char *)(v46 + 104) = v21;
  *(_DWORD *)(v46 + 105) = *(_DWORD *)v70;
  *(_DWORD *)(v46 + 108) = *(_DWORD *)&v70[3];
  *(void *)(v46 + 112) = v57;
  *(void *)(v46 + 120) = 0;
  uint64_t v48 = v53;
  *(void *)(v46 + 128) = v54;
  *(void *)(v46 + 136) = v48;
  return sub_240614CC0((uint64_t)v61, &qword_268C8B660);
}

uint64_t sub_240612960@<X0>(_DWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_240615270();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2406129E0()
{
  return sub_240615280();
}

uint64_t sub_240612A5C()
{
  return sub_240615370();
}

uint64_t sub_240612A78()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_240615270();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_240612AEC()
{
  return sub_24061220C(*v0, v0[1]);
}

char *sub_240612AF4(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    if (!v2) {
      return (char *)v3;
    }
    uint64_t v11 = MEMORY[0x263F8EE78];
    uint64_t result = sub_2406141B8(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v5 = 0;
    uint64_t v3 = v11;
    while (v2 != v5)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x2455F1000](v5, a1);
      }
      else {
        id v6 = *(id *)(a1 + 8 * v5 + 32);
      }
      uint64_t v7 = v6;
      unsigned int v8 = objc_msgSend(v6, sel_correspondingState);

      unint64_t v10 = *(void *)(v11 + 16);
      unint64_t v9 = *(void *)(v11 + 24);
      if (v10 >= v9 >> 1) {
        sub_2406141B8((char *)(v9 > 1), v10 + 1, 1);
      }
      ++v5;
      *(void *)(v11 + 16) = v10 + 1;
      *(_DWORD *)(v11 + 4 * v10 + 32) = v8;
      if (v2 == v5) {
        return (char *)v3;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_240615480();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_240612C58()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_240615270();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_240612CCC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_240615270();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_240612D40()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC27AccessibilityTextSizeModule20AppPickerButtonModel__options;
  uint64_t v2 = sub_2406140E0(&qword_268C8B628);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC27AccessibilityTextSizeModule20AppPickerButtonModel__selection;
  uint64_t v4 = sub_2406140E0(&qword_268C8B630);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC27AccessibilityTextSizeModule20AppPickerButtonModel__helper;
  uint64_t v6 = sub_2406140E0(&qword_268C8B638);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v8 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v7, v8);
}

uint64_t sub_240612E74()
{
  uint64_t v16 = sub_2406140E0(&qword_268C8B638);
  uint64_t v1 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2406140E0(&qword_268C8B630);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2406140E0(&qword_268C8B628);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v0 + OBJC_IVAR____TtC27AccessibilityTextSizeModule20AppPickerButtonModel__options;
  uint64_t v17 = MEMORY[0x263F8EE78];
  sub_2406140E0(&qword_268C8B5C0);
  sub_240615260();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  uint64_t v13 = v0 + OBJC_IVAR____TtC27AccessibilityTextSizeModule20AppPickerButtonModel__selection;
  LODWORD(v17) = 3;
  sub_240615260();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v13, v7, v4);
  uint64_t v14 = v0 + OBJC_IVAR____TtC27AccessibilityTextSizeModule20AppPickerButtonModel__helper;
  uint64_t v17 = 0;
  sub_2406140E0(&qword_268C8B5D8);
  sub_240615260();
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v14, v3, v16);
  return v0;
}

uint64_t sub_24061310C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AppPickerButtonModel();
  uint64_t result = sub_240615250();
  *a1 = result;
  return result;
}

uint64_t variable initialization expression of AppPickerButtonWrapperView.model()
{
  type metadata accessor for AppPickerButtonModel();
  uint64_t v0 = swift_allocObject();
  sub_240612E74();
  return v0;
}

uint64_t type metadata accessor for AppPickerButtonModel()
{
  uint64_t result = qword_268C8B718;
  if (!qword_268C8B718) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_2406131D4(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = OBJC_IVAR___AXCCAppPickerButtonWrapperView_model;
  type metadata accessor for AppPickerButtonModel();
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v5;
  sub_240612E74();
  *(void *)&v5[v10] = v11;

  v32.receiver = v12;
  v32.super_class = (Class)type metadata accessor for AppPickerButtonWrapperView();
  id v13 = objc_msgSendSuper2(&v32, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_240614088();
  swift_retain();
  sub_2406152A0();
  uint64_t v14 = (objc_class *)sub_2406140E0(&qword_268C8B5F0);
  id v15 = objc_allocWithZone(v14);
  uint64_t v16 = (void *)sub_2406152D0();
  objc_msgSend(v16, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v13, sel_addSubview_, v16);
  uint64_t v17 = self;
  id v18 = (void *)sub_2406153F0();
  sub_2406140E0(&qword_268C8B5F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2406173D0;
  *(void *)(inited + 32) = 0x56676E6974736F68;
  *(void *)(inited + 40) = 0xEB00000000776569;
  *(void *)(inited + 72) = v14;
  *(void *)(inited + 48) = v16;
  id v20 = v16;
  sub_24061359C(inited);
  uint64_t v21 = (void *)sub_2406153E0();
  swift_bridgeObjectRelease();
  id v22 = objc_msgSend(v17, sel_constraintsWithVisualFormat_options_metrics_views_, v18, 0, 0, v21);

  sub_240614124(0, &qword_268C8B600);
  unint64_t v23 = sub_240615430();

  sub_2406136D4(v23);
  uint64_t v24 = (void *)sub_2406153F0();
  uint64_t v25 = swift_initStackObject();
  *(_OWORD *)(v25 + 16) = xmmword_2406173D0;
  *(void *)(v25 + 32) = 0x56676E6974736F68;
  *(void *)(v25 + 40) = 0xEB00000000776569;
  *(void *)(v25 + 48) = v20;
  *(void *)(v25 + 72) = v14;
  id v26 = v20;
  sub_24061359C(v25);
  char v27 = (void *)sub_2406153E0();
  swift_bridgeObjectRelease();
  id v28 = objc_msgSend(v17, sel_constraintsWithVisualFormat_options_metrics_views_, v24, 0, 0, v27);

  unint64_t v29 = sub_240615430();
  sub_2406136D4(v29);
  uint64_t v30 = (void *)sub_240615420();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_activateConstraints_, v30);

  return v13;
}

unint64_t sub_24061359C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_2406140E0(&qword_268C8B618);
  uint64_t v2 = sub_240615490();
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
    sub_240614C5C(v6, (uint64_t)&v15, &qword_268C8B620);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_2406142D4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_240614738(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_2406136D4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_240615480();
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
    uint64_t v5 = sub_240615480();
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
    unint64_t v4 = MEMORY[0x2455F1010](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t v10 = sub_240614568(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_240615480();
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

Swift::Void __swiftcall AppPickerButtonWrapperView.setOptions(_:)(Swift::OpaquePointer a1)
{
  if (a1._rawValue)
  {
    objc_msgSend(a1._rawValue, sel_state);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_240615280();
}

Swift::Void __swiftcall AppPickerButtonWrapperView.setHelper(_:)(AXCCTextSizeHelper *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v2 = a1;
  swift_retain();
  sub_240615280();
}

id AppPickerButtonWrapperView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppPickerButtonWrapperView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_240613C48@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_240615270();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_240613CC8()
{
  return sub_240615280();
}

uint64_t sub_240613D44@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_240615270();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_240613DC4(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_240615280();
}

uint64_t type metadata accessor for AppPickerButtonWrapperView()
{
  return self;
}

uint64_t sub_240613E60()
{
  return type metadata accessor for AppPickerButtonModel();
}

void sub_240613E68()
{
  sub_24061402C(319, &qword_268C8B5B8, &qword_268C8B5C0);
  if (v0 <= 0x3F)
  {
    sub_240613FD4();
    if (v1 <= 0x3F)
    {
      sub_24061402C(319, &qword_268C8B5D0, &qword_268C8B5D8);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t sub_240613F8C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_240613FD4()
{
  if (!qword_268C8B5C8)
  {
    unint64_t v0 = sub_240615290();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C8B5C8);
    }
  }
}

void sub_24061402C(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_240613F8C(a3);
    unint64_t v4 = sub_240615290();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_24061407C()
{
  return MEMORY[0x263EFDDD8];
}

unint64_t sub_240614088()
{
  unint64_t result = qword_268C8B5E8;
  if (!qword_268C8B5E8)
  {
    type metadata accessor for AppPickerButtonModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C8B5E8);
  }
  return result;
}

uint64_t sub_2406140E0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_240614124(uint64_t a1, unint64_t *a2)
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

uint64_t sub_240614160@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2406152E0();
  *a1 = result;
  return result;
}

uint64_t sub_24061418C()
{
  return sub_2406152F0();
}

char *sub_2406141B8(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2406141D8(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_2406141D8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_2406140E0(&qword_268C8B6B8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

unint64_t sub_2406142D4(uint64_t a1, uint64_t a2)
{
  sub_2406154B0();
  sub_240615410();
  uint64_t v4 = sub_2406154C0();

  return sub_24061434C(a1, a2, v4);
}

unint64_t sub_24061434C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2406154A0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2406154A0() & 1) == 0);
    }
  }
  return v6;
}

void (*sub_240614430(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_2406144E0(v6, a2, a3);
  return sub_240614498;
}

void sub_240614498(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_2406144E0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x2455F1000](a2, a3);
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
    return sub_240614560;
  }
  __break(1u);
  return result;
}

void sub_240614560(id *a1)
{
}

uint64_t sub_240614568(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_240615480();
    uint64_t result = swift_bridgeObjectRelease();
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
      uint64_t v8 = sub_240615480();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_240614FB0(&qword_268C8B610, &qword_268C8B608);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_2406140E0(&qword_268C8B608);
            uint64_t v10 = sub_240614430(v13, i, a3);
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
        sub_240614124(0, &qword_268C8B600);
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

_OWORD *sub_240614738(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *initializeBufferWithCopyOfBuffer for AppPickerButton(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for AppPickerButton()
{
  return swift_release();
}

void *assignWithCopy for AppPickerButton(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for AppPickerButton(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for AppPickerButton(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppPickerButton(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppPickerButton(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AppPickerButton()
{
  return &type metadata for AppPickerButton;
}

uint64_t sub_240614898()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2406148B4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2406148EC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_240615270();
  swift_release();
  swift_release();
  swift_release();
  if (v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_240615270();
    swift_release();
    swift_release();
    swift_release();
    objc_msgSend(v1, sel_setState_, v0);
  }
}

uint64_t sub_2406149DC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_240615270();
  swift_release();
  swift_release();
  sub_240612AF4(v5);
  swift_bridgeObjectRelease();
  swift_release();
  swift_getKeyPath();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  swift_retain();
  sub_2406140E0(&qword_268C8B6A0);
  sub_2406140E0(&qword_268C8B680);
  sub_240614FB0(&qword_268C8B6A8, &qword_268C8B6A0);
  sub_240614BC4();
  return sub_2406153C0();
}

unint64_t sub_240614B50()
{
  unint64_t result = qword_268C8B670;
  if (!qword_268C8B670)
  {
    sub_240613F8C(&qword_268C8B668);
    sub_240614BC4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C8B670);
  }
  return result;
}

unint64_t sub_240614BC4()
{
  unint64_t result = qword_268C8B678;
  if (!qword_268C8B678)
  {
    sub_240613F8C(&qword_268C8B680);
    sub_240614FB0(&qword_268C8B688, &qword_268C8B690);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C8B678);
  }
  return result;
}

uint64_t sub_240614C5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_2406140E0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_240614CC0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2406140E0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_240614D1C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_240614D2C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

void sub_240614D3C(int *a1@<X0>, uint64_t *a2@<X8>)
{
  int v3 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_240615270();
  swift_release();
  swift_release();
  swift_release();
  if (v21 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_240615480())
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (v21 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2455F1000](v5 - 4) : *(id *)(v21 + 8 * v5);
      uint64_t v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      if (objc_msgSend(v6, sel_correspondingState) == v3)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v9 = sub_240615300();
        id v11 = objc_msgSend(v7, sel_image);
        uint64_t v4 = sub_2406153A0();
        id v12 = objc_msgSend(v7, sel_title);
        sub_240615400();

        sub_240614FF4();
        uint64_t v13 = sub_240615340();
        uint64_t v15 = v14;
        uint64_t v17 = v16;
        char v19 = v18 & 1;
        unsigned __int8 v22 = v18 & 1;
        swift_retain();
        sub_240614D1C(v13, v15, v19);
        swift_bridgeObjectRetain();
        sub_240614D2C(v13, v15, v19);
        swift_release();
        swift_bridgeObjectRelease();

        uint64_t v20 = v22;
        uint64_t v10 = 1;
        goto LABEL_16;
      }

      ++v5;
      if (v8 == v4)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v9 = 0;
        uint64_t v10 = 0;
        uint64_t v4 = 0;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease_n();
  uint64_t v9 = 0;
  uint64_t v10 = 0;
LABEL_15:
  uint64_t v13 = 0;
  uint64_t v15 = 0;
  uint64_t v20 = 0;
  uint64_t v17 = 0;
LABEL_16:
  *a2 = v9;
  a2[1] = 0;
  a2[2] = v10;
  a2[3] = v4;
  a2[4] = v13;
  a2[5] = v15;
  a2[6] = v20;
  a2[7] = v17;
}

uint64_t sub_240614FB0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_240613F8C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_240614FF4()
{
  unint64_t result = qword_268C8B6B0;
  if (!qword_268C8B6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C8B6B0);
  }
  return result;
}

uint64_t sub_24061504C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2406150E8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_240604000, log, OS_LOG_TYPE_ERROR, "Button images weren't created correcly", v1, 2u);
}

void sub_24061512C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_240604000, log, OS_LOG_TYPE_ERROR, "Buttons number is less than foreground apps number", v1, 2u);
}

uint64_t sub_240615170()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_240615194(v0);
}

void sub_240615194(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_240604000, log, OS_LOG_TYPE_ERROR, "Got too many foreground applications, should be 1 for a phone", v1, 2u);
}

void sub_2406151D8(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = objc_msgSend_description(a2, (const char *)a2, (uint64_t)a3, (uint64_t)a4);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_240604000, a4, OS_LOG_TYPE_ERROR, "Couldn't read appName, error = %@", a1, 0xCu);
}

uint64_t sub_240615250()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_240615260()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_240615270()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_240615280()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_240615290()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_2406152A0()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_2406152B0()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_2406152C0()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_2406152D0()
{
  return MEMORY[0x270EFFD88]();
}

uint64_t sub_2406152E0()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_2406152F0()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_240615300()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_240615310()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_240615320()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_240615330()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_240615340()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_240615350()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_240615360()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_240615370()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_240615380()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_240615390()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_2406153A0()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_2406153B0()
{
  return MEMORY[0x270F049D0]();
}

uint64_t sub_2406153C0()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_2406153D0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2406153E0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2406153F0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_240615400()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_240615410()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_240615420()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_240615430()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_240615450()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_240615460()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_240615470()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_240615480()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_240615490()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2406154A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2406154B0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2406154C0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F09240]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09440]();
}

uint64_t AXTextSizePercentage()
{
  return MEMORY[0x270F09D70]();
}

uint64_t CCUIIsPortrait()
{
  return MEMORY[0x270F18860]();
}

uint64_t CCUISliderExpandedContentModuleHeight()
{
  return MEMORY[0x270F188B0]();
}

uint64_t CCUISliderExpandedContentModuleWidth()
{
  return MEMORY[0x270F188B8]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
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

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

UIBezierPath *__cdecl UIAccessibilityConvertPathToScreenCoordinates(UIBezierPath *path, UIView *view)
{
  return (UIBezierPath *)MEMORY[0x270F82BF0](path, view);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UICeilToScale()
{
  return MEMORY[0x270F82CB8]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x270F82CC0]();
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x270F82D20]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x270F82E50]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x270F82E58]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x270F82E68]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x270F82E80]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x270F82E90]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x270F82EC0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F82ED0]();
}

uint64_t _AXSCopyPreferredContentSizeCategoryNameApp()
{
  return MEMORY[0x270F906E8]();
}

uint64_t _AXSCopyPreferredContentSizeCategoryNameGlobal()
{
  return MEMORY[0x270F906F0]();
}

uint64_t _AXSSetPreferredContentSizeCategoryName()
{
  return MEMORY[0x270F90A60]();
}

uint64_t _AXSSetPreferredContentSizeCategoryNameApp()
{
  return MEMORY[0x270F90A68]();
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

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}