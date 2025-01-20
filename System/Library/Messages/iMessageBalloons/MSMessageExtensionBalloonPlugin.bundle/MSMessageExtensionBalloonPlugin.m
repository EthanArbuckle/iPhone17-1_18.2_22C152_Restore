id sub_55FC(uint64_t a1)
{
  id result;
  void *v3;
  uint64_t vars8;

  result = [*(id *)(a1 + 32) needsSnapshot];
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 requestSnapshot];
  }
  return result;
}

id sub_5910(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) balloonPlugin];
  v3 = [v2 appBundle];
  [v3 load];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:CKPPTWillConfigureCellWithTranscriptPluginChatItemNotification object:0];

  v5 = *(void **)(a1 + 32);

  return [v5 createRemoteBalloonViewControllerIsResuming:0];
}

void *sub_5C28(void *result, int a2)
{
  if (a2)
  {
    v2 = result;
    [*(id *)(result[4] + 56) needsResize];
    v3 = (void *)v2[4];
    return [v3 _swapOutSnapshotView];
  }
  return result;
}

void sub_613C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_6164(uint64_t a1, void *a2)
{
  id v12 = a2;
  v3 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v4 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = ms_defaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (WeakRetained)
    {
      v7 = [WeakRetained[7] messageGUID];
    }
    else
    {
      v7 = 0;
    }
    v8 = NSStringFromCGSize(*(CGSize *)(a1 + 56));
    *(_DWORD *)buf = 138412546;
    v20 = v7;
    __int16 v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "LiveBubble. Size request timer fired for messageGUID: %@, size constraint: %@", buf, 0x16u);
    if (WeakRetained) {
  }
    }
  v9 = [*(id *)(a1 + 32) _remoteProxy];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_63DC;
  v13[3] = &unk_3CA88;
  long long v17 = *(_OWORD *)(a1 + 56);
  objc_copyWeak(&v16, (id *)(a1 + 48));
  v10 = WeakRetained;
  v14 = v10;
  id v15 = *(id *)(a1 + 40);
  char v18 = *(unsigned char *)(a1 + 80);
  [v9 _requestContentSizeThatFits:v3 presentationStyle:v4 completionHandler:v13];

  v11 = [*(id *)(a1 + 32) sizeUpdater];
  [v11 invalidate];

  [*(id *)(a1 + 32) setSizeUpdater:0];
  objc_destroyWeak(&v16);
}

void sub_63BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_63DC(uint64_t a1, double a2, double a3)
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6540;
  v8[3] = &unk_3CA38;
  v11[1] = *(id *)&a2;
  v11[2] = *(id *)&a3;
  long long v12 = *(_OWORD *)(a1 + 56);
  objc_copyWeak(v11, (id *)(a1 + 48));
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  v4 = objc_retainBlock(v8);
  v5 = v4;
  if (*(unsigned char *)(a1 + 72))
  {
    ((void (*)(void *))v4[2])(v4);
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_67FC;
    v6[3] = &unk_3CA60;
    v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
  objc_destroyWeak(v11);
}

void sub_652C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_6540(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  if (v2 <= 0.0) {
    double v2 = *(double *)(a1 + 72);
  }
  double v3 = *(double *)(a1 + 64);
  if (v3 <= 0.0) {
    double v3 = *(double *)(a1 + 80);
  }
  if (*(double *)(a1 + 72) >= v2) {
    double v4 = v2;
  }
  else {
    double v4 = *(double *)(a1 + 72);
  }
  if (*(double *)(a1 + 80) >= v3) {
    double v5 = v3;
  }
  else {
    double v5 = *(double *)(a1 + 80);
  }
  if (qword_46EF8 != -1) {
    dispatch_once(&qword_46EF8, &stru_3CDE8);
  }
  double v6 = *(double *)&qword_46EF0;
  if (*(double *)&qword_46EF0 == 0.0) {
    double v6 = 1.0;
  }
  double v7 = floor(v4 * v6) / v6;
  double v8 = *(double *)&qword_46EF0;
  if (*(double *)&qword_46EF0 == 0.0) {
    double v8 = 1.0;
  }
  double v9 = floor(v5 * v8) / v8;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setContentSize:", v7, v9);

  id v11 = objc_loadWeakRetained((id *)(a1 + 48));
  long long v12 = [v11 view];
  v13 = [v12 window];

  id v14 = objc_loadWeakRetained((id *)(a1 + 48));
  [v14 setHasLiveViewSize:1];

  id v15 = objc_loadWeakRetained((id *)(a1 + 48));
  [v15 setNeedsResize:0];

  id v16 = ms_defaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    if (v17)
    {
      char v18 = [*(id *)(v17 + 56) messageGUID];
    }
    else
    {
      char v18 = 0;
    }
    v19 = NSStringFromCGSize(*(CGSize *)(a1 + 56));
    v20 = +[NSNumber numberWithBool:v13 != 0];
    int v25 = 138412802;
    v26 = v18;
    __int16 v27 = 2112;
    v28 = v19;
    __int16 v29 = 2112;
    v30 = v20;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "LiveBubble Resizing. Received a sizeThatFits messageGUID: %@,  sizeThatFits %@ shouldResize %@", (uint8_t *)&v25, 0x20u);

    if (v17) {
  }
    }

  if (v13)
  {
    [*(id *)(*(void *)(a1 + 32) + 56) setHasInvalidatedSize:0];
    id v23 = objc_loadWeakRetained((id *)(a1 + 48));
    [v23 setNeedsSnapshot:1];
  }
  v21.n128_f64[0] = v7;
  v22.n128_f64[0] = v9;
  return (*(uint64_t (**)(__n128, __n128))(*(void *)(a1 + 40) + 16))(v21, v22);
}

uint64_t sub_67FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_6B94(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_6C30;
  v6[3] = &unk_3CAD8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_6C30(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    double v2 = +[UIImage ckImageWithData:](UIImage, "ckImageWithData:");
    id v3 = [*(id *)(a1 + 40) snapshotIdentifier];
    [*(id *)(a1 + 40) contentSize];
    double v5 = v4;
    double v7 = v6;
    [v2 size];
    BOOL v9 = vabdd_f64(v5, v8) < 0.00000011920929;
    BOOL v11 = vabdd_f64(v7, v10) < 0.00000011920929 && v9;
    long long v12 = ms_defaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [*(id *)(a1 + 40) payload];
      id v14 = [v13 messageGUID];
      id v15 = +[NSNumber numberWithBool:v11];
      [*(id *)(a1 + 40) contentSize];
      id v16 = NSStringFromCGSize(v29);
      [v2 size];
      uint64_t v17 = NSStringFromCGSize(v30);
      int v19 = 138413314;
      v20 = v14;
      __int16 v21 = 2112;
      __n128 v22 = v2;
      __int16 v23 = 2112;
      v24 = v15;
      __int16 v25 = 2112;
      v26 = v16;
      __int16 v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "LiveBubble. Took snapshot for messageGUID: %@ | image: %@ validSize: %@ contentSize: %@ [snapShotImage size]: %@", (uint8_t *)&v19, 0x34u);
    }
    if (v2 && v3 && v11)
    {
      [*(id *)(a1 + 40) setNeedsSnapshot:0];
      +[CKSnapshotUtilities cacheSnapshot:v2 guid:v3 postChangeNotification:0];
    }
    goto LABEL_13;
  }
  double v2 = ms_defaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    char v18 = [*(id *)(a1 + 40) payload];
    id v3 = [v18 messageGUID];
    int v19 = 138412290;
    v20 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "LiveBubble. Request for snapshot returned nil. messageGUID: %@", (uint8_t *)&v19, 0xCu);

LABEL_13:
  }
}

void sub_83B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = v3;
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_845C;
    v5[3] = &unk_3CAD8;
    v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

void sub_845C(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 40));
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[13];
  id v4 = [v2 loadingView];
  [v4 setAppIcon:v3];
}

id sub_9198(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) needsResize];
}

void sub_92CC(uint64_t a1)
{
  double v2 = +[MSMessageExtensionUtilities isValidMessagePayload:*(void *)(a1 + 32)];
  if (v2)
  {
    uint64_t v3 = ms_defaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_248E8();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) layout];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = *(void **)(a1 + 40);
      id v6 = v4;
      double v7 = [v6 imageTitle];
      double v8 = [v5 substituteNameInString:v7];
      [v6 setImageTitle:v8];

      BOOL v9 = *(void **)(a1 + 40);
      double v10 = [v6 imageSubtitle];
      BOOL v11 = [v9 substituteNameInString:v10];
      [v6 setImageSubtitle:v11];

      long long v12 = *(void **)(a1 + 40);
      v13 = [v6 caption];
      id v14 = [v12 substituteNameInString:v13];
      [v6 setCaption:v14];

      id v15 = *(void **)(a1 + 40);
      id v16 = [v6 subcaption];
      uint64_t v17 = [v15 substituteNameInString:v16];
      [v6 setSubcaption:v17];

      char v18 = *(void **)(a1 + 40);
      int v19 = [v6 trailingCaption];
      v20 = [v18 substituteNameInString:v19];
      [v6 setTrailingCaption:v20];

      __int16 v21 = *(void **)(a1 + 40);
      __n128 v22 = [v6 trailingSubcaption];
      __int16 v23 = [v21 substituteNameInString:v22];
      [v6 setTrailingSubcaption:v23];
    }
    v24 = *(void **)(a1 + 40);
    __int16 v25 = [*(id *)(a1 + 32) summaryText];
    v26 = [v24 substituteNameInString:v25];
    [*(id *)(a1 + 32) setSummaryText:v26];

    __int16 v27 = *(void **)(a1 + 40);
    v28 = [*(id *)(a1 + 32) accessibilityLabel];
    CGSize v29 = [v27 substituteNameInString:v28];
    [*(id *)(a1 + 32) setAccessibilityLabel:v29];

    CGSize v30 = [*(id *)(a1 + 40) _itemPayloadFromMSMessage:*(void *)(a1 + 32)];
    if (v30)
    {
      id v31 = [*(id *)(a1 + 40) hasEntitlement:@"com.apple.messages.private.BypassShelfAccess"];
      v32 = [*(id *)(a1 + 40) delegate];
      uint64_t v33 = *(unsigned __int8 *)(a1 + 56);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_96A8;
      v37[3] = &unk_3CB50;
      uint64_t v34 = *(void *)(a1 + 40);
      id v38 = *(id *)(a1 + 48);
      [v32 liveViewController:v34 stagePayload:v30 skipShelf:v33 allowAllCommits:v31 completionHandler:v37];

      v35 = v38;
    }
    else
    {
      v35 = +[NSError errorWithDomain:MSMessagesErrorDomain code:-1 userInfo:0];
      v36 = ms_defaultLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_248E8();
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void sub_96A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    if ([v3 code] == (char *)&dword_0 + 1)
    {
      uint64_t v4 = 9;
    }
    else if ([v6 code] == (char *)&dword_0 + 2)
    {
      uint64_t v4 = 10;
    }
    else
    {
      uint64_t v4 = -1;
    }
    double v5 = +[NSError errorWithDomain:MSMessagesErrorDomain code:v4 userInfo:0];
  }
  else
  {
    double v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_9828(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hasEntitlement:@"com.apple.messages.private.BypassShelfAccess"];
  unsigned int v3 = [*(id *)(a1 + 40) isSticker];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v5 = +[MSMessageExtensionUtilities isValidSticker:v4];
    if (v5)
    {
      id v6 = (void *)v5;
      double v7 = ms_defaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_249B8();
      }
LABEL_8:

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      return;
    }
    BOOL v9 = *(void **)(a1 + 40);
    double v10 = [*(id *)(a1 + 32) balloonPlugin];
    BOOL v11 = [v10 identifier];
    id v12 = [v9 convertToStickerWithExtensionIdentifier:v11];

    if (v12)
    {
      v13 = [*(id *)(a1 + 32) delegate];
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(unsigned __int8 *)(a1 + 56);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_9CC4;
      v39[3] = &unk_3CB50;
      id v40 = *(id *)(a1 + 48);
      [v13 liveViewController:v14 stageSticker:v12 skipShelf:v15 allowAllCommits:v2 completionHandler:v39];

      id v16 = v40;
    }
    else
    {
      id v16 = +[NSError errorWithDomain:MSMessagesErrorDomain code:-1 userInfo:0];
      id v31 = ms_defaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_24950();
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v8 = +[MSMessageExtensionUtilities isValidMediaPayload:v4];
    if (v8)
    {
      id v6 = (void *)v8;
      double v7 = ms_defaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_24A20();
      }
      goto LABEL_8;
    }
    uint64_t v17 = [*(id *)(a1 + 40) attributionInfo];
    char v18 = [*(id *)(a1 + 32) balloonExtensionPlugin];
    int v19 = [v18 attributionInfo];
    id v16 = [v19 mutableCopy];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = v17;
    id v20 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v36;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(v12);
          }
          uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          __int16 v25 = [v12 objectForKeyedSubscript:v24];
          [v16 setValue:v25 forKey:v24];
        }
        id v21 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v21);
    }

    [*(id *)(a1 + 40) setAttributionInfo:v16];
    v26 = +[MSMessageExtensionDataSource pluginPayloadFromMediaPayload:*(void *)(a1 + 40)];
    if (v26)
    {
      __int16 v27 = [*(id *)(a1 + 32) delegate];
      uint64_t v28 = *(void *)(a1 + 32);
      uint64_t v29 = *(unsigned __int8 *)(a1 + 56);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_9D78;
      v33[3] = &unk_3CB50;
      id v34 = *(id *)(a1 + 48);
      [v27 liveViewController:v28 stagePayload:v26 skipShelf:v29 allowAllCommits:v2 completionHandler:v33];

      CGSize v30 = v34;
    }
    else
    {
      CGSize v30 = +[NSError errorWithDomain:MSMessagesErrorDomain code:-1 userInfo:0];
      v32 = ms_defaultLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_248E8();
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_9CC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    if ([v3 code] == (char *)&dword_0 + 1)
    {
      uint64_t v4 = 9;
    }
    else if ([v6 code] == (char *)&dword_0 + 2)
    {
      uint64_t v4 = 10;
    }
    else
    {
      uint64_t v4 = -1;
    }
    uint64_t v5 = +[NSError errorWithDomain:MSMessagesErrorDomain code:v4 userInfo:0];
  }
  else
  {
    uint64_t v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_9D78(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    if ([v3 code] == (char *)&dword_0 + 1)
    {
      uint64_t v4 = 9;
    }
    else if ([v6 code] == (char *)&dword_0 + 2)
    {
      uint64_t v4 = 10;
    }
    else
    {
      uint64_t v4 = -1;
    }
    uint64_t v5 = +[NSError errorWithDomain:MSMessagesErrorDomain code:v4 userInfo:0];
  }
  else
  {
    uint64_t v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_9FA0(void *a1)
{
  id v2 = +[UIAlertController alertControllerWithTitle:a1[4] message:a1[5] preferredStyle:1];
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  uint64_t v8 = sub_A098;
  BOOL v9 = &unk_3CBC8;
  uint64_t v3 = a1[6];
  uint64_t v4 = (void *)a1[8];
  uint64_t v10 = a1[7];
  id v11 = v4;
  uint64_t v5 = +[UIAlertAction actionWithTitle:v3 style:0 handler:&v6];
  objc_msgSend(v2, "addAction:", v5, v6, v7, v8, v9, v10);

  [(id)a1[7] presentViewController:v2 animated:1 completion:0];
}

id sub_A098(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:*(void *)(a1 + 40)];
}

void sub_A220(uint64_t a1)
{
  id v2 = +[UIAlertController alertControllerWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40) preferredStyle:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_A3A8;
  v13[3] = &unk_3CBC8;
  uint64_t v3 = *(void *)(a1 + 48);
  void v13[4] = *(void *)(a1 + 56);
  id v14 = *(id *)(a1 + 72);
  uint64_t v4 = +[UIAlertAction actionWithTitle:v3 style:0 handler:v13];
  [v2 addAction:v4];

  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  BOOL v9 = sub_A448;
  uint64_t v10 = &unk_3CBC8;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 56);
  id v12 = *(id *)(a1 + 72);
  id v6 = +[UIAlertAction actionWithTitle:v5 style:2 handler:&v7];
  objc_msgSend(v2, "addAction:", v6, v7, v8, v9, v10, v11);

  [*(id *)(a1 + 56) presentViewController:v2 animated:1 completion:0];
}

void sub_A3A8(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_A434;
  v2[3] = &unk_3CA60;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 dismissViewControllerAnimated:1 completion:v2];
}

uint64_t sub_A434(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_A448(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_A4D4;
  v2[3] = &unk_3CA60;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 dismissViewControllerAnimated:1 completion:v2];
}

uint64_t sub_A4D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_A6EC(uint64_t a1)
{
  id v2 = +[UIAlertController alertControllerWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40) preferredStyle:0];
  if (![*(id *)(a1 + 48) count]) {
    goto LABEL_11;
  }
  unint64_t v3 = 0;
  BOOL v4 = 0;
  do
  {
    if (v4)
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v5 = [*(id *)(a1 + 56) objectAtIndexedSubscript:v3];
      unsigned int v6 = [v5 intValue];

      BOOL v4 = v6 == 1;
      if (v6 == 1)
      {
        uint64_t v9 = 1;
      }
      else
      {
        uint64_t v7 = [*(id *)(a1 + 56) objectAtIndexedSubscript:v3];
        BOOL v8 = [v7 intValue] == 2;

        uint64_t v9 = 2 * v8;
      }
      uint64_t v10 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v3];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_AA40;
      v29[3] = &unk_3CC68;
      uint64_t v11 = *(void **)(a1 + 72);
      v29[4] = *(void *)(a1 + 64);
      id v30 = v11;
      int v31 = v3;
      id v12 = +[UIAlertAction actionWithTitle:v10 style:v9 handler:v29];
      [v2 addAction:v12];
    }
    ++v3;
  }
  while ((unint64_t)[*(id *)(a1 + 48) count] > v3);
  if (!v4)
  {
LABEL_11:
    v13 = +[NSBundle mainBundle];
    id v14 = [v13 localizedStringForKey:@"CANCEL" value:&stru_3D720 table:0];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_AAF0;
    v28[3] = &unk_3CC90;
    v28[4] = *(void *)(a1 + 64);
    uint64_t v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:v28];
    [v2 addAction:v15];
  }
  id v16 = [v2 popoverPresentationController];
  if (v16)
  {
    uint64_t v17 = +[UIApplication sharedApplication];
    char v18 = (char *)[v17 userInterfaceLayoutDirection];

    int v19 = [*(id *)(a1 + 64) view];
    [v19 bounds];
    if (v18 == (unsigned char *)&dword_0 + 1)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v20);
      uint64_t v25 = 4;
    }
    else
    {
      double MaxX = CGRectGetMinX(*(CGRect *)&v20);
      uint64_t v25 = 8;
    }

    [v16 setPermittedArrowDirections:v25];
    v26 = [*(id *)(a1 + 64) view];
    [v16 setSourceView:v26];

    __int16 v27 = [*(id *)(a1 + 64) view];
    [v27 bounds];
    objc_msgSend(v16, "setSourceRect:", MaxX, CGRectGetMidY(v32), 0.0, 0.0);
  }
  [*(id *)(a1 + 64) presentViewController:v2 animated:1 completion:0];
}

void sub_AA40(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_AAD8;
  v3[3] = &unk_3CC40;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  int v5 = *(_DWORD *)(a1 + 48);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t sub_AAD8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

id sub_AAF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_AC0C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasEntitlement:@"com.apple.messages.private.AllowAlertPresentation"])
  {
    id v2 = [*(id *)(a1 + 40) count];
    if (v2 == [*(id *)(a1 + 48) count])
    {
      uint64_t v15 = objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
      [v15 setShowsMenuAsPrimaryAction:1];
      unint64_t v3 = +[NSMutableArray array];
      if ([*(id *)(a1 + 40) count])
      {
        unint64_t v4 = 0;
        do
        {
          int v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v4];
          unsigned int v6 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v4];
          uint64_t v7 = +[UIImage systemImageNamed:v6];
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_AEF0;
          v16[3] = &unk_3CCE0;
          id v17 = *(id *)(a1 + 56);
          int v18 = v4;
          BOOL v8 = +[UIAction actionWithTitle:v5 image:v7 identifier:0 handler:v16];

          [v3 addObject:v8];
          ++v4;
        }
        while ((unint64_t)[*(id *)(a1 + 40) count] > v4);
      }
      uint64_t v9 = +[UIMenu menuWithChildren:v3];
      uint64_t v10 = v15;
      [v15 setMenu:v9];

      uint64_t v11 = [*(id *)(a1 + 32) view];
      id v12 = [*(id *)(*(void *)(a1 + 32) + 16) view];
      [v11 insertSubview:v15 below:v12];

      [v15 performPrimaryAction];
      v13 = [*(id *)(a1 + 32) contextualMenuPlacementButton];

      if (v13)
      {
        id v14 = [*(id *)(a1 + 32) contextualMenuPlacementButton];
        [v14 removeFromSuperview];
      }
      [*(id *)(a1 + 32) setContextualMenuPlacementButton:v15];
    }
    else
    {
      uint64_t v10 = ms_defaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_24AF0((id *)(a1 + 40), (id *)(a1 + 48), v10);
      }
    }
  }
  else
  {
    uint64_t v10 = ms_defaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_24A88();
    }
  }
}

uint64_t sub_AEF0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned int *)(a1 + 40));
  }
  return result;
}

id sub_AFA0(uint64_t a1)
{
  id v2 = ms_defaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 56) messageGUID];
    int v5 = 138412290;
    unsigned int v6 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "LiveBubble received _remoteViewProvidesExplicitSizeSnapshot GUID: %@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(*(void *)(a1 + 32) + 16) setProvidesExplicitSizeSnapshot:1];
}

id sub_B0F8(uint64_t a1)
{
  id v2 = ms_defaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 56) messageGUID];
    int v5 = 138412290;
    unsigned int v6 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "LiveBubble received _remoteViewNeedsSizeMatchBeforeSnapshotSwap GUID: %@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(*(void *)(a1 + 32) + 16) setNeedsSizeMatchBeforeSnapshotSwap:1];
}

id sub_B250(uint64_t a1)
{
  id v2 = ms_defaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 56) messageGUID];
    int v5 = 138412290;
    unsigned int v6 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "LiveBubble received _remoteViewDidBecomeReadyForDisplay GUID: %@", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 32) + 16) setReadyToDisplay:1];
  return [*(id *)(a1 + 32) _swapOutSnapshotView];
}

void sub_B5D8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 liveViewController:*(void *)(a1 + 32) requestPresentationStyle:*(void *)(a1 + 40)];
}

id sub_B6A0(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsResize:1];
  id v2 = *(void **)(*(void *)(a1 + 32) + 56);

  return [v2 needsResize];
}

void sub_B790(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  unint64_t v3 = [v2 window];
  unint64_t v4 = [v3 windowScene];
  int v5 = [v4 _sceneIdentifier];

  unsigned int v6 = ms_defaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    BOOL v8 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "MSMessageExtensionBalloonLiveViewController returning hostSceneIdentifier: %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_BE80(uint64_t a1)
{
  [*(id *)(a1 + 32) setStaticView:0];
  id v2 = *(void **)(a1 + 40);

  return [v2 setLoadingView:0];
}

void sub_BEC4(id *a1)
{
  [a1[4] setAlpha:1.0];
  [a1[5] setAlpha:0.0];
  id v2 = [a1[6] iconView];
  [v2 setAlpha:1.0];

  unint64_t v3 = +[UIColor clearColor];
  [a1[5] setBackgroundColor:v3];

  unint64_t v4 = [a1[5] layer];
  [v4 setValue:&off_3E038 forKeyPath:@"filters.gaussianBlur.inputRadius"];

  id v5 = [a1[4] layer];
  [v5 setValue:&off_3E008 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

uint64_t sub_BFB0(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_D248(id a1)
{
  objc_msgSend(+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  qword_46EF0 = v1;
}

void sub_D27C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_D2A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_D9DC(id a1)
{
  uint64_t v1 = IMSharedHelperAppDisabledBundleIDsForAppCardSwipeGesture();
  id v2 = (void *)qword_46F00;
  qword_46F00 = v1;

  if (!qword_46F00)
  {
    qword_46F00 = (uint64_t)&off_3E108;
  }
}

void sub_DBF8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) balloonPlugin];

  if (v2)
  {
    uint64_t v6 = CKRemoteViewPluginKey;
    unint64_t v3 = [*(id *)(a1 + 32) balloonPlugin];
    int v7 = v3;
    unint64_t v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  }
  else
  {
    unint64_t v4 = 0;
  }
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:CKMessageExtensionBrowserViewControllerDidPrepareForDisplay object:0 userInfo:v4];
}

void sub_DEDC(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 72) || *(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 32))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_E074;
    block[3] = &unk_3C9E8;
    block[4] = *(void *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  unint64_t v4 = +[_MSStickerSendManager sharedInstance];
  id v5 = [v4 hostBundleID];

  if (!v5)
  {
    uint64_t v6 = +[NSBundle mainBundle];
    id v5 = [v6 bundleIdentifier];
  }
  int v7 = [*(id *)(a1 + 40) remoteProxy];
  [v7 _setHostBundleID:v5];

  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);
  }
  uint64_t v9 = *(id *)(a1 + 48);
  uint64_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 64);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_INTERVAL_END, v11, "extensionLoading", (const char *)&unk_3803B, v12, 2u);
  }
}

id sub_E074(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _postCurrentPluginBrowserViewDidPrepareForDisplay];
}

id sub_E43C(uint64_t a1)
{
  return [*(id *)(a1 + 32) forceTearDownRemoteView];
}

id sub_E62C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isInDeferredTeardown];
  if (result)
  {
    unint64_t v3 = *(void **)(a1 + 32);
    return [v3 forceTearDownRemoteView];
  }
  return result;
}

void sub_F854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_F880(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_F890(uint64_t a1)
{
}

void sub_F898(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_105B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_105DC(uint64_t a1)
{
  [*(id *)(a1 + 32) _addRemoteViewControllerAndConfigureExtension];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    unint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_10634(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10744;
  block[3] = &unk_3CE88;
  objc_copyWeak(v18, (id *)(a1 + 32));
  id v15 = v7;
  id v16 = v8;
  uint64_t v10 = *(void **)(a1 + 40);
  id v17 = v9;
  v18[1] = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(v18);
}

void sub_10744(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (!WeakRetained) {
    return;
  }
  id v4 = ms_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_loadWeakRetained(v2);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = v5;
    uint64_t v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 extensionLoadRequestCount]);

    *(_DWORD *)buf = 138413314;
    id v42 = v5;
    __int16 v43 = 2112;
    uint64_t v44 = v7;
    __int16 v45 = 2112;
    uint64_t v46 = v6;
    __int16 v47 = 2112;
    uint64_t v48 = v8;
    __int16 v49 = 2112;
    v50 = v10;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "instantiateViewControllerWithInputItems returned with request %@ remoteVC self %@ %@ error %@ extensionLoad request count %@", buf, 0x34u);
  }
  id v11 = objc_loadWeakRetained(v2);
  [v11 setExtensionLoadRequestInFlight:0];

  id v12 = objc_loadWeakRetained(v2);
  [v12 setSessionUUID:*(void *)(a1 + 32)];

  if (*(void *)(a1 + 48)) {
    goto LABEL_5;
  }
  id v24 = objc_loadWeakRetained(v2);
  if (![v24 extensionLoadRequestCount])
  {

    goto LABEL_5;
  }
  BOOL v25 = *(void *)(a1 + 40) == 0;

  if (v25)
  {
LABEL_5:
    id v13 = ms_defaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_loadWeakRetained(v2);
      uint64_t v15 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      id v42 = v14;
      __int16 v43 = 2112;
      uint64_t v44 = v15;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%@ extensionLoadRequestCount hit error case. Force tearing down extension %@ ", buf, 0x16u);
    }
    id v16 = objc_loadWeakRetained(v2);
    [v16 _callAndDequeueLoadCompletionBlocks:0];

    id v17 = objc_loadWeakRetained(v2);
    [v17 forceTearDownRemoteView];

    int v18 = ms_defaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Posting CKRemoteViewFailedInstantiationNotification", buf, 2u);
    }

    int v19 = +[NSNotificationCenter defaultCenter];
    uint64_t v39 = IMExtensionRemoteConnectionInterruptedBundleIdentifier;
    id v20 = objc_loadWeakRetained(v2);
    id v21 = objc_msgSend(v20, "balloonExtensionPlugin", v39);
    uint64_t v22 = [v21 identifier];
    id v40 = v22;
    __int16 v23 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    [v19 postNotificationName:CKRemoteViewFailedInstantiationNotification object:0 userInfo:v23];

    return;
  }
  id v26 = objc_loadWeakRetained(v2);
  __int16 v27 = [v26 extension];
  id v28 = objc_loadWeakRetained(v2);
  uint64_t v29 = [v28 sessionUUID];
  id v30 = [v27 _extensionContextForUUID:v29];

  id v31 = objc_loadWeakRetained(v2);
  [v30 setDelegate:v31];

  id v32 = objc_loadWeakRetained(v2);
  uint64_t v33 = [v32 remoteViewController];
  id v34 = [v33 parentViewController];

  if (v34)
  {
    id v35 = objc_loadWeakRetained(v2);
    [v35 _removeRemoteViewController];
  }
  id v36 = objc_loadWeakRetained(v2);
  [v36 setRemoteViewController:*(void *)(a1 + 40)];

  if ((CKIsAppCardsEnabled() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 40) setServiceViewShouldShareTouchesWithHost:1];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 40) setIntent:*(void *)(a1 + 64)];
  }
  id v37 = objc_loadWeakRetained(v2);
  [v37 _addRemoteViewControllerAndConfigureExtension];

  id v38 = objc_loadWeakRetained(v2);
  [v38 _callAndDequeueLoadCompletionBlocks:1];
}

void sub_10BD4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(a1);
    id v13 = ms_defaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained(v11);
      id v15 = WeakRetained;
      id v16 = [v15 balloonExtensionPlugin];
      id v17 = [v16 identifier];
      LODWORD(buf) = 134218240;
      *(void *)((char *)&buf + 4) = WeakRetained;
      WORD6(buf) = 2048;
      *(void *)((char *)&buf + 14) = v17;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Posting CKRemoteViewFailedInstantiationNotification  weakSelf %p or the extension %p is null", (uint8_t *)&buf, 0x16u);
    }
    objc_end_catch();
    JUMPOUT(0x10A04);
  }
  _Unwind_Resume(a1);
}

void sub_115DC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  [v2 _presentationDidChangeToPresentationState:*(void *)(a1 + 40)];
}

void sub_123B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

id sub_123D8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) requestSnapshotDataForPersistance];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_12498;
  v7[3] = &unk_3CED8;
  long long v8 = *(_OWORD *)(a1 + 40);
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v7);
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return v5;
}

void sub_12498(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v3 = +[UIScreen mainScreen];
  [v3 scale];
  +[UIImage imageWithData:scale:](UIImage, "imageWithData:scale:", v2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [objc_alloc((Class)UIImageView) initWithImage:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_12548(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) snapshotCache];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v4 = [*(id *)(a1 + 40) stringValue];
  [v2 setCachedPreview:v3 key:v4];

  uint64_t v5 = [*(id *)(a1 + 32) snapshotCache];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_12664;
  id v12 = &unk_3CF28;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  id v13 = v6;
  uint64_t v14 = v7;
  [v5 enqueueSaveBlock:&v9 withPriority:-1];

  long long v8 = +[NSNotificationCenter defaultCenter];
  objc_msgSend(v8, "__mainThreadPostNotificationName:object:", CKBalloonPluginManagerSnapshotsDidChange, 0);
}

void sub_12664(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stringValue];
  CKBrowserSnapshotPreviewURL();
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  CKFreeSpaceWriteDataToURL();
  uint64_t v3 = [*(id *)(a1 + 32) keyWithOppositeInterfaceStyle];
  +[MSMessageExtensionBrowserViewController invalidateSnapshotForKey:v3];
}

uint64_t sub_12FA4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_13088(uint64_t a1)
{
  if (+[_MSPresentationState isRunningInCameraContext])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    id v34 = +[NSError errorWithDomain:MSMessagesErrorDomain code:11 userInfo:0];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v34);
  }
  else
  {
    uint64_t v3 = +[MSMessageExtensionUtilities isValidMessagePayload:*(void *)(a1 + 32)];
    if (v3)
    {
      id v4 = ms_defaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_25460();
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v5 = [*(id *)(a1 + 32) layout];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = *(void **)(a1 + 40);
        id v7 = v5;
        long long v8 = [v7 imageTitle];
        id v9 = [v6 substituteNameInString:v8];
        [v7 setImageTitle:v9];

        uint64_t v10 = *(void **)(a1 + 40);
        id v11 = [v7 imageSubtitle];
        id v12 = [v10 substituteNameInString:v11];
        [v7 setImageSubtitle:v12];

        id v13 = *(void **)(a1 + 40);
        uint64_t v14 = [v7 caption];
        id v15 = [v13 substituteNameInString:v14];
        [v7 setCaption:v15];

        id v16 = *(void **)(a1 + 40);
        uint64_t v17 = [v7 subcaption];
        int v18 = [v16 substituteNameInString:v17];
        [v7 setSubcaption:v18];

        int v19 = *(void **)(a1 + 40);
        id v20 = [v7 trailingCaption];
        id v21 = [v19 substituteNameInString:v20];
        [v7 setTrailingCaption:v21];

        uint64_t v22 = *(void **)(a1 + 40);
        __int16 v23 = [v7 trailingSubcaption];
        id v24 = [v22 substituteNameInString:v23];
        [v7 setTrailingSubcaption:v24];
      }
      BOOL v25 = *(void **)(a1 + 40);
      id v26 = [*(id *)(a1 + 32) summaryText];
      __int16 v27 = [v25 substituteNameInString:v26];
      [*(id *)(a1 + 32) setSummaryText:v27];

      id v28 = *(void **)(a1 + 40);
      uint64_t v29 = [*(id *)(a1 + 32) accessibilityLabel];
      id v30 = [v28 substituteNameInString:v29];
      [*(id *)(a1 + 32) setAccessibilityLabel:v30];

      id v31 = [*(id *)(a1 + 40) _itemPayloadFromMSMessage:*(void *)(a1 + 32)];
      id v32 = *(void **)(a1 + 40);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_13448;
      v35[3] = &unk_3CF78;
      char v38 = *(unsigned char *)(a1 + 56);
      v35[4] = v32;
      id v36 = v31;
      id v37 = *(id *)(a1 + 48);
      id v33 = v31;
      [v32 checkForTouchInRemoteProcessIfNecessaryWithCompletion:v35];
    }
  }
}

void sub_13448(uint64_t a1, int a2)
{
  unsigned int v3 = [*(id *)(a1 + 32) allowAllPayloadCommits] | a2;
  id v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    id v24 = [v4 sendDelegate];
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = [*(id *)(a1 + 32) balloonPlugin];
    id v13 = [v12 identifier];
    [v24 commitPayload:v11 forPlugin:v13 allowAllCommits:1 completionHandler:*(void *)(a1 + 48)];
LABEL_9:

    return;
  }
  id v6 = [v4 balloonPlugin];
  unsigned __int8 v7 = [v6 showInBrowser];

  long long v8 = [*(id *)(a1 + 32) sendDelegate];
  if ((v7 & 1) == 0)
  {
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      return;
    }
    id v24 = [*(id *)(a1 + 32) sendDelegate];
    uint64_t v15 = *(void *)(a1 + 40);
    id v12 = [*(id *)(a1 + 32) balloonPlugin];
    id v13 = [v12 identifier];
    [v24 startEditingPayloadBypassingValidation:v15 forPlugin:v13 completion:*(void *)(a1 + 48)];
    goto LABEL_9;
  }
  char v9 = objc_opt_respondsToSelector();

  id v24 = [*(id *)(a1 + 32) sendDelegate];
  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v12 = [*(id *)(a1 + 32) balloonPlugin];
    id v13 = [v12 identifier];
    [v24 startEditingPayload:v10 dismiss:0 forPlugin:v13 completion:*(void *)(a1 + 48)];
    goto LABEL_9;
  }
  char v16 = objc_opt_respondsToSelector();

  uint64_t v17 = [*(id *)(a1 + 32) sendDelegate];
  int v18 = v17;
  uint64_t v19 = *(void *)(a1 + 40);
  if (v16)
  {
    id v20 = [*(id *)(a1 + 32) balloonPlugin];
    id v21 = [v20 identifier];
    [v18 startEditingPayload:v19 dismiss:0 forPlugin:v21];
  }
  else
  {
    [v17 startEditingPayload:*(void *)(a1 + 40) dismiss:0];
  }

  uint64_t v22 = *(void *)(a1 + 48);
  if (v22)
  {
    __int16 v23 = *(void (**)(void))(v22 + 16);
    v23();
  }
}

void sub_139D4(uint64_t a1)
{
  if (!+[_MSPresentationState isRunningInCameraContext](_MSPresentationState, "isRunningInCameraContext")|| !*(unsigned char *)(a1 + 56)&& (([*(id *)(a1 + 32) isSticker] & 1) != 0|| (objc_msgSend(*(id *)(a1 + 32), "mediaURL"), unsigned int v3 = objc_claimAutoreleasedReturnValue(), v4 = objc_msgSend(v3, "__ms_conformsToUTI:", kUTTypeImage), v3, (v4 & 1) != 0)))
  {
    if ([*(id *)(a1 + 32) isSticker])
    {
      BOOL v5 = [*(id *)(a1 + 40) currentDragPayload];
      if (v5)
      {
        int v6 = *(unsigned __int8 *)(a1 + 57);

        if (!v6)
        {
          long long v8 = ms_defaultLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Already dragging a sticker, bailing out of single tap sticker commit", buf, 2u);
          }
          goto LABEL_64;
        }
      }
      uint64_t v7 = +[MSMessageExtensionUtilities isValidSticker:*(void *)(a1 + 32)];
      if (v7)
      {
        long long v8 = v7;
        char v9 = ms_defaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Invalid sticker", buf, 2u);
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_15;
      }
      char v14 = [*(id *)(a1 + 40) balloonPlugin];
      long long v8 = [v14 identifier];

      uint64_t v15 = IMStickersExtensionIdentifier();
      char v16 = IMBalloonExtensionIDWithSuffix();

      uint64_t v17 = [*(id *)(a1 + 32) stickerPackGUID];
      int v18 = 0;
      if ([v8 isEqualToString:v16] && v17)
      {
        if ([v17 isEqualToString:v16])
        {
          int v18 = 0;
        }
        else
        {
          __int16 v43 = +[IMBalloonPluginManager sharedInstance];
          int v18 = [v43 balloonPluginForBundleID:v17];

          if (v18)
          {
            uint64_t v44 = v17;

            long long v8 = v44;
          }
        }
      }
      __int16 v45 = [*(id *)(a1 + 32) convertToStickerWithExtensionIdentifier:v8];
      uint64_t v46 = [v45 attributionInfo];

      if (!v46 && v18)
      {
        __int16 v47 = [v18 attributionInfo];
        [v45 setAttributionInfo:v47];
      }
      uint64_t v48 = [*(id *)(a1 + 40) sendDelegate];
      char v49 = objc_opt_respondsToSelector();

      if (v49)
      {
        v50 = &stru_3D720;
        if (v8) {
          v50 = (__CFString *)v8;
        }
        v51 = *(void **)(a1 + 40);
        v52 = v50;
        v53 = [v51 sendDelegate];
        [*(id *)(a1 + 32) sourceFrame];
        objc_msgSend(v53, "commitSticker:forPlugin:stickerFrame:", v45, v52);
      }
      else
      {
        v53 = [*(id *)(a1 + 40) sendDelegate];
        [*(id *)(a1 + 32) sourceFrame];
        objc_msgSend(v53, "commitSticker:stickerFrame:", v45);
      }

      goto LABEL_62;
    }
    uint64_t v10 = [*(id *)(a1 + 32) generativePlaygroundRecipeData];

    uint64_t v11 = +[MSMessageExtensionUtilities isValidMediaPayload:*(void *)(a1 + 32)];
    id v12 = (void *)v11;
    if (v10)
    {
      if (!v11)
      {
        uint64_t v19 = [*(id *)(a1 + 40) balloonExtensionPlugin];
        id v20 = [v19 identifier];

        id v21 = IMBalloonExtensionIDWithSuffix();
        unsigned __int8 v22 = [v20 isEqualToString:v21];

        if (v22)
        {
          if (([*(id *)(a1 + 32) isSticker] & 1) == 0)
          {
            __int16 v23 = [*(id *)(a1 + 32) attributionInfo];
            id v24 = [*(id *)(a1 + 40) balloonExtensionPlugin];
            BOOL v25 = [v24 attributionInfo];
            id v26 = [v25 mutableCopy];

            long long v81 = 0u;
            long long v82 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            id v27 = v23;
            id v28 = [v27 countByEnumeratingWithState:&v79 objects:v85 count:16];
            if (v28)
            {
              id v29 = v28;
              uint64_t v30 = *(void *)v80;
              do
              {
                for (i = 0; i != v29; i = (char *)i + 1)
                {
                  if (*(void *)v80 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  uint64_t v32 = *(void *)(*((void *)&v79 + 1) + 8 * i);
                  id v33 = [v27 objectForKeyedSubscript:v32];
                  [v26 setValue:v33 forKey:v32];
                }
                id v29 = [v27 countByEnumeratingWithState:&v79 objects:v85 count:16];
              }
              while (v29);
            }

            [*(id *)(a1 + 32) setAttributionInfo:v26];
          }
          id v34 = +[MSMessageExtensionDataSource pluginPayloadFromMediaPayload:*(void *)(a1 + 32)];
          id v35 = [*(id *)(a1 + 40) sendDelegate];
          char v36 = objc_opt_respondsToSelector();

          if (v36)
          {
            id v37 = [*(id *)(a1 + 40) sendDelegate];
            [v37 appendMediaPayloadToText:v34];
          }
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

          id v12 = 0;
        }
        else
        {
          id v12 = +[NSError errorWithDomain:MSMessagesErrorDomain code:11 userInfo:0];
          id v42 = ms_defaultLog();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            sub_25530();
          }

          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }

        goto LABEL_50;
      }
      id v13 = ms_defaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    if (v11)
    {
      id v13 = ms_defaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
LABEL_22:
      }
        sub_254C8();
LABEL_23:

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_50:

      return;
    }
    if ([*(id *)(a1 + 32) isSticker])
    {
LABEL_76:
      long long v8 = +[MSMessageExtensionDataSource pluginPayloadFromMediaPayload:*(void *)(a1 + 32)];
      if (*(unsigned char *)(a1 + 56))
      {
        v66 = [*(id *)(a1 + 40) recipients];
        id v67 = [v66 count];

        if (v67)
        {
          v68 = [*(id *)(a1 + 40) sendDelegate];
          v69 = [*(id *)(a1 + 40) balloonPlugin];
          v70 = [v69 identifier];
          objc_msgSend(v68, "commitPayload:forPlugin:allowAllCommits:completionHandler:", v8, v70, objc_msgSend(*(id *)(a1 + 40), "allowAllPayloadCommits"), *(void *)(a1 + 48));

LABEL_15:
          return;
        }
      }
      v71 = [*(id *)(a1 + 40) sendDelegate];
      char v72 = objc_opt_respondsToSelector();

      v73 = [*(id *)(a1 + 40) sendDelegate];
      char v16 = v73;
      if ((v72 & 1) == 0)
      {
        [v73 startEditingPayload:v8 dismiss:0];
        goto LABEL_63;
      }
      uint64_t v17 = [*(id *)(a1 + 40) balloonPlugin];
      int v18 = [v17 identifier];
      [v16 startEditingPayload:v8 dismiss:0 forPlugin:v18];
LABEL_62:

LABEL_63:
LABEL_64:

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      return;
    }
    char v38 = [*(id *)(a1 + 32) attributionInfo];
    uint64_t v39 = [*(id *)(a1 + 40) balloonExtensionPlugin];
    id v40 = [v39 identifier];

    v41 = IMBalloonExtensionIDWithSuffix();
    if ([v40 isEqualToString:v41])
    {
    }
    else
    {
      v54 = IMBalloonExtensionIDWithSuffix();
      unsigned __int8 v55 = [v40 isEqualToString:v54];

      if ((v55 & 1) == 0)
      {
        v56 = [*(id *)(a1 + 40) balloonExtensionPlugin];
        v57 = [v56 attributionInfo];
        id v58 = [v57 mutableCopy];

        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v59 = v38;
        id v60 = [v59 countByEnumeratingWithState:&v75 objects:v84 count:16];
        if (v60)
        {
          id v61 = v60;
          uint64_t v62 = *(void *)v76;
          do
          {
            for (j = 0; j != v61; j = (char *)j + 1)
            {
              if (*(void *)v76 != v62) {
                objc_enumerationMutation(v59);
              }
              uint64_t v64 = *(void *)(*((void *)&v75 + 1) + 8 * (void)j);
              v65 = [v59 objectForKeyedSubscript:v64];
              [v58 setValue:v65 forKey:v64];
            }
            id v61 = [v59 countByEnumeratingWithState:&v75 objects:v84 count:16];
          }
          while (v61);
        }

        [*(id *)(a1 + 32) setAttributionInfo:v58];
        goto LABEL_75;
      }
    }
    [*(id *)(a1 + 32) setAttributionInfo:v38];
LABEL_75:

    goto LABEL_76;
  }
  uint64_t v2 = *(void *)(a1 + 48);
  id v74 = +[NSError errorWithDomain:MSMessagesErrorDomain code:11 userInfo:0];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

void sub_1444C(uint64_t a1)
{
  if (+[_MSPresentationState isRunningInCameraContext])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    id v15 = +[NSError errorWithDomain:MSMessagesErrorDomain code:11 userInfo:0];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v15);
  }
  else
  {
    id v15 = objc_alloc_init((Class)CKBrowserItemPayload);
    unsigned int v3 = [*(id *)(a1 + 32) _linkMetadata];
    unsigned __int8 v4 = [v3 dataRepresentation];
    [v15 setData:v4];

    BOOL v5 = [*(id *)(a1 + 32) _linkMetadata];
    int v6 = [v5 originalURL];
    [v15 setUrl:v6];

    [v15 setPluginBundleID:IMBalloonPluginIdentifierRichLinks];
    LODWORD(v6) = *(unsigned __int8 *)(a1 + 56);
    uint64_t v7 = [*(id *)(a1 + 40) sendDelegate];
    if (v6)
    {
      long long v8 = [*(id *)(a1 + 40) balloonPlugin];
      char v9 = [v8 identifier];
      objc_msgSend(v7, "commitPayload:forPlugin:allowAllCommits:completionHandler:", v15, v9, objc_msgSend(*(id *)(a1 + 40), "allowAllPayloadCommits"), *(void *)(a1 + 48));
    }
    else
    {
      int v10 = objc_opt_respondsToSelector();

      uint64_t v11 = [*(id *)(a1 + 40) sendDelegate];
      id v12 = v11;
      if (v10)
      {
        id v13 = [*(id *)(a1 + 40) balloonPlugin];
        char v14 = [v13 identifier];
        [v12 startEditingPayload:v15 dismiss:0 forPlugin:v14];
      }
      else
      {
        [v11 startEditingPayload:v15 dismiss:0];
      }

      (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
    }
  }
}

void sub_14768(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentDragPayload];

  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_21;
  }
  unsigned int v3 = [*(id *)(a1 + 40) mediaURL];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [*(id *)(a1 + 40) macDragImageData];
    BOOL v5 = (void *)v4;
    if (!v3)
    {
      if (!v4)
      {
        uint64_t v7 = 0;
        goto LABEL_10;
      }
      id v6 = [objc_alloc((Class)CKImageData) initWithData:v4];
      goto LABEL_9;
    }
LABEL_8:
    id v6 = [objc_alloc((Class)CKImageData) initWithURL:v3];
LABEL_9:
    uint64_t v7 = v6;
    goto LABEL_10;
  }
  BOOL v5 = 0;
  uint64_t v7 = 0;
  if (v3) {
    goto LABEL_8;
  }
LABEL_10:
  long long v8 = [v7 durationsWithMaxCount:0x7FFFFFFFLL];
  char v9 = +[NSMutableArray array];
  if ([v7 count])
  {
    unint64_t v10 = 0;
    do
    {
      uint64_t v11 = objc_msgSend(v7, "thumbnailAtIndex:fillToSize:maxCount:", v10, 0x7FFFFFFFLL, 1.79769313e308, 1.79769313e308);
      if (v11) {
        [v9 addObject:v11];
      }

      ++v10;
    }
    while (v10 < (unint64_t)[v7 count]);
  }
  id v12 = [objc_alloc((Class)CKAnimatedImage) initWithImages:v9 durations:v8];
  if (v12)
  {
    [*(id *)(a1 + 32) setCurrentDragPayload:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setCompletionHandler:*(void *)(a1 + 56)];
    double v13 = *(double *)(a1 + 64);
    double v14 = *(double *)(a1 + 72);
    double v15 = *(double *)(a1 + 80);
    double v16 = *(double *)(a1 + 88);
    uint64_t v17 = [*(id *)(a1 + 32) extension];

    if (!v17)
    {
      int v18 = [*(id *)(a1 + 32) view];
      uint64_t v19 = [*(id *)(a1 + 32) view];
      id v20 = [v19 window];
      objc_msgSend(v18, "convertRect:fromView:", v20, v13, v14, v15, v16);
      double v13 = v21;
      double v14 = v22;
      double v15 = v23;
      double v16 = v24;
    }
    BOOL v25 = [*(id *)(a1 + 32) browserDragManager];
    objc_msgSend(v25, "beginDraggingItem:withAnimatedDragImage:fromRect:", *(void *)(a1 + 40), v12, v13, v14, v15, v16);
  }
  else
  {
    BOOL v25 = +[NSError errorWithDomain:@"CKAppBrowserViewController" code:-1 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }

LABEL_21:
  if (*(void *)(a1 + 48))
  {
    +[UIWindow _synchronizeDrawingWithFence:](UIWindow, "_synchronizeDrawingWithFence:");
  }
}

void sub_14AF0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sendDelegate];
  char v3 = objc_opt_respondsToSelector();

  uint64_t v4 = [*(id *)(a1 + 32) sendDelegate];
  if (v3)
  {
LABEL_5:
    id v9 = v4;
    [v4 stickerDruidDragStarted];
    goto LABEL_6;
  }
  id v9 = v4;
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [*(id *)(a1 + 32) sendDelegate];
    id v6 = [v5 appContext];
    unsigned int v7 = [v6 conformsToProtocol:&OBJC_PROTOCOL____MSMessageComposeExtensionImplProtocol];

    if (!v7) {
      return;
    }
    long long v8 = [*(id *)(a1 + 32) sendDelegate];
    id v10 = [v8 appContext];

    uint64_t v4 = v10;
    goto LABEL_5;
  }
LABEL_6:
}

void sub_14C94(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) balloonPlugin];
  uint64_t v4 = [(id)v3 identifier];
  id v15 = [v2 convertToStickerWithExtensionIdentifier:v4];

  BOOL v5 = [*(id *)(a1 + 40) sendDelegate];
  LOBYTE(v3) = objc_opt_respondsToSelector();

  id v6 = [*(id *)(a1 + 40) sendDelegate];
  unsigned int v7 = v6;
  if (v3)
  {
    [v6 stickerDruidDragEndedWithIMSticker:v15];
  }
  else if (objc_opt_respondsToSelector())
  {
    long long v8 = [*(id *)(a1 + 40) sendDelegate];
    id v9 = [v8 appContext];
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      goto LABEL_7;
    }
    uint64_t v11 = [*(id *)(a1 + 40) sendDelegate];
    unsigned int v7 = [v11 appContext];

    uint64_t v12 = *(void *)(a1 + 32);
    double v13 = [*(id *)(a1 + 40) balloonPlugin];
    double v14 = [v13 identifier];
    [v7 stickerDruidDragEndedWithPayload:v12 pluginIdentifier:v14];
  }
LABEL_7:
}

void sub_14ECC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) convertToStickerWithExtensionIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = [*(id *)(a1 + 48) sendDelegate];
    char v4 = objc_opt_respondsToSelector();

    uint64_t v2 = v6;
    if (v4)
    {
      BOOL v5 = [*(id *)(a1 + 48) sendDelegate];
      [v5 stickerDruidDragEndedWithIMSticker:v6];

      uint64_t v2 = v6;
    }
  }
}

void sub_150D0(uint64_t a1)
{
  uint64_t v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_25620(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  unint64_t v10 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 48) && v10 <= 1)
  {
    uint64_t v11 = [*(id *)(a1 + 32) sendDelegate];
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0) {
      return;
    }
    BOOL v13 = v10 == 1;
    double v14 = [*(id *)(a1 + 32) sendDelegate];
    id v15 = [*(id *)(a1 + 32) balloonPlugin];
    double v16 = [v15 identifier];
    [v14 requestTransitionPluginFromFullScreen:v16 toExpanded:v13];
LABEL_10:

LABEL_11:
LABEL_16:

    return;
  }
  if (v10 <= 1)
  {
    uint64_t v17 = [*(id *)(a1 + 32) sendDelegate];
    char v18 = objc_opt_respondsToSelector();

    uint64_t v19 = [*(id *)(a1 + 32) sendDelegate];
    double v14 = v19;
    if ((v18 & 1) == 0)
    {
      [v19 requestPresentationStyleExpanded:v10 == 1];
      goto LABEL_16;
    }
    BOOL v20 = v10 == 1;
    id v15 = [*(id *)(a1 + 32) balloonPlugin];
    double v16 = [v15 identifier];
    [v14 requestPresentationStyleExpanded:v20 forPlugin:v16];
    goto LABEL_10;
  }
  if (v10 == 3)
  {
    double v21 = [*(id *)(a1 + 32) sendDelegate];
    char v22 = objc_opt_respondsToSelector();

    if (v22)
    {
      double v14 = [*(id *)(a1 + 32) sendDelegate];
      id v15 = [*(id *)(a1 + 32) balloonPlugin];
      double v23 = [v15 identifier];
      objc_msgSend(v14, "requestPresentationStyleFullScreenModalForPlugin:preferredContentSize:", v23, CGSizeZero.width, CGSizeZero.height);

      goto LABEL_11;
    }
  }
}

void sub_1536C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sendDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v6 = [*(id *)(a1 + 32) sendDelegate];
    uint64_t v4 = [*(id *)(a1 + 32) balloonPlugin];
    uint64_t v5 = [v4 identifier];
    objc_msgSend(v6, "requestPresentationStyleFullScreenModalForPlugin:preferredContentSize:", v5, *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
}

void sub_154A8(uint64_t a1)
{
  uint64_t v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_25710(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  [*(id *)(a1 + 32) setDismissing:1];
  unint64_t v10 = [*(id *)(a1 + 32) sendDelegate];
  char v11 = objc_opt_respondsToSelector();

  char v12 = *(void **)(a1 + 32);
  if (v11)
  {
    BOOL v13 = [v12 balloonPlugin];
    double v14 = [v13 identifier];
    if ([v14 containsString:IMBalloonPluginIdentifierSurf])
    {
      unsigned int v15 = 1;
    }
    else
    {
      uint64_t v17 = [*(id *)(a1 + 32) balloonPlugin];
      char v18 = [v17 identifier];
      unsigned int v15 = [v18 containsString:IMBalloonPluginIdentifierSurfDeprecated];
    }
    if ([*(id *)(a1 + 32) inFullScreenModalPresentation]) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = +[CKUtilities isIpad] ^ 1 | v15;
    }
    double v16 = [*(id *)(a1 + 32) sendDelegate];
    BOOL v20 = [*(id *)(a1 + 32) balloonPlugin];
    double v21 = [v20 identifier];
    [v16 dismissAndReloadInputViews:v19 forPlugin:v21];
  }
  else
  {
    double v16 = [v12 sendDelegate];
    [v16 dismissAndReloadInputViews:1];
  }
}

void sub_156A8(uint64_t a1)
{
  uint64_t v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_25788(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  [*(id *)(a1 + 32) setDismissing:1];
  unint64_t v10 = [*(id *)(a1 + 32) sendDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    char v12 = [*(id *)(a1 + 32) sendDelegate];
    [v12 dismissAndPresentPhotosApp];
  }
}

void sub_15864(uint64_t a1)
{
  uint64_t v2 = +[UIAlertController alertControllerWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40) preferredStyle:1];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  uint64_t v8 = sub_1596C;
  uint64_t v9 = &unk_3CBC8;
  id v10 = v2;
  id v11 = *(id *)(a1 + 64);
  id v4 = v2;
  uint64_t v5 = +[UIAlertAction actionWithTitle:v3 style:0 handler:&v6];
  objc_msgSend(v4, "addAction:", v5, v6, v7, v8, v9);

  [*(id *)(a1 + 56) presentViewController:v4 animated:1 completion:0];
}

id sub_1596C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:*(void *)(a1 + 40)];
}

void sub_15ABC(uint64_t a1)
{
  uint64_t v2 = +[UIAlertController alertControllerWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40) preferredStyle:1];
  uint64_t v3 = *(void *)(a1 + 48);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_15C60;
  v15[3] = &unk_3CBC8;
  id v4 = v2;
  id v16 = v4;
  id v17 = *(id *)(a1 + 72);
  uint64_t v5 = +[UIAlertAction actionWithTitle:v3 style:0 handler:v15];
  [v4 addAction:v5];

  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_15D00;
  char v12 = &unk_3CBC8;
  id v13 = v4;
  id v14 = *(id *)(a1 + 72);
  id v7 = v4;
  uint64_t v8 = +[UIAlertAction actionWithTitle:v6 style:2 handler:&v9];
  objc_msgSend(v7, "addAction:", v8, v9, v10, v11, v12);

  [*(id *)(a1 + 64) presentViewController:v7 animated:1 completion:0];
}

void sub_15C60(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_15CEC;
  v2[3] = &unk_3CA60;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 dismissViewControllerAnimated:1 completion:v2];
}

uint64_t sub_15CEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_15D00(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_15D8C;
  v2[3] = &unk_3CA60;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 dismissViewControllerAnimated:1 completion:v2];
}

uint64_t sub_15D8C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_15E1C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _postCurrentPluginBrowserViewDidPrepareForDisplay];
}

void sub_15EBC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isInDeferredTeardown])
  {
    uint64_t v2 = [*(id *)(a1 + 32) balloonExtensionPlugin];

    if (v2)
    {
      [*(id *)(a1 + 40) size];
      double v4 = v3;
      double v6 = v5;
      if (qword_46F18 != -1) {
        dispatch_once(&qword_46F18, &stru_3D240);
      }
      double v7 = *(double *)&qword_46F10;
      if (*(double *)&qword_46F10 == 0.0) {
        double v7 = 1.0;
      }
      double v8 = round(v4 * v7) / v7;
      double v9 = round(v6 * v7) / v7;
      uint64_t v10 = [*(id *)(a1 + 32) view];
      [v10 bounds];
      double v12 = v11;
      double v14 = v13;
      if (qword_46F18 != -1) {
        dispatch_once(&qword_46F18, &stru_3D240);
      }
      double v15 = *(double *)&qword_46F10;
      if (*(double *)&qword_46F10 == 0.0) {
        double v15 = 1.0;
      }
      double v16 = round(v12 * v15) / v15;
      double v17 = round(v14 * v15) / v15;

      if (v8 == v16 && v9 == v17)
      {
        uint64_t v19 = +[CKBalloonPluginManager sharedInstance];
        BOOL v20 = [*(id *)(a1 + 32) balloonExtensionPlugin];
        double v21 = [v20 identifier];

        if (v21)
        {
          char v22 = [*(id *)(a1 + 32) traitCollection];
          id v23 = [v22 userInterfaceStyle];
          double v24 = [*(id *)(a1 + 32) view];
          [v24 bounds];
          BOOL v25 = +[CKSnapshotCacheKey keyWithIdentifier:interfaceStyle:bounds:](CKSnapshotCacheKey, "keyWithIdentifier:interfaceStyle:bounds:", v21, v23);
        }
        else
        {
          BOOL v25 = 0;
        }
        id v26 = [objc_alloc((Class)UIImageView) initWithImage:*(void *)(a1 + 40)];
        id v27 = [v19 snapshotCache];
        id v28 = [v25 stringValue];
        [v27 setCachedPreview:v26 key:v28];

        id v29 = +[NSNotificationCenter defaultCenter];
        [v29 postNotificationName:CKBalloonPluginManagerSnapshotsDidChange object:0];

        id v33 = _NSConcreteStackBlock;
        uint64_t v34 = 3221225472;
        id v35 = sub_161EC;
        char v36 = &unk_3CAD8;
        id v30 = v25;
        id v37 = v30;
        id v38 = *(id *)(a1 + 40);
        id v31 = objc_retainBlock(&v33);
        if (+[CKApplicationState isApplicationActive])
        {
          uint64_t v32 = [v19 snapshotCache];
          [v32 enqueueSaveBlock:v31 withPriority:-1];
        }
        else
        {
          ((void (*)(void ***))v31[2])(v31);
        }
      }
    }
  }
}

void sub_161EC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stringValue];
  CKBrowserSnapshotPreviewURL();
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  double v3 = UIImagePNGRepresentation(*(UIImage **)(a1 + 40));
  CKFreeSpaceWriteDataToURL();
}

void sub_16314(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  double v3 = [v2 window];
  id v4 = [v3 windowScene];
  double v5 = [v4 _identifier];

  double v6 = ms_defaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    double v8 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "MSMessageExtensionBrowserViewController returning hostSceneIdentifier %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_16578(uint64_t a1)
{
  uint64_t v2 = ms_traceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_25878(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  uint64_t v10 = [*(id *)(a1 + 32) remoteProxy];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    double v12 = [*(id *)(a1 + 32) remoteProxy];
    [v12 _requestStickerExtensionMetadataDictionary:*(void *)(a1 + 40)];
  }
}

id sub_166A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestStickerExtensionMetadataDictionary:*(void *)(a1 + 40)];
}

void sub_16D9C(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = +[MSMessageExtensionDataSource messagePayloadFromPluginPayload:*(void *)(a1 + 32)];
    uint64_t v4 = [*(id *)(a1 + 40) currentConversationState];
    uint64_t v5 = ms_traceLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_259E0(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    double v13 = [v3 _sanitizedCopy];
    [*(id *)(a1 + 40) setIsWaitingForReply:1];
    double v14 = ms_defaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = [*(id *)(a1 + 40) remoteProxy];
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(v16 + 32);
      uint64_t v18 = *(void *)(v16 + 80);
      *(_DWORD *)buf = 138412802;
      id v26 = v15;
      __int16 v27 = 2112;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "requesting validation for proxy %@, remoteViewConroller %@, sessionUUID %@", buf, 0x20u);
    }
    uint64_t v19 = [*(id *)(a1 + 40) remoteProxy];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_16FAC;
    v22[3] = &unk_3D0B8;
    uint64_t v20 = *(void *)(a1 + 48);
    v22[4] = *(void *)(a1 + 40);
    id v23 = v3;
    id v24 = *(id *)(a1 + 56);
    id v21 = v3;
    [v19 _canSendMessage:v13 conversationState:v4 associatedText:v20 completion:v22];
  }
}

void sub_16FAC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  [*(id *)(a1 + 32) setIsWaitingForReply:0];
  uint64_t v9 = ms_defaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = +[NSNumber numberWithBool:a2];
    uint64_t v11 = [v7 session];
    uint64_t v12 = [v11 identifier];
    int v16 = 136316162;
    uint64_t v17 = "-[MSMessageExtensionBrowserViewController validatePayloadForSending:associatedText:completionHandler:]_block_invoke";
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    BOOL v25 = v12;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%s shouldSend %@. modifiedMessage %@. localizedInvalidationDescription %@ sessionUUID %@", (uint8_t *)&v16, 0x34u);
  }
  unsigned int v13 = [*(id *)(a1 + 32) hasEntitlement:@"com.apple.messages.private.AllowMessageSanitizationOverride"];
  uint64_t v14 = *(void *)(a1 + 40);
  if (v13) {
    [v7 _mergeSanitizedKeepingModifiedMessage:v14];
  }
  else {
    [v7 _mergeSanitizedDataFromMessage:v14];
  }
  double v15 = [*(id *)(a1 + 32) _itemPayloadFromMSMessage:v7];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) _removeRemoteViewControllerAndCancelExtensionRequestIfNeeded];
}

id sub_1728C(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = +[MSMessageExtensionDataSource messagePayloadFromPluginPayload:*(void *)(a1 + 32)];
    uint64_t v4 = [*(id *)(a1 + 40) currentConversationState];
    uint64_t v5 = ms_traceLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_25A58(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    unsigned int v13 = [*(id *)(a1 + 40) remoteProxy];
    uint64_t v14 = [v3 _sanitizedCopy];
    [v13 _didStartSendingMessage:v14 conversationState:v4];
  }
  double v15 = ms_defaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "didStartSendingPluginPayload _removeRemoteViewControllerAndCancelExtensionRequestIfNeeded ", v17, 2u);
  }

  return [*(id *)(a1 + 40) _removeRemoteViewControllerAndCancelExtensionRequestIfNeeded];
}

id sub_174C4(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = +[MSMessageExtensionDataSource messagePayloadFromPluginPayload:*(void *)(a1 + 32)];
    uint64_t v4 = [*(id *)(a1 + 40) currentConversationState];
    uint64_t v5 = ms_traceLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_25AD0(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    unsigned int v13 = [*(id *)(a1 + 40) remoteProxy];
    uint64_t v14 = [v3 _sanitizedCopy];
    [v13 _didCancelSendingMessage:v14 conversationState:v4];
  }
  double v15 = +[_MSRemoteBalloonViewControllerManager sharedInstance];
  [v15 removeShelfBalloonViewController];

  int v16 = ms_defaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v18 = 0;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "didCancelSendingPluginPayload _removeRemoteViewControllerAndCancelExtensionRequestIfNeeded ", v18, 2u);
  }

  return [*(id *)(a1 + 40) _removeRemoteViewControllerAndCancelExtensionRequestIfNeeded];
}

void sub_176D8(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(void *)(a1 + 32)
      && ([*(id *)(a1 + 40) remoteViewController],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v3,
          (isKindOfClass & 1) != 0))
    {
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v5 = [*(id *)(a1 + 40) remoteViewController];
      uint64_t v6 = v5;
      if (v5)
      {
        [v5 serviceAuditToken];
      }
      else
      {
        long long v15 = 0u;
        long long v16 = 0u;
      }

      id v8 = [objc_alloc((Class)IMSandboxedFileURL) initWithFileURL:*(void *)(a1 + 32)];
      v14[0] = v15;
      v14[1] = v16;
      [v8 authorizeForAuditToken:v14];
      uint64_t v7 = [v8 sandboxExtension];
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v9 = [*(id *)(a1 + 40) remoteProxy];
    uint64_t v10 = *(void *)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1785C;
    v12[3] = &unk_3D130;
    uint64_t v11 = *(void *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    [v9 _didSelectGPAsset:v10 sandboxExtension:v7 recipeData:v11 completion:v12];
  }
}

uint64_t sub_1785C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_179F8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) balloonExtensionPlugin];
  unsigned __int8 v3 = [v2 showInBrowser];

  if ((v3 & 1) == 0) {
    [*(id *)(a1 + 32) _removeRemoteViewControllerAndCancelExtensionRequestIfNeeded];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void sub_17A80(uint64_t a1, int a2)
{
  if (a2)
  {
    unsigned __int8 v3 = [*(id *)(a1 + 32) remoteProxy];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_17B68;
    v7[3] = &unk_3CDA8;
    id v8 = *(id *)(a1 + 56);
    [v3 _handleTextInputPayload:v4 withPayloadID:v5 completion:v7];
  }
  else
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

uint64_t sub_17B68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_17C40(uint64_t a1, int a2)
{
  if (a2)
  {
    unsigned __int8 v3 = [*(id *)(a1 + 32) remoteProxy];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_17D10;
    v5[3] = &unk_3CDA8;
    id v6 = *(id *)(a1 + 40);
    [v3 _prepareForPresentationWithCompletionHandler:v5];
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

uint64_t sub_17D10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_17E38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_17F08(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  [v2 _setPluginIdentifierToShow:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void sub_1801C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  [v2 _addStickerToStoreWithRepresentations:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

void sub_18130(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  [v2 _addStickerToStoreWithRepresentations:*(void *)(a1 + 40) completionWithStickerIDs:*(void *)(a1 + 48)];
}

void sub_1826C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  objc_msgSend(v2, "_addStickerToStoreWithRepresentations:sourceRect:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

void sub_183B8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  objc_msgSend(v2, "_addStickerToStoreWithRepresentations:sourceRect:effect:completion:", *(void *)(a1 + 40), *(void *)(a1 + 88), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

void sub_18500(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  objc_msgSend(v2, "_addStickerToStoreWithUISticker:sourceRect:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

void sub_185C8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) remoteProxy];
  [v1 _prepareForAddStickerFromSubjectLift];
}

void sub_186A0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  [v2 _addStickerAnimationDidFinishWithCompletion:*(void *)(a1 + 40)];
}

void sub_18760(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) remoteProxy];
  [v1 _didRemoveStickerPreview];
}

void sub_18848(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  [v2 _animatedStickerCreationProgressChanged:*(void *)(a1 + 40) progress:*(double *)(a1 + 48)];
}

void sub_18A04(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _canCurrentPluginShowInBrowserPluginIdentifier:*(void *)(a1 + 40)])
  {
    id v4 = [*(id *)(a1 + 32) sendDelegate];
    [v4 showBrowserForPluginIdentifier:*(void *)(a1 + 40) style:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2)
    {
      unsigned __int8 v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
}

void sub_19124(id a1)
{
  objc_msgSend(+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  qword_46F10 = v1;
}

void sub_19158(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_19190(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_19210(id a1)
{
  qword_46F20 = objc_alloc_init(_MSRemoteBalloonViewControllerManager);

  _objc_release_x1();
}

void sub_198F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
}

void sub_19950(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_19A94;
  v15[3] = &unk_3D290;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 40);
  id v16 = v9;
  uint64_t v17 = v10;
  id v18 = v11;
  id v19 = v8;
  id v20 = v7;
  id v12 = v7;
  id v13 = v8;
  id v14 = v9;
  objc_copyWeak(&v22, (id *)(a1 + 56));
  char v23 = *(unsigned char *)(a1 + 64);
  id v21 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

  objc_destroyWeak(&v22);
}

void sub_19A94(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    unsigned __int8 v3 = ms_defaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_25D38(v2, v3);
    }

    [*(id *)(*(void *)(a1 + 40) + 8) removeObjectForKey:*(void *)(a1 + 48)];
LABEL_14:
    id v11 = 0;
    goto LABEL_15;
  }
  id v4 = (void *)(a1 + 56);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = ms_defaultLog();
  id v7 = v6;
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_25CBC((uint64_t *)(a1 + 56), v7);
    }

    id v16 = +[NSString stringWithFormat:@"Remote View Controller is not of type _MSMessageExtensionRemoteViewController: %@", *v4];
    uint64_t v17 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v16 userInfo:0];
    [v17 raise];

    goto LABEL_14;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134218498;
    uint64_t v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    __int16 v22 = 2048;
    uint64_t v23 = v10;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "LiveBubble. %p Finished loading remote view for messageGUID: %@ remoteViewController %p", buf, 0x20u);
  }

  id v11 = *(id *)(a1 + 56);
  [v11 setRequestUUID:*(void *)(a1 + 64)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  [v11 setWeakExtension:WeakRetained];

  id v13 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKeyedSubscript:*(void *)(a1 + 48)];
  id v14 = +[NSNull null];
  if ([v13 isEqual:v14])
  {
    int v15 = *(unsigned __int8 *)(a1 + 88);

    if (v15) {
      [*(id *)(*(void *)(a1 + 40) + 8) setObject:v11 forKeyedSubscript:*(void *)(a1 + 48)];
    }
  }
  else
  {
  }
LABEL_15:
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void sub_1AA80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AAB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 56));
    [v8 setRemoteViewController:v6];
  }
  else
  {
    uint64_t v9 = ms_defaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      int v14 = 138412546;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "LiveBubble. Completed a remoteViewController request but %@ nil'ed out. messageGUID: %@", (uint8_t *)&v14, 0x16u);
    }

    if (v5)
    {
      [*(id *)(a1 + 48) cancelExtensionRequestWithIdentifier:v5];
    }
    else
    {
      id v12 = ms_defaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 40);
        int v14 = 138412290;
        uint64_t v15 = v13;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "LiveBubble. but nil ID %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

void sub_1BD60(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BD7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [WeakRetained payload];
    id v8 = [v7 pluginBundleID];
    LODWORD(v6) = [v6 isEqualToString:v8];

    if (v6)
    {
      if (!v3)
      {
        uint64_t v9 = [v5 payload];
        uint64_t v10 = [v9 payloadDictionary];

        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1BEB0;
        id v11[3] = &unk_3CB28;
        v11[4] = v5;
        id v3 = +[IMBalloonPlugin __ck_appIconFromPayloadDictionary:v10 withCompletionBlock:v11];
      }
      [v5[7] setImage:v3];
    }
  }
}

void sub_1BEB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1BF54;
    v5[3] = &unk_3CAD8;
    void v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

id sub_1BF54(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) setImage:*(void *)(a1 + 40)];
}

void sub_1C8E8(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v11 = a3;
  id v12 = a4;
  if (!v12 && a6 && (a5 & 1) != 0)
  {
    id v38 = a2;
    uint64_t v37 = IMExtensionPayloadUnarchivingClasses();
    uint64_t v13 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:");
    id v35 = 0;
    id v14 = objc_alloc_init((Class)LPLinkMetadata);
    id v36 = v11;
    uint64_t v15 = +[NSURL URLWithString:v11];
    [v14 setURL:v15];

    uint64_t v39 = v13;
    __int16 v16 = [v13 objectForKeyedSubscript:IMExtensionPayloadLocalizedDescriptionTextKey];
    [v14 setTitle:v16];

    uint64_t v17 = [*(id *)(a1 + 40) firstObject];
    id v18 = +[NSData dataWithContentsOfURL:v17];
    if (v18)
    {
      PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (CFStringRef)[v17 pathExtension], 0);
      __int16 v20 = (__CFString *)UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, kUTTagClassMIMEType);
      id v21 = [objc_alloc((Class)LPImage) initWithData:v18 MIMEType:v20];
      [v14 setImage:v21];
    }
    id v22 = objc_alloc_init((Class)IMPluginPayload);
    [v22 setPluginBundleID:IMBalloonPluginIdentifierRichLinks];
    uint64_t v23 = [v14 URL];
    [v22 setUrl:v23];

    __int16 v24 = [v14 dataRepresentation];
    [v22 setData:v24];

    BOOL v25 = +[IMBalloonPluginManager sharedInstance];
    id v26 = [v25 dataSourceForPluginPayload:v22];

    [v26 payloadWillSendFromShelf];
    __int16 v27 = [v26 messagePayloadDataForSending];
    uint64_t v28 = *(void **)(a1 + 48);
    __int16 v29 = +[NSString stringGUID];
    uint64_t v30 = [v28 URLByAppendingPathComponent:v29];

    [v27 writeToURL:v30 atomically:1];
    id v31 = +[NSMutableArray arrayWithArray:v38];

    [v31 addObject:v30];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    id v11 = v36;
    id v32 = (id)v37;
    id v12 = v35;
  }
  else
  {
    uint64_t v33 = *(void *)(a1 + 56);
    uint64_t v34 = *(void (**)(uint64_t, id, id, id, uint64_t, uint64_t))(v33 + 16);
    id v32 = a2;
    v34(v33, v32, v11, v12, a5, a6);
  }
}

void sub_1D158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D19C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained dataSource];
  objc_msgSend(WeakRetained, "setAllowedByScreenTime:", objc_msgSend(v1, "allowedByScreenTime"));

  [WeakRetained setNeedsLayout];
  [WeakRetained layoutIfNeeded];
}

void sub_1D210(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (!v3)
    {
      id v6 = [WeakRetained dataSource];
      unsigned __int8 v7 = [v6 parentChatHasAllUnknownRecipients];

      if ((v7 & 1) == 0)
      {
        id v12 = [v5 payload];
        id v11 = [v12 payloadDictionary];

        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1D3A4;
        v15[3] = &unk_3CB28;
        id v13 = v5;
        id v16 = v13;
        id v3 = +[IMBalloonPlugin __ck_appIconFromPayloadDictionary:v11 pluginBundleID:0 withCompletionBlock:v15];
        if (v3)
        {
          id v14 = [v13 iconView];
          [v14 setImage:v3];
        }
        goto LABEL_9;
      }
    }
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v5 payload];
    uint64_t v10 = [v9 pluginBundleID];
    LODWORD(v8) = [v8 isEqualToString:v10];

    if (v8)
    {
      id v11 = [v5 iconView];
      [v11 setImage:v3];
LABEL_9:
    }
  }
}

void sub_1D3A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1D454;
    v4[3] = &unk_3CAD8;
    id v5 = *(id *)(a1 + 32);
    id v6 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

void sub_1D454(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) iconView];
  [v2 setImage:v1];
}

void sub_1DB1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB40(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) identifier];
    LODWORD(v4) = [v4 isEqualToString:v5];

    if (v4)
    {
      id v6 = [WeakRetained iconView];
      [v6 setImage:v7];
    }
  }
}

void sub_1EC8C(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)(v2 - 128) = 138412290;
        *(void *)(v2 - 124) = v3;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Exception thrown processing message payload %@", (uint8_t *)(v2 - 128), 0xCu);
      }
    }
    objc_end_catch();
    JUMPOUT(0x1EC38);
  }
  _Unwind_Resume(exception_object);
}

void sub_1F954(id a1)
{
  uint64_t v1 = -[MSMessageExtensionBalloonView initWithFrame:dataSource:fromMe:]([MSMessageExtensionBalloonView alloc], "initWithFrame:dataSource:fromMe:", 0, 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  uint64_t v2 = qword_46F30;
  qword_46F30 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

uint64_t sub_20760(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_217B8(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) isPhotosExtensionBrowser];
  id v3 = ms_defaultLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) length];
      CFStringRef v6 = @"YES";
      uint64_t v7 = *(void *)(a1 + 48);
      if (*(unsigned char *)(a1 + 56)) {
        CFStringRef v8 = @"YES";
      }
      else {
        CFStringRef v8 = @"NO";
      }
      *(_DWORD *)buf = 134218498;
      id v27 = v5;
      if (v7) {
        CFStringRef v6 = @"NO";
      }
      __int16 v28 = 2112;
      CFStringRef v29 = v8;
      __int16 v30 = 2112;
      CFStringRef v31 = v6;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Call to _stageAssetArchive: %tu skipShelf: %@ completionHandler: %@", buf, 0x20u);
    }

    if (!qword_46F48) {
      qword_46F48 = IMWeakLinkClass();
    }
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = *(void *)(a1 + 40);
    id v24 = 0;
    id v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v9 fromData:v10 error:&v24];
    id v12 = v24;
    if (v11)
    {
      if (!*(unsigned char *)(a1 + 56))
      {
        [*(id *)(a1 + 32) stageAssetToTransportAndNotifySendDelegate:v11];
        goto LABEL_28;
      }
      id v13 = [v11 browserItemPayload];
      if (v13)
      {
        id v14 = objc_alloc_init((Class)CKBrowserItemPayload);
        BOOL v25 = v13;
        uint64_t v15 = +[NSArray arrayWithObjects:&v25 count:1];
        [v14 setAttachments:v15];

        id v16 = [*(id *)(a1 + 32) sendDelegate];
        uint64_t v17 = [*(id *)(a1 + 32) balloonExtensionPlugin];
        id v18 = [v17 identifier];
        [v16 commitPayload:v14 forPlugin:v18 allowAllCommits:1 completionHandler:*(void *)(a1 + 48)];

LABEL_30:
        goto LABEL_31;
      }
      if (!IMOSLoggingEnabled())
      {
LABEL_28:
        uint64_t v23 = *(void *)(a1 + 48);
        if (v23) {
          (*(void (**)(uint64_t, void))(v23 + 16))(v23, 0);
        }
        goto LABEL_30;
      }
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        id v27 = v22;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Failed to convert asset %@ into a CKBrowserItemPayload!", buf, 0xCu);
      }
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_28;
      }
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v12;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Asset package unarchive error! %@", buf, 0xCu);
      }
    }

    goto LABEL_28;
  }
  if (v4)
  {
    uint64_t v19 = [*(id *)(a1 + 32) balloonExtensionPlugin];
    __int16 v20 = [v19 identifier];
    *(_DWORD *)buf = 138412290;
    id v27 = v20;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Dispatching call from %@ to Photos extension browser", buf, 0xCu);
  }
  if ([*(id *)(a1 + 32) isFromValidExtension])
  {
    id v12 = [*(id *)(a1 + 32) sendDelegate];
    [v12 stageAssetArchive:*(void *)(a1 + 40) skipShelf:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
LABEL_31:
  }
}

void sub_21D90(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPhotosExtensionBrowser])
  {
    unsigned int v2 = [*(id *)(a1 + 32) assetExplorerTransport];
    [v2 unstagePackageWithIdentifier:*(void *)(a1 + 40) andNotify:0];

    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      BOOL v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    id v5 = ms_defaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = [*(id *)(a1 + 32) balloonExtensionPlugin];
      uint64_t v7 = [v6 identifier];
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Dispatching call from %@ to Photos extension browser", (uint8_t *)&v9, 0xCu);
    }
    if ([*(id *)(a1 + 32) isFromValidExtension])
    {
      CFStringRef v8 = [*(id *)(a1 + 32) sendDelegate];
      [v8 removeAssetArchiveWithIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    }
  }
}

id *sub_22420(id *result, char a2)
{
  if ((a2 & 1) == 0) {
    return (id *)[result[4] fetchPluginPayloadsAndClear:1];
  }
  return result;
}

id sub_2280C(uint64_t a1)
{
  [*(id *)(a1 + 32) willMoveToParentViewController:0];
  [*(id *)(a1 + 40) removeFromSuperview];
  unsigned int v2 = *(void **)(a1 + 32);

  return [v2 removeFromParentViewController];
}

id sub_232B4()
{
  return sub_24260(0, type metadata accessor for ReportTouchOperation);
}

id variable initialization expression of TouchTracker.queue()
{
  id v0 = objc_allocWithZone((Class)NSOperationQueue);

  return [v0 init];
}

uint64_t variable initialization expression of TouchTracker._hasTouch()
{
  return 0;
}

uint64_t sub_23324(char a1)
{
  uint64_t v2 = sub_25EF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  id v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25ED0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  int v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25EC0();
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(unsigned char *)(v11 + 24) = a1;
  aBlock[4] = sub_247A4;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235E8;
  aBlock[3] = &unk_3D638;
  id v12 = _Block_copy(aBlock);
  swift_retain();
  sub_25EE0();
  sub_25F60();
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();
  return swift_release();
}

void sub_23588(uint64_t a1, char a2)
{
  swift_beginAccess();
  Strong = (unsigned char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    Strong[OBJC_IVAR___MSTouchTracker__hasTouch] = a2 & 1;
  }
}

uint64_t variable initialization expression of TouchTracker.propertyQueue()
{
  uint64_t v0 = sub_25F30();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25EF0();
  __chkstk_darwin();
  sub_25F20();
  __chkstk_darwin();
  sub_23BF8(0, &qword_46DB8);
  sub_25F10();
  sub_25EE0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  return sub_25F70();
}

id TouchTracker.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

char *TouchTracker.init()()
{
  uint64_t v1 = sub_25F30();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25EF0();
  __chkstk_darwin();
  sub_25F20();
  __chkstk_darwin();
  uint64_t v5 = OBJC_IVAR___MSTouchTracker_queue;
  id v6 = objc_allocWithZone((Class)NSOperationQueue);
  uint64_t v7 = v0;
  *(void *)&v0[v5] = [v6 init];
  v7[OBJC_IVAR___MSTouchTracker__hasTouch] = 0;
  uint64_t v8 = OBJC_IVAR___MSTouchTracker_propertyQueue;
  sub_23BF8(0, &qword_46DB8);
  sub_25F10();
  sub_25EE0();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  *(void *)&v7[v8] = sub_25F70();

  int v9 = (objc_class *)type metadata accessor for TouchTracker();
  v12.receiver = v7;
  v12.super_class = v9;
  uint64_t v10 = (char *)objc_msgSendSuper2(&v12, "init");
  [*(id *)&v10[OBJC_IVAR___MSTouchTracker_queue] setMaxConcurrentOperationCount:1];
  return v10;
}

uint64_t type metadata accessor for TouchTracker()
{
  return self;
}

Swift::Void __swiftcall TouchTracker.touchReceived()()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___MSTouchTracker_queue);
  if ((uint64_t)[v1 operationCount] >= 1)
  {
    id v2 = [v1 operations];
    sub_23BF8(0, &qword_46DD8);
    unint64_t v3 = sub_25F00();

    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_25FA0();
      swift_bridgeObjectRelease();
      if (v4) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
      if (v4)
      {
LABEL_4:
        if (v4 < 1)
        {
          __break(1u);
          return;
        }
        for (uint64_t i = 0; i != v4; ++i)
        {
          if ((v3 & 0xC000000000000001) != 0) {
            id v6 = (id)sub_25F90();
          }
          else {
            id v6 = *(id *)(v3 + 8 * i + 32);
          }
          uint64_t v7 = v6;
          type metadata accessor for ReportTouchOperation();
          uint64_t v8 = swift_dynamicCastClass();
          if (v8) {
            *(unsigned char *)(v8
          }
                     + OBJC_IVAR____TtC31MSMessageExtensionBalloonPluginP33_34F0067A36E85448CF72AC3F6D0A6D7420ReportTouchOperation_hasTouch) = 1;
        }
      }
    }
    swift_bridgeObjectRelease();
    return;
  }

  sub_23324(1);
}

uint64_t sub_23BF8(uint64_t a1, unint64_t *a2)
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

uint64_t type metadata accessor for ReportTouchOperation()
{
  return self;
}

void TouchTracker.checkForTouch(completion:)(void (*a1)(uint64_t), uint64_t a2)
{
  unint64_t v3 = v2;
  sub_25F50();
  if (LOBYTE(aBlock[0]) == 1)
  {
    sub_23324(0);
    a1(1);
  }
  else
  {
    id v6 = *(void **)&v2[OBJC_IVAR___MSTouchTracker_queue];
    aBlock[4] = sub_23E88;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_235E8;
    aBlock[3] = &unk_3D4D0;
    uint64_t v7 = _Block_copy(aBlock);
    [v6 addOperationWithBlock:v7];
    _Block_release(v7);
    uint64_t v8 = (uint64_t (*)(char))swift_allocObject();
    *((void *)v8 + 2) = v3;
    *((void *)v8 + 3) = a1;
    *((void *)v8 + 4) = a2;
    int v9 = (objc_class *)type metadata accessor for ReportTouchOperation();
    uint64_t v10 = objc_allocWithZone(v9);
    v10[OBJC_IVAR____TtC31MSMessageExtensionBalloonPluginP33_34F0067A36E85448CF72AC3F6D0A6D7420ReportTouchOperation_hasTouch] = 0;
    uint64_t v11 = (uint64_t (**)(char))&v10[OBJC_IVAR____TtC31MSMessageExtensionBalloonPluginP33_34F0067A36E85448CF72AC3F6D0A6D7420ReportTouchOperation_work];
    void *v11 = sub_2418C;
    v11[1] = v8;
    v14.receiver = v10;
    v14.super_class = v9;
    id v12 = v3;
    swift_retain();
    id v13 = objc_msgSendSuper2(&v14, "init");
    [v6 addOperation:v13];
  }
}

void sub_23E70(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(*(void *)(v1 + 16) + OBJC_IVAR___MSTouchTracker__hasTouch);
}

id sub_23E88()
{
  uint64_t v0 = self;

  return [v0 sleepForTimeInterval:0.1];
}

uint64_t sub_23EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_23ED8()
{
  return swift_release();
}

uint64_t sub_23EE0(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_25ED0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_25EF0();
  uint64_t v11 = *(void *)(v19 - 8);
  __chkstk_darwin();
  id v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23324(0);
  sub_23BF8(0, &qword_46DB8);
  objc_super v14 = (void *)sub_25F40();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  *(unsigned char *)(v15 + 32) = a1;
  aBlock[4] = sub_245C4;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235E8;
  aBlock[3] = &unk_3D5C0;
  id v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_25EE0();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_245F4();
  sub_2464C(&qword_46E48);
  sub_24690();
  sub_25F80();
  sub_25F60();
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v19);
}

uint64_t sub_2418C(char a1)
{
  return sub_23EE0(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_24198(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id TouchTracker.__deallocating_deinit(uint64_t a1)
{
  return sub_24260(a1, type metadata accessor for TouchTracker);
}

id sub_24260(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

void sub_242E4(char *a1, void (**a2)(void, void))
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  _Block_copy(a2);
  sub_25F50();
  if (LOBYTE(aBlock[0]) == 1)
  {
    sub_23324(0);
    a2[2](a2, 1);
    swift_release();
  }
  else
  {
    uint64_t v5 = *(void **)&a1[OBJC_IVAR___MSTouchTracker_queue];
    aBlock[4] = sub_23E88;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_235E8;
    aBlock[3] = &unk_3D548;
    id v6 = _Block_copy(aBlock);
    [v5 addOperationWithBlock:v6];
    _Block_release(v6);
    uint64_t v7 = (uint64_t (*)(char))swift_allocObject();
    *((void *)v7 + 2) = a1;
    *((void *)v7 + 3) = sub_24530;
    *((void *)v7 + 4) = v4;
    uint64_t v8 = (objc_class *)type metadata accessor for ReportTouchOperation();
    uint64_t v9 = objc_allocWithZone(v8);
    v9[OBJC_IVAR____TtC31MSMessageExtensionBalloonPluginP33_34F0067A36E85448CF72AC3F6D0A6D7420ReportTouchOperation_hasTouch] = 0;
    uint64_t v10 = (uint64_t (**)(char))&v9[OBJC_IVAR____TtC31MSMessageExtensionBalloonPluginP33_34F0067A36E85448CF72AC3F6D0A6D7420ReportTouchOperation_work];
    char *v10 = sub_247B0;
    v10[1] = v7;
    v13.receiver = v9;
    v13.super_class = v8;
    uint64_t v11 = a1;
    swift_retain();
    id v12 = objc_msgSendSuper2(&v13, "init");
    [v5 addOperation:v12];
    swift_release();
  }
}

uint64_t sub_244F8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_24530(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_2454C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_2458C()
{
  swift_release();

  return _swift_deallocObject(v0, 33, 7);
}

uint64_t sub_245C4()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(unsigned __int8 *)(v0 + 32));
}

unint64_t sub_245F4()
{
  unint64_t result = qword_46E40;
  if (!qword_46E40)
  {
    sub_25ED0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_46E40);
  }
  return result;
}

uint64_t sub_2464C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_24690()
{
  unint64_t result = qword_46E50;
  if (!qword_46E50)
  {
    sub_246EC(&qword_46E48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_46E50);
  }
  return result;
}

uint64_t sub_246EC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24734()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_2476C()
{
  swift_release();

  return _swift_deallocObject(v0, 25, 7);
}

void sub_247A4()
{
  sub_23588(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

void sub_247C0(unsigned char *a1@<X8>)
{
}

uint64_t sub_247E4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_24818()
{
  sub_D2C0();
  sub_D2A4(&dword_0, v0, v1, "LiveBubble. Calling createRemoteBalloonViewControllerIsResuming: from viewDidAppear:.", v2, v3, v4, v5, v6);
}

void sub_2484C()
{
  sub_D2C0();
  sub_D2A4(&dword_0, v0, v1, "LiveBubble. Calling createRemoteBalloonViewControllerIsResuming: from reloadRemoteViewIsResuming:.", v2, v3, v4, v5, v6);
}

void sub_24880()
{
  sub_D2C0();
  sub_D2A4(&dword_0, v0, v1, "LiveBubble. Calling createRemoteBalloonViewControllerIsResuming: from initWithDataSource:.", v2, v3, v4, v5, v6);
}

void sub_248B4()
{
  sub_D2C0();
  sub_D2A4(&dword_0, v0, v1, "LiveBubble. Calling createRemoteBalloonViewControllerIsResuming: from _handleApplicationStateResumeFromInActive:.", v2, v3, v4, v5, v6);
}

void sub_248E8()
{
  sub_D298();
  sub_D27C(&dword_0, v0, v1, "MSMessageExtensionBalloonLiveViewController invalid message item with error %@", v2, v3, v4, v5, v6);
}

void sub_24950()
{
  sub_D298();
  sub_D27C(&dword_0, v0, v1, "MSMessageExtensionBalloonLiveViewController invalid sticker with error %@", v2, v3, v4, v5, v6);
}

void sub_249B8()
{
  sub_D298();
  sub_D27C(&dword_0, v0, v1, "MSMessageExtensionBalloonLiveViewController Invalid sticker with error %@", v2, v3, v4, v5, v6);
}

void sub_24A20()
{
  sub_D298();
  sub_D27C(&dword_0, v0, v1, "MSMessageExtensionBalloonLiveViewController invalid payload with error %@", v2, v3, v4, v5, v6);
}

void sub_24A88()
{
  sub_D298();
  sub_D27C(&dword_0, v0, v1, "MSMessageExtensionBalloonLiveViewController missing entitlement %@", v2, v3, v4, v5, v6);
}

void sub_24AF0(id *a1, id *a2, NSObject *a3)
{
  id v5 = [*a1 count];
  id v6 = [*a2 count];
  int v7 = 134218240;
  id v8 = v5;
  __int16 v9 = 2048;
  id v10 = v6;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "MSMessageExtensionBalloonLiveViewController mismatched count four button titles(%lu) and images(%lu)", (uint8_t *)&v7, 0x16u);
}

void sub_24BA4(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [*(id *)(a1 + 56) messageGUID];
  sub_D298();
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "LiveBubble. View has not yet been added to a window when trying to set the remote balloon view. messageGUID: %@", v4, 0xCu);
}

void sub_24C44()
{
  sub_D298();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "LiveBubble. Extension will be used to create remote balloon view controller with identifier: %@", v1, 0xCu);
}

void sub_24CB8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 identifier];
  sub_D298();
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "LiveBubble. Plugin extension loaded. bundleID: %@", v4, 0xCu);
}

void sub_24D4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24DC4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Skipping _addRemoteViewController, we don't have a remote view controller to add!", v1, 2u);
}

void sub_24E08(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24E80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24EF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24F70(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24FE8()
{
  sub_191B0();
  uint64_t v1 = [v0 balloonPlugin];
  uint64_t v2 = [v1 identifier];
  sub_19174();
  sub_19190(&dword_0, v3, v4, "%s %@ %@", v5, v6, v7, v8, 2u);
}

void sub_250B0()
{
  sub_191B0();
  uint64_t v1 = [v0 balloonPlugin];
  uint64_t v2 = [v1 identifier];
  sub_19174();
  sub_19190(&dword_0, v3, v4, "%s %@ %@", v5, v6, v7, v8, 2u);
}

void sub_25178()
{
  sub_191B0();
  uint64_t v1 = [v0 balloonPlugin];
  uint64_t v2 = [v1 identifier];
  sub_19174();
  sub_19190(&dword_0, v3, v4, "%s %@ %@", v5, v6, v7, v8, 2u);
}

void sub_25240()
{
  sub_191B0();
  uint64_t v1 = [v0 balloonPlugin];
  uint64_t v2 = [v1 identifier];
  sub_19174();
  sub_19190(&dword_0, v3, v4, "%s %@ %@", v5, v6, v7, v8, 2u);
}

void sub_25308(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25380(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_253F8()
{
  sub_D298();
  sub_19158(&dword_0, v0, v1, "Finished _saveSnapshotForBrowserViewController:, %@", v2, v3, v4, v5, v6);
}

void sub_25460()
{
  sub_D298();
  sub_D27C(&dword_0, v0, v1, "MSMessageExtensionBrowserViewController not valid message item with error %@", v2, v3, v4, v5, v6);
}

void sub_254C8()
{
  sub_D298();
  sub_D27C(&dword_0, v0, v1, "MSBrowserVC invalid payload with error %@", v2, v3, v4, v5, v6);
}

void sub_25530()
{
  sub_D298();
  sub_D27C(&dword_0, v0, v1, "MSBrowserVC invalid presentation context with error %@", v2, v3, v4, v5, v6);
}

void sub_25598(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Allowing dismiss from modal presentation to a card presentation", v1, 2u);
}

void sub_255DC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "MSMessageExtensionBrowserViewController: Unsupported! Attempted to request different presentation style from full screen modal", v1, 2u);
}

void sub_25620(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25698(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25710(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25788(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25800(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25878(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_258F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25968(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_259E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25A58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25AD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25B48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25BC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25C38()
{
  sub_D298();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "INVALID SHOW BROWSER REQUEST FROM PLUGIN %@ TO SHOW PLUGIN %@", v2, 0x16u);
}

void sub_25CBC(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "LiveBubble. Remote View Controller is not of type _MSMessageExtensionRemoteViewController: %@", (uint8_t *)&v3, 0xCu);
}

void sub_25D38(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "LiveBubble. Failed to get remote view controller: %@", (uint8_t *)&v3, 0xCu);
}

void sub_25DB4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[_MSRemoteBalloonViewController _sendResignActiveMessage]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

void sub_25E38(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "nil balloonControllerDelegate in sizeThatFits", v1, 2u);
}

void sub_25E7C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "_configurePhotosDraftAssetArchivesWithConversationID: Called on a non-Photos extension. Only the photos extension is supported for retrieving draft asset archives. This should be dispatched through the sendDelegate", v1, 2u);
}

uint64_t sub_25EC0()
{
  return static DispatchWorkItemFlags.barrier.getter();
}

uint64_t sub_25ED0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_25EE0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_25EF0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_25F00()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_25F10()
{
  return static OS_dispatch_queue.Attributes.concurrent.getter();
}

uint64_t sub_25F20()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_25F30()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_25F40()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_25F50()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_25F60()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_25F70()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_25F80()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_25F90()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_25FA0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CKBrowserSnapshotPreviewURL()
{
  return _CKBrowserSnapshotPreviewURL();
}

uint64_t CKFreeSpaceWriteDataToURL()
{
  return _CKFreeSpaceWriteDataToURL();
}

uint64_t CKIsAppCardsEnabled()
{
  return _CKIsAppCardsEnabled();
}

uint64_t CKIsRunningInCameraAppsClient()
{
  return _CKIsRunningInCameraAppsClient();
}

uint64_t CKIsRunningInCarousel()
{
  return _CKIsRunningInCarousel();
}

uint64_t CKIsRunningInFullCKClient()
{
  return _CKIsRunningInFullCKClient();
}

uint64_t CKIsRunningInMacCatalyst()
{
  return _CKIsRunningInMacCatalyst();
}

uint64_t CKIsRunningInMessages()
{
  return _CKIsRunningInMessages();
}

uint64_t CKIsRunningInMessagesViewService()
{
  return _CKIsRunningInMessagesViewService();
}

uint64_t CKIsRunningInUserGeneratedStickersExtension()
{
  return _CKIsRunningInUserGeneratedStickersExtension();
}

uint64_t CKShouldShowSURF()
{
  return _CKShouldShowSURF();
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return _IMBalloonExtensionIDWithSuffix();
}

uint64_t IMBalloonPluginRequiredCapabilitiesWithPayloadDictionary()
{
  return _IMBalloonPluginRequiredCapabilitiesWithPayloadDictionary();
}

uint64_t IMExtensionPayloadUnarchivingClasses()
{
  return _IMExtensionPayloadUnarchivingClasses();
}

uint64_t IMGetDomainBoolForKey()
{
  return _IMGetDomainBoolForKey();
}

uint64_t IMLogHandleForCategory()
{
  return _IMLogHandleForCategory();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

uint64_t IMSharedHelperAppDisabledBundleIDsForAppCardSwipeGesture()
{
  return _IMSharedHelperAppDisabledBundleIDsForAppCardSwipeGesture();
}

uint64_t IMStickersExtensionIdentifier()
{
  return _IMStickersExtensionIdentifier();
}

uint64_t IMWeakLinkClass()
{
  return _IMWeakLinkClass();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return _UTTypeConformsTo(inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return _UTTypeCopyPreferredTagWithClass(inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return _UTTypeCreatePreferredIdentifierForTag(inTagClass, inTag, inConformingToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _IMWarn()
{
  return __IMWarn();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t im_dispatch_after()
{
  return _im_dispatch_after();
}

uint64_t ms_defaultLog()
{
  return _ms_defaultLog();
}

uint64_t ms_traceLog()
{
  return _ms_traceLog();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend___ck_appIconFromPayloadDictionary_pluginBundleID_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__ck_appIconFromPayloadDictionary:pluginBundleID:withCompletionBlock:");
}

id objc_msgSend___ck_appIconFromPayloadDictionary_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__ck_appIconFromPayloadDictionary:withCompletionBlock:");
}

id objc_msgSend___ck_browserImageForInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__ck_browserImageForInterfaceStyle:");
}

id objc_msgSend___ck_generateStatusImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__ck_generateStatusImage:");
}

id objc_msgSend___ck_statusJPEGImageDataForTransportWithCompressionFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__ck_statusJPEGImageDataForTransportWithCompressionFactor:");
}

id objc_msgSend___mainThreadPostNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__mainThreadPostNotificationName:object:");
}

id objc_msgSend___ms_conformsToUTI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__ms_conformsToUTI:");
}

id objc_msgSend__addRemoteViewController(void *a1, const char *a2, ...)
{
  return _[a1 _addRemoteViewController];
}

id objc_msgSend__addRemoteViewControllerAndConfigureExtension(void *a1, const char *a2, ...)
{
  return _[a1 _addRemoteViewControllerAndConfigureExtension];
}

id objc_msgSend__addStickerAnimationDidFinishWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addStickerAnimationDidFinishWithCompletion:");
}

id objc_msgSend__addStickerToStoreWithRepresentations_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addStickerToStoreWithRepresentations:completionHandler:");
}

id objc_msgSend__addStickerToStoreWithRepresentations_completionWithStickerIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addStickerToStoreWithRepresentations:completionWithStickerIDs:");
}

id objc_msgSend__addStickerToStoreWithRepresentations_sourceRect_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addStickerToStoreWithRepresentations:sourceRect:completion:");
}

id objc_msgSend__addStickerToStoreWithRepresentations_sourceRect_effect_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addStickerToStoreWithRepresentations:sourceRect:effect:completion:");
}

id objc_msgSend__addStickerToStoreWithUISticker_sourceRect_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addStickerToStoreWithUISticker:sourceRect:completion:");
}

id objc_msgSend__allowAllPresentationStyles(void *a1, const char *a2, ...)
{
  return _[a1 _allowAllPresentationStyles];
}

id objc_msgSend__animatedStickerCreationProgressChanged_progress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animatedStickerCreationProgressChanged:progress:");
}

id objc_msgSend__applicationStateIsBackground(void *a1, const char *a2, ...)
{
  return _[a1 _applicationStateIsBackground];
}

id objc_msgSend__arrayForApplePlistKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_arrayForApplePlistKey:");
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return _[a1 _auxiliaryConnection];
}

id objc_msgSend__becomeActiveWithConversationState_presentationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_becomeActiveWithConversationState:presentationState:");
}

id objc_msgSend__bundleIDsForSwipeGestureDisablement(void *a1, const char *a2, ...)
{
  return _[a1 _bundleIDsForSwipeGestureDisablement];
}

id objc_msgSend__callAndDequeueLoadCompletionBlocks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callAndDequeueLoadCompletionBlocks:");
}

id objc_msgSend__canCurrentPluginShowInBrowserPluginIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canCurrentPluginShowInBrowserPluginIdentifier:");
}

id objc_msgSend__canSendMessage_conversationState_associatedText_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canSendMessage:conversationState:associatedText:completion:");
}

id objc_msgSend__cancelExtensionRequest(void *a1, const char *a2, ...)
{
  return _[a1 _cancelExtensionRequest];
}

id objc_msgSend__cancelTouchesForCurrentEventInHostedContent(void *a1, const char *a2, ...)
{
  return _[a1 _cancelTouchesForCurrentEventInHostedContent];
}

id objc_msgSend__configureMessage_withConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureMessage:withConversation:");
}

id objc_msgSend__configurePhotosDraftAssetArchivesWithConversationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configurePhotosDraftAssetArchivesWithConversationID:");
}

id objc_msgSend__conversationDidChangeWithConversationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_conversationDidChangeWithConversationState:");
}

id objc_msgSend__didCancelSendingMessage_conversationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didCancelSendingMessage:conversationState:");
}

id objc_msgSend__didReceiveMessage_conversationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didReceiveMessage:conversationState:");
}

id objc_msgSend__didRemoveAssetArchiveWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didRemoveAssetArchiveWithIdentifier:");
}

id objc_msgSend__didRemoveStickerPreview(void *a1, const char *a2, ...)
{
  return _[a1 _didRemoveStickerPreview];
}

id objc_msgSend__didSelectGPAsset_sandboxExtension_recipeData_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didSelectGPAsset:sandboxExtension:recipeData:completion:");
}

id objc_msgSend__didStartSendingMessage_conversationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didStartSendingMessage:conversationState:");
}

id objc_msgSend__didUpdateMessage_conversationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didUpdateMessage:conversationState:");
}

id objc_msgSend__dropAssertion(void *a1, const char *a2, ...)
{
  return _[a1 _dropAssertion];
}

id objc_msgSend__enableStrictSecureDecodingMode(void *a1, const char *a2, ...)
{
  return _[a1 _enableStrictSecureDecodingMode];
}

id objc_msgSend__extensionContextForUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extensionContextForUUID:");
}

id objc_msgSend__handleTextInputPayload_withPayloadID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleTextInputPayload:withPayloadID:completion:");
}

id objc_msgSend__hasValidSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 _hasValidSnapshot];
}

id objc_msgSend__hostDidBeginDeferredTeardown(void *a1, const char *a2, ...)
{
  return _[a1 _hostDidBeginDeferredTeardown];
}

id objc_msgSend__iMessageLoginID(void *a1, const char *a2, ...)
{
  return _[a1 _iMessageLoginID];
}

id objc_msgSend__identifier(void *a1, const char *a2, ...)
{
  return _[a1 _identifier];
}

id objc_msgSend__initializeContentSize(void *a1, const char *a2, ...)
{
  return _[a1 _initializeContentSize];
}

id objc_msgSend__initializeStaticView(void *a1, const char *a2, ...)
{
  return _[a1 _initializeStaticView];
}

id objc_msgSend__instantiateRemoteViewControllerIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_instantiateRemoteViewControllerIfNeeded:");
}

id objc_msgSend__instantiateRemoteViewControllerIfNeededWithIntent_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_instantiateRemoteViewControllerIfNeededWithIntent:completion:");
}

id objc_msgSend__isInShelf(void *a1, const char *a2, ...)
{
  return _[a1 _isInShelf];
}

id objc_msgSend__isShowingLoadingView(void *a1, const char *a2, ...)
{
  return _[a1 _isShowingLoadingView];
}

id objc_msgSend__itemPayloadFromMSMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_itemPayloadFromMSMessage:");
}

id objc_msgSend__kill_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_kill:");
}

id objc_msgSend__linkMetadata(void *a1, const char *a2, ...)
{
  return _[a1 _linkMetadata];
}

id objc_msgSend__makeDelegateCallForBrowserPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_makeDelegateCallForBrowserPresentationStyle:");
}

id objc_msgSend__markCurrentMessageAsPlayedIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _markCurrentMessageAsPlayedIfNeeded];
}

id objc_msgSend__maxAppMessageURLength(void *a1, const char *a2, ...)
{
  return _[a1 _maxAppMessageURLength];
}

id objc_msgSend__maxStickerFileSize(void *a1, const char *a2, ...)
{
  return _[a1 _maxStickerFileSize];
}

id objc_msgSend__mergeSanitizedDataFromMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mergeSanitizedDataFromMessage:");
}

id objc_msgSend__mergeSanitizedKeepingModifiedMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mergeSanitizedKeepingModifiedMessage:");
}

id objc_msgSend__minStickerFileSize(void *a1, const char *a2, ...)
{
  return _[a1 _minStickerFileSize];
}

id objc_msgSend__prepareForAddStickerFromSubjectLift(void *a1, const char *a2, ...)
{
  return _[a1 _prepareForAddStickerFromSubjectLift];
}

id objc_msgSend__prepareForPresentationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareForPresentationWithCompletionHandler:");
}

id objc_msgSend__presentationDidChangeToPresentationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentationDidChangeToPresentationState:");
}

id objc_msgSend__presentationWillChangeToPresentationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentationWillChangeToPresentationState:");
}

id objc_msgSend__remoteProxy(void *a1, const char *a2, ...)
{
  return _[a1 _remoteProxy];
}

id objc_msgSend__removeRemoteViewController(void *a1, const char *a2, ...)
{
  return _[a1 _removeRemoteViewController];
}

id objc_msgSend__removeRemoteViewControllerAndCancelExtensionRequestIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _removeRemoteViewControllerAndCancelExtensionRequestIfNeeded];
}

id objc_msgSend__replaceHandleWithContactNameInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_replaceHandleWithContactNameInString:");
}

id objc_msgSend__requestContentSizeThatFits_presentationStyle_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestContentSizeThatFits:presentationStyle:completionHandler:");
}

id objc_msgSend__requestPresentationWithStickerType_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestPresentationWithStickerType:identifier:");
}

id objc_msgSend__requestSnapshotThatFits_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestSnapshotThatFits:completion:");
}

id objc_msgSend__requestSnapshotWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestSnapshotWithCompletion:");
}

id objc_msgSend__requestStickerExtensionMetadataDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestStickerExtensionMetadataDictionary:");
}

id objc_msgSend__resignActive(void *a1, const char *a2, ...)
{
  return _[a1 _resignActive];
}

id objc_msgSend__sanitize(void *a1, const char *a2, ...)
{
  return _[a1 _sanitize];
}

id objc_msgSend__sanitizedCopy(void *a1, const char *a2, ...)
{
  return _[a1 _sanitizedCopy];
}

id objc_msgSend__sceneIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _sceneIdentifier];
}

id objc_msgSend__sendBecomeActiveMessage(void *a1, const char *a2, ...)
{
  return _[a1 _sendBecomeActiveMessage];
}

id objc_msgSend__sendInstantiationRequestToExtensionWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendInstantiationRequestToExtensionWithHandler:");
}

id objc_msgSend__sendResignActiveMessage(void *a1, const char *a2, ...)
{
  return _[a1 _sendResignActiveMessage];
}

id objc_msgSend__setApplyCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setApplyCornerRadius:");
}

id objc_msgSend__setDisableTapGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDisableTapGesture:");
}

id objc_msgSend__setHostBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHostBundleID:");
}

id objc_msgSend__setPluginIdentifierToShow_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPluginIdentifierToShow:completion:");
}

id objc_msgSend__shouldVendRemoteViewControllerForCardSwipeSPI(void *a1, const char *a2, ...)
{
  return _[a1 _shouldVendRemoteViewControllerForCardSwipeSPI];
}

id objc_msgSend__snapshotView(void *a1, const char *a2, ...)
{
  return _[a1 _snapshotView];
}

id objc_msgSend__snapshotViewForGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_snapshotViewForGUID:");
}

id objc_msgSend__strictlyUnarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_strictlyUnarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend__swapOutSnapshotView(void *a1, const char *a2, ...)
{
  return _[a1 _swapOutSnapshotView];
}

id objc_msgSend__volumeButtonPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_volumeButtonPressed:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityLabel];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return _[a1 accountType];
}

id objc_msgSend_actionWithTitle_image_identifier_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:image:identifier:handler:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activeMessage(void *a1, const char *a2, ...)
{
  return _[a1 activeMessage];
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return _[a1 adamID];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allowAllPayloadCommits(void *a1, const char *a2, ...)
{
  return _[a1 allowAllPayloadCommits];
}

id objc_msgSend_allowedByScreenTime(void *a1, const char *a2, ...)
{
  return _[a1 allowedByScreenTime];
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_appBundle(void *a1, const char *a2, ...)
{
  return _[a1 appBundle];
}

id objc_msgSend_appContext(void *a1, const char *a2, ...)
{
  return _[a1 appContext];
}

id objc_msgSend_appIcon(void *a1, const char *a2, ...)
{
  return _[a1 appIcon];
}

id objc_msgSend_appendDraftAssetArchivesIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendDraftAssetArchivesIfNeeded:");
}

id objc_msgSend_appendMediaPayloadToText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendMediaPayloadToText:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetExplorerTransport(void *a1, const char *a2, ...)
{
  return _[a1 assetExplorerTransport];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return _[a1 attachments];
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_attributionInfo(void *a1, const char *a2, ...)
{
  return _[a1 attributionInfo];
}

id objc_msgSend_authorizeForAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authorizeForAuditToken:");
}

id objc_msgSend_balloonColorsForColorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "balloonColorsForColorType:");
}

id objc_msgSend_balloonControllerDelegate(void *a1, const char *a2, ...)
{
  return _[a1 balloonControllerDelegate];
}

id objc_msgSend_balloonExtensionPlugin(void *a1, const char *a2, ...)
{
  return _[a1 balloonExtensionPlugin];
}

id objc_msgSend_balloonMaskTailWidth(void *a1, const char *a2, ...)
{
  return _[a1 balloonMaskTailWidth];
}

id objc_msgSend_balloonPlugin(void *a1, const char *a2, ...)
{
  return _[a1 balloonPlugin];
}

id objc_msgSend_balloonPluginDataSource(void *a1, const char *a2, ...)
{
  return _[a1 balloonPluginDataSource];
}

id objc_msgSend_balloonPluginForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "balloonPluginForBundleID:");
}

id objc_msgSend_balloonView(void *a1, const char *a2, ...)
{
  return _[a1 balloonView];
}

id objc_msgSend_becomeActiveWithConversationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeActiveWithConversationState:");
}

id objc_msgSend_beginAppearanceTransition_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginAppearanceTransition:animated:");
}

id objc_msgSend_beginDisablingUserInteraction(void *a1, const char *a2, ...)
{
  return _[a1 beginDisablingUserInteraction];
}

id objc_msgSend_beginDraggingItem_withAnimatedDragImage_fromRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginDraggingItem:withAnimatedDragImage:fromRect:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottom(void *a1, const char *a2, ...)
{
  return _[a1 bottom];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_browserCardBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 browserCardBackgroundColor];
}

id objc_msgSend_browserDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 browserDisplayName];
}

id objc_msgSend_browserDragManager(void *a1, const char *a2, ...)
{
  return _[a1 browserDragManager];
}

id objc_msgSend_browserItemPayload(void *a1, const char *a2, ...)
{
  return _[a1 browserItemPayload];
}

id objc_msgSend_browserSnapshotForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "browserSnapshotForKey:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_cacheSnapshot_guid_postChangeNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheSnapshot:guid:postChangeNotification:");
}

id objc_msgSend_canSendDataPayloads(void *a1, const char *a2, ...)
{
  return _[a1 canSendDataPayloads];
}

id objc_msgSend_canShowBrowserForPluginIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canShowBrowserForPluginIdentifier:completion:");
}

id objc_msgSend_cancelExtensionRequestWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelExtensionRequestWithIdentifier:");
}

id objc_msgSend_caption(void *a1, const char *a2, ...)
{
  return _[a1 caption];
}

id objc_msgSend_chat(void *a1, const char *a2, ...)
{
  return _[a1 chat];
}

id objc_msgSend_chatIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 chatIdentifier];
}

id objc_msgSend_checkForTouchInRemoteProcessIfNecessaryWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkForTouchInRemoteProcessIfNecessaryWithCompletion:");
}

id objc_msgSend_checkForTouchWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkForTouchWithCompletion:");
}

id objc_msgSend_ckImageWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ckImageWithData:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clearShelfPayload(void *a1, const char *a2, ...)
{
  return _[a1 clearShelfPayload];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_commitPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitPayload:");
}

id objc_msgSend_commitPayload_forPlugin_allowAllCommits_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitPayload:forPlugin:allowAllCommits:completionHandler:");
}

id objc_msgSend_commitSticker_forPlugin_stickerFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitSticker:forPlugin:stickerFrame:");
}

id objc_msgSend_commitSticker_stickerFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitSticker:stickerFrame:");
}

id objc_msgSend_commitSticker_withDragTarget_draggedSticker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitSticker:withDragTarget:draggedSticker:");
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return _[a1 completionHandler];
}

id objc_msgSend_configureForDisplay(void *a1, const char *a2, ...)
{
  return _[a1 configureForDisplay];
}

id objc_msgSend_configureLiveViewForDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureLiveViewForDisplay:");
}

id objc_msgSend_configurePhotosDraftAssetArchivesWithConversationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurePhotosDraftAssetArchivesWithConversationID:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contextualMenuPlacementButton(void *a1, const char *a2, ...)
{
  return _[a1 contextualMenuPlacementButton];
}

id objc_msgSend_conversationEngramID(void *a1, const char *a2, ...)
{
  return _[a1 conversationEngramID];
}

id objc_msgSend_conversationForExistingChatWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationForExistingChatWithGUID:");
}

id objc_msgSend_conversationID(void *a1, const char *a2, ...)
{
  return _[a1 conversationID];
}

id objc_msgSend_conversationID_appID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationID:appID:");
}

id objc_msgSend_conversationState(void *a1, const char *a2, ...)
{
  return _[a1 conversationState];
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromView:");
}

id objc_msgSend_convertToStickerWithExtensionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertToStickerWithExtensionIdentifier:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createRemoteBalloonViewControllerIsResuming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createRemoteBalloonViewControllerIsResuming:");
}

id objc_msgSend_currentConversationState(void *a1, const char *a2, ...)
{
  return _[a1 currentConversationState];
}

id objc_msgSend_currentDragPayload(void *a1, const char *a2, ...)
{
  return _[a1 currentDragPayload];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dataRepresentation];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataSourceForPluginPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSourceForPluginPayload:");
}

id objc_msgSend_dataSourcePluginPayloadDidChange_didUpdateData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSourcePluginPayloadDidChange:didUpdateData:");
}

id objc_msgSend_dataSourcePluginPayloadDidChange_didUpdateData_forceReloadData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSourcePluginPayloadDidChange:didUpdateData:forceReloadData:");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_datasource_didMoveToShelf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "datasource:didMoveToShelf:");
}

id objc_msgSend_datasourcePayloadDidChange_updateFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "datasourcePayloadDidChange:updateFlags:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didBeginDraggingSticker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didBeginDraggingSticker:");
}

id objc_msgSend_didFinishAnimatedBoundsChange(void *a1, const char *a2, ...)
{
  return _[a1 didFinishAnimatedBoundsChange];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didStageAssetArchive_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStageAssetArchive:identifier:");
}

id objc_msgSend_dismissAndPresentPhotosApp(void *a1, const char *a2, ...)
{
  return _[a1 dismissAndPresentPhotosApp];
}

id objc_msgSend_dismissAndReloadInputViews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissAndReloadInputViews:");
}

id objc_msgSend_dismissAndReloadInputViews_forPlugin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissAndReloadInputViews:forPlugin:");
}

id objc_msgSend_dismissEntryViewShelf(void *a1, const char *a2, ...)
{
  return _[a1 dismissEntryViewShelf];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_draggedSticker(void *a1, const char *a2, ...)
{
  return _[a1 draggedSticker];
}

id objc_msgSend_durationsWithMaxCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "durationsWithMaxCount:");
}

id objc_msgSend_eagerUploadCancelIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eagerUploadCancelIdentifier:");
}

id objc_msgSend_endAppearanceTransition(void *a1, const char *a2, ...)
{
  return _[a1 endAppearanceTransition];
}

id objc_msgSend_endDisablingUserInteraction(void *a1, const char *a2, ...)
{
  return _[a1 endDisablingUserInteraction];
}

id objc_msgSend_engramID(void *a1, const char *a2, ...)
{
  return _[a1 engramID];
}

id objc_msgSend_enqueueGenerationBlock_completion_withPriority_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueGenerationBlock:completion:withPriority:forKey:");
}

id objc_msgSend_enqueueSaveBlock_withPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueSaveBlock:withPriority:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return _[a1 extension];
}

id objc_msgSend_extensionBalloonMaximumHeight(void *a1, const char *a2, ...)
{
  return _[a1 extensionBalloonMaximumHeight];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _[a1 extensionContext];
}

id objc_msgSend_extensionIconBadgeRectForOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionIconBadgeRectForOrientation:");
}

id objc_msgSend_extensionLoadRequestCompletionBlockArray(void *a1, const char *a2, ...)
{
  return _[a1 extensionLoadRequestCompletionBlockArray];
}

id objc_msgSend_extensionLoadRequestCount(void *a1, const char *a2, ...)
{
  return _[a1 extensionLoadRequestCount];
}

id objc_msgSend_extensionLoadRequestInFlight(void *a1, const char *a2, ...)
{
  return _[a1 extensionLoadRequestInFlight];
}

id objc_msgSend_extensionWantsDraftAssetArchives(void *a1, const char *a2, ...)
{
  return _[a1 extensionWantsDraftAssetArchives];
}

id objc_msgSend_fallbackForData_attachments_inFileURL_completionBlockWithText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fallbackForData:attachments:inFileURL:completionBlockWithText:");
}

id objc_msgSend_fallbackInLPFromPayloadDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fallbackInLPFromPayloadDictionary:");
}

id objc_msgSend_fetchPluginPayloadsAndClear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPluginPayloadsAndClear:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_filterWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithType:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_forceTearDownRemoteView(void *a1, const char *a2, ...)
{
  return _[a1 forceTearDownRemoteView];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_fromMe(void *a1, const char *a2, ...)
{
  return _[a1 fromMe];
}

id objc_msgSend_generatePreviewAndStoreInCacheForSendingPhotoFromPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePreviewAndStoreInCacheForSendingPhotoFromPayload:");
}

id objc_msgSend_generatedSummary(void *a1, const char *a2, ...)
{
  return _[a1 generatedSummary];
}

id objc_msgSend_generativeContext(void *a1, const char *a2, ...)
{
  return _[a1 generativeContext];
}

id objc_msgSend_generativePlaygroundRecipeData(void *a1, const char *a2, ...)
{
  return _[a1 generativePlaygroundRecipeData];
}

id objc_msgSend_getRemoteViewControllerForExtension_messageIdentifier_contextIdentifier_item_connectionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRemoteViewControllerForExtension:messageIdentifier:contextIdentifier:item:connectionHandler:");
}

id objc_msgSend_groupID(void *a1, const char *a2, ...)
{
  return _[a1 groupID];
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return _[a1 guid];
}

id objc_msgSend_handleRemoteInterruption(void *a1, const char *a2, ...)
{
  return _[a1 handleRemoteInterruption];
}

id objc_msgSend_hasEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasEntitlement:");
}

id objc_msgSend_hasLiveView(void *a1, const char *a2, ...)
{
  return _[a1 hasLiveView];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hostBundleID(void *a1, const char *a2, ...)
{
  return _[a1 hostBundleID];
}

id objc_msgSend_hostContext(void *a1, const char *a2, ...)
{
  return _[a1 hostContext];
}

id objc_msgSend_iMessageAppIconSize(void *a1, const char *a2, ...)
{
  return _[a1 iMessageAppIconSize];
}

id objc_msgSend_iMessageLoginID(void *a1, const char *a2, ...)
{
  return _[a1 iMessageLoginID];
}

id objc_msgSend_iMessageService(void *a1, const char *a2, ...)
{
  return _[a1 iMessageService];
}

id objc_msgSend_iTunesStoreDialogPresented(void *a1, const char *a2, ...)
{
  return _[a1 iTunesStoreDialogPresented];
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return _[a1 iconView];
}

id objc_msgSend_iconWidth(void *a1, const char *a2, ...)
{
  return _[a1 iconWidth];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_im_lastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_lastPathComponent");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageSubtitle(void *a1, const char *a2, ...)
{
  return _[a1 imageSubtitle];
}

id objc_msgSend_imageTitle(void *a1, const char *a2, ...)
{
  return _[a1 imageTitle];
}

id objc_msgSend_imageWithData_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithData:scale:");
}

id objc_msgSend_inExpandedPresentation(void *a1, const char *a2, ...)
{
  return _[a1 inExpandedPresentation];
}

id objc_msgSend_inFullScreenModalPresentation(void *a1, const char *a2, ...)
{
  return _[a1 inFullScreenModalPresentation];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return _[a1 infoDictionary];
}

id objc_msgSend_initByReferencingFileURL_MIMEType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initByReferencingFileURL:MIMEType:");
}

id objc_msgSend_initByReferencingFileURL_MIMEType_hasAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initByReferencingFileURL:MIMEType:hasAudio:");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithAlternateLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAlternateLayout:");
}

id objc_msgSend_initWithAppContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppContext:");
}

id objc_msgSend_initWithAppIcon_fromMe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppIcon:fromMe:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_MIMEType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:MIMEType:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDataSource_fromMe_conversationID_recipients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:fromMe:conversationID:recipients:");
}

id objc_msgSend_initWithExtension_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExtension:identifier:");
}

id objc_msgSend_initWithFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileURL:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_dataSource_fromMe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:dataSource:fromMe:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithImages_durations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImages:durations:");
}

id objc_msgSend_initWithPackageTransport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPackageTransport:");
}

id objc_msgSend_initWithPlugin_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlugin:identifier:");
}

id objc_msgSend_initWithPresentationProperties_URL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPresentationProperties:URL:");
}

id objc_msgSend_initWithSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSession:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithViewController_wantsLiveView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithViewController:wantsLiveView:");
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_insertSubview_below_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:below:");
}

id objc_msgSend_insertSubview_belowSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:belowSubview:");
}

id objc_msgSend_insets(void *a1, const char *a2, ...)
{
  return _[a1 insets];
}

id objc_msgSend_instantiateViewControllerWithInputItems_connectionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instantiateViewControllerWithInputItems:connectionHandler:");
}

id objc_msgSend_instantiateViewControllerWithInputItems_listenerEndpoint_connectionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateSnapshotForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateSnapshotForKey:");
}

id objc_msgSend_isApplicationActive(void *a1, const char *a2, ...)
{
  return _[a1 isApplicationActive];
}

id objc_msgSend_isBeingDismissed(void *a1, const char *a2, ...)
{
  return _[a1 isBeingDismissed];
}

id objc_msgSend_isBusiness(void *a1, const char *a2, ...)
{
  return _[a1 isBusiness];
}

id objc_msgSend_isBusinessChat(void *a1, const char *a2, ...)
{
  return _[a1 isBusinessChat];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToIgnoringCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToIgnoringCase:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _[a1 isFileURL];
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return _[a1 isFromMe];
}

id objc_msgSend_isFromValidExtension(void *a1, const char *a2, ...)
{
  return _[a1 isFromValidExtension];
}

id objc_msgSend_isGeneratingPreviewForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isGeneratingPreviewForKey:");
}

id objc_msgSend_isGenerativePlaygroundExtension(void *a1, const char *a2, ...)
{
  return _[a1 isGenerativePlaygroundExtension];
}

id objc_msgSend_isInDeferredTeardown(void *a1, const char *a2, ...)
{
  return _[a1 isInDeferredTeardown];
}

id objc_msgSend_isIpad(void *a1, const char *a2, ...)
{
  return _[a1 isIpad];
}

id objc_msgSend_isLaunchProhibited(void *a1, const char *a2, ...)
{
  return _[a1 isLaunchProhibited];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isPhotosExtensionBrowser(void *a1, const char *a2, ...)
{
  return _[a1 isPhotosExtensionBrowser];
}

id objc_msgSend_isPlayed(void *a1, const char *a2, ...)
{
  return _[a1 isPlayed];
}

id objc_msgSend_isPrimaryViewController(void *a1, const char *a2, ...)
{
  return _[a1 isPrimaryViewController];
}

id objc_msgSend_isReadyToDisplay(void *a1, const char *a2, ...)
{
  return _[a1 isReadyToDisplay];
}

id objc_msgSend_isRunningInCameraContext(void *a1, const char *a2, ...)
{
  return _[a1 isRunningInCameraContext];
}

id objc_msgSend_isRunningTest(void *a1, const char *a2, ...)
{
  return _[a1 isRunningTest];
}

id objc_msgSend_isRunningTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunningTest:");
}

id objc_msgSend_isShowingAssetExplorerShelf(void *a1, const char *a2, ...)
{
  return _[a1 isShowingAssetExplorerShelf];
}

id objc_msgSend_isSticker(void *a1, const char *a2, ...)
{
  return _[a1 isSticker];
}

id objc_msgSend_isValidMediaPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidMediaPayload:");
}

id objc_msgSend_isValidMessagePayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidMessagePayload:");
}

id objc_msgSend_isValidSticker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidSticker:");
}

id objc_msgSend_isWaitingForReply(void *a1, const char *a2, ...)
{
  return _[a1 isWaitingForReply];
}

id objc_msgSend_isiMessage(void *a1, const char *a2, ...)
{
  return _[a1 isiMessage];
}

id objc_msgSend_itemPadding(void *a1, const char *a2, ...)
{
  return _[a1 itemPadding];
}

id objc_msgSend_keyWithIdentifier_interfaceStyle_bounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWithIdentifier:interfaceStyle:bounds:");
}

id objc_msgSend_keyWithOppositeInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 keyWithOppositeInterfaceStyle];
}

id objc_msgSend_killExtensionProcess(void *a1, const char *a2, ...)
{
  return _[a1 killExtensionProcess];
}

id objc_msgSend_lastDraftConversationID(void *a1, const char *a2, ...)
{
  return _[a1 lastDraftConversationID];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastRequestSize(void *a1, const char *a2, ...)
{
  return _[a1 lastRequestSize];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layout(void *a1, const char *a2, ...)
{
  return _[a1 layout];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return _[a1 layoutSubviews];
}

id objc_msgSend_leading(void *a1, const char *a2, ...)
{
  return _[a1 leading];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_linkView(void *a1, const char *a2, ...)
{
  return _[a1 linkView];
}

id objc_msgSend_linkedBeforeDawn(void *a1, const char *a2, ...)
{
  return _[a1 linkedBeforeDawn];
}

id objc_msgSend_linkedBeforeYukon(void *a1, const char *a2, ...)
{
  return _[a1 linkedBeforeYukon];
}

id objc_msgSend_liveView_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "liveView:sizeThatFits:");
}

id objc_msgSend_liveViewController(void *a1, const char *a2, ...)
{
  return _[a1 liveViewController];
}

id objc_msgSend_liveViewController_requestPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "liveViewController:requestPresentationStyle:");
}

id objc_msgSend_liveViewController_stagePayload_skipShelf_allowAllCommits_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "liveViewController:stagePayload:skipShelf:allowAllCommits:completionHandler:");
}

id objc_msgSend_liveViewController_stageSticker_skipShelf_allowAllCommits_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "liveViewController:stageSticker:skipShelf:allowAllCommits:completionHandler:");
}

id objc_msgSend_liveViewControllerContextIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "liveViewControllerContextIdentifier:");
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_loadProxyIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadProxyIfNeededWithCompletion:");
}

id objc_msgSend_loadRemoteView(void *a1, const char *a2, ...)
{
  return _[a1 loadRemoteView];
}

id objc_msgSend_loadRemoteViewWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadRemoteViewWithCompletion:");
}

id objc_msgSend_loadedRemoteView(void *a1, const char *a2, ...)
{
  return _[a1 loadedRemoteView];
}

id objc_msgSend_loadingView(void *a1, const char *a2, ...)
{
  return _[a1 loadingView];
}

id objc_msgSend_localParticipantIdentifierForAppID_conversationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localParticipantIdentifierForAppID:conversationID:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_macDragImageData(void *a1, const char *a2, ...)
{
  return _[a1 macDragImageData];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_markAsPlayed(void *a1, const char *a2, ...)
{
  return _[a1 markAsPlayed];
}

id objc_msgSend_maxNumExtensionRemoteViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 maxNumExtensionRemoteViewControllers];
}

id objc_msgSend_mayBeKeptInViewHierarchy(void *a1, const char *a2, ...)
{
  return _[a1 mayBeKeptInViewHierarchy];
}

id objc_msgSend_mediaFileURL(void *a1, const char *a2, ...)
{
  return _[a1 mediaFileURL];
}

id objc_msgSend_mediaFilename(void *a1, const char *a2, ...)
{
  return _[a1 mediaFilename];
}

id objc_msgSend_mediaURL(void *a1, const char *a2, ...)
{
  return _[a1 mediaURL];
}

id objc_msgSend_menuWithChildren_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuWithChildren:");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_messageGUID(void *a1, const char *a2, ...)
{
  return _[a1 messageGUID];
}

id objc_msgSend_messagePayloadDataForSending(void *a1, const char *a2, ...)
{
  return _[a1 messagePayloadDataForSending];
}

id objc_msgSend_messagePayloadFromPluginPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messagePayloadFromPluginPayload:");
}

id objc_msgSend_minimumSizeThatFitsExtensionIconBadge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minimumSizeThatFitsExtensionIconBadge:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_needsResize(void *a1, const char *a2, ...)
{
  return _[a1 needsResize];
}

id objc_msgSend_needsSizeMatchBeforeSnapshotSwap(void *a1, const char *a2, ...)
{
  return _[a1 needsSizeMatchBeforeSnapshotSwap];
}

id objc_msgSend_needsSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 needsSnapshot];
}

id objc_msgSend_notifyActiveBrowserAssetArchiveWasRemoved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyActiveBrowserAssetArchiveWasRemoved:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForInfoDictionaryKey:");
}

id objc_msgSend_objectForInfoDictionaryKey_ofClass_inScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForInfoDictionaryKey:ofClass:inScope:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openURL_applicationIdentifier_pluginID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:applicationIdentifier:pluginID:completionHandler:");
}

id objc_msgSend_openURL_pluginID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:pluginID:completionHandler:");
}

id objc_msgSend_operationalAccountsForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationalAccountsForService:");
}

id objc_msgSend_orderedStagedIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 orderedStagedIdentifiers];
}

id objc_msgSend_orderedStagedPayloads(void *a1, const char *a2, ...)
{
  return _[a1 orderedStagedPayloads];
}

id objc_msgSend_originalURL(void *a1, const char *a2, ...)
{
  return _[a1 originalURL];
}

id objc_msgSend_parentChatHasAllUnknownRecipients(void *a1, const char *a2, ...)
{
  return _[a1 parentChatHasAllUnknownRecipients];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _[a1 parentViewController];
}

id objc_msgSend_passKitUIPresented(void *a1, const char *a2, ...)
{
  return _[a1 passKitUIPresented];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _[a1 payload];
}

id objc_msgSend_payloadDictionary(void *a1, const char *a2, ...)
{
  return _[a1 payloadDictionary];
}

id objc_msgSend_payloadForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "payloadForIdentifier:");
}

id objc_msgSend_payloadInShelf(void *a1, const char *a2, ...)
{
  return _[a1 payloadInShelf];
}

id objc_msgSend_payloadWillSendFromShelf(void *a1, const char *a2, ...)
{
  return _[a1 payloadWillSendFromShelf];
}

id objc_msgSend_performPrimaryAction(void *a1, const char *a2, ...)
{
  return _[a1 performPrimaryAction];
}

id objc_msgSend_pidForRequestIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pidForRequestIdentifier:");
}

id objc_msgSend_pluginBalloonInsetsForMessageFromMe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pluginBalloonInsetsForMessageFromMe:");
}

id objc_msgSend_pluginBundleID(void *a1, const char *a2, ...)
{
  return _[a1 pluginBundleID];
}

id objc_msgSend_pluginContentView(void *a1, const char *a2, ...)
{
  return _[a1 pluginContentView];
}

id objc_msgSend_pluginContentViewController(void *a1, const char *a2, ...)
{
  return _[a1 pluginContentViewController];
}

id objc_msgSend_pluginPayload(void *a1, const char *a2, ...)
{
  return _[a1 pluginPayload];
}

id objc_msgSend_pluginPayloadDataDidChangeForLiveView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pluginPayloadDataDidChangeForLiveView:");
}

id objc_msgSend_pluginPayloadDidChangeForLiveView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pluginPayloadDidChangeForLiveView:");
}

id objc_msgSend_pluginPayloadFromMediaPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pluginPayloadFromMediaPayload:");
}

id objc_msgSend_pluginPayloadFromMessagePayload_appIconData_appName_adamID_allowDataPayloads_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pluginPayloadFromMessagePayload:appIconData:appName:adamID:allowDataPayloads:");
}

id objc_msgSend_pluginViewDelegate(void *a1, const char *a2, ...)
{
  return _[a1 pluginViewDelegate];
}

id objc_msgSend_pluginViewRequestsPresentationAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pluginViewRequestsPresentationAction:");
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return _[a1 popoverPresentationController];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSize];
}

id objc_msgSend_prefersStatusBarHidden(void *a1, const char *a2, ...)
{
  return _[a1 prefersStatusBarHidden];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationStyle(void *a1, const char *a2, ...)
{
  return _[a1 presentationStyle];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return _[a1 principalClass];
}

id objc_msgSend_propertyProvider(void *a1, const char *a2, ...)
{
  return _[a1 propertyProvider];
}

id objc_msgSend_providesExplicitSizeSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 providesExplicitSizeSnapshot];
}

id objc_msgSend_proxy(void *a1, const char *a2, ...)
{
  return _[a1 proxy];
}

id objc_msgSend_purgeRemoteViewController(void *a1, const char *a2, ...)
{
  return _[a1 purgeRemoteViewController];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return _[a1 raise];
}

id objc_msgSend_recipientIDForRecipient_appID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recipientIDForRecipient:appID:");
}

id objc_msgSend_recipientStrings(void *a1, const char *a2, ...)
{
  return _[a1 recipientStrings];
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return _[a1 recipients];
}

id objc_msgSend_registerChangeObserver_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerChangeObserver:context:");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_reloadRemoteViewIsResuming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadRemoteViewIsResuming:");
}

id objc_msgSend_remoteBalloonView(void *a1, const char *a2, ...)
{
  return _[a1 remoteBalloonView];
}

id objc_msgSend_remoteBalloonViewControllerContextIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteBalloonViewControllerContextIdentifier:");
}

id objc_msgSend_remoteBalloonViewControllerDidLoad_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteBalloonViewControllerDidLoad:");
}

id objc_msgSend_remoteBalloonViewControllerWillLoad_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteBalloonViewControllerWillLoad:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteProxy];
}

id objc_msgSend_remoteViewController(void *a1, const char *a2, ...)
{
  return _[a1 remoteViewController];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAssetArchiveWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAssetArchiveWithIdentifier:completionHandler:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeShelfBalloonViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeShelfBalloonViewController];
}

id objc_msgSend_removeSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 removeSnapshot];
}

id objc_msgSend_removeViewControllerWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeViewControllerWithIdentifier:");
}

id objc_msgSend_replaceOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_requestPresentationStyleExpanded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestPresentationStyleExpanded:");
}

id objc_msgSend_requestPresentationStyleExpanded_forPlugin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestPresentationStyleExpanded:forPlugin:");
}

id objc_msgSend_requestPresentationStyleFullScreenModalForPlugin_preferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestPresentationStyleFullScreenModalForPlugin:preferredContentSize:");
}

id objc_msgSend_requestSizeThatFits_presentationStyle_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestSizeThatFits:presentationStyle:completionHandler:");
}

id objc_msgSend_requestSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 requestSnapshot];
}

id objc_msgSend_requestSnapshotDataForPersistance(void *a1, const char *a2, ...)
{
  return _[a1 requestSnapshotDataForPersistance];
}

id objc_msgSend_requestTransitionPluginFromFullScreen_toExpanded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestTransitionPluginFromFullScreen:toExpanded:");
}

id objc_msgSend_requestUUID(void *a1, const char *a2, ...)
{
  return _[a1 requestUUID];
}

id objc_msgSend_sandboxExtension(void *a1, const char *a2, ...)
{
  return _[a1 sandboxExtension];
}

id objc_msgSend_saveSnapshotForBrowserViewController(void *a1, const char *a2, ...)
{
  return _[a1 saveSnapshotForBrowserViewController];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 secondarySystemBackgroundColor];
}

id objc_msgSend_sendDelegate(void *a1, const char *a2, ...)
{
  return _[a1 sendDelegate];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return _[a1 sender];
}

id objc_msgSend_senderAddress(void *a1, const char *a2, ...)
{
  return _[a1 senderAddress];
}

id objc_msgSend_senderIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 senderIdentifier];
}

id objc_msgSend_senderParticipantIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 senderParticipantIdentifier];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_serviceAuditToken(void *a1, const char *a2, ...)
{
  return _[a1 serviceAuditToken];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_sessionGUID(void *a1, const char *a2, ...)
{
  return _[a1 sessionGUID];
}

id objc_msgSend_sessionUUID(void *a1, const char *a2, ...)
{
  return _[a1 sessionUUID];
}

id objc_msgSend_setAccessibilityLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityLabel:");
}

id objc_msgSend_setActiveMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveMessage:");
}

id objc_msgSend_setAllowedByScreenTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedByScreenTime:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAppContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppContext:");
}

id objc_msgSend_setAppIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppIcon:");
}

id objc_msgSend_setAssetExplorerShelfViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetExplorerShelfViewController:");
}

id objc_msgSend_setAssociatedMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssociatedMessageGUID:");
}

id objc_msgSend_setAttachments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttachments:");
}

id objc_msgSend_setAttributionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributionInfo:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBalloonControllerDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBalloonControllerDelegate:");
}

id objc_msgSend_setBalloonView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBalloonView:");
}

id objc_msgSend_setCachedPreview_key_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedPreview:key:");
}

id objc_msgSend_setCaption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaption:");
}

id objc_msgSend_setCaptionBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaptionBar:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setContextualMenuPlacementButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextualMenuPlacementButton:");
}

id objc_msgSend_setConversationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationContext:");
}

id objc_msgSend_setConversationEngramID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationEngramID:");
}

id objc_msgSend_setConversationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationID:");
}

id objc_msgSend_setConversationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationIdentifier:");
}

id objc_msgSend_setCurrentDragPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentDragPayload:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDismissing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissing:");
}

id objc_msgSend_setDraftAssetArchives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDraftAssetArchives:");
}

id objc_msgSend_setEntryViewDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntryViewDelegate:");
}

id objc_msgSend_setExtensionLoadRequestCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtensionLoadRequestCount:");
}

id objc_msgSend_setExtensionLoadRequestInFlight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtensionLoadRequestInFlight:");
}

id objc_msgSend_setFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFileURL:");
}

id objc_msgSend_setFilename_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilename:");
}

id objc_msgSend_setFilters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilters:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setForceHideAppIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForceHideAppIcon:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromMe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromMe:");
}

id objc_msgSend_setGeneratedSummary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGeneratedSummary:");
}

id objc_msgSend_setGenerativePlaygroundRecipeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGenerativePlaygroundRecipeData:");
}

id objc_msgSend_setGroupID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupID:");
}

id objc_msgSend_setGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGuid:");
}

id objc_msgSend_setHasInvalidatedSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasInvalidatedSize:");
}

id objc_msgSend_setHasLiveViewSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasLiveViewSize:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHidesWhenStopped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesWhenStopped:");
}

id objc_msgSend_setHostContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHostContext:");
}

id objc_msgSend_setIconView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconView:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImageSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageSubtitle:");
}

id objc_msgSend_setImageTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageTitle:");
}

id objc_msgSend_setIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntent:");
}

id objc_msgSend_setIsBusiness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBusiness:");
}

id objc_msgSend_setIsFromMe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFromMe:");
}

id objc_msgSend_setIsInDeferredTeardown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInDeferredTeardown:");
}

id objc_msgSend_setIsInShelf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInShelf:");
}

id objc_msgSend_setIsShowingAssetExplorerShelf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsShowingAssetExplorerShelf:");
}

id objc_msgSend_setIsWaitingForReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsWaitingForReply:");
}

id objc_msgSend_setIsiMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsiMessage:");
}

id objc_msgSend_setLastDraftConversationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastDraftConversationID:");
}

id objc_msgSend_setLastRequestSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastRequestSize:");
}

id objc_msgSend_setLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayout:");
}

id objc_msgSend_setLiveViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLiveViewController:");
}

id objc_msgSend_setLoadingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLoadingView:");
}

id objc_msgSend_setMediaBottomCaptionBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaBottomCaptionBar:");
}

id objc_msgSend_setMediaFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaFileURL:");
}

id objc_msgSend_setMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenu:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsResize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsResize:");
}

id objc_msgSend_setNeedsSizeMatchBeforeSnapshotSwap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsSizeMatchBeforeSnapshotSwap:");
}

id objc_msgSend_setNeedsSnapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsSnapshot:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPending:");
}

id objc_msgSend_setPermittedArrowDirections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPermittedArrowDirections:");
}

id objc_msgSend_setPluginBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPluginBundleID:");
}

id objc_msgSend_setPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationStyle:");
}

id objc_msgSend_setProvidesExplicitSizeSnapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProvidesExplicitSizeSnapshot:");
}

id objc_msgSend_setReadyToDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReadyToDisplay:");
}

id objc_msgSend_setRecipientAddresses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecipientAddresses:");
}

id objc_msgSend_setRecipientIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecipientIdentifiers:");
}

id objc_msgSend_setRecipients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecipients:");
}

id objc_msgSend_setRemoteBalloonView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteBalloonView:");
}

id objc_msgSend_setRemoteViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteViewController:");
}

id objc_msgSend_setRequestUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestUUID:");
}

id objc_msgSend_setRequiredCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiredCapabilities:");
}

id objc_msgSend_setSenderAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSenderAddress:");
}

id objc_msgSend_setSenderIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSenderIdentifier:");
}

id objc_msgSend_setSenderParticipantIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSenderParticipantIdentifier:");
}

id objc_msgSend_setServiceViewShouldShareTouchesWithHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceViewShouldShareTouchesWithHost:");
}

id objc_msgSend_setSessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionUUID:");
}

id objc_msgSend_setShouldAutomaticallyForwardAppearanceMethods_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldAutomaticallyForwardAppearanceMethods:");
}

id objc_msgSend_setShouldExpire_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldExpire:");
}

id objc_msgSend_setShouldHideReviewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldHideReviewController:");
}

id objc_msgSend_setShowsMenuAsPrimaryAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsMenuAsPrimaryAction:");
}

id objc_msgSend_setSizeUpdater_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSizeUpdater:");
}

id objc_msgSend_setSnapshotView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSnapshotView:");
}

id objc_msgSend_setSnapshotViewInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSnapshotViewInterfaceStyle:");
}

id objc_msgSend_setSourceRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceRect:");
}

id objc_msgSend_setSourceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceView:");
}

id objc_msgSend_setSpinnerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpinnerView:");
}

id objc_msgSend_setStaticView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStaticView:");
}

id objc_msgSend_setStatusText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusText:");
}

id objc_msgSend_setSticker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSticker:");
}

id objc_msgSend_setSubcaption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubcaption:");
}

id objc_msgSend_setSummaryText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSummaryText:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTime:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitleLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleLabel:");
}

id objc_msgSend_setTrailingCaption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrailingCaption:");
}

id objc_msgSend_setTrailingSubcaption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrailingSubcaption:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdate:");
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrl:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKeyPath:");
}

id objc_msgSend_setVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideo:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setWeakExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWeakExtension:");
}

id objc_msgSend_set_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_data:");
}

id objc_msgSend_setiMessageLoginID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setiMessageLoginID:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedBehaviors(void *a1, const char *a2, ...)
{
  return _[a1 sharedBehaviors];
}

id objc_msgSend_sharedConversationList(void *a1, const char *a2, ...)
{
  return _[a1 sharedConversationList];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shouldBalloonHideAppIcon(void *a1, const char *a2, ...)
{
  return _[a1 shouldBalloonHideAppIcon];
}

id objc_msgSend_shouldDisableSnapshotView(void *a1, const char *a2, ...)
{
  return _[a1 shouldDisableSnapshotView];
}

id objc_msgSend_shouldExpire(void *a1, const char *a2, ...)
{
  return _[a1 shouldExpire];
}

id objc_msgSend_shouldShowForRecipients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowForRecipients:");
}

id objc_msgSend_showBrowserForPluginIdentifier_style_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showBrowserForPluginIdentifier:style:completion:");
}

id objc_msgSend_showEntryViewPhotosShelf_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showEntryViewPhotosShelf:completion:");
}

id objc_msgSend_showInBrowser(void *a1, const char *a2, ...)
{
  return _[a1 showInBrowser];
}

id objc_msgSend_showModalViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showModalViewController:animated:completion:");
}

id objc_msgSend_showSnapshotForSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSnapshotForSize:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeThatFits_datasource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:datasource:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_sizeUpdater(void *a1, const char *a2, ...)
{
  return _[a1 sizeUpdater];
}

id objc_msgSend_snapshotCache(void *a1, const char *a2, ...)
{
  return _[a1 snapshotCache];
}

id objc_msgSend_snapshotForGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotForGUID:");
}

id objc_msgSend_snapshotIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 snapshotIdentifier];
}

id objc_msgSend_snapshotView(void *a1, const char *a2, ...)
{
  return _[a1 snapshotView];
}

id objc_msgSend_snapshotViewAfterScreenUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotViewAfterScreenUpdates:");
}

id objc_msgSend_snapshotViewInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 snapshotViewInterfaceStyle];
}

id objc_msgSend_sourceFrame(void *a1, const char *a2, ...)
{
  return _[a1 sourceFrame];
}

id objc_msgSend_spinnerHorizontalPadding(void *a1, const char *a2, ...)
{
  return _[a1 spinnerHorizontalPadding];
}

id objc_msgSend_spinnerView(void *a1, const char *a2, ...)
{
  return _[a1 spinnerView];
}

id objc_msgSend_stageAssetArchive_skipShelf_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stageAssetArchive:skipShelf:completionHandler:");
}

id objc_msgSend_stageAssetToTransportAndNotifySendDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stageAssetToTransportAndNotifySendDelegate:");
}

id objc_msgSend_stagePackage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stagePackage:");
}

id objc_msgSend_stagePersistedPayloads_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stagePersistedPayloads:");
}

id objc_msgSend_stagedPackageForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stagedPackageForIdentifier:");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_startEditingPayload_dismiss_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startEditingPayload:dismiss:");
}

id objc_msgSend_startEditingPayload_dismiss_forPlugin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startEditingPayload:dismiss:forPlugin:");
}

id objc_msgSend_startEditingPayload_dismiss_forPlugin_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startEditingPayload:dismiss:forPlugin:completion:");
}

id objc_msgSend_startEditingPayloadBypassingValidation_forPlugin_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startEditingPayloadBypassingValidation:forPlugin:completion:");
}

id objc_msgSend_startTimingForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTimingForKey:");
}

id objc_msgSend_staticView(void *a1, const char *a2, ...)
{
  return _[a1 staticView];
}

id objc_msgSend_statusText(void *a1, const char *a2, ...)
{
  return _[a1 statusText];
}

id objc_msgSend_stickerDruidDragEndedWithIMSticker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stickerDruidDragEndedWithIMSticker:");
}

id objc_msgSend_stickerDruidDragEndedWithPayload_pluginIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stickerDruidDragEndedWithPayload:pluginIdentifier:");
}

id objc_msgSend_stickerDruidDragStarted(void *a1, const char *a2, ...)
{
  return _[a1 stickerDruidDragStarted];
}

id objc_msgSend_stickerPackGUID(void *a1, const char *a2, ...)
{
  return _[a1 stickerPackGUID];
}

id objc_msgSend_stickerRepresentations(void *a1, const char *a2, ...)
{
  return _[a1 stickerRepresentations];
}

id objc_msgSend_stickerStoreIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 stickerStoreIdentifier];
}

id objc_msgSend_stopTimingForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopTimingForKey:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringGUID(void *a1, const char *a2, ...)
{
  return _[a1 stringGUID];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_strippedLogin(void *a1, const char *a2, ...)
{
  return _[a1 strippedLogin];
}

id objc_msgSend_subcaption(void *a1, const char *a2, ...)
{
  return _[a1 subcaption];
}

id objc_msgSend_substituteNameInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substituteNameInString:");
}

id objc_msgSend_substituteNameInString_withAppID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substituteNameInString:withAppID:");
}

id objc_msgSend_summaryText(void *a1, const char *a2, ...)
{
  return _[a1 summaryText];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_synchronizeAnimationsInActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeAnimationsInActions:");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_tearDownRemoteView(void *a1, const char *a2, ...)
{
  return _[a1 tearDownRemoteView];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return _[a1 theme];
}

id objc_msgSend_thumbnailAtIndex_fillToSize_maxCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thumbnailAtIndex:fillToSize:maxCount:");
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return _[a1 time];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_top(void *a1, const char *a2, ...)
{
  return _[a1 top];
}

id objc_msgSend_touchReceived(void *a1, const char *a2, ...)
{
  return _[a1 touchReceived];
}

id objc_msgSend_touchTracker(void *a1, const char *a2, ...)
{
  return _[a1 touchTracker];
}

id objc_msgSend_trailing(void *a1, const char *a2, ...)
{
  return _[a1 trailing];
}

id objc_msgSend_trailingCaption(void *a1, const char *a2, ...)
{
  return _[a1 trailingCaption];
}

id objc_msgSend_trailingSubcaption(void *a1, const char *a2, ...)
{
  return _[a1 trailingSubcaption];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_transcriptLoadingViewTextFont(void *a1, const char *a2, ...)
{
  return _[a1 transcriptLoadingViewTextFont];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unloadRemoteView(void *a1, const char *a2, ...)
{
  return _[a1 unloadRemoteView];
}

id objc_msgSend_unregisterChangeObserver_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterChangeObserver:context:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unstagePackageWithIdentifier_andNotify_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unstagePackageWithIdentifier:andNotify:");
}

id objc_msgSend_unstagePackagesWithIdentifiers_evictFiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unstagePackagesWithIdentifiers:evictFiles:");
}

id objc_msgSend_updateIconForPlugin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIconForPlugin:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceLayoutDirection];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueWithCGRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCGRect:");
}

id objc_msgSend_valueWithCGSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCGSize:");
}

id objc_msgSend_video(void *a1, const char *a2, ...)
{
  return _[a1 video];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllerKeyForMessageIdentifier_contextIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerKeyForMessageIdentifier:contextIdentifier:");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_workingDraftDirForPluginIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workingDraftDirForPluginIdentifier:");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:atomically:");
}