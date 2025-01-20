void sub_4F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4F94(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_16;
  }
  if (WeakRetained[8])
  {
    v3 = FCUILogModule;
    if (os_log_type_enabled(FCUILogModule, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v2[8];
      LODWORD(v10) = 138543362;
      *(void *)((char *)&v10 + 4) = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Deactivating active activity: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    id v5 = 0;
    goto LABEL_12;
  }
  id v6 = WeakRetained[9];
  if (v6)
  {
    id v5 = v6;
    v7 = FCUILogModule;
    if (!os_log_type_enabled(FCUILogModule, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    LODWORD(v10) = 138543362;
    *(void *)((char *)&v10 + 4) = v5;
    v8 = "Activating previously active activity: %{public}@";
  }
  else
  {
    id v5 = WeakRetained[10];
    v7 = FCUILogModule;
    if (!os_log_type_enabled(FCUILogModule, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    LODWORD(v10) = 138543362;
    *(void *)((char *)&v10 + 4) = v5;
    v8 = "Activating suggested activity: %{public}@";
  }
  _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
LABEL_12:
  objc_msgSend(v2[1], "setActivity:active:reason:", v5, v5 != 0, @"Control center activity suggestion button", v10);
  if (*((unsigned char *)v2 + 161) && v5 == v2[10])
  {
    v9 = [v2[1] suggestedActivityFeedbackReceiver];
    [v9 userDidAcceptSuggestedActivity:v5 location:0];
  }
LABEL_16:
}

void sub_5194(id a1, FCCCControlCenterModule *a2, UITraitCollection *a3)
{
  v8 = a2;
  id v4 = [(UITraitCollection *)a3 preferredContentSizeCategory];
  id v5 = [(FCCCControlCenterModule *)v8 traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory(v4, v6);

  if (v7) {
    [(FCCCModuleViewController *)v8->_moduleViewController adjustForContentSizeCategoryChange];
  }
}

id sub_55CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePreviouslyActiveActivity:*(void *)(*(void *)(a1 + 32) + 64)];
}

id sub_5710(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePreviouslyActiveActivity:0];
}

void sub_5830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_584C(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[8];
    if (!v4) {
      id v4 = WeakRetained[10];
    }
    id v5 = v4;
    if (*((unsigned char *)v3 + 160))
    {
      id v6 = *(void **)(a1 + 32);
      BSRectWithSize();
      objc_msgSend(v6, "_activityPickerExpandedFrameForBounds:");
      uint64_t v51 = v8;
      uint64_t v52 = v7;
      uint64_t v50 = v9;
      uint64_t v11 = v10;
      v12 = [v3[2] superview];
      v13 = [v3[6] view];
      v14 = [v13 superview];
      objc_msgSend(v12, "convertRect:toView:", v14, *((double *)v3 + 12), *((double *)v3 + 13), *((double *)v3 + 14), *((double *)v3 + 15));
      uint64_t v16 = v15;
      uint64_t v18 = v17;
      uint64_t v20 = v19;
      uint64_t v22 = v21;

      CAFrameRateRange v59 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      float minimum = v59.minimum;
      float maximum = v59.maximum;
      float preferred = v59.preferred;
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_5BE4;
      v56[3] = &unk_10460;
      v56[4] = v3;
      v58[1] = v52;
      v58[2] = v51;
      v58[3] = v50;
      v58[4] = v11;
      v58[5] = v16;
      v58[6] = v18;
      v58[7] = v20;
      v58[8] = v22;
      v26 = &v57;
      id v57 = v5;
      v27 = (id *)v58;
      v58[0] = *(id *)(a1 + 40);
      v28 = v56;
      *(float *)&double v29 = minimum;
      *(float *)&double v30 = maximum;
      *(float *)&double v31 = preferred;
    }
    else
    {
      v32 = [v3[2] superview];
      v33 = [v3[6] view];
      v34 = [v33 superview];
      objc_msgSend(v32, "convertRect:toView:", v34, *((double *)v3 + 12), *((double *)v3 + 13), *((double *)v3 + 14), *((double *)v3 + 15));
      uint64_t v36 = v35;
      uint64_t v38 = v37;
      uint64_t v40 = v39;
      uint64_t v42 = v41;

      CAFrameRateRange v60 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      float v43 = v60.minimum;
      float v44 = v60.maximum;
      float v45 = v60.preferred;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_5CAC;
      v53[3] = &unk_10488;
      v53[4] = v3;
      v55[1] = v36;
      v55[2] = v38;
      v55[3] = v40;
      v55[4] = v42;
      v26 = &v54;
      id v54 = v5;
      v27 = (id *)v55;
      v55[0] = *(id *)(a1 + 40);
      v28 = v53;
      *(float *)&double v29 = v43;
      *(float *)&double v30 = v44;
      *(float *)&double v31 = v45;
    }
    +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1703937, v28, v29, v30, v31);

    [v3 _updateBackgroundContinuousCornerRadius];
    if (*((unsigned char *)v3 + 160)) {
      double v46 = 0.0;
    }
    else {
      double v46 = 1.0;
    }
    [v3[2] setAlpha:v46];
    v47 = [v3[6] view];
    v48 = v47;
    if (*((unsigned char *)v3 + 160)) {
      double v49 = 1.0;
    }
    else {
      double v49 = 0.0;
    }
    [v47 setAlpha:v49];
  }
}

void sub_5BE4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setExpandedFrame:initialFrame:representedActivity:presentationStyle:transitionCoordinator:", *(void *)(a1 + 40), 0, *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 16);
  id v11 = [v10 superview];
  objc_msgSend(v11, "convertRect:fromView:", 0, v3, v5, v7, v9);
  objc_msgSend(v10, "setFrame:");
}

id sub_5CAC(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setContractedFrame:representedActivity:presentationStyle:transitionCoordinator:", *(void *)(a1 + 40), 0, *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  double v2 = *(double **)(a1 + 32);
  double v3 = (void *)*((void *)v2 + 2);
  v2 += 12;
  double v4 = *v2;
  double v5 = v2[1];
  double v6 = v2[2];
  double v7 = v2[3];

  return objc_msgSend(v3, "setFrame:", v4, v5, v6, v7);
}

void sub_61B4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_61C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) activeActivity];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_627C;
    v4[3] = &unk_104D8;
    v4[4] = WeakRetained;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

id sub_627C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateActiveActivity:*(void *)(a1 + 40)];
}

void sub_6368(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_637C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id obj = [*(id *)(a1 + 32) availableActivities];
    id v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v14;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(obj);
          }
          double v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          double v8 = [v7 activityUniqueIdentifier];
          double v9 = [WeakRetained[10] activityUniqueIdentifier];
          unsigned int v10 = [v8 isEqual:v9];

          if (v10)
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_653C;
            block[3] = &unk_104D8;
            block[4] = WeakRetained;
            block[5] = v7;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          }
        }
        id v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }
  }
}

id sub_653C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSuggestedActivity:*(void *)(a1 + 40)];
}

void sub_6654(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_6668(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) suggestedActivityForLocation:0];
    BOOL v4 = v3 != 0;
    if (v3)
    {
      uint64_t v5 = (void *)v3;
      if (!*(void *)(a1 + 40))
      {
        double v6 = [*(id *)(a1 + 32) suggestedActivityFeedbackReceiver];
        [v6 didShowSuggestedActivity:v5 location:0];
      }
    }
    else
    {
      uint64_t v5 = [*(id *)(a1 + 32) defaultActivity];
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6778;
    block[3] = &unk_10528;
    BOOL v10 = v4;
    block[4] = WeakRetained;
    id v9 = v5;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_6778(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 161) = *(unsigned char *)(a1 + 48);
  return [*(id *)(a1 + 32) _updateSuggestedActivity:*(void *)(a1 + 40)];
}

void sub_6A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_6A64(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    if ([a1[4] count])
    {
      unint64_t v3 = 0;
      do
      {
        BOOL v4 = [a1[4] objectAtIndexedSubscript:v3];
        uint64_t v5 = [WeakRetained[1] activityWithIdentifier:v4];
        if (v5)
        {
          id v6 = [objc_alloc((Class)FCUIActivityBaubleDescription) initWithActivityDescription:v5];
        }
        else
        {
          id v6 = [a1[5] objectAtIndexedSubscript:v3];
        }
        id v7 = v6;
        if (v6) {
          [a1[6] addObject:v6];
        }

        ++v3;
      }
      while (v3 < (unint64_t)[a1[4] count]);
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_6BD4;
    v8[3] = &unk_10578;
    id v9 = a1[6];
    id v10 = a1[7];
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  }
}

void sub_6BD4(uint64_t a1)
{
  id v2 = [objc_alloc((Class)FCUIActivityBaubleGroupView) initWithBaubleDescriptions:*(void *)(a1 + 32) baubleGroupType:0];
  [v2 setAdjustsFontForContentSizeCategory:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_6D3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_6FDC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

id sub_7694(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 copy];
    BOOL v4 = [v3 elements];
    id v5 = [v4 copy];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "keyPath", (void)v19);
          unsigned int v13 = [v12 isEqualToString:@"fillColor"];

          if (v13)
          {
            id v14 = objc_alloc_init((Class)CAStateSetValue);
            long long v15 = [v11 target];
            [v14 setTarget:v15];

            long long v16 = [v11 keyPath];
            [v14 setKeyPath:v16];

            id v17 = +[UIColor fcui_colorForActivity:*(void *)(a1 + 32)];
            objc_msgSend(v14, "setValue:", objc_msgSend(v17, "CGColor"));

            [v3 removeElement:v11];
            [v3 addElement:v14];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id sub_8008(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureRoundButtonViewControllerIfNecessary];
}

id sub_8010(uint64_t a1, int a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 136);
  id v3 = &kFCUIPackageViewStateOn;
  if (!a2) {
    id v3 = &kFCUIPackageViewStateOff;
  }
  return [v2 setGlyphState:*v3];
}

uint64_t sub_8040(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 120) != 0);
}

id sub_8068(uint64_t a1)
{
  [*(id *)(a1 + 32) _scaledMetric:14.0];
  if (*(unsigned char *)(a1 + 64)) {
    CGRectGetMaxX(*(CGRect *)(*(void *)(a1 + 32) + 48));
  }
  UIRectCenteredYInRectScale();
  [*(id *)(a1 + 40) setFrame:0];
  id v2 = *(void **)(a1 + 40);

  return [v2 layoutIfNeeded];
}

void sub_857C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_8598(uint64_t a1, void *a2)
{
  if (([a2 isCancelled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setExpanded:*(unsigned __int8 *)(a1 + 40)];
  }
}

void sub_8F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_8F3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained _roundButtonVC];

  if (!v5)
  {
    [WeakRetained _setInitialUseView:v3];
    [WeakRetained _setRequestingInitialUseView:0];
    id v6 = [WeakRetained view];
    [v6 addSubview:v3];

    id v7 = [WeakRetained view];
    [v7 setNeedsLayout];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_9044;
    v8[3] = &unk_10438;
    void v8[4] = WeakRetained;
    +[UIView fcui_animateWithDefaultParameters:v8 completion:0];
  }
}

id sub_9044(uint64_t a1)
{
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_90EC;
  v3[3] = &unk_10438;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1703937, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void sub_90EC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

void sub_9C68(uint64_t a1, CGFloat *a2, double *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8, double a9, double a10, double a11)
{
  CGFloat v17 = a4;
  CGRectGetWidth(*(CGRect *)&a4);
  BSRectWithSize();
  double v35 = a11;
  UIRectCenteredIntegralRect();
  CGFloat v20 = v19;
  double v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  v36.origin.x = v17;
  v36.origin.y = a5;
  v36.size.width = a6;
  CGFloat v33 = a7;
  v36.size.height = a7;
  double v27 = v22;
  double Height = CGRectGetHeight(v36);
  v37.origin.x = v20;
  v37.origin.y = v27;
  double v34 = v24;
  v37.size.width = v24;
  v37.size.height = v26;
  if (Height / CGRectGetHeight(v37) >= 1.0)
  {
    *a3 = v20;
    a3[1] = v27;
    CGFloat v17 = v20;
    a5 = v27;
    double v30 = v26;
    a6 = v34;
    a3[2] = v34;
    goto LABEL_6;
  }
  int v29 = *(unsigned __int8 *)(a1 + 32);
  *a3 = v17;
  a3[1] = a5;
  double v30 = v33;
  a3[2] = a6;
  a3[3] = v33;
  if (!v29)
  {
LABEL_6:
    a3[3] = v35;
    v38.origin.x = v17;
    v38.origin.y = a5;
    v38.size.width = a6;
    v38.size.height = v30;
    a3[1] = CGRectGetMaxY(v38) - a3[3];
    *a2 = v17;
    a2[1] = a5;
    a2[2] = a6;
    a2[3] = v30;
    a2[3] = v30 - a3[3];
    return;
  }
  a3[2] = a10;
  if (*(unsigned char *)(a1 + 33))
  {
    *a2 = v17;
    a2[1] = a5;
    a2[2] = a6;
    a2[3] = v33;
    a2[2] = a6 - a3[2];
  }
  else
  {
    v39.origin.x = v17;
    v39.origin.y = a5;
    v39.size.width = a6;
    v39.size.height = v33;
    *a3 = CGRectGetMaxX(v39) - a3[2];
    int v31 = *(unsigned __int8 *)(a1 + 33);
    *a2 = v17;
    a2[1] = a5;
    a2[2] = a6;
    a2[3] = v33;
    a2[2] = a6 - a3[2];
    if (!v31) {
      return;
    }
  }
  *a2 = a3[2];
}

id sub_9E34(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  UIRectIntegralWithScale();
  objc_msgSend(v2, "setFrame:");
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  UIRectIntegralWithScale();
  objc_msgSend(v3, "setFrame:");
  CAFrameRateRange v4 = *(void **)(*(void *)(a1 + 32) + 24);
  UIRectIntegralWithScale();

  return objc_msgSend(v4, "setFrame:");
}

id sub_A084()
{
  [v0 alpha];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_A108;
  v4[3] = &unk_10738;
  v4[4] = v1;
  uint64_t v2 = objc_retainBlock(v4);

  return v2;
}

id sub_A108(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setAlpha:*(double *)(a1 + 32)];
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return _BSDispatchQueueCreateSerialWithQoS();
}

uint64_t BSEqualObjects()
{
  return _BSEqualObjects();
}

uint64_t BSEqualStrings()
{
  return _BSEqualStrings();
}

uint64_t BSRectWithSize()
{
  return _BSRectWithSize();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  return _CAFrameRateRangeMake(minimum, maximum, preferred);
}

uint64_t CCUIDefaultExpandedContentModuleWidth()
{
  return _CCUIDefaultExpandedContentModuleWidth();
}

uint64_t CCUIExpandedModuleContinuousCornerRadius()
{
  return _CCUIExpandedModuleContinuousCornerRadius();
}

uint64_t CCUIReferenceScreenBounds()
{
  return _CCUIReferenceScreenBounds();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

uint64_t FCUIBundle()
{
  return _FCUIBundle();
}

uint64_t FCUIPackageNameForActivity()
{
  return _FCUIPackageNameForActivity();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

uint64_t UIRectCenteredIntegralRect()
{
  return _UIRectCenteredIntegralRect();
}

uint64_t UIRectCenteredYInRectScale()
{
  return _UIRectCenteredYInRectScale();
}

uint64_t UIRectIntegralWithScale()
{
  return _UIRectIntegralWithScale();
}

uint64_t UISizeRoundToScale()
{
  return _UISizeRoundToScale();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__activityManagerQueue(void *a1, const char *a2, ...)
{
  return [a1 _activityManagerQueue];
}

id objc_msgSend__configureInitialUseViewIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _configureInitialUseViewIfNecessary];
}

id objc_msgSend__configureOnStateLabelIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _configureOnStateLabelIfNecessary];
}

id objc_msgSend__effectiveTitle(void *a1, const char *a2, ...)
{
  return [a1 _effectiveTitle];
}

id objc_msgSend__invalidateAndAnimateViewLayoutIfAppropriate(void *a1, const char *a2, ...)
{
  return [a1 _invalidateAndAnimateViewLayoutIfAppropriate];
}

id objc_msgSend__invalidateInitialUseView(void *a1, const char *a2, ...)
{
  return [a1 _invalidateInitialUseView];
}

id objc_msgSend__invalidatePreferredExpandedContentSize(void *a1, const char *a2, ...)
{
  return [a1 _invalidatePreferredExpandedContentSize];
}

id objc_msgSend__invalidateRoundButtonViewController(void *a1, const char *a2, ...)
{
  return [a1 _invalidateRoundButtonViewController];
}

id objc_msgSend__isInAnimationBlockWithAnimationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 _isInAnimationBlockWithAnimationsEnabled];
}

id objc_msgSend__isLargerModuleForAccessibility(void *a1, const char *a2, ...)
{
  return [a1 _isLargerModuleForAccessibility];
}

id objc_msgSend__isRequestingInitialUseView(void *a1, const char *a2, ...)
{
  return [a1 _isRequestingInitialUseView];
}

id objc_msgSend__needsTextAttributesUpdate(void *a1, const char *a2, ...)
{
  return [a1 _needsTextAttributesUpdate];
}

id objc_msgSend__preferredExpandedContentSize(void *a1, const char *a2, ...)
{
  return [a1 _preferredExpandedContentSize];
}

id objc_msgSend__roundButtonVC(void *a1, const char *a2, ...)
{
  return [a1 _roundButtonVC];
}

id objc_msgSend__setNeedsTextAttributesUpdate(void *a1, const char *a2, ...)
{
  return [a1 _setNeedsTextAttributesUpdate];
}

id objc_msgSend__shouldReverseLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 _shouldReverseLayoutDirection];
}

id objc_msgSend__updateBackgroundContinuousCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 _updateBackgroundContinuousCornerRadius];
}

id objc_msgSend__updateTextAttributesForOnStateLabel(void *a1, const char *a2, ...)
{
  return [a1 _updateTextAttributesForOnStateLabel];
}

id objc_msgSend__updateTextAttributesIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _updateTextAttributesIfNecessary];
}

id objc_msgSend_activeActivity(void *a1, const char *a2, ...)
{
  return [a1 activeActivity];
}

id objc_msgSend_activityDisplayName(void *a1, const char *a2, ...)
{
  return [a1 activityDisplayName];
}

id objc_msgSend_activitySymbolImageName(void *a1, const char *a2, ...)
{
  return [a1 activitySymbolImageName];
}

id objc_msgSend_activityUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 activityUniqueIdentifier];
}

id objc_msgSend_adjustForContentSizeCategoryChange(void *a1, const char *a2, ...)
{
  return [a1 adjustForContentSizeCategoryChange];
}

id objc_msgSend_adjustsFontForContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 adjustsFontForContentSizeCategory];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_availableActivities(void *a1, const char *a2, ...)
{
  return [a1 availableActivities];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return [a1 button];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_controlCenterModuleBackgroundMaterial(void *a1, const char *a2, ...)
{
  return [a1 controlCenterModuleBackgroundMaterial];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_defaultActivity(void *a1, const char *a2, ...)
{
  return [a1 defaultActivity];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_endAppearanceTransition(void *a1, const char *a2, ...)
{
  return [a1 endAppearanceTransition];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isExpanded(void *a1, const char *a2, ...)
{
  return [a1 isExpanded];
}

id objc_msgSend_isOnboardingEncountered(void *a1, const char *a2, ...)
{
  return [a1 isOnboardingEncountered];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_keyPath(void *a1, const char *a2, ...)
{
  return [a1 keyPath];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 loadViewIfNeeded];
}

id objc_msgSend_metricsScaleFactor(void *a1, const char *a2, ...)
{
  return [a1 metricsScaleFactor];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_requiredVisualStyleCategories(void *a1, const char *a2, ...)
{
  return [a1 requiredVisualStyleCategories];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedActivityManager(void *a1, const char *a2, ...)
{
  return [a1 sharedActivityManager];
}

id objc_msgSend_suggestedActivity(void *a1, const char *a2, ...)
{
  return [a1 suggestedActivity];
}

id objc_msgSend_suggestedActivityFeedbackReceiver(void *a1, const char *a2, ...)
{
  return [a1 suggestedActivityFeedbackReceiver];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_symbolScaleFactor(void *a1, const char *a2, ...)
{
  return [a1 symbolScaleFactor];
}

id objc_msgSend_systemIndigoColor(void *a1, const char *a2, ...)
{
  return [a1 systemIndigoColor];
}

id objc_msgSend_systemMintColor(void *a1, const char *a2, ...)
{
  return [a1 systemMintColor];
}

id objc_msgSend_systemTealColor(void *a1, const char *a2, ...)
{
  return [a1 systemTealColor];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transitionCoordinator(void *a1, const char *a2, ...)
{
  return [a1 transitionCoordinator];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return [a1 viewIfLoaded];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}