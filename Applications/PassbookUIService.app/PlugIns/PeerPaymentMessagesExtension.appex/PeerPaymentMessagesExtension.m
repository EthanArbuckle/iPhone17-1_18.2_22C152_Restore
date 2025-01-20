void sub_100003CB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_100003D10(id *a1, void *a2)
{
  id v6 = a2;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained setMemo:v6];

  id v4 = objc_loadWeakRetained(a1);
  v5 = [v4 delegate];

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 memoDidChangeTo:v6];
  }
}

void sub_100003DB4(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAmount:v9];

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  if (v4)
  {
    v5 = v4;
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
      [v8 amountDidChangeTo:v9];
    }
  }
}

void sub_100003E84(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained appController];
  id v4 = [v3 presentationStyle];

  id v12 = objc_loadWeakRetained(v1);
  v5 = [v12 appController];
  id v6 = v5;
  if (v4)
  {
    id v7 = [v5 presentationStyle];

    if (v7 != (id)1) {
      return;
    }
    id v8 = objc_loadWeakRetained(v1);
    id v9 = [v8 mainView];
    v10 = [v9 amountStepperView];
    [v10 validateNumberPadInput];

    id v12 = objc_loadWeakRetained(v1);
    v5 = [v12 appController];
    id v6 = v5;
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 1;
  }
  [v5 requestPresentationStyle:v11];
}

void sub_100003F9C(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [v5 setActivityIndicatorVisible:1 forAction:a3];
  [v5 setEnabled:0];
  id v6 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v8 = [WeakRetained mainView];
  id v9 = [v8 amountStepperView];
  [v9 validateNumberPadInput];

  [a1[4] sendAnalyticsForAction:a3];
  [a1[5] setUsedKeypad:0];
  id v10 = objc_loadWeakRetained((id *)a1[4] + 9);
  if (v10
    && (uint64_t v11 = v10,
        id v12 = objc_loadWeakRetained((id *)a1[4] + 9),
        char v13 = objc_opt_respondsToSelector(),
        v12,
        v11,
        (v13 & 1) != 0))
  {
    id v14 = objc_loadWeakRetained((id *)a1[4] + 9);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000041AC;
    v22[3] = &unk_100024940;
    v15 = (id *)v23;
    v23[0] = v5;
    v23[1] = a3;
    id v16 = v5;
    [v14 handleAction:a3 completion:v22];
  }
  else
  {
    id v14 = objc_loadWeakRetained(a1 + 6);
    v17 = [v14 appController];
    id v18 = objc_loadWeakRetained(v6);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100004288;
    v20[3] = &unk_100024940;
    v15 = (id *)v21;
    v21[0] = v5;
    v21[1] = a3;
    id v19 = v5;
    [v17 handleAction:a3 sender:v18 completion:v20];
  }
}

void sub_1000041AC(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004240;
  v4[3] = &unk_100024918;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

id sub_100004240(uint64_t a1)
{
  [*(id *)(a1 + 32) setActivityIndicatorVisible:0 forAction:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 setEnabled:1];
}

void sub_100004288(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000431C;
  v4[3] = &unk_100024918;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

id sub_10000431C(uint64_t a1)
{
  [*(id *)(a1 + 32) setActivityIndicatorVisible:0 forAction:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 setEnabled:1];
}

void sub_100004F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004F50(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 8);
    uint64_t v6 = [v7 traitCollection];
    [v5 setPresentationContext:[v6 _presentationSemanticContext]];
  }
}

void sub_100005514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005530(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a3 == 2)
    {
      [v5 setShowsActionSpinner:1];
      id v9 = [WeakRetained appController];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100005770;
      v10[3] = &unk_100024A30;
      objc_copyWeak(&v12, v6);
      id v11 = v5;
      [v9 handleAction:4 sender:v11 completion:v10];

      objc_destroyWeak(&v12);
    }
    else if (a3 == 1)
    {
      [v5 setShowsActionSpinner:1];
      id v8 = [WeakRetained appController];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000056E0;
      v13[3] = &unk_1000249E0;
      id v14 = v5;
      [v8 handleAction:3 sender:v14 completion:v13];
    }
  }
}

void sub_1000056CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000056E0(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005764;
  block[3] = &unk_1000249B8;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100005764(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowsActionSpinner:0];
}

void sub_100005770(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005828;
  block[3] = &unk_100024A08;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  char v7 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v6);
}

void sub_100005828(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) setShowsActionSpinner:0];
    if (*(unsigned char *)(a1 + 48))
    {
      [*(id *)(a1 + 32) updateWithPeerPaymentStatus:1 animated:1];
      dispatch_time_t v4 = dispatch_time(0, 300000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005918;
      block[3] = &unk_1000248F0;
      objc_copyWeak(&v6, v2);
      dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(&v6);
    }
  }
}

void sub_100005918(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _resizeBubbleViewToReferenceSizeAnimated];
    id WeakRetained = v2;
  }
}

void sub_1000060A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000060E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained appController];
    [v2 noteReadyForDisplay];

    id WeakRetained = v3;
  }
}

void sub_100006140(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000639C;
    block[3] = &unk_100024A80;
    objc_copyWeak(&v16, a1 + 6);
    id v14 = a1[4];
    id v4 = v3;
    id v15 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v16);
    id v5 = a1 + 5;
    if (*((unsigned char *)a1[5] + 40) || [v4 peerPaymentStatus]) {
      goto LABEL_9;
    }
    id v6 = (unsigned char *)*v5;
  }
  else
  {
    id v5 = a1 + 5;
    id v6 = a1[5];
    if (v6[40]) {
      goto LABEL_9;
    }
  }
  v6[40] = 1;
  char v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (unsigned char *)*v5;
    *(_DWORD *)buf = 134217984;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Fetching remote status.", buf, 0xCu);
  }

  id v9 = [a1[5] appController];
  id v10 = a1[4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006508;
  v11[3] = &unk_100024AD0;
  objc_copyWeak(&v12, a1 + 6);
  v11[4] = a1[5];
  [v9 remoteStatusForMessage:v10 completion:v11];

  objc_destroyWeak(&v12);
LABEL_9:
}

void sub_100006380(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000639C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v4 = [WeakRetained _isMessage:*(void *)(a1 + 32) validForTransaction:*(void *)(a1 + 40)];
    id v5 = v3[3];
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      char v7 = [v3 appController];
      [v5 updateWithPaymentTransaction:v6 animated:[v7 appReadyForDisplay]];
    }
    else
    {
      char v7 = [v3 appController];
      [v5 setState:9 animated:[v7 appReadyForDisplay]];
    }

    if ([v3[3] state] != (id)4)
    {
      id v8 = v3[3];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000064BC;
      v9[3] = &unk_1000249B8;
      v9[4] = v3;
      [v8 performPostRender:v9];
    }
  }
}

id sub_1000064BC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appController];
  [v2 noteReadyForDisplay];

  id v3 = *(void **)(a1 + 32);

  return [v3 _resizeBubbleViewToReferenceSizeAnimated];
}

void sub_100006508(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000065C8;
  block[3] = &unk_100024A80;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
}

void sub_1000065C8(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 40) = 0;
    id v5 = WeakRetained[3];
    if (*(void *)(a1 + 32))
    {
      [(id)objc_opt_class() referenceSizeForPeerPaymentStatusResponse:*(void *)(a1 + 32)];
      double v7 = v6;
      double v9 = v8;
      [v4[3] frame];
      if (v9 <= v10)
      {
        id v13 = v4[3];
        uint64_t v14 = *(void *)(a1 + 32);
        id v15 = [v4 appController];
        [v13 updateWithPeerPaymentStatusResponse:v14 animated:[v15 appReadyForDisplay]];

        dispatch_time_t v16 = dispatch_time(0, 300000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100006920;
        block[3] = &unk_1000248F0;
        objc_copyWeak(&v21, v2);
        dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, block);
        objc_destroyWeak(&v21);
      }
      else
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000068B4;
        v22[3] = &unk_100024AA8;
        void v22[4] = v4;
        id v23 = *(id *)(a1 + 32);
        [v4 _resizeBubbleViewToSize:v22 completion:v7, v9];
      }
    }
    else
    {
      [v5 setState:10 animated:1];
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        uint64_t v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Failed to get remote status.", buf, 0xCu);
      }

      [v4 _resizeBubbleViewToReferenceSizeAnimated];
    }
    id v17 = v4[3];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100006964;
    v18[3] = &unk_1000248F0;
    objc_copyWeak(&v19, v2);
    [v17 performPostRender:v18];
    objc_destroyWeak(&v19);
  }
}

void sub_100006898(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000068B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [*(id *)(a1 + 32) appController];
  [v2 updateWithPeerPaymentStatusResponse:v1 animated:[v3 appReadyForDisplay]];
}

void sub_100006920(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _resizeBubbleViewToReferenceSizeAnimated];
    id WeakRetained = v2;
  }
}

void sub_100006964(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained appController];
    [v2 noteReadyForDisplay];

    id WeakRetained = v3;
  }
}

void sub_1000069C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [*(id *)(a1 + 32) appController];
    [v3 noteReadyForDisplay];

    id WeakRetained = v4;
  }
}

void sub_100006D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_100006D38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *(CGSize *)(*(void *)(a1 + 32) + 48) = CGSizeZero;
    id v2 = *(void **)(*(void *)(a1 + 32) + 24);
    [v2 frame];
    [v2 setFrame:];
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }
}

void sub_100007C74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100007C90(id *a1, int a2)
{
  id v4 = a1 + 6;
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  double v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      double v7 = [WeakRetained[9] webService];
      double v8 = [v7 _appleAccountInformation];

      double v9 = PKPeerPaymentSenderAddressForRecipientAddress();
      double v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [v8 primaryEmailAddress];
      }
      id v13 = v11;

      [v6[9] reset];
      id v14 = v6[9];
      id v15 = a1[4];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100007E20;
      v16[3] = &unk_100024BC0;
      objc_copyWeak(&v19, v4);
      id v18 = a1[5];
      id v17 = a1[4];
      [v14 identifyRecipientWithAddress:v15 senderAddress:v13 completion:v16];

      objc_destroyWeak(&v19);
    }
    else
    {
      uint64_t v12 = (void (**)(id, void))a1[5];
      if (v12) {
        v12[2](v12, 0);
      }
    }
  }
}

void sub_100007E0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100007E20(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100007F38;
  v12[3] = &unk_100024B98;
  objc_copyWeak(v17, a1 + 6);
  id v13 = v8;
  id v9 = a1[5];
  v17[1] = a2;
  id v16 = v9;
  id v14 = v7;
  id v15 = a1[4];
  id v10 = v7;
  id v11 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

  objc_destroyWeak(v17);
}

void sub_100007F38(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_17;
  }
  if (*(void *)(a1 + 32))
  {
    +[PKAnalyticsReporter pageTagForAppleCashSenderError:](PKAnalyticsReporter, "pageTagForAppleCashSenderError:");
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_100008164;
    id v17 = &unk_1000249B8;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = v4;
    id v5 = PKAlertForDisplayableErrorWithCancelHandler();
    if (v5)
    {
      +[PKAnalyticsReporter reportAppleCashSenderErrorPage:v4];
      id v6 = objc_loadWeakRetained(v3 + 4);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100008184;
      v12[3] = &unk_100024B70;
      id v13 = *(id *)(a1 + 56);
      [v6 presentViewController:v5 animated:1 completion:v12];
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 56);
      if (v9) {
        (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
      }
    }

    goto LABEL_17;
  }
  uint64_t v7 = *(void *)(a1 + 72);
  if (v7 == 2)
  {
LABEL_8:
    id v8 = [*(id *)(a1 + 40) displayName];
    if ([v8 length]) {
      [*(id *)(a1 + 40) displayName];
    }
    else {
    id v11 = [v3[9] displayNameForRecipientAddress:*(void *)(a1 + 48)];
    }

    [v3 _showAlertForInvalidRecipientWithName:v11 statusReason:[*(id *)(a1 + 40) statusReason] completion:*(void *)(a1 + 56)];
    goto LABEL_17;
  }
  if (v7 != 1)
  {
    if (v7) {
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  objc_storeStrong(WeakRetained + 1, *(id *)(a1 + 40));
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, 1);
  }
LABEL_17:
}

id sub_100008164(uint64_t a1)
{
  return +[PKAnalyticsReporter reportAppleCashSenderErrorPage:*(void *)(a1 + 32) buttonTag:PKAnalyticsReportOkButtonTag];
}

uint64_t sub_100008184(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void sub_1000084D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_100008514(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008614;
  block[3] = &unk_100024C10;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  char v17 = a2;
  id v13 = v7;
  id v9 = *(id *)(a1 + 32);
  id v14 = v8;
  id v15 = v9;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v16);
}

void sub_100008614(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    if (*(unsigned char *)(a1 + 64))
    {
      [WeakRetained _confirmPaymentMessageInsertionWithQuote:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
LABEL_11:
      id WeakRetained = v11;
      goto LABEL_12;
    }
    id v3 = *(id *)(a1 + 40);
    id v4 = [v3 userInfo];
    id v5 = [v4 objectForKey:NSUnderlyingErrorKey];

    id v6 = [v5 domain];
    if ([v6 isEqualToString:PKPeerPaymentWebServiceErrorDomain])
    {
      id v7 = [v5 code];

      if (v7)
      {
LABEL_8:
        [v11 _handleError:v3];
        uint64_t v10 = *(void *)(a1 + 48);
        if (v10) {
          (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
        }

        goto LABEL_11;
      }
      id v6 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_TITLE");
      id v8 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_MESSAGE");
      uint64_t v9 = PKDisplayableErrorCustom();

      id v3 = (id)v9;
    }

    goto LABEL_8;
  }
LABEL_12:
}

void sub_100008778(id *a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000888C;
  v12[3] = &unk_100024C60;
  objc_copyWeak(&v17, a1 + 6);
  char v18 = a2;
  id v13 = v7;
  id v14 = a1[4];
  id v9 = a1[5];
  id v15 = v8;
  id v16 = v9;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

  objc_destroyWeak(&v17);
}

void sub_10000888C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v12 = WeakRetained;
    if (*(unsigned char *)(a1 + 72))
    {
      id v3 = *(void **)(a1 + 32);
      if (v3)
      {
        objc_storeStrong(WeakRetained + 7, v3);
        [v12 _insertRequestMessageWithAmount:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
LABEL_12:
        id WeakRetained = v12;
        goto LABEL_13;
      }
    }
    id v4 = *(id *)(a1 + 48);
    id v5 = [v4 userInfo];
    id v6 = [v5 objectForKey:NSUnderlyingErrorKey];

    id v7 = [v6 domain];
    if ([v7 isEqualToString:PKPeerPaymentWebServiceErrorDomain])
    {
      id v8 = [v6 code];

      if (v8)
      {
LABEL_9:
        [v12 _handleError:v4];
        uint64_t v11 = *(void *)(a1 + 56);
        if (v11) {
          (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
        }

        goto LABEL_12;
      }
      id v7 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_REQUEST_MONEY_GENERIC_ERROR_TITLE");
      id v9 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_REQUEST_MONEY_GENERIC_ERROR_MESSAGE");
      uint64_t v10 = PKDisplayableErrorCustom();

      id v4 = (id)v10;
    }

    goto LABEL_9;
  }
LABEL_13:
}

void sub_100008CFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_100008D30(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008E44;
  block[3] = &unk_100024CB0;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  char v19 = a2;
  id v9 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v14 = v7;
  id v15 = v9;
  id v10 = *(id *)(a1 + 48);
  id v16 = v8;
  id v17 = v10;
  id v11 = v8;
  id v12 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v18);
}

void sub_100008E44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v21 = WeakRetained;
    if (*(unsigned char *)(a1 + 80))
    {
      id v3 = [*(id *)(*(void *)(a1 + 32) + 64) identifier];

      if (!v3)
      {
        id v4 = *(void **)(*(void *)(a1 + 32) + 64);
        id v5 = [*(id *)(a1 + 40) recurringPaymentIdentifier];
        [v4 setIdentifier:v5];
      }
      id v6 = objc_alloc((Class)MSSession);
      id v7 = objc_alloc((Class)NSUUID);
      id v8 = [*(id *)(a1 + 48) identifier];
      id v9 = [v7 initWithUUIDString:v8];
      id v10 = [v6 initWithIdentifier:v9];
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 48);
      *(void *)(v11 + 48) = v10;

      [v21 _confirmPaymentMessageInsertionWithQuote:*(void *)(a1 + 40) completion:*(void *)(a1 + 64)];
LABEL_13:
      id WeakRetained = v21;
      goto LABEL_14;
    }
    id v13 = *(id *)(a1 + 56);
    id v14 = [v13 userInfo];
    id v15 = [v14 objectForKey:NSUnderlyingErrorKey];

    id v16 = [v15 domain];
    if ([v16 isEqualToString:PKPeerPaymentWebServiceErrorDomain])
    {
      id v17 = [v15 code];

      if (v17)
      {
LABEL_10:
        [v21 _handleError:v13];
        uint64_t v20 = *(void *)(a1 + 64);
        if (v20) {
          (*(void (**)(uint64_t, void))(v20 + 16))(v20, 0);
        }

        goto LABEL_13;
      }
      id v16 = PKLocalizedPeerPaymentRecurringString(@"SETUP_GENERIC_ERROR_TITLE");
      id v18 = PKLocalizedPeerPaymentRecurringString(@"SETUP_GENERIC_ERROR_MESSAGE");
      uint64_t v19 = PKDisplayableErrorCustom();

      id v13 = (id)v19;
    }

    goto LABEL_10;
  }
LABEL_14:
}

uint64_t sub_100009208(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void sub_100009434(id a1)
{
}

void sub_100009458(id a1)
{
}

uint64_t sub_10000947C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void sub_100009970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009998(id a1)
{
}

void sub_1000099BC(id a1)
{
}

void sub_1000099E0(id a1)
{
}

void sub_100009A04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained) {
    goto LABEL_13;
  }
  if (a3 == 2)
  {
    uint64_t v6 = a1 + 48;
  }
  else
  {
    if (a3) {
      goto LABEL_7;
    }
    uint64_t v6 = a1 + 40;
  }
  (*(void (**)(void))(*(void *)v6 + 16))();
LABEL_7:
  if (*(void *)(a1 + 72) == a3)
  {
    [WeakRetained _insertPaymentMessageWithQuote:*(void *)(a1 + 32) completion:*(void *)(a1 + 56)];
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: User does not want to insert payment message.", v9, 2u);
    }

    uint64_t v8 = *(void *)(a1 + 56);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
  }
LABEL_13:
}

void sub_10000A08C(id *a1)
{
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v4 = objc_alloc((Class)PKPeerPaymentMessageComposeController);
    id v5 = [a1[4] underlyingMessage];
    uint64_t v6 = [a1[4] recipientAddress];
    id v7 = [v4 initWithMessage:v5 recipientAddress:v6];
    uint64_t v8 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = v7;

    id v9 = (void *)*((void *)WeakRetained + 3);
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = sub_10000A1EC;
    id v15 = &unk_100024E78;
    objc_copyWeak(&v17, v2);
    id v16 = a1[5];
    [v9 setCompletionHandler:&v12];
    id v10 = (void *)*((void *)WeakRetained + 3);
    id v11 = objc_loadWeakRetained((id *)WeakRetained + 4);
    [v10 presentMessageOverController:v11 presentationHandler:0 v12, v13, v14, v15];

    objc_destroyWeak(&v17);
  }
}

void sub_10000A1D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000A1EC(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (!a2 || a2 == 2)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if (!v8) {
        goto LABEL_10;
      }
      id v9 = *(void (**)(void))(v8 + 16);
      goto LABEL_9;
    }
    if (a2 == 1)
    {
      if (WeakRetained[8])
      {
        uint64_t v6 = +[PKPeerPaymentService sharedInstance];
        uint64_t v13 = v5[8];
        id v7 = +[NSArray arrayWithObjects:&v13 count:1];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_10000A358;
        v11[3] = &unk_100024B70;
        id v12 = *(id *)(a1 + 32);
        [v6 insertOrUpdateRecurringPayments:v7 completion:v11];

        goto LABEL_10;
      }
      uint64_t v10 = *(void *)(a1 + 32);
      if (!v10) {
        goto LABEL_10;
      }
      id v9 = *(void (**)(void))(v10 + 16);
LABEL_9:
      v9();
    }
  }
LABEL_10:
}

uint64_t sub_10000A358(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

id sub_10000A6C0(uint64_t a1)
{
  return +[PKAnalyticsReporter reportAppleCashSenderErrorPage:*(void *)(a1 + 32) buttonTag:PKAnalyticsReportOkButtonTag];
}

id sub_10000A6E0(uint64_t a1)
{
  return +[PKAnalyticsReporter reportAppleCashSenderErrorPage:*(void *)(a1 + 32) buttonTag:PKAnalyticsReportCancelButtonTag];
}

void sub_10000A700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (a3 == 2 && *(void *)(a1 + 32))
    {
      id v5 = +[LSApplicationWorkspace defaultWorkspace];
      [v5 openSensitiveURL:*(void *)(a1 + 32) withOptions:0];
    }
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

CFStringRef PKPeerPaymentMessagesContentStateToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD) {
    return @"Unknown";
  }
  else {
    return off_1000255F8[a1 - 1];
  }
}

void sub_10000AC18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AC40(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000ACFC;
  v5[3] = &unk_100024B20;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10000ACFC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = [objc_alloc((Class)PKFamilyMemberCollection) initWithFamilyMembers:*(void *)(a1 + 32)];
    [WeakRetained _updateWithFamilyCollection:v2];
  }
}

void sub_10000B61C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3 == *(void *)(a1 + 40))
  {
    [*(id *)(v2 + 48) reloadContent];
    id v4 = *(void **)(*(void *)(a1 + 32) + 40);
    [v4 setNeedsLayout];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = PKPeerPaymentMessagesContentStateToString(v3);
      uint64_t v7 = PKPeerPaymentMessagesContentStateToString(*(void *)(a1 + 40));
      uint64_t v8 = (void *)v7;
      int v9 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)buf = 134218754;
      uint64_t v25 = v2;
      if (v9) {
        CFStringRef v10 = @"YES";
      }
      else {
        CFStringRef v10 = @"NO";
      }
      __int16 v26 = 2114;
      v27 = v6;
      __int16 v28 = 2114;
      uint64_t v29 = v7;
      __int16 v30 = 2114;
      CFStringRef v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesAppViewController %p: Changed content state. From %{public}@ -> %{public}@. (animated: %{public}@)", buf, 0x2Au);
    }
    *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 40);
    id v11 = [*(id *)(a1 + 32) _viewControllerForState:v3 shouldLoad:0];
    id v12 = [*(id *)(a1 + 32) _viewControllerForState:*(void *)(a1 + 40) shouldLoad:1];
    uint64_t v13 = [v12 view];
    [*(id *)(*(void *)(a1 + 32) + 40) bounds];
    [v13 setFrame:];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v12);
    if (v11)
    {
      if (*(unsigned char *)(a1 + 48)) {
        double v14 = 0.4;
      }
      else {
        double v14 = 0.0;
      }
      [*(id *)(a1 + 32) addChildViewController:v12];
      [v12 didMoveToParentViewController:*(void *)(a1 + 32)];
      id v15 = *(void **)(a1 + 32);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10000B954;
      v20[3] = &unk_100024F30;
      id v16 = v11;
      uint64_t v17 = *(void *)(a1 + 32);
      id v21 = v16;
      uint64_t v22 = v17;
      uint64_t v23 = v3;
      [v15 transitionFromViewController:v16 toViewController:v12 duration:5242912 options:0 animations:v20 completion:v14];
    }
    else
    {
      id v18 = *(void **)(*(void *)(a1 + 32) + 40);
      uint64_t v19 = [v12 view];
      [v18 addSubview:v19];

      [*(id *)(a1 + 32) addChildViewController:v12];
      [v12 didMoveToParentViewController:*(void *)(a1 + 32)];
    }
    [*(id *)(*(void *)(a1 + 32) + 40) setNeedsLayout];
    [*(id *)(a1 + 32) _reportAnalyticsForState];
  }
}

void sub_10000B954(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) willMoveToParentViewController:0];
    [*(id *)(a1 + 32) removeFromParentViewController];
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = *(void **)(*(void *)(a1 + 40) + 32);
    id v5 = +[NSNumber numberWithUnsignedInteger:v3];
    [v4 setObject:0 forKeyedSubscript:v5];
  }
}

void sub_10000BCEC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v23 = a3;
  id v7 = a4;
  if (a2 != 1)
  {
    if ([v23 statusReason] == (id)2)
    {
      CFStringRef v10 = *(void **)(a1 + 32);
      uint64_t v11 = 14;
      goto LABEL_7;
    }
    id v14 = v7;
    id v15 = [v14 domain];
    unsigned int v16 = [v15 isEqualToString:PKDisplayableErrorDomain];

    uint64_t v13 = v14;
    if (v16)
    {
      uint64_t v17 = [v14 userInfo];
      uint64_t v13 = [v17 objectForKeyedSubscript:NSUnderlyingErrorKey];
    }
    if (+[PKPeerPaymentController errorIsTermsAcceptanceRequiredError:v13])
    {
LABEL_12:
      [*(id *)(a1 + 32) _handleError:v14];
      goto LABEL_20;
    }
    id v18 = [v13 domain];
    unsigned int v19 = [v18 isEqualToString:PKPeerPaymentWebServiceErrorDomain];

    if (v19)
    {
      if ([v13 code] == (id)40312)
      {
        uint64_t v20 = *(void **)(a1 + 32);
        uint64_t v21 = 6;
      }
      else
      {
        if ([v13 code] != (id)40309)
        {
          id v22 = [v13 code];
          [*(id *)(a1 + 32) _transitionToState:8 animated:1];
          if (v22 != (id)40310) {
            goto LABEL_20;
          }
          goto LABEL_12;
        }
        uint64_t v20 = *(void **)(a1 + 32);
        uint64_t v21 = 5;
      }
    }
    else
    {
      uint64_t v20 = *(void **)(a1 + 32);
      uint64_t v21 = 8;
    }
    [v20 _transitionToState:v21 animated:1];
    goto LABEL_20;
  }
  if (([*(id *)(a1 + 32) recipientFoundInContacts] & 1) == 0)
  {
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 16) account];
    id v9 = [v8 sendRestrictionType];

    if (v9 == (id)2)
    {
      CFStringRef v10 = *(void **)(a1 + 32);
      uint64_t v11 = 13;
LABEL_7:
      [v10 _transitionToState:v11 animated:1];
      goto LABEL_21;
    }
  }
  [*(id *)(a1 + 32) _transitionToState:11 animated:1];
  id v12 = *(void **)(a1 + 32);
  uint64_t v13 = [v23 phoneOrEmail];
  [v12 _prewarmDeviceScoreForRecipient:v13];
LABEL_20:

LABEL_21:
}

void sub_10000CFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000CFCC(id a1)
{
}

void sub_10000CFF0(id a1)
{
}

uint64_t sub_10000D014(void *a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = a1[8] == a3;
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: User does not want to send payment message.", v8, 2u);
    }
  }
  if (a3 == 2)
  {
    id v6 = a1 + 5;
  }
  else
  {
    if (a3) {
      goto LABEL_10;
    }
    id v6 = a1 + 4;
  }
  (*(void (**)(void))(*v6 + 16))();
LABEL_10:
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24));
  }
  return result;
}

void sub_10000D4F0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(void *)(a1 + 32) && *(unsigned char *)(a1 + 96))
    {
      uint64_t v3 = *(void **)(a1 + 40);
      id v4 = [*(id *)(a1 + 48) identifier];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000D768;
      v15[3] = &unk_1000250E0;
      v15[4] = *(void *)(a1 + 40);
      id v16 = *(id *)(a1 + 56);
      id v17 = *(id *)(a1 + 64);
      id v5 = *(id *)(a1 + 48);
      uint64_t v6 = *(void *)(a1 + 88);
      id v18 = v5;
      uint64_t v21 = v6;
      id v19 = *(id *)(a1 + 72);
      id v20 = *(id *)(a1 + 80);
      [v3 _hostSceneIdentifierForMessageIdentifier:v4 withCompletion:v15];

      return;
    }
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Failed to restore controller state. Hence failing validation.", buf, 2u);
    }

    CFStringRef v10 = *(void **)(a1 + 40);
    uint64_t v11 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_CONTROLLER_STATE_UNAVAILABLE_ERROR_TITLE");
    id v12 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_CONTROLLER_STATE_UNAVAILABLE_ERROR_DESCRIPTION");
    uint64_t v13 = PKDisplayableErrorCustom();
    [v10 _handleError:v13];
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not performing a peer payment quote for message %@", buf, 0xCu);
    }
  }
  uint64_t v14 = *(void *)(a1 + 80);
  if (v14) {
    (*(void (**)(uint64_t, void, void))(v14 + 16))(v14, 0, 0);
  }
}

void sub_10000D768(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), a2);
  id v4 = a2;
  id v5 = *(void **)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000D880;
  v10[3] = &unk_1000250B8;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 80);
  id v14 = v8;
  uint64_t v17 = v9;
  id v15 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 72);
  [v6 performQuoteWithCompletion:v10];
}

void sub_10000D880(uint64_t a1, int a2, void *a3, void *a4)
{
  LODWORD(v5) = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = PKLogFacilityTypeGetObject();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  CFStringRef v11 = @"NO";
  if (v10)
  {
    if (v5) {
      CFStringRef v11 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    CFStringRef v45 = v11;
    __int16 v46 = 2112;
    id v47 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: performQuoteWithCompletion returned success: %{public}@ error: %@", buf, 0x16u);
  }

  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = *(void **)(v12 + 128);
  *(void *)(v12 + 128) = 0;

  id v14 = 0;
  if (v7) {
    uint64_t v5 = v5;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v8 && (v5 & 1) == 0)
  {
    id v14 = PKTitleForDisplayableError();
  }
  if ([*(id *)(a1 + 48) length])
  {
    id v15 = *(id *)(a1 + 48);
  }
  else
  {
    id v15 = [*(id *)(a1 + 56) memo];
  }
  id v16 = v15;
  if (!v5)
  {
    if (!v8) {
      goto LABEL_41;
    }
    id v22 = [v8 userInfo];
    uint64_t v23 = [v22 objectForKey:NSUnderlyingErrorKey];

    v24 = [v23 domain];
    if ([v24 isEqualToString:PKPeerPaymentWebServiceErrorDomain])
    {
      id v25 = [v23 code];

      if (v25)
      {
LABEL_24:
        [*(id *)(a1 + 40) _handleError:v8 v41];

        id v14 = 0;
LABEL_40:

        goto LABEL_41;
      }
      v24 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_TITLE");
      __int16 v26 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_MESSAGE");
      uint64_t v41 = PKDisplayableErrorCustom();

      id v8 = (id)v41;
    }

    goto LABEL_24;
  }
  [*(id *)(a1 + 56) updateWithPeerPaymentPerformResponse:v7];
  uint64_t v17 = *(void *)(a1 + 80);
  if (v17 == 3)
  {
    v27 = [v7 recurringPaymentIdentifier];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v45 = v27;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Recurring payment created with identifier : %@", buf, 0xCu);
    }

    id v18 = +[PKPeerPaymentService sharedInstance];
    __int16 v28 = [*(id *)(a1 + 56) recurringPaymentMemo];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10000DE98;
    v42[3] = &unk_100025050;
    v43 = v27;
    uint64_t v29 = v27;
    [v18 updateRecurringPaymentMemo:v28 identifier:v29 completion:v42];

    [v18 updateRecurringPaymentsWithCompletion:&stru_100025090];
    goto LABEL_29;
  }
  if (v17 == 1)
  {
    id v18 = objc_alloc_init((Class)PKProtobufPeerPaymentMessage);
    [v18 setMemo:v16];
    id v19 = [v7 transactionIdentifier];
    [v18 setTransactionIdentifier:v19];

    id v20 = +[PKPeerPaymentService sharedInstance];
    uint64_t v21 = [v18 data];
    [v20 receivedPeerPaymentMessageData:v21];

    if ([v16 length]) {
      [*(id *)(a1 + 56) setMemo:v16];
    }
    PKAnalyticsSendEvent();
    [*(id *)(a1 + 56) reportMessageSentWithLocalProperties:*(void *)(a1 + 64)];
LABEL_29:
  }
  if ([*(id *)(a1 + 40) _peerPaymentParicipantShouldSeeMemoSharingMessageForMemo:v16]
    && [*(id *)(a1 + 32) mode] == (id)1)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Marking the peer payment participant account as seeing the memo sharing message.", buf, 2u);
    }

    __int16 v30 = +[NSUserDefaults standardUserDefaults];
    [v30 setObject:&__kCFBooleanTrue forKey:@"PKPeerPaymentParticipantSharingMemoMessage"];
  }
  CFStringRef v31 = +[PKMessagesAppSharedContext sharedContext];
  v32 = [*(id *)(a1 + 56) identifier];
  [v31 removeExternalizedControllerStateDataForMessageIdentifier:v32];

  CFStringRef v33 = *(const __CFString **)(a1 + 40);
  if (v33[2].info || v33[2].data)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      CFStringRef v45 = v33;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Controller:%p Invalidating pending request values post successful perform quote.", buf, 0xCu);
    }

    uint64_t v34 = *(void *)(a1 + 40);
    v35 = *(void **)(v34 + 72);
    *(void *)(v34 + 72) = 0;

    uint64_t v36 = *(void *)(a1 + 40);
    v37 = *(void **)(v36 + 80);
    *(void *)(v36 + 80) = 0;

    uint64_t v38 = *(void *)(a1 + 40);
    uint64_t v23 = *(void **)(v38 + 88);
    *(void *)(v38 + 88) = 0;
    goto LABEL_40;
  }
LABEL_41:
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v39 = @"NO";
    if (v5) {
      CFStringRef v39 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    CFStringRef v45 = v39;
    __int16 v46 = 2112;
    id v47 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Calling payment completion with shouldSend: %{public}@, localizedInvalidationDescription: %@", buf, 0x16u);
  }

  uint64_t v40 = *(void *)(a1 + 72);
  if (v40) {
    (*(void (**)(uint64_t, uint64_t, void *))(v40 + 16))(v40, v5, v14);
  }
}

void sub_10000DE98(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Memo updated for recurring payment %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000DF44(id a1, NSArray *a2, NSError *a3)
{
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updated recurring payments after message insertion", v4, 2u);
  }
}

void sub_10000E4A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E4D4(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained && [WeakRetained presentationStyle] != (id)2 && v7[18] == 2)
  {
    unint64_t v8 = (unint64_t)[v5 _presentationSemanticContext] & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v9 = [v11 traitCollection];
    unint64_t v10 = (unint64_t)[v9 _presentationSemanticContext] & 0xFFFFFFFFFFFFFFFELL;

    if (v8 == 2 || v10 != 2)
    {
      if (v8 == 2 && v10 != 2) {
        [v7 _reportAnalyticsViewDisappeared];
      }
    }
    else if (!v7[12])
    {
      [v7 _reportAnalyticsViewAppearedWithArchivedParent:0];
    }
  }
}

void sub_10000E794(uint64_t a1, void *a2)
{
  uint64_t v3 = (CGContext *)[a2 CGContext];
  id v4 = +[PKPeerPaymentTheme backgroundColor];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v4 CGColor]);

  CGContextFillRect(v3, *(CGRect *)(a1 + 40));
  if ([*(id *)(a1 + 32) presentationStyle] == (id)2)
  {
    id v7 = [*(id *)(a1 + 32) _viewControllerForState:12 shouldLoad:1];
    id v5 = [v7 generatedSnapshot];
    id v6 = [v7 view];
    [v6 frame];
    [v5 drawInRect:];
  }
}

void sub_10000F4F4(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) paymentIdentifier];
    [v3 _handlePeerPaymentRemoteAlertCompletedForPaymentIdentifier:v6 completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      id v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
  }
}

void sub_10000F598(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000F658;
  v10[3] = &unk_100025180;
  char v14 = a2;
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(void **)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

void sub_10000F658(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    if (v4)
    {
      id v11 = v4;
      id v5 = [v11 userInfo];
      id v6 = [v5 objectForKey:NSUnderlyingErrorKey];

      uint64_t v7 = [v6 domain];
      if ([v7 isEqualToString:PKPeerPaymentWebServiceErrorDomain])
      {
        id v8 = [v6 code];

        if (v8)
        {
LABEL_11:
          [*(id *)(a1 + 40) _handleError:v11 forAction:4 withCompletion:*(void *)(a1 + 48)];

          return;
        }
        uint64_t v7 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_ACCEPT_MONEY_GENERIC_ERROR_TITLE");
        id v9 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_ACCEPT_MONEY_GENERIC_ERROR_MESSAGE");
        uint64_t v10 = PKDisplayableErrorCustom();

        id v11 = (id)v10;
      }

      goto LABEL_11;
    }
  }
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = *(void (**)(void))(v2 + 16);
    v3();
  }
}

uint64_t sub_10000F7E0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000F7F8(id a1, __CFUserNotification *a2, unint64_t a3)
{
  if (!a3)
  {
    id v4 = objc_alloc((Class)NSURL);
    id v5 = +[NSString stringWithFormat:@"wallet://%@", PKUserNotificationActionRouteAddPaymentCard];
    id v7 = [v4 initWithString:v5];

    id v6 = +[LSApplicationWorkspace defaultWorkspace];
    [v6 openSensitiveURL:v7 withOptions:0];
  }
}

uint64_t sub_10000F8AC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100010004(id a1, __CFUserNotification *a2, unint64_t a3)
{
  if (!a3)
  {
    id v5 = +[LSApplicationWorkspace defaultWorkspace];
    id v4 = +[NSURL URLWithString:@"prefs:root=PASSBOOK"];
    [v5 openSensitiveURL:v4 withOptions:0];
  }
}

id *sub_100010088(id *result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return (id *)[result[4] _presentInlineSetupFlowWithPeerPaymentMessage:result[5] flowState:0 completion:0];
  }
  return result;
}

void sub_10001053C(id a1, __CFUserNotification *a2, unint64_t a3)
{
  if (!a3)
  {
    id v5 = +[LSApplicationWorkspace defaultWorkspace];
    id v4 = +[NSURL URLWithString:@"prefs:root=PASSBOOK"];
    [v5 openSensitiveURL:v4 withOptions:0];
  }
}

id *sub_1000105C0(id *result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return (id *)[result[4] _presentInlineSetupFlowWithPeerPaymentMessage:result[5] flowState:0 completion:0];
  }
  return result;
}

void sub_100010728(uint64_t a1, void *a2)
{
  id v16 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) underlyingMessage];
  id v4 = [v3 senderParticipantIdentifier];
  id v5 = [*(id *)(a1 + 40) activeConversation];
  id v6 = [v5 localParticipantIdentifier];
  unsigned int v7 = [v4 isEqual:v6];

  id v8 = [v3 time];
  id v9 = [v16 peerPaymentMessageReceivedDate];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 timeIntervalSinceReferenceDate];
    BOOL v12 = v11 != 0.0;
  }
  else
  {
    BOOL v12 = 0;
  }
  if (v8)
  {
    [v8 timeIntervalSinceReferenceDate];
    if (v16) {
      int v14 = v12;
    }
    else {
      int v14 = 1;
    }
    if (v13 == 0.0) {
      int v14 = 1;
    }
    if (((v14 | v7) & 1) == 0)
    {
      id v15 = +[PKPeerPaymentService sharedInstance];
      [v15 updateMessageReceivedDate:v8 forTransactionWithIdentifier:*(void *)(a1 + 48)];

      [v16 setPeerPaymentMessageReceivedDate:v8];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100010974(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    unsigned int v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Failed to get status for message with error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100011150(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100011164(id a1, __CFUserNotification *a2, unint64_t a3)
{
  if (!a3) {
    +[PKAnalyticsReporter reportAppleCashSenderErrorPage:PKAnalyticsReportPeerPaymentErrorContactsOnlyPageTag buttonTag:PKAnalyticsReportOkButtonTag];
  }
}

uint64_t sub_100011190(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100011644(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100011658(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10001173C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _presentInlineSetupFlowWithAmount:*(void *)(a1 + 40) flowState:*(void *)(a1 + 56) senderAddress:0 hostSceneIdentifier:a2 completion:*(void *)(a1 + 48)];
}

void sub_10001183C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v8 = [v4 currencyAmount];
  uint64_t v6 = *(void *)(a1 + 56);
  unsigned int v7 = [*(id *)(a1 + 40) senderAddress];
  [v3 _presentInlineSetupFlowWithAmount:v8 flowState:v6 senderAddress:v7 hostSceneIdentifier:v5 completion:*(void *)(a1 + 48)];
}

uint64_t sub_100011B1C(uint64_t a1, uint64_t a2)
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (a2) {
      CFStringRef v5 = @"YES";
    }
    int v7 = 138543362;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Peer payment setup flow presented with success %{public}@.", (uint8_t *)&v7, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_100012290(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _currentRequestTokenForAmount:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(v4 + 16);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100012398;
    v9[3] = &unk_1000253A0;
    v9[4] = v4;
    id v10 = *(id *)(a1 + 48);
    [v6 quoteWithAmount:v5 source:1 requestToken:v3 completion:v9];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      CFStringRef v8 = *(void (**)(void))(v7 + 16);
      v8();
    }
  }
}

void sub_100012398(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012478;
  block[3] = &unk_100025378;
  char v16 = a2;
  id v9 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v13 = v7;
  id v14 = v8;
  id v15 = v9;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100012478(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 56);
    [v2 _confirmPaymentMessageInsertionWithQuote:v3 completion:v4];
    return;
  }
  id v12 = *(id *)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 48) userInfo];
  uint64_t v6 = [v5 objectForKey:NSUnderlyingErrorKey];

  id v7 = [v6 domain];
  if (![v7 isEqualToString:PKPeerPaymentWebServiceErrorDomain]) {
    goto LABEL_8;
  }
  id v8 = [v6 code];

  if (!v8)
  {
    id v7 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_TITLE");
    id v9 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_MESSAGE");
    uint64_t v10 = PKDisplayableErrorCustom();

    id v12 = (id)v10;
LABEL_8:
  }
  [*(id *)(a1 + 32) _handleError:v12];
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
  }
}

void sub_10001270C(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void **)(v3 + 16);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100012810;
    v8[3] = &unk_1000253F0;
    v8[4] = v3;
    id v9 = v4;
    id v10 = *(id *)(a1 + 48);
    [v5 formalRequestTokenForAmount:v9 source:2 completion:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      id v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

void sub_100012810(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100012904;
  v14[3] = &unk_1000253C8;
  char v20 = a2;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v15 = v7;
  uint64_t v16 = v9;
  id v17 = v10;
  id v11 = *(id *)(a1 + 48);
  id v18 = v8;
  id v19 = v11;
  id v12 = v8;
  id v13 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
}

void sub_100012904(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72) && *(void *)(a1 + 32))
  {
    uint64_t v2 = *(void **)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    [v2 _insertRequestMessageWithAmount:v3];
    return;
  }
  id v11 = *(id *)(a1 + 56);
  uint64_t v4 = [*(id *)(a1 + 56) userInfo];
  uint64_t v5 = [v4 objectForKey:NSUnderlyingErrorKey];

  uint64_t v6 = [v5 domain];
  if (![v6 isEqualToString:PKPeerPaymentWebServiceErrorDomain]) {
    goto LABEL_9;
  }
  id v7 = [v5 code];

  if (!v7)
  {
    uint64_t v6 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_REQUEST_MONEY_GENERIC_ERROR_TITLE");
    id v8 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_REQUEST_MONEY_GENERIC_ERROR_MESSAGE");
    uint64_t v9 = PKDisplayableErrorCustom();

    id v11 = (id)v9;
LABEL_9:
  }
  [*(id *)(a1 + 40) _handleError:v11];
  uint64_t v10 = *(void *)(a1 + 64);
  if (v10) {
    (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
  }
}

void sub_100012BFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100012C20(uint64_t a1, int a2)
{
  if (a2)
  {
    if ([*(id *)(a1 + 32) usesAppleCashBalance]) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 1;
    }
    uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 16);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = [*(id *)(a1 + 32) identifier];
    id v7 = [*(id *)(a1 + 32) frequency];
    id v8 = [*(id *)(a1 + 32) startDate];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100012DB8;
    v11[3] = &unk_100024C38;
    objc_copyWeak(&v13, (id *)(a1 + 64));
    id v12 = *(id *)(a1 + 56);
    [v4 quoteWithAmount:v5 source:1 requestToken:0 alternateFundingSource:0 preserveCurrentBalance:v3 recurringPaymentIdentifier:v6 frequency:v7 startDate:v8 threshold:0 completion:v11];

    objc_destroyWeak(&v13);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 56);
    if (v9)
    {
      uint64_t v10 = *(void (**)(void))(v9 + 16);
      v10();
    }
  }
}

void sub_100012DA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100012DB8(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012EB8;
  block[3] = &unk_100024C10;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  char v17 = a2;
  id v13 = v7;
  id v9 = *(id *)(a1 + 32);
  id v14 = v8;
  id v15 = v9;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v16);
}

void sub_100012EB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    if (*(unsigned char *)(a1 + 64))
    {
      [WeakRetained _confirmPaymentMessageInsertionWithQuote:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
LABEL_11:
      id WeakRetained = v11;
      goto LABEL_12;
    }
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = [v3 userInfo];
    uint64_t v5 = [v4 objectForKey:NSUnderlyingErrorKey];

    uint64_t v6 = [v5 domain];
    if ([v6 isEqualToString:PKPeerPaymentWebServiceErrorDomain])
    {
      id v7 = [v5 code];

      if (v7)
      {
LABEL_8:
        [v11 _handleError:v3];
        uint64_t v10 = *(void *)(a1 + 48);
        if (v10) {
          (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
        }

        goto LABEL_11;
      }
      uint64_t v6 = PKLocalizedPeerPaymentRecurringString(@"SETUP_GENERIC_ERROR_TITLE");
      id v8 = PKLocalizedPeerPaymentRecurringString(@"SETUP_GENERIC_ERROR_MESSAGE");
      uint64_t v9 = PKDisplayableErrorCustom();

      id v3 = (id)v9;
    }

    goto LABEL_8;
  }
LABEL_12:
}

void sub_100013304(id a1)
{
}

void sub_100013328(id a1)
{
}

uint64_t (**sub_10001334C(void *a1, uint64_t a2, uint64_t a3))(id, void)
{
  if (a3)
  {
    if (a3 == 2) {
      (*(void (**)(void))(a1[7] + 16))();
    }
    uint64_t v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: User does not want to insert payment message.", v9, 2u);
    }

    uint64_t result = (uint64_t (**)(id, void))a1[8];
    if (result) {
      return (uint64_t (**)(id, void))result[2](result, 0);
    }
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    uint64_t v8 = a1[8];
    return (uint64_t (**)(id, void))[v6 _insertPaymentMessageWithQuote:v7 completion:v8];
  }
  return result;
}

void sub_1000138D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v5;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error inserting message: %@ with error: %@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) _handleError:v3];
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013A44;
    block[3] = &unk_1000254D0;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(a1 + 48);
    id v11 = v7;
    uint64_t v12 = v8;
    id v13 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100013A44(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Inserted message: %@", buf, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) view];
  [v4 setUserInteractionEnabled:0];

  uint64_t v5 = +[NSUserDefaults standardUserDefaults];
  uint64_t v6 = [v5 objectForKey:@"PKBubbleInsertionDismissalDelay"];
  id v7 = v6;
  if (!v6) {
    uint64_t v6 = &off_100026630;
  }
  [v6 doubleValue];
  double v9 = v8;

  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100013BF0;
  v12[3] = &unk_1000254A8;
  id v11 = *(void **)(a1 + 48);
  void v12[4] = *(void *)(a1 + 40);
  id v13 = v11;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v12);
}

uint64_t sub_100013BF0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 setUserInteractionEnabled:1];

  [*(id *)(a1 + 32) dismiss];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_100013EB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error inserting message %@ with error: %@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) _handleError:v3];
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Inserted message: %@", buf, 0xCu);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100014054;
    v10[3] = &unk_1000254A8;
    double v9 = *(void **)(a1 + 48);
    void v10[4] = *(void *)(a1 + 40);
    id v11 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
}

void sub_100014054(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 setUserInteractionEnabled:0];

  id v3 = +[NSUserDefaults standardUserDefaults];
  uint64_t v4 = [v3 objectForKey:@"PKBubbleInsertionDismissalDelay"];
  BOOL v5 = v4;
  if (!v4) {
    uint64_t v4 = &off_100026630;
  }
  [v4 doubleValue];
  double v7 = v6;

  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001417C;
  v10[3] = &unk_1000254A8;
  double v9 = *(void **)(a1 + 40);
  void v10[4] = *(void *)(a1 + 32);
  id v11 = v9;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v10);
}

uint64_t sub_10001417C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 setUserInteractionEnabled:1];

  [*(id *)(a1 + 32) dismiss];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_100014574(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Terms acceptance flow appeared with success: %d", (uint8_t *)v11, 8u);
  }

  if (a2 && *(void *)(a1 + 48) == 4)
  {
    BOOL v5 = [*(id *)(a1 + 32) activeConversation];
    double v6 = [v5 selectedMessage];
    double v7 = [v6 peerPaymentMessage];

    dispatch_time_t v8 = *(void **)(a1 + 32);
    double v9 = [v7 paymentIdentifier];
    [v8 _handlePeerPaymentRemoteAlertCompletedForPaymentIdentifier:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, a2);
    }
  }
}

uint64_t sub_1000146B0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void sub_1000146CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Identity verification flow appeared with success: %d", (uint8_t *)v11, 8u);
  }

  if (a2 && *(void *)(a1 + 48) == 4)
  {
    BOOL v5 = [*(id *)(a1 + 32) activeConversation];
    double v6 = [v5 selectedMessage];
    double v7 = [v6 peerPaymentMessage];

    dispatch_time_t v8 = *(void **)(a1 + 32);
    double v9 = [v7 paymentIdentifier];
    [v8 _handlePeerPaymentRemoteAlertCompletedForPaymentIdentifier:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, a2);
    }
  }
}

void sub_1000148D0(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Peer Payment Accept Payment Observer:  Handling In App Sheet Dismissal.", buf, 2u);
  }

  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) account];
  if (+[PKPeerPaymentOnDeviceProvisioningCheck peerPaymentPassIsProvisionedOnDeviceForAccount:v3])
  {

LABEL_6:
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Peer Payment Accept Payment Observer: Attempting to auto-accept payment with identifier: %@.", buf, 0xCu);
    }

    double v6 = *(void **)(a1 + 40);
    double v7 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v8 = PKPeerPaymentActionAccept;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100014B00;
    v10[3] = &unk_1000251A8;
    id v11 = v6;
    id v12 = *(id *)(a1 + 48);
    [v7 performAction:v8 withPaymentIdentifier:v11 completion:v10];

    return;
  }
  char v4 = PKUseMockSURFServer();

  if (v4) {
    goto LABEL_6;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Peer Payment Accept Payment Observer: Setup still required, calling completion with NO.", buf, 2u);
  }

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
}

void sub_100014B00(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014BD0;
  v9[3] = &unk_100025180;
  id v7 = *(id *)(a1 + 32);
  char v13 = a2;
  id v10 = v7;
  id v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

uint64_t sub_100014BD0(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 1024;
    int v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Peer Payment Accept Payment Observer: Payment with identifier: %@ successfully accepted: %i with error: %@.", (uint8_t *)&v7, 0x1Cu);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56));
  }
  return result;
}

id sub_100014FE4(uint64_t a1)
{
  return +[PKAnalyticsReporter reportAppleCashSenderErrorPage:*(void *)(a1 + 32) buttonTag:PKAnalyticsReportOkButtonTag];
}

id sub_100015004(uint64_t a1)
{
  return +[PKAnalyticsReporter reportAppleCashSenderErrorPage:*(void *)(a1 + 32) buttonTag:PKAnalyticsReportCancelButtonTag];
}

void sub_100015024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (a3 == 2 && *(void *)(a1 + 32))
    {
      id v5 = +[LSApplicationWorkspace defaultWorkspace];
      [v5 openSensitiveURL:*(void *)(a1 + 32) withOptions:0];
    }
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void sub_100015848(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting currency amount to %@ based on text input payload: %@", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [*(id *)(a1 + 48) _amountEntryViewController];
  [v5 setAmount:*(void *)(a1 + 32)];

  objc_storeStrong((id *)(*(void *)(a1 + 48) + 80), *(id *)(a1 + 32));
}

void sub_100015AA0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Error donating peer payment interaction: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_100015FEC(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received updated transaction for the bubble view being rendered. Reloading bubble view content.", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) _viewControllerForState:12 shouldLoad:0];
  [v3 reloadContent];
}

void *sub_100016410(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = (void *)result[4];
    id v3 = a2;
    [v3 gravity];
    double v5 = v4;
    [v3 gravity];
    double v7 = v6;

    return [v2 setGravityDirection:v5, -v7];
  }
  return result;
}

uint64_t sub_100016540(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t IMStringIsBusinessID()
{
  return _IMStringIsBusinessID();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return _NSStringFromSize(aSize);
}

uint64_t PKAlertForDisplayableErrorWithCancelHandler()
{
  return _PKAlertForDisplayableErrorWithCancelHandler();
}

uint64_t PKAnalyticsAmountCategoryForAmount()
{
  return _PKAnalyticsAmountCategoryForAmount();
}

uint64_t PKAnalyticsSendEvent()
{
  return _PKAnalyticsSendEvent();
}

uint64_t PKAnalyticsSendEventWithDailyLimit()
{
  return _PKAnalyticsSendEventWithDailyLimit();
}

uint64_t PKContentAlignmentMake()
{
  return _PKContentAlignmentMake();
}

uint64_t PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported()
{
  return _PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported();
}

uint64_t PKCurrencyAmountMake()
{
  return _PKCurrencyAmountMake();
}

uint64_t PKCurrencyDecimalAmountRound()
{
  return _PKCurrencyDecimalAmountRound();
}

uint64_t PKDeviceSpecificLocalizedStringKeyForKey()
{
  return _PKDeviceSpecificLocalizedStringKeyForKey();
}

uint64_t PKDeviceSupportsPeerPaymentIdentityVerification()
{
  return _PKDeviceSupportsPeerPaymentIdentityVerification();
}

uint64_t PKDisplayableErrorCustom()
{
  return _PKDisplayableErrorCustom();
}

uint64_t PKEnableSURFLiveBubbleDebugMode()
{
  return _PKEnableSURFLiveBubbleDebugMode();
}

uint64_t PKFormattedCurrencyStringFromNumber()
{
  return _PKFormattedCurrencyStringFromNumber();
}

uint64_t PKIDSNormalizedAddress()
{
  return _PKIDSNormalizedAddress();
}

uint64_t PKIsPad()
{
  return _PKIsPad();
}

uint64_t PKIsSimulator()
{
  return _PKIsSimulator();
}

uint64_t PKIsVision()
{
  return _PKIsVision();
}

uint64_t PKLogFacilityTypeGetObject()
{
  return _PKLogFacilityTypeGetObject();
}

uint64_t PKMessageForDisplayableError()
{
  return _PKMessageForDisplayableError();
}

uint64_t PKNetworkConnectivityAvailable()
{
  return _PKNetworkConnectivityAvailable();
}

uint64_t PKPassbookIsCurrentlyDeletedByUser()
{
  return _PKPassbookIsCurrentlyDeletedByUser();
}

uint64_t PKPassbookIsSupported()
{
  return _PKPassbookIsSupported();
}

uint64_t PKPeerPaymentGetSetupSensitiveURLWithConfiguration()
{
  return _PKPeerPaymentGetSetupSensitiveURLWithConfiguration();
}

uint64_t PKPeerPaymentNormalizedMergedPinningIdentifiersForRecipientAddress()
{
  return _PKPeerPaymentNormalizedMergedPinningIdentifiersForRecipientAddress();
}

uint64_t PKPeerPaymentSenderAddressForRecipientAddress()
{
  return _PKPeerPaymentSenderAddressForRecipientAddress();
}

uint64_t PKPrimaryAppleAccountFormattedUsername()
{
  return _PKPrimaryAppleAccountFormattedUsername();
}

uint64_t PKShowAlertForWalletUninstalled()
{
  return _PKShowAlertForWalletUninstalled();
}

uint64_t PKSizeAlignedInRect()
{
  return _PKSizeAlignedInRect();
}

uint64_t PKStoreDemoModeEnabled()
{
  return _PKStoreDemoModeEnabled();
}

uint64_t PKTitleForDisplayableError()
{
  return _PKTitleForDisplayableError();
}

uint64_t PKTransactionDetailsSensitiveURL()
{
  return _PKTransactionDetailsSensitiveURL();
}

uint64_t PKUIApplePayLogo()
{
  return _PKUIApplePayLogo();
}

uint64_t PKUIScreenScale()
{
  return _PKUIScreenScale();
}

uint64_t PKUseMockSURFServer()
{
  return _PKUseMockSURFServer();
}

uint64_t PKUserHasDisabledPeerPayment()
{
  return _PKUserHasDisabledPeerPayment();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PKLocalizedString(NSString *a1)
{
  return PKLocalizedString(a1);
}

uint64_t PKCurrencyAmountCreate(NSDecimalNumber *a1, NSString *a2, uint64_t a3)
{
  return PKCurrencyAmountCreate(a1, a2, a3);
}

uint64_t PKLocalizedPaymentString(NSString *a1)
{
  return PKLocalizedPaymentString(a1);
}

uint64_t PKLocalizedDeletableString(NSString *a1)
{
  return PKLocalizedDeletableString(a1);
}

uint64_t PKLocalizedPeerPaymentString(NSString *a1)
{
  return PKLocalizedPeerPaymentString(a1);
}

uint64_t PKLocalizedPeerPaymentString(NSString *a1, NSString *a2, ...)
{
  return PKLocalizedPeerPaymentString(a1, a2);
}

uint64_t PKLocalizedPeerPaymentLexingtonString(NSString *a1)
{
  return PKLocalizedPeerPaymentLexingtonString(a1);
}

uint64_t PKLocalizedPeerPaymentRecurringString(NSString *a1)
{
  return PKLocalizedPeerPaymentRecurringString(a1);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return [a1 CGContext];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend__accountIsLocked(void *a1, const char *a2, ...)
{
  return [a1 _accountIsLocked];
}

id objc_msgSend__amountEntryViewController(void *a1, const char *a2, ...)
{
  return [a1 _amountEntryViewController];
}

id objc_msgSend__analyticsP2PContext(void *a1, const char *a2, ...)
{
  return [a1 _analyticsP2PContext];
}

id objc_msgSend__analyticsPageTag(void *a1, const char *a2, ...)
{
  return [a1 _analyticsPageTag];
}

id objc_msgSend__appleAccountInformation(void *a1, const char *a2, ...)
{
  return [a1 _appleAccountInformation];
}

id objc_msgSend__balloonMaskEdgeInsets(void *a1, const char *a2, ...)
{
  return [a1 _balloonMaskEdgeInsets];
}

id objc_msgSend__currentBalance(void *a1, const char *a2, ...)
{
  return [a1 _currentBalance];
}

id objc_msgSend__fetchStatus(void *a1, const char *a2, ...)
{
  return [a1 _fetchStatus];
}

id objc_msgSend__iMessageIsEnabled(void *a1, const char *a2, ...)
{
  return [a1 _iMessageIsEnabled];
}

id objc_msgSend__isBusinessConversation(void *a1, const char *a2, ...)
{
  return [a1 _isBusinessConversation];
}

id objc_msgSend__isGroupConversation(void *a1, const char *a2, ...)
{
  return [a1 _isGroupConversation];
}

id objc_msgSend__maximumTransferAmount(void *a1, const char *a2, ...)
{
  return [a1 _maximumTransferAmount];
}

id objc_msgSend__minimumTransferAmount(void *a1, const char *a2, ...)
{
  return [a1 _minimumTransferAmount];
}

id objc_msgSend__noteAmountChanged(void *a1, const char *a2, ...)
{
  return [a1 _noteAmountChanged];
}

id objc_msgSend__openWallet(void *a1, const char *a2, ...)
{
  return [a1 _openWallet];
}

id objc_msgSend__percentExpanded(void *a1, const char *a2, ...)
{
  return [a1 _percentExpanded];
}

id objc_msgSend__presentationSemanticContext(void *a1, const char *a2, ...)
{
  return [a1 _presentationSemanticContext];
}

id objc_msgSend__recipientAddress(void *a1, const char *a2, ...)
{
  return [a1 _recipientAddress];
}

id objc_msgSend__recipientFoundInContacts(void *a1, const char *a2, ...)
{
  return [a1 _recipientFoundInContacts];
}

id objc_msgSend__recipientPersonForIntentDonation(void *a1, const char *a2, ...)
{
  return [a1 _recipientPersonForIntentDonation];
}

id objc_msgSend__registerForPresentationSemanticContextChanges(void *a1, const char *a2, ...)
{
  return [a1 _registerForPresentationSemanticContextChanges];
}

id objc_msgSend__reportAnalyticsForState(void *a1, const char *a2, ...)
{
  return [a1 _reportAnalyticsForState];
}

id objc_msgSend__reportAnalyticsViewDisappeared(void *a1, const char *a2, ...)
{
  return [a1 _reportAnalyticsViewDisappeared];
}

id objc_msgSend__requiredContentState(void *a1, const char *a2, ...)
{
  return [a1 _requiredContentState];
}

id objc_msgSend__requiresEnablement(void *a1, const char *a2, ...)
{
  return [a1 _requiresEnablement];
}

id objc_msgSend__requiresSetupFlow(void *a1, const char *a2, ...)
{
  return [a1 _requiresSetupFlow];
}

id objc_msgSend__resizeBubbleViewToReferenceSizeAnimated(void *a1, const char *a2, ...)
{
  return [a1 _resizeBubbleViewToReferenceSizeAnimated];
}

id objc_msgSend__senderAddress(void *a1, const char *a2, ...)
{
  return [a1 _senderAddress];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_actionView(void *a1, const char *a2, ...)
{
  return [a1 actionView];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return [a1 activationState];
}

id objc_msgSend_activeConversation(void *a1, const char *a2, ...)
{
  return [a1 activeConversation];
}

id objc_msgSend_activityIndicator(void *a1, const char *a2, ...)
{
  return [a1 activityIndicator];
}

id objc_msgSend_allowsFormalPaymentRequests(void *a1, const char *a2, ...)
{
  return [a1 allowsFormalPaymentRequests];
}

id objc_msgSend_amount(void *a1, const char *a2, ...)
{
  return [a1 amount];
}

id objc_msgSend_amountStepperView(void *a1, const char *a2, ...)
{
  return [a1 amountStepperView];
}

id objc_msgSend_analyticsSessionToken(void *a1, const char *a2, ...)
{
  return [a1 analyticsSessionToken];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_appController(void *a1, const char *a2, ...)
{
  return [a1 appController];
}

id objc_msgSend_appReadyForDisplay(void *a1, const char *a2, ...)
{
  return [a1 appReadyForDisplay];
}

id objc_msgSend_associatedPassUniqueID(void *a1, const char *a2, ...)
{
  return [a1 associatedPassUniqueID];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_balanceLabel(void *a1, const char *a2, ...)
{
  return [a1 balanceLabel];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bubbleAppControllers(void *a1, const char *a2, ...)
{
  return [a1 bubbleAppControllers];
}

id objc_msgSend_bubbleView(void *a1, const char *a2, ...)
{
  return [a1 bubbleView];
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return [a1 button];
}

id objc_msgSend_canSendText(void *a1, const char *a2, ...)
{
  return [a1 canSendText];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currency(void *a1, const char *a2, ...)
{
  return [a1 currency];
}

id objc_msgSend_currencyAmount(void *a1, const char *a2, ...)
{
  return [a1 currencyAmount];
}

id objc_msgSend_currentBalance(void *a1, const char *a2, ...)
{
  return [a1 currentBalance];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return [a1 currentUser];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 defaultButtonTitle];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceTransactionSourceIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 deviceTransactionSourceIdentifiers];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dynamicFraudContent(void *a1, const char *a2, ...)
{
  return [a1 dynamicFraudContent];
}

id objc_msgSend_enableLiveBubbleDebugMode(void *a1, const char *a2, ...)
{
  return [a1 enableLiveBubbleDebugMode];
}

id objc_msgSend_externalizedControllerState(void *a1, const char *a2, ...)
{
  return [a1 externalizedControllerState];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fpanIdentifier(void *a1, const char *a2, ...)
{
  return [a1 fpanIdentifier];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return [a1 frequency];
}

id objc_msgSend_fundingSource(void *a1, const char *a2, ...)
{
  return [a1 fundingSource];
}

id objc_msgSend_generatedSnapshot(void *a1, const char *a2, ...)
{
  return [a1 generatedSnapshot];
}

id objc_msgSend_gravity(void *a1, const char *a2, ...)
{
  return [a1 gravity];
}

id objc_msgSend_hasBeenSent(void *a1, const char *a2, ...)
{
  return [a1 hasBeenSent];
}

id objc_msgSend_header(void *a1, const char *a2, ...)
{
  return [a1 header];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identityVerificationRequired(void *a1, const char *a2, ...)
{
  return [a1 identityVerificationRequired];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_informalRequestToken(void *a1, const char *a2, ...)
{
  return [a1 informalRequestToken];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_isDeviceMotionAvailable(void *a1, const char *a2, ...)
{
  return [a1 isDeviceMotionAvailable];
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return [a1 isFromMe];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isInHardwareKeyboardMode(void *a1, const char *a2, ...)
{
  return [a1 isInHardwareKeyboardMode];
}

id objc_msgSend_isRecurringPayment(void *a1, const char *a2, ...)
{
  return [a1 isRecurringPayment];
}

id objc_msgSend_isiMessageEnabled(void *a1, const char *a2, ...)
{
  return [a1 isiMessageEnabled];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return [a1 layoutFrame];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 loadViewIfNeeded];
}

id objc_msgSend_localParticipantIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localParticipantIdentifier];
}

id objc_msgSend_localProperties(void *a1, const char *a2, ...)
{
  return [a1 localProperties];
}

id objc_msgSend_localizedRecoveryOptions(void *a1, const char *a2, ...)
{
  return [a1 localizedRecoveryOptions];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainView(void *a1, const char *a2, ...)
{
  return [a1 mainView];
}

id objc_msgSend_maximumAmount(void *a1, const char *a2, ...)
{
  return [a1 maximumAmount];
}

id objc_msgSend_maximumTransferAmount(void *a1, const char *a2, ...)
{
  return [a1 maximumTransferAmount];
}

id objc_msgSend_memo(void *a1, const char *a2, ...)
{
  return [a1 memo];
}

id objc_msgSend_memoField(void *a1, const char *a2, ...)
{
  return [a1 memoField];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageSource(void *a1, const char *a2, ...)
{
  return [a1 messageSource];
}

id objc_msgSend_minimumAmount(void *a1, const char *a2, ...)
{
  return [a1 minimumAmount];
}

id objc_msgSend_minimumTransferAmount(void *a1, const char *a2, ...)
{
  return [a1 minimumTransferAmount];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nameComponents(void *a1, const char *a2, ...)
{
  return [a1 nameComponents];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_needsRegistration(void *a1, const char *a2, ...)
{
  return [a1 needsRegistration];
}

id objc_msgSend_notANumber(void *a1, const char *a2, ...)
{
  return [a1 notANumber];
}

id objc_msgSend_noteContentSizeNeedsUpdate(void *a1, const char *a2, ...)
{
  return [a1 noteContentSizeNeedsUpdate];
}

id objc_msgSend_noteReadyForDisplay(void *a1, const char *a2, ...)
{
  return [a1 noteReadyForDisplay];
}

id objc_msgSend_one(void *a1, const char *a2, ...)
{
  return [a1 one];
}

id objc_msgSend_otherButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 otherButtonTitle];
}

id objc_msgSend_paymentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 paymentIdentifier];
}

id objc_msgSend_paymentPass(void *a1, const char *a2, ...)
{
  return [a1 paymentPass];
}

id objc_msgSend_peerPaymentMessage(void *a1, const char *a2, ...)
{
  return [a1 peerPaymentMessage];
}

id objc_msgSend_peerPaymentMessageReceivedDate(void *a1, const char *a2, ...)
{
  return [a1 peerPaymentMessageReceivedDate];
}

id objc_msgSend_peerPaymentPass(void *a1, const char *a2, ...)
{
  return [a1 peerPaymentPass];
}

id objc_msgSend_peerPaymentRequiresEnablement(void *a1, const char *a2, ...)
{
  return [a1 peerPaymentRequiresEnablement];
}

id objc_msgSend_peerPaymentService(void *a1, const char *a2, ...)
{
  return [a1 peerPaymentService];
}

id objc_msgSend_peerPaymentStatus(void *a1, const char *a2, ...)
{
  return [a1 peerPaymentStatus];
}

id objc_msgSend_percentExpanded(void *a1, const char *a2, ...)
{
  return [a1 percentExpanded];
}

id objc_msgSend_phoneOrEmail(void *a1, const char *a2, ...)
{
  return [a1 phoneOrEmail];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_presentationStyle(void *a1, const char *a2, ...)
{
  return [a1 presentationStyle];
}

id objc_msgSend_primaryEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 primaryEmailAddress];
}

id objc_msgSend_primaryTextColor(void *a1, const char *a2, ...)
{
  return [a1 primaryTextColor];
}

id objc_msgSend_quote(void *a1, const char *a2, ...)
{
  return [a1 quote];
}

id objc_msgSend_recipient(void *a1, const char *a2, ...)
{
  return [a1 recipient];
}

id objc_msgSend_recipientAddress(void *a1, const char *a2, ...)
{
  return [a1 recipientAddress];
}

id objc_msgSend_recipientAddresses(void *a1, const char *a2, ...)
{
  return [a1 recipientAddresses];
}

id objc_msgSend_recipientDisplayName(void *a1, const char *a2, ...)
{
  return [a1 recipientDisplayName];
}

id objc_msgSend_recipientFoundInContacts(void *a1, const char *a2, ...)
{
  return [a1 recipientFoundInContacts];
}

id objc_msgSend_recurringPaymentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 recurringPaymentIdentifier];
}

id objc_msgSend_recurringPaymentMemo(void *a1, const char *a2, ...)
{
  return [a1 recurringPaymentMemo];
}

id objc_msgSend_recurringPaymentsFeatureDescriptor(void *a1, const char *a2, ...)
{
  return [a1 recurringPaymentsFeatureDescriptor];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
}

id objc_msgSend_referenceBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 referenceBackgroundColor];
}

id objc_msgSend_referenceSize(void *a1, const char *a2, ...)
{
  return [a1 referenceSize];
}

id objc_msgSend_reloadContent(void *a1, const char *a2, ...)
{
  return [a1 reloadContent];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_requestResize(void *a1, const char *a2, ...)
{
  return [a1 requestResize];
}

id objc_msgSend_requestToken(void *a1, const char *a2, ...)
{
  return [a1 requestToken];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_riskLevel(void *a1, const char *a2, ...)
{
  return [a1 riskLevel];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_selectedMessage(void *a1, const char *a2, ...)
{
  return [a1 selectedMessage];
}

id objc_msgSend_sendRestrictionType(void *a1, const char *a2, ...)
{
  return [a1 sendRestrictionType];
}

id objc_msgSend_sendToUserFeatureDescriptor(void *a1, const char *a2, ...)
{
  return [a1 sendToUserFeatureDescriptor];
}

id objc_msgSend_senderAddress(void *a1, const char *a2, ...)
{
  return [a1 senderAddress];
}

id objc_msgSend_senderParticipantIdentifier(void *a1, const char *a2, ...)
{
  return [a1 senderParticipantIdentifier];
}

id objc_msgSend_senderPhoneOrEmail(void *a1, const char *a2, ...)
{
  return [a1 senderPhoneOrEmail];
}

id objc_msgSend_serviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 serviceIdentifier];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setReadyForDisplay(void *a1, const char *a2, ...)
{
  return [a1 setReadyForDisplay];
}

id objc_msgSend_shapeLayer(void *a1, const char *a2, ...)
{
  return [a1 shapeLayer];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return [a1 sharedContext];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_stage(void *a1, const char *a2, ...)
{
  return [a1 stage];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusReason(void *a1, const char *a2, ...)
{
  return [a1 statusReason];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_supportsRecurringPayments(void *a1, const char *a2, ...)
{
  return [a1 supportsRecurringPayments];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return [a1 time];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_totalReceiveAmount(void *a1, const char *a2, ...)
{
  return [a1 totalReceiveAmount];
}

id objc_msgSend_totalReceiveAmountCurrency(void *a1, const char *a2, ...)
{
  return [a1 totalReceiveAmountCurrency];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transactionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 transactionIdentifier];
}

id objc_msgSend_transactionSourceIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 transactionSourceIdentifiers];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_underlyingMessage(void *a1, const char *a2, ...)
{
  return [a1 underlyingMessage];
}

id objc_msgSend_updateIsExpansionSupported(void *a1, const char *a2, ...)
{
  return [a1 updateIsExpansionSupported];
}

id objc_msgSend_updateIsKeypadSupported(void *a1, const char *a2, ...)
{
  return [a1 updateIsKeypadSupported];
}

id objc_msgSend_usedKeypad(void *a1, const char *a2, ...)
{
  return [a1 usedKeypad];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_usesAppleCashBalance(void *a1, const char *a2, ...)
{
  return [a1 usesAppleCashBalance];
}

id objc_msgSend_validateNumberPadInput(void *a1, const char *a2, ...)
{
  return [a1 validateNumberPadInput];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_webService(void *a1, const char *a2, ...)
{
  return [a1 webService];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return [a1 windows];
}

id objc_msgSend_zero(void *a1, const char *a2, ...)
{
  return [a1 zero];
}