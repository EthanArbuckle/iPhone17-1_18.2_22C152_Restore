void sub_10000524C(id a1)
{
  void *v1;
  id v2;
  double v3;
  id v4;
  uint64_t vars8;

  v4 = +[UIDevice currentDevice];
  if ([v4 userInterfaceIdiom] == (id)1)
  {
    qword_10003EB60 = 0x4052000000000000;
  }
  else
  {
    v1 = +[UIDevice currentDevice];
    v2 = [v1 userInterfaceIdiom];
    v3 = 46.0;
    if (v2 == (id)5) {
      v3 = 72.0;
    }
    qword_10003EB60 = *(void *)&v3;
  }
}

id sub_100005B9C(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  v4 = [*(id *)(a1 + 32) identifier];
  id v5 = [v3 isEqual:v4];

  return v5;
}

id sub_100005C00(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  v4 = [*(id *)(a1 + 32) identifier];
  id v5 = [v3 isEqual:v4];

  return v5;
}

void sub_100006570(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) puppetCollectionView];
  [v1 reloadData];
}

id sub_10000662C(uint64_t a1)
{
  [*(id *)(a1 + 32) updateSelectedForVisibleCells];
  v2 = *(void **)(a1 + 32);

  return [v2 updateHighlightedForVisibleCells];
}

id sub_10000678C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) setSuspendAutoScrolling:0];
  }
  [*(id *)(a1 + 32) reloadData];
  v2 = *(void **)(a1 + 32);

  return [v2 scrollToSelection];
}

void sub_1000069DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006A00(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained plusButtonCellEnabled])
  {
    id v1 = [WeakRetained delegate];
    [v1 puppetCollectionViewControllerDidRequestMemojiLaunch:WeakRetained];
  }
}

id sub_100006B30(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) selectedRowIndex];
  BOOL v4 = v3 == [*(id *)(a1 + 48) row];

  return [v2 displaySelection:v4];
}

id sub_100007530(uint64_t a1)
{
  [*(id *)(a1 + 32) setTintColor:0];
  [*(id *)(a1 + 32) setThumbRequestId:-1];
  [*(id *)(a1 + 32) setMaxSize:1.79769313e308, 1.79769313e308];
  v2 = [*(id *)(a1 + 32) puppetImgView];
  [v2 setImage:0];

  id v3 = [*(id *)(a1 + 32) puppetImgView];
  [v3 setHidden:1];

  BOOL v4 = [*(id *)(a1 + 32) imageButton];
  [v4 setBackgroundImage:0 forState:0];

  id v5 = [*(id *)(a1 + 32) imageButton];
  [v5 setHidden:1];

  [*(id *)(a1 + 32) setImageButtonHandlerBlock:0];
  [*(id *)(a1 + 32) displayHighlight:0];
  v6 = *(void **)(a1 + 32);

  return [v6 displaySelection:0];
}

void sub_100007930(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained thumbRequestId] == *(id *)(a1 + 40)) {
    [WeakRetained setPuppetThumbnail:v4 alpha:1.0 maxSize:1.79769313e308];
  }
}

void sub_100007E3C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingHighlightBounceAnimation];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) pendingHighlightBounceAnimation];
    [*(id *)(a1 + 32) setPendingHighlightBounceAnimation:0];
  }
  else
  {
    id v4 = 0;
  }
  id v3 = [*(id *)(a1 + 32) pendingSelectionAnimation];

  if (v3)
  {
    id v3 = [*(id *)(a1 + 32) pendingSelectionAnimation];
    [*(id *)(a1 + 32) setPendingSelectionAnimation:0];
  }
  if (v4) {
    v4[2](v4);
  }
  if (v3) {
    v3[2](v3);
  }
}

void sub_100007F14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  long long v2 = *(_OWORD *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 48);
  long long v7 = v2;
  v5[2] = sub_100008010;
  v5[3] = &unk_100034858;
  v5[4] = v1;
  long long v8 = *(_OWORD *)(a1 + 80);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100008064;
  v3[3] = &unk_100034880;
  id v4 = *(id *)(a1 + 40);
  +[UIView _animateWithDuration:0 delay:v1 options:v5 factory:v3 animations:0.1 completion:0.0];
}

void sub_100008010(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) contentContainerView:*(void *)(a1 + 40) :*(void *)(a1 + 48) :*(void *)(a1 + 56) :*(void *)(a1 + 64) :*(void *)(a1 + 72) :*(void *)(a1 + 80)];
  [v1 setTransform:&v2];
}

uint64_t sub_100008064(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1000081AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = _NSConcreteStackBlock;
  uint64_t v4 = 3221225472;
  id v5 = sub_100008244;
  long long v6 = &unk_1000348D0;
  uint64_t v7 = v1;
  return +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 0, 0.1, 0.0, _NSConcreteStackBlock, 3221225472, sub_100008244, &unk_1000348D0, v1, *(void *)(a1 + 40));
}

void sub_100008244(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) borderView];
  [v2 setAlpha:v1];
}

void sub_10000AD9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,id location,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

uint64_t sub_10000ADF8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000AE08(uint64_t a1)
{
}

id sub_10000AE10(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) view];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) view];
  long long v6 = [v5 backgroundColor];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setBackgroundColor:v6];

  [*(id *)(a1 + 32) addChildViewController:*(void *)(*(void *)(a1 + 32) + 32)];
  [*(id *)(*(void *)(a1 + 32) + 8) addSubview:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) displayAvatarRecordWithIdentifier:v8 animated:0];
    v9 = *(void **)(*(void *)(a1 + 32) + 32);
    return [v9 reloadData];
  }
  return result;
}

void sub_10000AF1C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained displaysLaunchScreen])
  {
    uint64_t v2 = &v4;
    uint64_t v4 = _NSConcreteStackBlock;
    uint64_t v5 = 3221225472;
    uint64_t v3 = sub_10000B02C;
  }
  else
  {
    uint64_t v2 = (void ***)v6;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    uint64_t v3 = sub_10000AFE8;
  }
  v2[2] = (void **)v3;
  v2[3] = (void **)&unk_100034790;
  v2[4] = (void **)WeakRetained;
  [WeakRetained performWhileOverridingPresentationStyle:0 block:v4, v5];
}

id sub_10000AFE8(uint64_t a1)
{
  [*(id *)(a1 + 32) updateUIState:3 animated:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 updateLayoutForPresentationStyle];
}

id sub_10000B02C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) presentsLaunchScreenInFullScreenModal]) {
    uint64_t v2 = 3;
  }
  else {
    uint64_t v2 = 0;
  }
  [*(id *)(a1 + 32) updateUIState:v2 animated:0];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 updateLayoutForPresentationStyle];
}

void sub_10000BC6C(uint64_t a1)
{
  double v1 = *(void **)(*(void *)(a1 + 32) + 240);
  id v2 = +[UIImage imageNamed:@"tap-to-radar-96-recording"];
  [v1 setImage:v2 forState:0];
}

id sub_10000C4DC(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_10000C508(uint64_t a1)
{
}

void sub_10000C510(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = [WeakRetained waitingOnPresentationStyleRequestFulfillment];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] request expanded timer fire, waiting: %i", (uint8_t *)v7, 8u);
  }
  if (([WeakRetained waitingOnPresentationStyleRequestFulfillment] & 1) != 0
    || (+[BaseMessagesViewController pendingChildViewController], uint64_t v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    [WeakRetained requestPresentationStyle:*(void *)(a1 + 48)];
    dispatch_time_t v4 = dispatch_time(0, 500000000);
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, *(dispatch_block_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  }
  else
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

void sub_10000C644(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateUIState:1 animated:0];
  [WeakRetained updateLayoutForPresentationStyle];
}

void sub_10000CA5C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  [WeakRetained updateInterfaceOrientation];

  [*(id *)(a1 + 32) updateLayoutForPresentationStyle];
  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

id sub_10000CAD4(uint64_t a1)
{
  return [*(id *)(a1 + 32) captureSnapshotMetricsIfNeeded];
}

void sub_10000D22C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) presentationStyle] != (id)1)
  {
    id v2 = *(void **)(a1 + 32);
    id v4 = [v2 parentMessagesViewController];
    id v3 = [v4 launchViewController];
    [v2 launchViewControllerDidCancel:v3];
  }
}

void sub_10000E3EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  [WeakRetained setContentMode:4];
}

void sub_10000EA60(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 376);
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 144));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 464);
    uint64_t v7 = [WeakRetained arSession];
    v14[0] = 67109632;
    v14[1] = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    __int16 v17 = 2048;
    id v18 = [v7 state];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] interfaceObscuredByOverlayOrPresentationChanged obscured %i; local sessionState = %lu; actual sessionState %lu",
      (uint8_t *)v14,
      0x1Cu);
  }
  if (v3 == 3)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      [WeakRetained setFaceTrackingPaused:1];
      [*(id *)(*(void *)(a1 + 32) + 616) didPauseFaceTracking];
      BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      LOBYTE(v8) = 0;
      if (!v9) {
        goto LABEL_28;
      }
      LOWORD(v14[0]) = 0;
      v10 = "[Jellyfish] pausing face tracking due to strong popover";
    }
    else
    {
      if (![WeakRetained faceTrackingIsPaused]) {
        goto LABEL_27;
      }
      [WeakRetained setFaceTrackingPaused:0];
      [*(id *)(*(void *)(a1 + 32) + 616) didResumeFaceTracking];
      BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      LOBYTE(v8) = 0;
      if (!v13) {
        goto LABEL_28;
      }
      LOWORD(v14[0]) = 0;
      v10 = "[Jellyfish] resuming face tracking after strong popover";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)v14, 2u);
    goto LABEL_27;
  }
  if (v3 == 5)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(v11 + 352);
    if (*(unsigned char *)(a1 + 40))
    {
      if (!v12)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] forcing preview to stop", (uint8_t *)v14, 2u);
        }
        [*(id *)(a1 + 32) stopPreviewing];
        [*(id *)(a1 + 32) fadeOut:*(void *)(*(void *)(a1 + 32) + 232)];
        LOBYTE(v8) = 1;
        goto LABEL_28;
      }
    }
    else if (v12 == 1)
    {
      int v8 = *(unsigned __int8 *)(v11 + 345);
      if (v8)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] playing preview once", (uint8_t *)v14, 2u);
        }
        [*(id *)(a1 + 32) playPreviewOnce];
        goto LABEL_27;
      }
      goto LABEL_28;
    }
LABEL_27:
    LOBYTE(v8) = 0;
    goto LABEL_28;
  }
  if (v3 != 4) {
    goto LABEL_27;
  }
  LOBYTE(v8) = *(unsigned char *)(a1 + 40);
  if ((_BYTE)v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] forcing recording to stop", (uint8_t *)v14, 2u);
    }
    [*(id *)(a1 + 32) stopRecordingAndPlayPreview:0];
    [*(id *)(a1 + 32) discardRecording];
    goto LABEL_27;
  }
LABEL_28:
  *(unsigned char *)(*(void *)(a1 + 32) + 345) = v8;
}

void sub_10000F3E4(uint64_t a1)
{
  uint64_t v2 = +[UIAlertController alertControllerWithTitle:@"Log Facetracking" message:@"If puppet related, set Log Facetracking in Internal Settings > Animoji" preferredStyle:1];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F544;
  v8[3] = &unk_100034998;
  v8[4] = *(void *)(a1 + 32);
  uint64_t v3 = +[UIAlertAction actionWithTitle:@"File Radar Anyway" style:0 handler:v8];
  [v2 addAction:v3];

  id v4 = +[UIAlertAction actionWithTitle:@"Back Out" style:1 handler:&stru_1000349D8];
  [v2 addAction:v4];

  [v2 _setShouldAlignToKeyboard:0];
  int v5 = [*(id *)(a1 + 32) view];
  uint64_t v6 = [v5 window];
  uint64_t v7 = [v6 rootViewController];
  [v7 presentViewController:v2 animated:0 completion:0];
}

id sub_10000F544(uint64_t a1)
{
  return [*(id *)(a1 + 32) showFileRadarWarningPopup];
}

id sub_10000F774(uint64_t a1)
{
  [*(id *)(a1 + 32) requestPresentationStyle:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 launchTapToRadar];
}

id sub_10000F7B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestPresentationStyle:0];
}

id sub_1000101AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && !a3) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);

  return [v4 _launchTapToRadarWithAttachments:v5];
}

void sub_1000103C4(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  if (v1[58] == 2)
  {
    id v3 = +[NSBundle mainBundle];
    uint64_t v2 = [v3 localizedStringForKey:@"sJFARSessionFailed" value:&stru_100035088 table:@"JFStrings"];
    [v1 pauseFaceTrackingWithReason:v2];
  }
}

id sub_100010584(uint64_t a1, int a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 sendVideoMessage];
  }
  else {
    return [v2 afterExportMovie];
  }
}

void sub_1000108E0(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001096C;
    block[3] = &unk_100034A50;
    id v2 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t sub_10001096C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100010980(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 648) = 1;
  if (*(void *)(a1 + 40))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010A20;
    block[3] = &unk_100034A50;
    id v2 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t sub_100010A20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100010DEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v3 localizedDescription];
      int v10 = 138412290;
      uint64_t v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] exportMovieToURL failed: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    uint64_t v5 = +[NSFileManager defaultManager];
    uint64_t v6 = [*(id *)(a1 + 32) path];
    unsigned __int8 v7 = [v5 fileExistsAtPath:v6];

    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v8) {
        goto LABEL_10;
      }
      LOWORD(v10) = 0;
      BOOL v9 = "[Jellyfish] exportMovieToURL succeeded";
    }
    else
    {
      if (!v8) {
        goto LABEL_10;
      }
      LOWORD(v10) = 0;
      BOOL v9 = "[Jellyfish] exportMovieToURL succeeded but file does not exist at path";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 2u);
  }
LABEL_10:
  kdebug_trace();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] finished exporting video for TTR", (uint8_t *)&v10, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000113B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000114B4;
  v5[3] = &unk_100034C08;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v7 = *(id *)(a1 + 56);
  char v9 = *(unsigned char *)(a1 + 72);
  id v8 = *(id *)(a1 + 64);
  char v10 = *(unsigned char *)(a1 + 73);
  [WeakRetained exportMovieToURL:v6 options:v4 completionHandler:v5];
}

void sub_1000114B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_10001159C;
  v7[3] = &unk_100034BE0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  char v13 = *(unsigned char *)(a1 + 64);
  id v12 = *(id *)(a1 + 56);
  char v14 = *(unsigned char *)(a1 + 65);
  id v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

void sub_10001159C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 488), v2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 32) localizedDescription];
      *(_DWORD *)buf = 138412290;
      v23 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] exportMovieToURL failed: %@", buf, 0xCu);
    }
    [*(id *)(a1 + 40) afterExportMovie];
  }
  else
  {
    uint64_t v4 = +[AXUIAvatarUtilities descriptionForAvatarWithRecord:*(void *)(a1 + 56) includeVideoPrefix:1];
    UIAccessibilityAddMetadataDescriptionToVideo();

    if (*(unsigned char *)(a1 + 72))
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100011840;
      v17[3] = &unk_100034B90;
      id v18 = *(id *)(a1 + 48);
      id v5 = *(id *)(a1 + 64);
      char v21 = *(unsigned char *)(a1 + 73);
      uint64_t v6 = *(void *)(a1 + 40);
      id v19 = v5;
      uint64_t v20 = v6;
      +[PHPhotoLibrary requestAuthorization:v17];
    }
    id v7 = *(void **)(a1 + 48);
    id v8 = *(void **)(*(void *)(a1 + 40) + 368);
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    char v13 = sub_100011D4C;
    char v14 = &unk_100034BB8;
    id v9 = v7;
    uint64_t v10 = *(void *)(a1 + 40);
    id v15 = v9;
    uint64_t v16 = v10;
    [v8 sendAttachment:v9 withAlternateFilename:0 completionHandler:&v11];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] did send video", buf, 2u);
    }
    [*(id *)(*(void *)(a1 + 40) + 616) didSendVideoWithAvatar:*(void *)(a1 + 56) duration:*(double *)(*(void *)(a1 + 40) + 320) v11, v12, v13, v14];
    [*(id *)(a1 + 40) afterExportMovie];
    kdebug_trace();
  }
}

void sub_100011840(uint64_t a1, uint64_t a2)
{
  if (a2 == 3)
  {
    uint64_t v12 = v2;
    uint64_t v13 = v3;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    _DWORD v7[2] = sub_1000118FC;
    v7[3] = &unk_100034B68;
    id v8 = *(id *)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    char v11 = *(unsigned char *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 48);
    id v9 = v5;
    uint64_t v10 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

void sub_1000118FC(uint64_t a1)
{
  uint64_t v2 = +[PHPhotoLibrary sharedPhotoLibrary];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100011A0C;
  v5[3] = &unk_100034AF0;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100011A5C;
  v3[3] = &unk_100034B40;
  char v4 = *(unsigned char *)(a1 + 56);
  void v3[4] = *(void *)(a1 + 48);
  [v2 performChanges:v5 completionHandler:v3];
}

id sub_100011A0C(uint64_t a1)
{
  id result = +[PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:*(void *)(a1 + 32)];
  if (*(void *)(a1 + 40)) {
    return +[PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:](PHAssetChangeRequest, "creationRequestForAssetFromVideoAtFileURL:");
  }
  return result;
}

void sub_100011A5C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011B08;
  block[3] = &unk_100034B18;
  char v11 = a2;
  char v12 = *(unsigned char *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100011B08(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    if (*(unsigned char *)(a1 + 49)) {
      CFStringRef v2 = @"videos";
    }
    else {
      CFStringRef v2 = @"video";
    }
    +[NSString stringWithFormat:@"Successfully saved %@ to photo library", v2, v10];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] saveVideoToCameraRoll failed: %@", buf, 0xCu);
    }
    CFStringRef v3 = @"videos";
    if (!*(unsigned char *)(a1 + 49)) {
      CFStringRef v3 = @"video";
    }
    +[NSString stringWithFormat:@"Saving %@ failed: %@", v3, *(void *)(a1 + 32)];
  char v4 = };
  +[UIAlertController alertControllerWithTitle:@"Camera Roll" message:v4 preferredStyle:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100011D3C;
  v11[3] = &unk_100034998;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v12;
  uint64_t v6 = +[UIAlertAction actionWithTitle:@"Close" style:0 handler:v11];
  [v5 addAction:v6];

  [v5 _setShouldAlignToKeyboard:0];
  id v7 = [*(id *)(a1 + 40) view];
  id v8 = [v7 window];
  id v9 = [v8 rootViewController];
  [v9 presentViewController:v5 animated:0 completion:0];
}

id sub_100011D3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_100011D4C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 496), a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v4 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] sendAttachment failed: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = +[NSFileManager defaultManager];
    id v7 = [*(id *)(a1 + 32) path];
    unsigned __int8 v8 = [v6 fileExistsAtPath:v7];

    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] sendAttachment succeeded", buf, 2u);
      }
    }
    else
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] exportMovieToURL succeeded but file does not exist at path", buf, 2u);
      }
      uint64_t v10 = [*(id *)(a1 + 32) path];
      uint64_t v11 = +[NSString stringWithFormat:@"ExportMovieToURL succeeded but file does not exist at path:%@", v10];
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void **)(v12 + 512);
      *(void *)(v12 + 512) = v11;
    }
  }
}

id sub_1000120C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideUserInfoLabel];
}

void sub_1000120D0(uint64_t a1)
{
  [*(id *)(a1 + 32) updateARSessionStateResettingState:1];
  CFStringRef v2 = *(void **)(a1 + 32);
  if (v2[58] == 2)
  {
    id v4 = +[NSBundle mainBundle];
    CFStringRef v3 = [v4 localizedStringForKey:@"sJFARSessionFailed" value:&stru_100035088 table:@"JFStrings"];
    [v2 pauseFaceTrackingWithReason:v3];
  }
}

void sub_100012AA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_100012ACC(uint64_t a1)
{
  [*(id *)(a1 + 32) updateLayoutForPresentationStyle];
  [*(id *)(a1 + 32) updateUIState:3 animated:*(unsigned __int8 *)(a1 + 48)];
  id result = [*(id *)(a1 + 32) shouldPresentPaddleView];
  if (result)
  {
    id result = [*(id *)(a1 + 32) presentPaddleView];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

id sub_100012B28(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return +[UIView performWithoutAnimation:*(void *)(a1 + 32)];
  }
}

id sub_100012B54(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestPresentationStyle:1];
}

void sub_100012B60(id *a1)
{
  [a1[4] willMoveToParentViewController:0];
  CFStringRef v2 = [a1[4] view];
  [v2 removeFromSuperview];

  [a1[4] removeFromParentViewController];
  CFStringRef v3 = [a1[5] parentMessagesViewController];
  [v3 setLaunchViewController:0];

  [a1[6] removeFromSuperview];
  id v4 = [a1[5] parentMessagesViewController];
  [v4 setLaunchViewContainer:0];
}

void *sub_1000141F4(uint64_t a1)
{
  id result = *(void **)(a1 + 32);
  if (result[58] == 3 && *(void *)(a1 + 40) == 1) {
    return [result handleInterruptionEnded];
  }
  return result;
}

id sub_10001458C(uint64_t a1)
{
  id result = +[AVTUIControllerPresentation setPendingGlobalPresentation:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 608) = 0;
  return result;
}

void sub_100014DFC(uint64_t a1)
{
  CFStringRef v2 = [*(id *)(a1 + 32) parentMessagesViewController];
  CFStringRef v3 = [v2 launchViewContainer];
  [v3 setAlpha:1.0];

  id v5 = [*(id *)(a1 + 32) parentMessagesViewController];
  id v4 = [v5 messagesViewContainer];
  [v4 setAlpha:1.0];
}

id sub_100014E94(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateEditButtonVisibilityForceHide:1];
}

id sub_100014EA0(uint64_t a1)
{
  [*(id *)(a1 + 32) updateTapToRadarVisibilityForceHide:0];
  CFStringRef v2 = *(void **)(a1 + 32);

  return [v2 updateEditButtonVisibilityForceHide:0];
}

id sub_100014EE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateEditButtonVisibilityForceHide:1];
}

id sub_100014EF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateEditButtonVisibilityForceHide:1];
}

id sub_100014EFC(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateEditButtonVisibilityForceHide:1];
}

void sub_1000153CC(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] will insert sticker", buf, 2u);
    }
    CFStringRef v3 = [*(id *)(a1 + 32) stickerUsingLargeSticker:1];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 368);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    _DWORD v14[2] = sub_100015600;
    v14[3] = &unk_100034C80;
    v14[4] = v4;
    [v5 insertSticker:v3 completionHandler:v14];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] did insert sticker", buf, 2u);
    }
    if ([*(id *)(a1 + 32) isExpanded]) {
      [*(id *)(a1 + 32) requestPresentationStyle:0];
    }
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 32) focusedRecord];
    [*(id *)(*(void *)(a1 + 32) + 616) didSendImageWithAvatar:v6];
    id v7 = +[NSUserDefaults standardUserDefaults];
    unsigned int v8 = [v7 BOOLForKey:@"JFDefaults_SaveStickersToCameraRoll"];

    if (v8)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000156E8;
      v11[3] = &unk_100034CF8;
      id v9 = v3;
      uint64_t v10 = *(void *)(a1 + 32);
      id v12 = v9;
      uint64_t v13 = v10;
      +[PHPhotoLibrary requestAuthorization:v11];
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 385) = 0;
  }
}

void sub_100015600(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 504), a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v4 localizedDescription];
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] insertSticker failed: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_1000156E8(uint64_t a1, uint64_t a2)
{
  if (a2 == 3)
  {
    uint64_t v10 = v2;
    uint64_t v11 = v3;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    _DWORD v7[2] = sub_100015788;
    v7[3] = &unk_100034AF0;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v8 = v5;
    uint64_t v9 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

void sub_100015788(uint64_t a1)
{
  uint64_t v2 = +[PHPhotoLibrary sharedPhotoLibrary];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001587C;
  v4[3] = &unk_100034790;
  id v5 = *(id *)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000158E0;
  v3[3] = &unk_100034CD0;
  void v3[4] = *(void *)(a1 + 40);
  [v2 performChanges:v4 completionHandler:v3];
}

void sub_10001587C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) imageFileURL];
  id v1 = +[PHAssetChangeRequest creationRequestForAssetFromImageAtFileURL:v2];
}

void sub_1000158E0(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015984;
  block[3] = &unk_100034CA8;
  char v11 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100015984(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = @"Successfully saved sticker to photo library";
  }
  else
  {
    id v2 = +[NSString stringWithFormat:@"Saving sticker failed: %@", *(void *)(a1 + 32)];
  }
  if (!*(unsigned char *)(a1 + 48) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    char v11 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] saveStickerToCameraRoll failed: %@", buf, 0xCu);
  }
  +[UIAlertController alertControllerWithTitle:@"Camera Roll" message:v2 preferredStyle:1];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015B7C;
  v8[3] = &unk_100034998;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v9;
  id v4 = +[UIAlertAction actionWithTitle:@"Close" style:0 handler:v8];
  [v3 addAction:v4];

  [v3 _setShouldAlignToKeyboard:0];
  id v5 = [*(id *)(a1 + 40) view];
  uint64_t v6 = [v5 window];
  id v7 = [v6 rootViewController];
  [v7 presentViewController:v3 animated:0 completion:0];
}

id sub_100015B7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_100016234(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if ([*(id *)(a1 + 32) state] == (id)2 || objc_msgSend(*(id *)(a1 + 32), "state") == (id)1)
  {
    id v2 = *(void **)(a1 + 40);
    v7[0] = v2[36];
    v7[1] = v2[28];
    id v3 = +[NSArray arrayWithObjects:v7 count:2];
    uint64_t v4 = [v2 setRestorableValue:&__kCFBooleanTrue forKeyPath:@"hidden" onViews:v3];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(v5 + 192);
    *(void *)(v5 + 192) = v4;
  }
}

id sub_10001633C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  [WeakRetained setAlpha:1.0];

  id v3 = *(void **)(a1 + 40);

  return [v3 setAlpha:0.0];
}

id sub_100016398(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) setHidden:0];
  id v2 = *(void **)(a1 + 40);

  return [v2 removeFromSuperview];
}

id sub_1000168FC(uint64_t a1)
{
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 320) = CFAbsoluteTimeGetCurrent()
                                                    - *(double *)(*(void *)(a1 + 32) + 312);
  id v2 = *(void **)(a1 + 32);

  return [v2 updateRecordingTime];
}

void sub_100017014(uint64_t a1)
{
  CGAffineTransformMakeScale(&v4, 1.2, 1.2);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) view];
  CGAffineTransform v3 = v4;
  [v2 setTransform:&v3];
}

void sub_1000172EC(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 32) view];
  long long v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v3[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v3[1] = v2;
  v3[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v1 setTransform:v3];
}

void sub_100017350(uint64_t a1, uint64_t a2)
{
  if (a2 == 3)
  {
    block[5] = v2;
    block[6] = v3;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000173D4;
    block[3] = &unk_100034790;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_1000173D4(uint64_t a1)
{
  uint64_t v2 = +[PHPhotoLibrary sharedPhotoLibrary];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000174AC;
  v4[3] = &unk_100034790;
  uint64_t v5 = *(void *)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100017528;
  _OWORD v3[3] = &unk_100034CD0;
  void v3[4] = v5;
  [v2 performChanges:v4 completionHandler:v3];
}

void sub_1000174AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  id v1 = [WeakRetained faceTrackingRecordingURL];
  id v2 = +[PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:v1];
}

void sub_100017528(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000175CC;
  block[3] = &unk_100034CA8;
  char v11 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1000175CC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = @"Successfully saved video to photo library";
  }
  else
  {
    id v2 = +[NSString stringWithFormat:@"Saving video failed: %@", *(void *)(a1 + 32)];
  }
  +[UIAlertController alertControllerWithTitle:@"Camera Roll" message:v2 preferredStyle:1];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100017744;
  v8[3] = &unk_100034998;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v9;
  CGAffineTransform v4 = +[UIAlertAction actionWithTitle:@"Close" style:0 handler:v8];
  [v3 addAction:v4];

  [v3 _setShouldAlignToKeyboard:0];
  id v5 = [*(id *)(a1 + 40) view];
  uint64_t v6 = [v5 window];
  id v7 = [v6 rootViewController];
  [v7 presentViewController:v3 animated:0 completion:0];
}

id sub_100017744(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

uint64_t sub_100017CFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100017DA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id sub_100017E48(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_100017F60(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
}

id sub_100018038(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
}

id sub_100018124(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) setText:*(void *)(a1 + 40)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 408);

  return [v2 layoutIfNeeded];
}

void sub_1000183B0(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v6 = a2;
  id v5 = [v6 valueForKeyPath:v4];
  [v3 addObject:v5];

  [v6 setValue:a1[6] forKeyPath:a1[5]];
}

void sub_10001842C(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000184CC;
  _OWORD v3[3] = &unk_100034DE8;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 enumerateObjectsUsingBlock:v3];
}

void sub_1000184CC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectAtIndexedSubscript:a3];
  [v6 setValue:v7 forKeyPath:*(void *)(a1 + 40)];
}

void sub_100018648(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    unsigned int v3 = [WeakRetained faceIsTracked];
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    v16[0] = 67109376;
    v16[1] = v3;
    __int16 v17 = 1024;
    unsigned int v18 = [v4 faceIsFullyActive];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] observeValueForKeyPath faceIsTracked %i; faceIsFullyActive %i",
      (uint8_t *)v16,
      0xEu);
  }
  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  unsigned int v6 = [v5 faceIsTracked];

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] observeValueForKeyPath -> _puppetView.faceIsTracked", (uint8_t *)v16, 2u);
    }
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    if ([v7 faceIsFullyActive])
    {
      int v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 649);

      if (!v8)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] Tracking started", (uint8_t *)v16, 2u);
        }
        [*(id *)(*(void *)(a1 + 32) + 288) setEnabled:1];
        [*(id *)(*(void *)(a1 + 32) + 416) invalidate];
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void **)(v9 + 416);
        *(void *)(v9 + 416) = 0;

        [*(id *)(*(void *)(a1 + 32) + 424) invalidate];
        uint64_t v11 = *(void *)(a1 + 32);
        id v12 = *(void **)(v11 + 424);
        *(void *)(v11 + 424) = 0;

        *(void *)(*(void *)(a1 + 32) + 464) = 4;
        [*(id *)(a1 + 32) resumeFaceTrackingIfNecessary];
      }
    }
    else
    {
    }
  }
  else
  {
    uint64_t v13 = +[NSUserDefaults standardUserDefaults];
    if ([v13 BOOLForKey:@"JFDefaults_NeverDisableRecordButton"])
    {
    }
    else
    {
      int v14 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 304);

      if (!v14) {
        [*(id *)(*(void *)(a1 + 32) + 288) setEnabled:0];
      }
    }
    uint64_t v15 = *(void *)(a1 + 32);
    if (*(void *)(v15 + 464) != 2)
    {
      *(void *)(v15 + 464) = 1;
      [*(id *)(a1 + 32) startTrackingLostTimer];
    }
  }
}

void sub_1000189F0(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 440) = 0;
  [*(id *)(a1 + 32) changeUserInfoLabelForTrackingState];
  [*(id *)(*(void *)(a1 + 32) + 416) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  unsigned int v3 = *(void **)(v2 + 416);
  *(void *)(v2 + 416) = 0;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_100018ACC;
  v7[3] = &unk_100034D70;
  void v7[4] = *(void *)(a1 + 32);
  uint64_t v4 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v7 block:1.0];
  uint64_t v5 = *(void *)(a1 + 32);
  unsigned int v6 = *(void **)(v5 + 416);
  *(void *)(v5 + 416) = v4;
}

void sub_100018ACC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void *)(v4 + 440);
  if (v5 <= 0x1D)
  {
    *(void *)(v4 + 440) = v5 + 1;
    unsigned int v6 = *(void **)(a1 + 32);
    if (v6[55] == 30 && !v6[57])
    {
      id v9 = v3;
      id v7 = +[NSBundle mainBundle];
      int v8 = [v7 localizedStringForKey:@"sJFTrackingPausedMessage" value:&stru_100035088 table:@"JFStrings"];
      [v6 pauseFaceTrackingWithReason:v8];

      id v3 = v9;
    }
  }
}

void sub_100018CC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void *)(v4 + 448);
  if (v5 <= 0x1D)
  {
    *(void *)(v4 + 448) = v5 + 1;
    unsigned int v6 = *(void **)(a1 + 32);
    uint64_t v7 = v6[56];
    if (v7 == *(void *)(a1 + 40))
    {
      id v10 = v3;
      [v6 updateARSessionStateResettingState:0];
      [*(id *)(a1 + 32) changeUserInfoLabelForTrackingState];
      id v3 = v10;
      unsigned int v6 = *(void **)(a1 + 32);
      uint64_t v7 = v6[56];
    }
    if (v7 == 30 && !v6[57])
    {
      id v11 = v3;
      int v8 = +[NSBundle mainBundle];
      id v9 = [v8 localizedStringForKey:@"sJFTrackingPausedMessage" value:&stru_100035088 table:@"JFStrings"];
      [v6 pauseFaceTrackingWithReason:v9];

      id v3 = v11;
    }
  }
}

void sub_1000195D0(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(void *)(v5 + 464))
  {
    if ((unint64_t)(*(void *)(v5 + 376) - 3) <= 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v5 + 144));
      unsigned int v7 = [WeakRetained captureImageIsTooDark];

      if (v7)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] showUserInfoLabelWithText:USER_INFO_LOW_LIGHT", buf, 2u);
        }
        int v8 = *(void **)(a1 + 32);
        id v9 = +[NSBundle mainBundle];
        id v10 = v9;
        CFStringRef v11 = @"sJFLowLight";
LABEL_11:
        int v14 = [v9 localizedStringForKey:v11 value:&stru_100035088 table:@"JFStrings"];
        [v8 showUserInfoLabelWithText:v14];

LABEL_20:
        goto LABEL_25;
      }
      id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
      int v13 = [v12 isSensorCovered];

      if (v13)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] showUserInfoLabelWithText:USER_INFO_CAMERA_COVERED", v25, 2u);
        }
        int v8 = *(void **)(a1 + 32);
        id v9 = +[NSBundle mainBundle];
        id v10 = v9;
        CFStringRef v11 = @"sJFCameraCovered";
        goto LABEL_11;
      }
      uint64_t v5 = *(void *)(a1 + 32);
    }
    id v10 = objc_loadWeakRetained((id *)(v5 + 144));
    unsigned int v15 = [v10 captureImageIsTooDark];
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 408) text];
      __int16 v17 = +[NSBundle mainBundle];
      uint64_t v2 = [v17 localizedStringForKey:@"sJFLowLight" value:&stru_100035088 table:@"JFStrings"];
      if ([v16 isEqualToString:v2])
      {

        goto LABEL_24;
      }
      v23 = v17;
      v24 = v16;
    }
    id v18 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    if ([v18 isSensorCovered])
    {

      if (!v15)
      {
      }
      goto LABEL_20;
    }
    id v19 = [*(id *)(*(void *)(a1 + 32) + 408) text];
    uint64_t v20 = +[NSBundle mainBundle];
    char v21 = [v20 localizedStringForKey:@"sJFCameraCovered" value:&stru_100035088 table:@"JFStrings"];
    unsigned __int8 v22 = [v19 isEqualToString:v21];

    if ((v15 & 1) == 0)
    {
    }
    if (v22) {
LABEL_24:
    }
      [*(id *)(a1 + 32) hideUserInfoLabel];
  }
LABEL_25:
}

void sub_100019F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100019F38(uint64_t a1, void *a2)
{
  CGFloat v3 = *(double *)(*(void *)(a1 + 32) + 560);
  CGFloat v4 = *(double *)(*(void *)(a1 + 32) + 568);
  id v5 = a2;
  v14.width = v3;
  v14.height = v4;
  UIGraphicsBeginImageContextWithOptions(v14, 1, 0.0);
  unsigned int v6 = [*(id *)(a1 + 32) view];
  unsigned int v7 = [v6 backgroundColor];
  int v8 = [*(id *)(a1 + 32) traitCollection];
  id v9 = [v7 resolvedColorWithTraitCollection:v8];
  [v9 setFill];

  UIRectFill(*(CGRect *)(*(void *)(a1 + 32) + 544));
  [v5 drawViewHierarchyInRect:1 afterScreenUpdates:[*(double *)(*(void *)(a1 + 32) + 576), *(double *)(*(void *)(a1 + 32) + 584), *(double *)(*(void *)(a1 + 32) + 592), *(double *)(*(void *)(a1 + 32) + 600)]];

  uint64_t v10 = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  UIGraphicsEndImageContext();
}

void sub_10001A1F8(uint64_t a1, void *a2)
{
  CGFloat v3 = *(void **)(*(void *)(a1 + 32) + 368);
  CGFloat v4 = [a2 URL];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001A2AC;
  v5[3] = &unk_100034C80;
  void v5[4] = *(void *)(a1 + 32);
  [v3 insertAttachment:v4 withAlternateFilename:0 completionHandler:v5];
}

id sub_10001A2AC(uint64_t a1)
{
  [*(id *)(a1 + 32) requestPresentationStyle:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 dismissViewControllerAnimated:1 completion:0];
}

void sub_10001CCD0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) needsLandscapeOverlayUpdate])
  {
    if ([*(id *)(a1 + 32) isLandscapeMode])
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10001CDE4;
      v6[3] = &unk_100034790;
      v6[4] = *(void *)(a1 + 32);
      +[UIView performWithoutAnimation:v6];
      uint64_t v2 = [*(id *)(a1 + 32) landscapeTrapOverlay];
      CGFloat v3 = [v2 label];
      [v3 setAlpha:1.0];
    }
    else
    {
      id v5 = [*(id *)(a1 + 32) landscapeTrapOverlay];
      CGFloat v4 = [v5 label];
      [v4 setAlpha:0.0];
    }
  }
}

void sub_10001CDE4(uint64_t a1)
{
  [*(id *)(a1 + 32) updateLandscapeOverlayImmediately];
  id v3 = [*(id *)(a1 + 32) landscapeTrapOverlay];
  uint64_t v2 = [v3 label];
  [v2 setAlpha:0.0];
}

id sub_10001CE50(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLandscapeOverlayImmediately];
}

void sub_10001D3AC(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if ([WeakRetained snapshottingEnabledUpdateIdentifier] == a1[6])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = a1[4];
      int v4 = 138412290;
      id v5 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[BaseAnimoji] updating snapshottingEnabled applying futureValue: %@", (uint8_t *)&v4, 0xCu);
    }
    [WeakRetained setSnapshottingEnabled:[a1[4] BOOLValue]];
  }
}

void sub_10001E4D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001E4F4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained layoutMonitorDidUpdateDisplayLayout:v7 withContext:v6];
}

void sub_10001E7EC(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (v2 != [*(id *)(a1 + 32) strongPopoverCurrentlyPresented])
  {
    [*(id *)(a1 + 32) setStrongPopoverCurrentlyPresented:*(unsigned __int8 *)(a1 + 40)];
    CFStringRef v6 = @"BaseMessagesViewControllerStrongPopupPresentedKey";
    id v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    id v7 = v3;
    int v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:@"BaseMessagesViewControllerStrongPopupPresentationNotification" object:*(void *)(a1 + 32) userInfo:v4];
  }
}

void sub_10001EF80(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) launchController];
  id v1 = [v3 view];
  int v2 = [v1 superview];
  [v2 setAlpha:0.0];
}

uint64_t sub_10001EFF0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100020130(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) center];
  double v4 = v3;
  double v6 = v5;
  id v7 = [*(id *)(a1 + 40) superview];
  [v2 convertPoint:v7 fromView:v4];
  double v9 = v8;
  double v11 = v10;

  id v12 = [*(id *)(a1 + 48) layer];
  [v12 removeAnimationForKey:@"bounce-up-transform"];

  int v13 = *(void **)(a1 + 48);
  long long v14 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v16[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v16[1] = v14;
  _DWORD v16[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v13 setTransform:v16];
  [*(id *)(a1 + 48) _setContinuousCornerRadius:0.0];
  [*(id *)(a1 + 40) attachVideoController:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
  [*(id *)(a1 + 64) addSubview:*(void *)(a1 + 72)];
  [*(id *)(a1 + 40) setCenter:v9, v11];
  [*(id *)(a1 + 80) removeFromSuperview];
  [*(id *)(a1 + 88) removeFromSuperview];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 104) + 16))();
}

uint64_t ARKitBuildVersionString()
{
  return _ARKitBuildVersionString();
}

uint64_t AVTAvatarEditorSplashVideo()
{
  return _AVTAvatarEditorSplashVideo();
}

uint64_t AVTAvatarUIBundle()
{
  return _AVTAvatarUIBundle();
}

uint64_t AVTDeviceIsGreenTea()
{
  return _AVTDeviceIsGreenTea();
}

uint64_t AVTUIForceCameraDisclosures_once()
{
  return _AVTUIForceCameraDisclosures_once();
}

uint64_t AVTUIHasDisplayedAnimojiSplashScreen()
{
  return _AVTUIHasDisplayedAnimojiSplashScreen();
}

uint64_t AVTUIHasDisplayedCameraDisclosureSplashScreen()
{
  return _AVTUIHasDisplayedCameraDisclosureSplashScreen();
}

uint64_t AVTUIHasDisplayedPaddleView()
{
  return _AVTUIHasDisplayedPaddleView();
}

uint64_t AVTUIMemojiClassicShowDisclosureWarning_once()
{
  return _AVTUIMemojiClassicShowDisclosureWarning_once();
}

uint64_t AVTUISetHasDisplayedAnimojiCameraDisclosureSplashScreen()
{
  return _AVTUISetHasDisplayedAnimojiCameraDisclosureSplashScreen();
}

uint64_t AVTUISetHasDisplayedAnimojiSplashScreen()
{
  return _AVTUISetHasDisplayedAnimojiSplashScreen();
}

uint64_t AVTUISetHasDisplayedPaddleView()
{
  return _AVTUISetHasDisplayedPaddleView();
}

uint64_t AVTUISetHasDisplayedSplashScreen()
{
  return _AVTUISetHasDisplayedSplashScreen();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return _CATransform3DConcat(retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DMakeTranslation(retstr, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformEqualToTransform(t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return _CMTimeMakeWithSeconds(retstr, seconds, preferredTimescale);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return _CMTimeRangeFromTimeToTime(retstr, start, end);
}

uint64_t CTFontDescriptorCreateWithTextStyle()
{
  return _CTFontDescriptorCreateWithTextStyle();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return _NSStringFromUIEdgeInsets(insets);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t UIAccessibilityAddMetadataDescriptionToVideo()
{
  return _UIAccessibilityAddMetadataDescriptionToVideo();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void UIRectFill(CGRect rect)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__configure(void *a1, const char *a2, ...)
{
  return [a1 _configure];
}

id objc_msgSend__detentValues(void *a1, const char *a2, ...)
{
  return [a1 _detentValues];
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return [a1 _referenceBounds];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return [a1 _rootSheetPresentationController];
}

id objc_msgSend__screen(void *a1, const char *a2, ...)
{
  return [a1 _screen];
}

id objc_msgSend_accessoryButtonContentInsets(void *a1, const char *a2, ...)
{
  return [a1 accessoryButtonContentInsets];
}

id objc_msgSend_actualPresentationStyle(void *a1, const char *a2, ...)
{
  return [a1 actualPresentationStyle];
}

id objc_msgSend_addInternalARSessionObserverIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 addInternalARSessionObserverIfNecessary];
}

id objc_msgSend_addPuppetCollectionViewControllerInNecessary(void *a1, const char *a2, ...)
{
  return [a1 addPuppetCollectionViewControllerInNecessary];
}

id objc_msgSend_afterExportMovie(void *a1, const char *a2, ...)
{
  return [a1 afterExportMovie];
}

id objc_msgSend_allowsCreate(void *a1, const char *a2, ...)
{
  return [a1 allowsCreate];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_appBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 appBackgroundColor];
}

id objc_msgSend_arSession(void *a1, const char *a2, ...)
{
  return [a1 arSession];
}

id objc_msgSend_areAnimationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 areAnimationsEnabled];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asyncPuppetThumbnailHandler(void *a1, const char *a2, ...)
{
  return [a1 asyncPuppetThumbnailHandler];
}

id objc_msgSend_automaticallyDisplaysLandscapeRotationOverlay(void *a1, const char *a2, ...)
{
  return [a1 automaticallyDisplaysLandscapeRotationOverlay];
}

id objc_msgSend_avatarDataSource(void *a1, const char *a2, ...)
{
  return [a1 avatarDataSource];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_baseMessagesViewController(void *a1, const char *a2, ...)
{
  return [a1 baseMessagesViewController];
}

id objc_msgSend_beforeExportMovie(void *a1, const char *a2, ...)
{
  return [a1 beforeExportMovie];
}

id objc_msgSend_beginObservingFaceTrackingIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 beginObservingFaceTrackingIfNecessary];
}

id objc_msgSend_blueButton(void *a1, const char *a2, ...)
{
  return [a1 blueButton];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_borderView(void *a1, const char *a2, ...)
{
  return [a1 borderView];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_buttonFont(void *a1, const char *a2, ...)
{
  return [a1 buttonFont];
}

id objc_msgSend_buttonFrame(void *a1, const char *a2, ...)
{
  return [a1 buttonFrame];
}

id objc_msgSend_canCreateAvatar(void *a1, const char *a2, ...)
{
  return [a1 canCreateAvatar];
}

id objc_msgSend_canPeelSticker(void *a1, const char *a2, ...)
{
  return [a1 canPeelSticker];
}

id objc_msgSend_canTakeSendingAction(void *a1, const char *a2, ...)
{
  return [a1 canTakeSendingAction];
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return [a1 cancelButton];
}

id objc_msgSend_cancelMovieExport(void *a1, const char *a2, ...)
{
  return [a1 cancelMovieExport];
}

id objc_msgSend_cancelRecording(void *a1, const char *a2, ...)
{
  return [a1 cancelRecording];
}

id objc_msgSend_captureImageIsTooDark(void *a1, const char *a2, ...)
{
  return [a1 captureImageIsTooDark];
}

id objc_msgSend_captureSnapshotMetricsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 captureSnapshotMetricsIfNeeded];
}

id objc_msgSend_carouselHeight(void *a1, const char *a2, ...)
{
  return [a1 carouselHeight];
}

id objc_msgSend_cellContentPadding(void *a1, const char *a2, ...)
{
  return [a1 cellContentPadding];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_changeUserInfoLabelForTrackingState(void *a1, const char *a2, ...)
{
  return [a1 changeUserInfoLabelForTrackingState];
}

id objc_msgSend_checkLightingAndObscuredSensorAfterTrackingLost(void *a1, const char *a2, ...)
{
  return [a1 checkLightingAndObscuredSensorAfterTrackingLost];
}

id objc_msgSend_checkLightingAndObscuredSensorWhileTracking(void *a1, const char *a2, ...)
{
  return [a1 checkLightingAndObscuredSensorWhileTracking];
}

id objc_msgSend_childConstraints(void *a1, const char *a2, ...)
{
  return [a1 childConstraints];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return [a1 childViewControllers];
}

id objc_msgSend_cleanUpOnExit(void *a1, const char *a2, ...)
{
  return [a1 cleanUpOnExit];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_collectionViewLayout(void *a1, const char *a2, ...)
{
  return [a1 collectionViewLayout];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return [a1 constraints];
}

id objc_msgSend_contentContainerView(void *a1, const char *a2, ...)
{
  return [a1 contentContainerView];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return [a1 controller];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentControllerPresentation(void *a1, const char *a2, ...)
{
  return [a1 currentControllerPresentation];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLayout(void *a1, const char *a2, ...)
{
  return [a1 currentLayout];
}

id objc_msgSend_currentOrientation(void *a1, const char *a2, ...)
{
  return [a1 currentOrientation];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return [a1 currentSession];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultVideoExportDimensions(void *a1, const char *a2, ...)
{
  return [a1 defaultVideoExportDimensions];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_destinationViewController(void *a1, const char *a2, ...)
{
  return [a1 destinationViewController];
}

id objc_msgSend_detachVideoController(void *a1, const char *a2, ...)
{
  return [a1 detachVideoController];
}

id objc_msgSend_didPauseFaceTracking(void *a1, const char *a2, ...)
{
  return [a1 didPauseFaceTracking];
}

id objc_msgSend_didRecordVideo(void *a1, const char *a2, ...)
{
  return [a1 didRecordVideo];
}

id objc_msgSend_didReplayVideo(void *a1, const char *a2, ...)
{
  return [a1 didReplayVideo];
}

id objc_msgSend_didResumeFaceTracking(void *a1, const char *a2, ...)
{
  return [a1 didResumeFaceTracking];
}

id objc_msgSend_didShowExpandedMode(void *a1, const char *a2, ...)
{
  return [a1 didShowExpandedMode];
}

id objc_msgSend_disableIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 disableIdleTimer];
}

id objc_msgSend_discardRecording(void *a1, const char *a2, ...)
{
  return [a1 discardRecording];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_dismissPaddleViewIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 dismissPaddleViewIfNecessary];
}

id objc_msgSend_displayLayoutMonitor(void *a1, const char *a2, ...)
{
  return [a1 displayLayoutMonitor];
}

id objc_msgSend_displaysLaunchScreen(void *a1, const char *a2, ...)
{
  return [a1 displaysLaunchScreen];
}

id objc_msgSend_dotView(void *a1, const char *a2, ...)
{
  return [a1 dotView];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_edgeMargin(void *a1, const char *a2, ...)
{
  return [a1 edgeMargin];
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserInterfaceLayoutDirection];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_emptySnapshotImage(void *a1, const char *a2, ...)
{
  return [a1 emptySnapshotImage];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_endObservingFaceTrackingIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 endObservingFaceTrackingIfNecessary];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_faceIsFullyActive(void *a1, const char *a2, ...)
{
  return [a1 faceIsFullyActive];
}

id objc_msgSend_faceIsTracked(void *a1, const char *a2, ...)
{
  return [a1 faceIsTracked];
}

id objc_msgSend_faceTrackingIsPaused(void *a1, const char *a2, ...)
{
  return [a1 faceTrackingIsPaused];
}

id objc_msgSend_faceTrackingRecordingURL(void *a1, const char *a2, ...)
{
  return [a1 faceTrackingRecordingURL];
}

id objc_msgSend_focusedRecord(void *a1, const char *a2, ...)
{
  return [a1 focusedRecord];
}

id objc_msgSend_focusedRecordingView(void *a1, const char *a2, ...)
{
  return [a1 focusedRecordingView];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_freezeLayout(void *a1, const char *a2, ...)
{
  return [a1 freezeLayout];
}

id objc_msgSend_fromValue(void *a1, const char *a2, ...)
{
  return [a1 fromValue];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return [a1 grayColor];
}

id objc_msgSend_gridThumbnailScope(void *a1, const char *a2, ...)
{
  return [a1 gridThumbnailScope];
}

id objc_msgSend_handleInterruptionEnded(void *a1, const char *a2, ...)
{
  return [a1 handleInterruptionEnded];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_hideUserInfoLabel(void *a1, const char *a2, ...)
{
  return [a1 hideUserInfoLabel];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 horizontalSizeClass];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageButton(void *a1, const char *a2, ...)
{
  return [a1 imageButton];
}

id objc_msgSend_imageButtonHandlerBlock(void *a1, const char *a2, ...)
{
  return [a1 imageButtonHandlerBlock];
}

id objc_msgSend_imageFileURL(void *a1, const char *a2, ...)
{
  return [a1 imageFileURL];
}

id objc_msgSend_imageProvider(void *a1, const char *a2, ...)
{
  return [a1 imageProvider];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateLayout(void *a1, const char *a2, ...)
{
  return [a1 invalidateLayout];
}

id objc_msgSend_isAnimatingHighlight(void *a1, const char *a2, ...)
{
  return [a1 isAnimatingHighlight];
}

id objc_msgSend_isEditable(void *a1, const char *a2, ...)
{
  return [a1 isEditable];
}

id objc_msgSend_isExpanded(void *a1, const char *a2, ...)
{
  return [a1 isExpanded];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_isLandcapeTrapOverlayShown(void *a1, const char *a2, ...)
{
  return [a1 isLandcapeTrapOverlayShown];
}

id objc_msgSend_isLandscapeMode(void *a1, const char *a2, ...)
{
  return [a1 isLandscapeMode];
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return [a1 isLoaded];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isOverlayShown(void *a1, const char *a2, ...)
{
  return [a1 isOverlayShown];
}

id objc_msgSend_isPlayingVideo(void *a1, const char *a2, ...)
{
  return [a1 isPlayingVideo];
}

id objc_msgSend_isPreviewing(void *a1, const char *a2, ...)
{
  return [a1 isPreviewing];
}

id objc_msgSend_isSensorCovered(void *a1, const char *a2, ...)
{
  return [a1 isSensorCovered];
}

id objc_msgSend_isShowingPlusButton(void *a1, const char *a2, ...)
{
  return [a1 isShowingPlusButton];
}

id objc_msgSend_isSpeculatingLayout(void *a1, const char *a2, ...)
{
  return [a1 isSpeculatingLayout];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_landscapeOverlayMessage(void *a1, const char *a2, ...)
{
  return [a1 landscapeOverlayMessage];
}

id objc_msgSend_landscapeTrapOverlay(void *a1, const char *a2, ...)
{
  return [a1 landscapeTrapOverlay];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_launchController(void *a1, const char *a2, ...)
{
  return [a1 launchController];
}

id objc_msgSend_launchTapToRadar(void *a1, const char *a2, ...)
{
  return [a1 launchTapToRadar];
}

id objc_msgSend_launchViewContainer(void *a1, const char *a2, ...)
{
  return [a1 launchViewContainer];
}

id objc_msgSend_launchViewController(void *a1, const char *a2, ...)
{
  return [a1 launchViewController];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_maxSize(void *a1, const char *a2, ...)
{
  return [a1 maxSize];
}

id objc_msgSend_messagesController(void *a1, const char *a2, ...)
{
  return [a1 messagesController];
}

id objc_msgSend_messagesViewContainer(void *a1, const char *a2, ...)
{
  return [a1 messagesViewContainer];
}

id objc_msgSend_modalBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 modalBackgroundColor];
}

id objc_msgSend_modalMessagesController(void *a1, const char *a2, ...)
{
  return [a1 modalMessagesController];
}

id objc_msgSend_needsLandscapeOverlayUpdate(void *a1, const char *a2, ...)
{
  return [a1 needsLandscapeOverlayUpdate];
}

id objc_msgSend_normalizedEdgeInsetsFromDelegate(void *a1, const char *a2, ...)
{
  return [a1 normalizedEdgeInsetsFromDelegate];
}

id objc_msgSend_normalizedHorizontalCellSpaingFromDelegate(void *a1, const char *a2, ...)
{
  return [a1 normalizedHorizontalCellSpaingFromDelegate];
}

id objc_msgSend_numberOfCells(void *a1, const char *a2, ...)
{
  return [a1 numberOfCells];
}

id objc_msgSend_numberOfPrecedingCells(void *a1, const char *a2, ...)
{
  return [a1 numberOfPrecedingCells];
}

id objc_msgSend_numberOfRecords(void *a1, const char *a2, ...)
{
  return [a1 numberOfRecords];
}

id objc_msgSend_overlayMessageBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 overlayMessageBackgroundColor];
}

id objc_msgSend_overlayMessageTextColor(void *a1, const char *a2, ...)
{
  return [a1 overlayMessageTextColor];
}

id objc_msgSend_paddleView(void *a1, const char *a2, ...)
{
  return [a1 paddleView];
}

id objc_msgSend_parentMessagesViewController(void *a1, const char *a2, ...)
{
  return [a1 parentMessagesViewController];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_pauseVideo(void *a1, const char *a2, ...)
{
  return [a1 pauseVideo];
}

id objc_msgSend_pendingChildViewController(void *a1, const char *a2, ...)
{
  return [a1 pendingChildViewController];
}

id objc_msgSend_pendingGlobalPresentation(void *a1, const char *a2, ...)
{
  return [a1 pendingGlobalPresentation];
}

id objc_msgSend_pendingHighlightBounceAnimation(void *a1, const char *a2, ...)
{
  return [a1 pendingHighlightBounceAnimation];
}

id objc_msgSend_pendingSelectionAnimation(void *a1, const char *a2, ...)
{
  return [a1 pendingSelectionAnimation];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_playPreviewOnce(void *a1, const char *a2, ...)
{
  return [a1 playPreviewOnce];
}

id objc_msgSend_playVideo(void *a1, const char *a2, ...)
{
  return [a1 playVideo];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return [a1 player];
}

id objc_msgSend_plusButtonCellEnabled(void *a1, const char *a2, ...)
{
  return [a1 plusButtonCellEnabled];
}

id objc_msgSend_plusButtonMaxSizeDimension(void *a1, const char *a2, ...)
{
  return [a1 plusButtonMaxSizeDimension];
}

id objc_msgSend_plusButtonView(void *a1, const char *a2, ...)
{
  return [a1 plusButtonView];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_preparePuppetViewForReuse(void *a1, const char *a2, ...)
{
  return [a1 preparePuppetViewForReuse];
}

id objc_msgSend_presentPaddleView(void *a1, const char *a2, ...)
{
  return [a1 presentPaddleView];
}

id objc_msgSend_presentationContext(void *a1, const char *a2, ...)
{
  return [a1 presentationContext];
}

id objc_msgSend_presentationStyle(void *a1, const char *a2, ...)
{
  return [a1 presentationStyle];
}

id objc_msgSend_presentsLaunchScreenInFullScreenModal(void *a1, const char *a2, ...)
{
  return [a1 presentsLaunchScreenInFullScreenModal];
}

id objc_msgSend_primaryVideoFrame(void *a1, const char *a2, ...)
{
  return [a1 primaryVideoFrame];
}

id objc_msgSend_puppetCellSize(void *a1, const char *a2, ...)
{
  return [a1 puppetCellSize];
}

id objc_msgSend_puppetCollectionView(void *a1, const char *a2, ...)
{
  return [a1 puppetCollectionView];
}

id objc_msgSend_puppetImgView(void *a1, const char *a2, ...)
{
  return [a1 puppetImgView];
}

id objc_msgSend_puppetsPerRow(void *a1, const char *a2, ...)
{
  return [a1 puppetsPerRow];
}

id objc_msgSend_recordStore(void *a1, const char *a2, ...)
{
  return [a1 recordStore];
}

id objc_msgSend_recordingWillStart(void *a1, const char *a2, ...)
{
  return [a1 recordingWillStart];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reloadSelection(void *a1, const char *a2, ...)
{
  return [a1 reloadSelection];
}

id objc_msgSend_removeAllGestureRecognizers(void *a1, const char *a2, ...)
{
  return [a1 removeAllGestureRecognizers];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_removeInternalARSessionObserverIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 removeInternalARSessionObserverIfNecessary];
}

id objc_msgSend_removePuppetCollectionViewControllerIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 removePuppetCollectionViewControllerIfNecessary];
}

id objc_msgSend_requestsExpandedOnLaunchScreenDismissal(void *a1, const char *a2, ...)
{
  return [a1 requestsExpandedOnLaunchScreenDismissal];
}

id objc_msgSend_restoreIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 restoreIdleTimer];
}

id objc_msgSend_resumeFaceTrackingIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 resumeFaceTrackingIfNecessary];
}

id objc_msgSend_retargetableSpringBehavior(void *a1, const char *a2, ...)
{
  return [a1 retargetableSpringBehavior];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scrollToSelection(void *a1, const char *a2, ...)
{
  return [a1 scrollToSelection];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_secondaryVideoFrame(void *a1, const char *a2, ...)
{
  return [a1 secondaryVideoFrame];
}

id objc_msgSend_selectedBorderColor(void *a1, const char *a2, ...)
{
  return [a1 selectedBorderColor];
}

id objc_msgSend_selectedRecord(void *a1, const char *a2, ...)
{
  return [a1 selectedRecord];
}

id objc_msgSend_selectedRowIndex(void *a1, const char *a2, ...)
{
  return [a1 selectedRowIndex];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setupDisplayLayoutMonitor(void *a1, const char *a2, ...)
{
  return [a1 setupDisplayLayoutMonitor];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 sharedPhotoLibrary];
}

id objc_msgSend_shouldPresentPaddleView(void *a1, const char *a2, ...)
{
  return [a1 shouldPresentPaddleView];
}

id objc_msgSend_shouldShowDisclosureAlertForSendingMessage(void *a1, const char *a2, ...)
{
  return [a1 shouldShowDisclosureAlertForSendingMessage];
}

id objc_msgSend_shouldShowLaunchScreen(void *a1, const char *a2, ...)
{
  return [a1 shouldShowLaunchScreen];
}

id objc_msgSend_shouldZoomWhileRecording(void *a1, const char *a2, ...)
{
  return [a1 shouldZoomWhileRecording];
}

id objc_msgSend_showFileRadarWarningPopup(void *a1, const char *a2, ...)
{
  return [a1 showFileRadarWarningPopup];
}

id objc_msgSend_showsPlusButton(void *a1, const char *a2, ...)
{
  return [a1 showsPlusButton];
}

id objc_msgSend_singleAvatarMode(void *a1, const char *a2, ...)
{
  return [a1 singleAvatarMode];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return [a1 snapshot];
}

id objc_msgSend_snapshottingEnabled(void *a1, const char *a2, ...)
{
  return [a1 snapshottingEnabled];
}

id objc_msgSend_snapshottingEnabledUpdateIdentifier(void *a1, const char *a2, ...)
{
  return [a1 snapshottingEnabledUpdateIdentifier];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startObservingBaseMessagesNotifications(void *a1, const char *a2, ...)
{
  return [a1 startObservingBaseMessagesNotifications];
}

id objc_msgSend_startPlayingVideos(void *a1, const char *a2, ...)
{
  return [a1 startPlayingVideos];
}

id objc_msgSend_startRecording(void *a1, const char *a2, ...)
{
  return [a1 startRecording];
}

id objc_msgSend_startTrackingLostTimer(void *a1, const char *a2, ...)
{
  return [a1 startTrackingLostTimer];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stopObservingBaseMessagesNotifications(void *a1, const char *a2, ...)
{
  return [a1 stopObservingBaseMessagesNotifications];
}

id objc_msgSend_stopPlayingVideos(void *a1, const char *a2, ...)
{
  return [a1 stopPlayingVideos];
}

id objc_msgSend_stopPreviewing(void *a1, const char *a2, ...)
{
  return [a1 stopPreviewing];
}

id objc_msgSend_stopRecording(void *a1, const char *a2, ...)
{
  return [a1 stopRecording];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_strongPopoverCurrentlyPresented(void *a1, const char *a2, ...)
{
  return [a1 strongPopoverCurrentlyPresented];
}

id objc_msgSend_subTitleFont(void *a1, const char *a2, ...)
{
  return [a1 subTitleFont];
}

id objc_msgSend_subTitleFrame(void *a1, const char *a2, ...)
{
  return [a1 subTitleFrame];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_suspendAutoScrolling(void *a1, const char *a2, ...)
{
  return [a1 suspendAutoScrolling];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 temporaryDirectory];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_thumbRequestId(void *a1, const char *a2, ...)
{
  return [a1 thumbRequestId];
}

id objc_msgSend_timerLabel(void *a1, const char *a2, ...)
{
  return [a1 timerLabel];
}

id objc_msgSend_timerLabelFont(void *a1, const char *a2, ...)
{
  return [a1 timerLabelFont];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_titleFont(void *a1, const char *a2, ...)
{
  return [a1 titleFont];
}

id objc_msgSend_titleFrame(void *a1, const char *a2, ...)
{
  return [a1 titleFrame];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_toValue(void *a1, const char *a2, ...)
{
  return [a1 toValue];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trackingLostReason(void *a1, const char *a2, ...)
{
  return [a1 trackingLostReason];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_transitionCompletionBlock(void *a1, const char *a2, ...)
{
  return [a1 transitionCompletionBlock];
}

id objc_msgSend_unconstrainedContentSize(void *a1, const char *a2, ...)
{
  return [a1 unconstrainedContentSize];
}

id objc_msgSend_upateReplayButtonImageForContentSize(void *a1, const char *a2, ...)
{
  return [a1 upateReplayButtonImageForContentSize];
}

id objc_msgSend_updateButtonsImages(void *a1, const char *a2, ...)
{
  return [a1 updateButtonsImages];
}

id objc_msgSend_updateConstraintConstants(void *a1, const char *a2, ...)
{
  return [a1 updateConstraintConstants];
}

id objc_msgSend_updateForNewPuppetView(void *a1, const char *a2, ...)
{
  return [a1 updateForNewPuppetView];
}

id objc_msgSend_updateHiddenSubviewsForAnyOverlays(void *a1, const char *a2, ...)
{
  return [a1 updateHiddenSubviewsForAnyOverlays];
}

id objc_msgSend_updateInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 updateInterfaceOrientation];
}

id objc_msgSend_updateLandscapeOverlayImmediately(void *a1, const char *a2, ...)
{
  return [a1 updateLandscapeOverlayImmediately];
}

id objc_msgSend_updateLayoutForPresentationStyle(void *a1, const char *a2, ...)
{
  return [a1 updateLayoutForPresentationStyle];
}

id objc_msgSend_updatePaddleViewLayoutIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 updatePaddleViewLayoutIfNecessary];
}

id objc_msgSend_updatePuppetCollectionViewIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 updatePuppetCollectionViewIfNecessary];
}

id objc_msgSend_updateRecording(void *a1, const char *a2, ...)
{
  return [a1 updateRecording];
}

id objc_msgSend_updateSelectedForVisibleCells(void *a1, const char *a2, ...)
{
  return [a1 updateSelectedForVisibleCells];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_videoController(void *a1, const char *a2, ...)
{
  return [a1 videoController];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewWillBeObstructed(void *a1, const char *a2, ...)
{
  return [a1 viewWillBeObstructed];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return [a1 visibleCells];
}

id objc_msgSend_waitingOnPresentationStyleRequestFulfillment(void *a1, const char *a2, ...)
{
  return [a1 waitingOnPresentationStyleRequestFulfillment];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_widthExtent(void *a1, const char *a2, ...)
{
  return [a1 widthExtent];
}

id objc_msgSend_widthScaleFactor(void *a1, const char *a2, ...)
{
  return [a1 widthScaleFactor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:atomically:];
}