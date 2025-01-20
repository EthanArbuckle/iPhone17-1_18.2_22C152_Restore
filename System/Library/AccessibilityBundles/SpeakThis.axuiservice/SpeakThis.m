void sub_4C04()
{
  id v0;
  void *v1;
  uint64_t vars8;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)qword_30210;
  qword_30210 = (uint64_t)v0;
}

void sub_5390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 128));
  _Unwind_Resume(a1);
}

id *sub_53F8(id *result, uint64_t a2)
{
  if (a2 == 8) {
    return (id *)[result[4] _handleLockButtonPress];
  }
  return result;
}

void sub_540C(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setSpringBoardActionHandlerId:v3];
}

id sub_5468(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 performSelector:"_updateForContinuityStateChange" withObject:0 afterDelay:0.0];
  }
  return result;
}

void sub_5488(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateVCWithLatestHighlightColors];
}

void sub_54C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateVCWithLatestHighlightColors];
}

void sub_5508(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateGestureRecognizers];
}

void sub_5548(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateGestureRecognizers];
}

id sub_5588(uint64_t a1)
{
  return [*(id *)(a1 + 32) _observeNotifications:1];
}

void sub_5594(uint64_t a1)
{
  v2 = +[AXSpeakFingerManager sharedInstance];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_5658;
  v3[3] = &unk_286E8;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  [v2 registerBlockForStateChange:v3];

  objc_destroyWeak(&v4);
}

void sub_5644(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_5658(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_56E8;
  block[3] = &unk_286E8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_56E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _speakFingerStateChanged];
}

void sub_5728(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (![WeakRetained isReadingFromFrontmostApp])
  {
LABEL_12:

    return;
  }
  id v3 = objc_loadWeakRetained(v2);
  unsigned __int8 v4 = [v3 highlightSentences];
  if ((v4 & 1) == 0)
  {
    v1 = objc_loadWeakRetained(v2);
    if (![v1 highlightWords]) {
      goto LABEL_10;
    }
  }
  id v5 = objc_loadWeakRetained(v2);
  uint64_t v6 = [v5 currentContent];
  if (!v6)
  {

    if (v4)
    {
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:

    goto LABEL_11;
  }
  v7 = (void *)v6;
  id v8 = objc_loadWeakRetained(v2);
  v9 = [v8 currentSpeakingRange];

  if ((v4 & 1) == 0) {
  if (v9)
  }
  {
    id v3 = objc_loadWeakRetained(v2);
    v1 = [v3 currentContent];
    id v10 = objc_loadWeakRetained(v2);
    id v11 = [v10 currentWordRange];
    uint64_t v13 = v12;
    id v14 = objc_loadWeakRetained(v2);
    v15 = [v14 currentSpeakingRange];
    LOBYTE(v16) = 0;
    objc_msgSend(v3, "_fetchTextRectsAndApplyHighlightToContent:withRange:elementRange:updateSentences:scrollWords:scrollSentences:", v1, v11, v13, v15, 1, 0, v16);

    id WeakRetained = v3;
    goto LABEL_10;
  }
}

void sub_5A1C(id a1, int a2, NSData *a3)
{
  unsigned __int8 v4 = a3;
  id v5 = v4;
  if (a2 <= 1020)
  {
    if (a2 != 1000)
    {
      if (a2 == 1009)
      {
        v7 = AXLogSpeakScreen();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          sub_1928C();
        }

        uint64_t v6 = +[SpeakThisUIServer sharedInstance];
        [v6 _pageDidScroll:v5];
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    uint64_t v12 = AXLogSpeakScreen();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_19258();
    }

    v9 = +[SpeakThisUIServer sharedInstance];
    uint64_t v6 = v9;
    uint64_t v10 = 1;
LABEL_19:
    [v9 _frontmostAppMayHaveChanged:v10];
    goto LABEL_20;
  }
  if (a2 == 1021)
  {
    id v8 = AXLogSpeakScreen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v13 = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Pid status changed: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    v9 = +[SpeakThisUIServer sharedInstance];
    uint64_t v6 = v9;
    uint64_t v10 = 0;
    goto LABEL_19;
  }
  if (a2 == 1044)
  {
    uint64_t v6 = +[SpeakThisUIServer sharedInstance];
    id v11 = [v6 updateElementVisualsCoalescer];
    [v11 notifyUpdateElementVisualsEventDidOccur];

    goto LABEL_20;
  }
  if (a2 == 1078 && v4)
  {
    uint64_t v6 = +[SpeakThisUIServer sharedInstance];
    [v6 keyboardFocusChangedForSceneIdentifier:v5];
LABEL_20:
  }
LABEL_21:
}

void sub_6444(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  id v5 = +[AXUIClientMessenger clientMessengerWithIdentifier:v3];
  id v6 = [v4 mutableCopy];

  [v6 setObject:a1[5] forKeyedSubscript:STSMessageKeyUUID];
  uint64_t v7 = a1[6];
  id v8 = +[AXAccessQueue mainAccessQueue];
  [v5 sendAsynchronousMessage:v6 withIdentifier:v7 targetAccessQueue:v8 completion:0];

  v9 = AXLogSpeakScreen();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    int v13 = v5;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Got reply: %@ sending to %@", (uint8_t *)&v10, 0x16u);
  }
}

id sub_6ADC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) showUI];
}

id sub_6BD8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) showUIForApplication:*(void *)(*(void *)(a1 + 32) + 32)];
}

void sub_8214(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_822C(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) view];
  id v2 = [v3 window];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 interfaceOrientation];
}

void sub_829C(uint64_t a1)
{
  _AXSetAllowsSuspendedAppServer();
  AXOverrideRequestingClientType();
  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(a1 + 32) updateCache:2084];
    [*(id *)(a1 + 32) updateCache:3046];
  }
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = 0;

  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  *(void *)(*(void *)(a1 + 40) + 64) = -1;
  [*(id *)(a1 + 40) setSpeakingRangeAndElements:0];
  _AXSetAllowsSuspendedAppServer();
  id v8 = [*(id *)(a1 + 40) _fetchNextElementsAndReturnContentStringUsingAppElement:*(void *)(a1 + 32) startingWithPageTurnElement:*(unsigned __int8 *)(a1 + 65) shouldScrollOpaqueProviderIfNecessary:0 deviceOrientation:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_83EC;
  v11[3] = &unk_287C8;
  id v9 = *(id *)(a1 + 48);
  id v12 = v8;
  id v13 = v9;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
  AXOverrideRequestingClientType();
}

uint64_t sub_83EC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void sub_85B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_85D0(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) view];
  uint64_t v2 = [v3 window];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 interfaceOrientation];
}

void sub_8640(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _fetchNextElementsAndReturnContentStringUsingAppElement:0 startingWithPageTurnElement:0 shouldScrollOpaqueProviderIfNecessary:*(unsigned __int8 *)(a1 + 56) deviceOrientation:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  id v3 = [v2 length];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_8788;
  v9[3] = &unk_28818;
  v9[4] = *(void *)(a1 + 32);
  objc_msgSend(v2, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 4, v9);
  [*(id *)(*(void *)(a1 + 32) + 8) addAdditionalContentToSpeechQueue:v2];
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = _NSConcreteStackBlock;
    uint64_t v5 = 3221225472;
    uint64_t v6 = sub_8830;
    uint64_t v7 = &unk_28840;
    id v8 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsFetchingContent:", 0, v4, v5, v6, v7);
}

void sub_8788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) content];
  id v8 = (char *)[v7 length] + a3;

  id v10 = [*(id *)(a1 + 32) sentenceRanges];
  id v9 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v8, a4);
  [v10 addObject:v9];
}

uint64_t sub_8830(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_8840(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_8E44(id a1, RBSAssertion *a2, NSError *a3)
{
  if (a3)
  {
    id v3 = AXLogSpeakScreen();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Assertion for fetching more content was unexpectedly invalidated.", v4, 2u);
    }
  }
}

void sub_9150(id a1, RBSAssertion *a2, NSError *a3)
{
  if (a3)
  {
    id v3 = AXLogSpeakScreen();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Assertion for fetching more content was unexpectedly invalidated.", v4, 2u);
    }
  }
}

void sub_9430(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = AXLogSpeakScreen();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SpeakThis-FetchContent", (const char *)&unk_26FC9, buf, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 56);
  double v6 = 0.5;
  if ((v5 & 0x20) == 0) {
    double v6 = 0.0;
  }
  if ((v5 & 0x10) != 0) {
    double v7 = 0.3;
  }
  else {
    double v7 = v6;
  }
  if ((v5 & 1) != 0 && [*(id *)(*(void *)(a1 + 32) + 8) canResumeWithContent:v3])
  {
    id v8 = *(void **)(*(void *)(a1 + 32) + 8);
    id v29 = 0;
    unsigned __int8 v9 = [v8 resumeSpeakingAfterDelay:&v29 error:v7];
    id v10 = v29;
    if ((v9 & 1) == 0)
    {
      id v11 = AXLogSpeakScreen();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_19498();
      }

      uint64_t v33 = STSMessageReplyKeyErrorCode;
      id v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "_stsErrorCodeForOratorErrorCode:", objc_msgSend(v10, "code")));
      v34 = v12;
      id v13 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
LABEL_25:

      goto LABEL_29;
    }
    goto LABEL_28;
  }
  [*(id *)(*(void *)(a1 + 32) + 8) setContent:v3];
  [*(id *)(*(void *)(a1 + 32) + 8) setSpeakingContext:1];
  id v14 = AXLogSpeakScreen();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SpeakThis-StartSpeaking", (const char *)&unk_26FC9, buf, 2u);
  }

  v15 = *(void **)(*(void *)(a1 + 32) + 8);
  id v28 = 0;
  unsigned __int8 v16 = [v15 startSpeakingWithPreferredLanguage:0 delayBeforeStart:&v28 error:v7];
  id v17 = v28;
  id v10 = v17;
  if (v16)
  {
    uint64_t v18 = *(void *)(a1 + 56);
    if ((v18 & 8) != 0)
    {
      uint64_t v19 = *(void *)(a1 + 32);
      if ((v18 & 0x30) == 0 || *(void *)(v19 + 16))
      {
        [*(id *)(v19 + 16) updateBarWithAppTitleForApp:*(void *)(v19 + 32)];
        [*(id *)(a1 + 32) _updateVCWithLatestHighlightColors];
      }
      else
      {
        [(id)v19 _handleLoadUIAtAppPoint:*(void *)(a1 + 40)];
      }
      id v24 = [v3 length];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_98DC;
      v26[3] = &unk_28818;
      v26[4] = *(void *)(a1 + 32);
      objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v24, 4, v26);
      [*(id *)(a1 + 32) _handleFinishShowingUI];
    }
LABEL_28:
    id v13 = 0;
    goto LABEL_29;
  }
  uint64_t v31 = STSMessageReplyKeyErrorCode;
  v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "_stsErrorCodeForOratorErrorCode:", objc_msgSend(v17, "code")));
  v32 = v20;
  id v13 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];

  if ((*(unsigned char *)(a1 + 56) & 4) != 0 && [v10 code] == (char *)&dword_0 + 1)
  {
    v21 = +[NSBundle bundleForClass:objc_opt_class()];
    id v12 = [v21 localizedStringForKey:@"NO_SPEAKABLE_CONTENT_EXISTS" value:@"NO_SPEAKABLE_CONTENT_EXISTS" table:@"Localizable"];

    [*(id *)(a1 + 32) _handleNoSpeakableContent:v12];
    if (!UIAccessibilityIsVoiceOverRunning())
    {
      [*(id *)(*(void *)(a1 + 32) + 8) setContent:v12];
      v22 = *(void **)(*(void *)(a1 + 32) + 8);
      id v27 = v10;
      [v22 startSpeakingWithPreferredLanguage:0 error:&v27];
      id v23 = v27;

      id v10 = v23;
    }
    goto LABEL_25;
  }
LABEL_29:
  if (([*(id *)(a1 + 32) isPausingAssistiveTechnology] & 1) == 0)
  {
    +[UIAccessibilityNotification postNotification:UIAccessibilityPauseAssistiveTechnologyNotification withData:UIAccessibilityNotificationSwitchControlIdentifier];
    [*(id *)(a1 + 32) setIsPausingAssistiveTechnology:1];
  }
  uint64_t v25 = *(void *)(a1 + 48);
  if (v25) {
    (*(void (**)(uint64_t, void *, void))(v25 + 16))(v25, v13, 0);
  }
}

void sub_98DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [*(id *)(a1 + 32) sentenceRanges];
  double v6 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4);
  [v7 addObject:v6];
}

void sub_9EF4(uint64_t a1, char a2)
{
  if (a2) {
    goto LABEL_7;
  }
  id v3 = *(id **)(a1 + 32);
  id v4 = [v3[1] lastSpokenSubstringRange];
  double v6 = (char *)objc_msgSend(v3, "_findIndexOfRange:", v4, v5);
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = v6;
    unsigned __int8 v9 = [*(id *)(a1 + 32) speakingRangeAndElements];
    id v10 = (char *)[v9 count] - 1;

    if (v8 >= v10)
    {
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      id v11 = [*(id *)(a1 + 32) speakingRangeAndElements];
      id v12 = [v11 objectAtIndexedSubscript:v8 + 1];

      uint64_t v7 = (uint64_t)[v12 range];
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 8) fastForwardWithBoundary:v7])
  {
LABEL_7:
    id v13 = 0;
  }
  else
  {
    uint64_t v15 = STSMessageReplyKeyErrorCode;
    unsigned __int8 v16 = &off_295B8;
    id v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v13, 0);
  }
}

void sub_A0EC(uint64_t a1, char a2)
{
  if (a2) {
    goto LABEL_6;
  }
  id v3 = *(id **)(a1 + 32);
  id v4 = [v3[1] lastSpokenSubstringRange];
  double v6 = (char *)objc_msgSend(v3, "_findIndexOfRange:", v4, v5);
  uint64_t v7 = v6;
  if (v6 && v6 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [*(id *)(a1 + 32) speakingRangeAndElements];
    unsigned __int8 v9 = [v8 objectAtIndexedSubscript:v7 - 1];

    uint64_t v7 = (char *)[v9 range];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 8) rewindWithBoundary:v7])
  {
LABEL_6:
    id v10 = 0;
  }
  else
  {
    uint64_t v12 = STSMessageReplyKeyErrorCode;
    id v13 = &off_295B8;
    id v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v10, 0);
  }
}

void sub_AC0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length] && (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v3) & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 40) + 8) setContent:v3];
    uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 8);
    id v11 = 0;
    id v4 = [v5 startSpeakingWithPreferredLanguage:0 error:&v11];
    id v6 = v11;
    uint64_t v7 = AXLogSpeakScreen();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Updating assertion flags to keep app alive but not necessarily responsive.", buf, 2u);
      }

      [*(id *)(a1 + 40) _clearAssertions:*(void *)(*(void *)(a1 + 40) + 208)];
      id v9 = [v3 length];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_ADE4;
      v10[3] = &unk_28818;
      v10[4] = *(void *)(a1 + 40);
      objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 4, v10);
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Error speaking next page: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v4 = 0;
  }
  [*(id *)(a1 + 40) _finishHandlingPageScroll:v4];
}

void sub_ADE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [*(id *)(a1 + 32) sentenceRanges];
  id v6 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4);
  [v7 addObject:v6];
}

id sub_B7D0(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_B854;
  v2[3] = &unk_28710;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:v2 animations:0.2];
}

id sub_B854(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) temporarilyHideUI];
}

id sub_B860(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) resetUI];
}

id *sub_BF44(id *result, char a2)
{
  if ((a2 & 1) == 0) {
    return (id *)[result[4] _handleSpeakingStopped];
  }
  return result;
}

void sub_C6EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_C71C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 288);
  uint64_t v3 = v2 - (void)[*(id *)(a1 + 40) range];
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void *)(v4 + 288);
  uint64_t v6 = *(void *)(v4 + 296);
  if (v5 >= (unint64_t)[*(id *)(a1 + 40) range]) {
    uint64_t v7 = v3;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(v9 + 288);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v11 = *(void *)(v9 + 296) + v10;
    if (v11 <= (unint64_t)[*(id *)(a1 + 48) length])
    {
      uint64_t v12 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", *(void *)(*(void *)(a1 + 32) + 288), *(void *)(*(void *)(a1 + 32) + 296));

      id v8 = (id)v12;
    }
  }
  uint64_t v13 = [*(id *)(a1 + 40) element];
  uint64_t v14 = [v13 numberWithAXAttribute:2004];
  unint64_t v15 = (unint64_t)[v14 unsignedLongLongValue];

  uint64_t v16 = kAXWebContentTrait;
  unint64_t v17 = kAXWebContentTrait & v15;
  if ((kAXWebContentTrait & v15) != kAXWebContentTrait) {
    goto LABEL_14;
  }
  uint64_t v18 = [*(id *)(a1 + 40) element];
  [v18 updateCache:2310];

  uint64_t v19 = [*(id *)(a1 + 40) element];
  v20 = +[AXElement elementWithUIElement:v19];
  v21 = [v20 elementForAttribute:2310];

  LOBYTE(v19) = [v21 isVisible];
  unsigned int v22 = [*(id *)(a1 + 32) activeWebContentIsHidden];
  if (v19)
  {
    if (v22)
    {
      [*(id *)(a1 + 32) setActiveWebContentIsHidden:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      id v23 = AXLogSpeakScreen();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Starting to highlight web content because we are active again.", buf, 2u);
      }
    }
LABEL_14:
    v57[0] = @"speakThisRangeInElement";
    id v24 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", *(void *)(a1 + 80), *(void *)(a1 + 88));
    v58[0] = v24;
    v58[1] = v8;
    v57[1] = @"speakThisCurrentString";
    v57[2] = @"speakThisWantsSentenceRects";
    v58[2] = &__kCFBooleanFalse;
    v57[3] = @"speakThisIgnoreScrollToVisible";
    uint64_t v25 = +[NSNumber numberWithInt:*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 0];
    v58[3] = v25;
    v21 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:4];

    v55[0] = @"speakThisRangeInElement";
    v26 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v7, v6);
    v56[0] = v26;
    v56[1] = v8;
    v55[1] = @"speakThisCurrentString";
    v55[2] = @"speakThisWantsSentenceRects";
    v56[2] = &__kCFBooleanTrue;
    v55[3] = @"speakThisIgnoreScrollToVisible";
    id v27 = +[NSNumber numberWithInt:*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 0];
    v56[3] = v27;
    id v28 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:4];

    id v29 = 0;
    if (v17 == v16 && *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      v30 = [*(id *)(a1 + 40) element];
      unsigned int v31 = [v30 BOOLWithAXAttribute:2093];

      if (v31)
      {
        v32 = [*(id *)(a1 + 40) element];
        id v29 = [v32 objectWithAXAttribute:95224 parameter:v28];

        if ([v29 count])
        {
          uint64_t v33 = [*(id *)(a1 + 40) element];
          v34 = +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", [v33 objectWithAXAttribute:2092]);

          v35 = [v34 uiElement];
          v36 = [v29 lastObject];
          [v35 performAXAction:2039 withValue:v36];
        }
      }
      else
      {
        id v29 = 0;
      }
    }
    if ([*(id *)(a1 + 32) highlightWords])
    {
      v37 = [*(id *)(a1 + 40) element];
      v38 = [v37 objectWithAXAttribute:95224 parameter:v21];

      if (![v38 count])
      {
        v39 = [v38 firstObject];
        [v39 CGRectValue];
        v61.origin.x = CGRectZero.origin.x;
        v61.origin.y = CGRectZero.origin.y;
        v61.size.width = CGRectZero.size.width;
        v61.size.height = CGRectZero.size.height;
        BOOL v40 = CGRectEqualToRect(v59, v61);

        if (v40)
        {
          *(_OWORD *)(*(void *)(a1 + 32) + 288) = xmmword_268F0;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
        }
      }
    }
    else
    {
      v38 = 0;
    }
    if ([*(id *)(a1 + 32) highlightSentences]
      && *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      v41 = [*(id *)(a1 + 40) element];
      v42 = [v41 objectWithAXAttribute:95224 parameter:v28];

      if (![v42 count])
      {
        v43 = [v42 firstObject];
        [v43 CGRectValue];
        v62.origin.x = CGRectZero.origin.x;
        v62.origin.y = CGRectZero.origin.y;
        v62.size.width = CGRectZero.size.width;
        v62.size.height = CGRectZero.size.height;
        BOOL v44 = CGRectEqualToRect(v60, v62);

        if (v44) {
          *(_OWORD *)(*(void *)(a1 + 32) + 288) = xmmword_268F0;
        }
      }
    }
    else
    {
      v42 = v29;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_CDD4;
    block[3] = &unk_28990;
    v45 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v50 = v45;
    id v51 = v38;
    uint64_t v46 = *(void *)(a1 + 72);
    id v52 = v42;
    uint64_t v53 = v46;
    id v47 = v42;
    id v48 = v38;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_36:
    goto LABEL_37;
  }
  if ((v22 & 1) == 0)
  {
    [*(id *)(a1 + 32) setActiveWebContentIsHidden:1];
    id v28 = AXLogSpeakScreen();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Skipping highlighting because web content is hidden. We are probably on a different tab", buf, 2u);
    }
    goto LABEL_36;
  }
LABEL_37:
}

void sub_CDD4(uint64_t a1)
{
  if (_AXSQuickSpeakHighlightTextEnabled()
    && [*(id *)(a1 + 32) isReadingFromFrontmostApp])
  {
    if ([*(id *)(a1 + 32) needToRefreshContextIds])
    {
      uint64_t v2 = [*(id *)(a1 + 40) element];
      [v2 updateCache:2021];
    }
    if ([*(id *)(a1 + 32) highlightWords])
    {
      uint64_t v3 = *(id **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 48);
      unint64_t v5 = [v3[2] view];
      uint64_t v6 = [*(id *)(a1 + 40) element];
      uint64_t v7 = [v3 _convertAXValueSceneReferenceRects:v4 toView:v5 fromElement:v6];

      id v8 = AXLogSpeakScreen();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_197E0();
      }

      [*(id *)(*(void *)(a1 + 32) + 16) setHighlightSelectionRects:v7];
      [*(id *)(a1 + 32) _updateIsHighlightVisible];
    }
    if ([*(id *)(a1 + 32) highlightSentences]
      && *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      uint64_t v9 = *(id **)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 56);
      unint64_t v11 = [v9[2] view];
      uint64_t v12 = [*(id *)(a1 + 40) element];
      uint64_t v13 = [v9 _convertAXValueSceneReferenceRects:v10 toView:v11 fromElement:v12];

      uint64_t v14 = AXLogSpeakScreen();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_19774();
      }

      [*(id *)(*(void *)(a1 + 32) + 16) setSentenceHighlightSelectionRects:v13];
      [*(id *)(a1 + 32) _updateIsHighlightVisible];
    }
  }
  unint64_t v15 = AXLogSpeakScreen();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SpeakThis-FetchRects", (const char *)&unk_26FC9, v16, 2u);
  }
}

void sub_D1F4(id a1)
{
}

void sub_DD1C(uint64_t a1)
{
  if (_AXSSpeakThisEnabled())
  {
    uint64_t v2 = +[AXSettings sharedInstance];
    unsigned int v3 = [v2 showSpeechController];

    uint64_t v4 = [*(id *)(a1 + 32) eventProcessor];
    unint64_t v5 = v4;
    if (v3)
    {
      [v4 beginHandlingHIDEventsForReason:@"Speak screen was turned on with the speech controller always visible"];

      uint64_t v6 = *(void **)(a1 + 32);
      [v6 _handleLoadSpeakUnderfingerUI];
      return;
    }
  }
  else
  {
    [*(id *)(a1 + 32) stopButtonPressed];
    [*(id *)(a1 + 32) _handleHideUI];
    uint64_t v4 = [*(id *)(a1 + 32) eventProcessor];
    unint64_t v5 = v4;
  }
  unsigned int v7 = [v4 isHandlingHIDEvents];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) eventProcessor];
    [v8 endHandlingHIDEventsForReason:@"Speak screen was turned on with the speech controller always visible"];
  }
}

id sub_E298(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isWaitingForPageScroll];
  if (result)
  {
    unsigned int v3 = *(void **)(a1 + 32);
    return [v3 _handleNewPage];
  }
  return result;
}

void sub_E508(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  id v4 = [v2 window];

  objc_msgSend(*(id *)(a1 + 32), "setContextID:", objc_msgSend(v4, "_contextId"));
  unsigned int v3 = [*(id *)(a1 + 40) eventProcessor];
  [v3 addEventContextForWindow:v4];
}

id sub_E7BC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) eventProcessor];
  objc_msgSend(v2, "removeEventContextForContextID:", objc_msgSend(*(id *)(a1 + 40), "contextID"));

  unsigned int v3 = +[AXUIDisplayManager sharedDisplayManager];
  [v3 removeContentViewController:*(void *)(a1 + 40) withUserInteractionEnabled:1 forService:*(void *)(a1 + 32)];

  id v4 = *(void **)(*(void *)(a1 + 32) + 128);
  uint64_t v5 = *(void *)(a1 + 48);

  return [v4 removeObjectForKey:v5];
}

id sub_E844(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v2 updateUIForDisplayChange];
}

uint64_t sub_E88C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_EA84(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  unsigned int v3 = [*(id *)(a1 + 40) view];
  id v4 = [v3 window];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) view];
    uint64_t v6 = [v5 window];
    unsigned int v7 = [v6 screen];
    id v8 = [v7 displayIdentity];
    uint64_t v9 = [v8 displayID];

    uint64_t v10 = [*(id *)(a1 + 40) view];
    unint64_t v11 = [v10 window];
    id v12 = [v11 _contextId];

    uint64_t v13 = [*(id *)(a1 + 32) hitTestCategoryAssertion];
    [v13 invalidate];

    uint64_t v14 = +[BKSTouchEventService sharedInstance];
    unint64_t v15 = +[NSNumber numberWithUnsignedInt:v12];
    uint64_t v19 = v15;
    uint64_t v16 = +[NSArray arrayWithObjects:&v19 count:1];
    unint64_t v17 = [v14 setContextIDs:v16 forHitTestContextCategory:1];
    [*(id *)(a1 + 32) setHitTestCategoryAssertion:v17];

    uint64_t v18 = [*(id *)(a1 + 32) eventProcessor];
    [v18 setActiveDisplayId:v9];
  }
}

uint64_t sub_EC5C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_EFB0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) updateUIForDisplayChange];
}

void sub_F940(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_F980(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_F99C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_F9C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1053C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_10550(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSpeedButtonTitle];
}

BOOL sub_13B00(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

void sub_14248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1426C(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 40));
  AXPerformBlockOnMainThread();
  objc_destroyWeak(&v1);
}

void sub_142FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_14310(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setAlpha:1.0];
  uint64_t v2 = +[AXUIDisplayManager sharedDisplayManager];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v2 registerNubbit:v3 delegate:WeakRetained];

  id v5 = +[AXSettings sharedInstance];
  [v5 speechControllerIdleOpacity];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setAlpha:");
}

id sub_14844(uint64_t a1)
{
  +[AXSpeakOverlayControlBar controlBarSize];
  double v3 = v2;
  double v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 32) view];
  [v6 bounds];
  double v7 = floor((CGRectGetWidth(v14) - v3) * 0.5);
  [*(id *)(*(void *)(a1 + 32) + 8) frame];
  double v9 = v8;
  [*(id *)(*(void *)(a1 + 32) + 8) frame];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setFrame:", v7, fmax(v9 + v10 - v5, 0.0), v3, v5);

  [*(id *)(*(void *)(a1 + 32) + 104) updateButtonConstraints];
  unint64_t v11 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v11 layoutIfNeeded];
}

id sub_14B40(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setAlpha:1.0];
}

id sub_14CE0(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 72), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void sub_15CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_15CE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained collapseNubbit];
}

id sub_16090(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) frame];
  double v3 = v2;
  double v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 32) stateManager];
  unsigned int v7 = [v6 inTabMode];

  if (v7)
  {
    +[AXSpeakOverlayControlBar nubbitSize];
    double v9 = v8;
    double v11 = v10;
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v12 view];
    [v13 frame];
    objc_msgSend(v12, "_denormalizedNubbitOriginForViewSize:", v14, v15);
    double v17 = v16;
    double v19 = v18;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setFrame:", v17, v19, v9, v11);
  }
  else
  {
    +[AXSpeakOverlayControlBar controlBarSize];
    double v21 = v20;
    double v23 = v22;
    id v24 = [*(id *)(a1 + 32) view];
    [v24 bounds];
    double v25 = floor((CGRectGetWidth(v32) - v21) * 0.5);
    double v26 = fmax(v3 + v5 - v23, 0.0);

    unsigned int v27 = objc_msgSend(*(id *)(a1 + 32), "_axIsPointInForeheadRect:", v25, v26);
    uint64_t v28 = *(void *)(a1 + 32);
    if (v27) {
      double v26 = *(double *)(v28 + 40) + *(double *)(v28 + 56) + 2.0;
    }
    objc_msgSend(*(id *)(v28 + 8), "setFrame:", v25, v26, v21, v23);
    [*(id *)(*(void *)(a1 + 32) + 104) updateButtonConstraints];
  }
  [*(id *)(*(void *)(a1 + 32) + 8) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 104) updateForTabModeChangeUsingSpeakFingerButton:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateNubbitForTabModeChange];
  id v29 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v29 layoutIfNeeded];
}

id sub_16470(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setAlpha:0.0];
}

uint64_t sub_16488(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_17060(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_denormalizedNubbitOriginForViewSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v3 = v2;
  double v5 = v4;
  [*(id *)(*(void *)(a1 + 32) + 8) frame];
  double v7 = v6;
  double v9 = v8;
  double v10 = [*(id *)(a1 + 32) stateManager];
  unsigned __int8 v11 = [v10 inTabMode];

  if ((v11 & 1) == 0)
  {
    id v12 = [*(id *)(a1 + 32) view];
    [v12 frame];
    double Width = CGRectGetWidth(v17);
    [*(id *)(*(void *)(a1 + 32) + 8) frame];
    double v3 = floor((Width - CGRectGetWidth(v18)) * 0.5);
  }
  double v14 = *(void **)(*(void *)(a1 + 32) + 8);

  return objc_msgSend(v14, "setFrame:", v3, v5, v7, v9);
}

void sub_17150(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) stateManager];
  unsigned int v3 = [v2 inTabMode];

  if (v3)
  {
    double v4 = *(void **)(a1 + 32);
    [v4 _registerNubbit];
  }
}

id sub_175FC(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  unsigned int v3 = [v2 view];
  [v3 frame];
  objc_msgSend(v2, "_denormalizedNubbitOriginForViewSize:", v4, v5);
  double v7 = v6;
  double v9 = v8;

  [*(id *)(*(void *)(a1 + 32) + 8) frame];
  double v11 = v10;
  double v13 = v12;
  double v14 = +[UIScreen mainScreen];
  [v14 bounds];
  double v16 = vabdd_f64(v15, *(double *)(a1 + 48));

  if (v16 >= 2.22044605e-16)
  {
    v29.origin.x = v7;
    v29.origin.y = v9;
    v29.size.width = v11;
    v29.size.height = v13;
    if (CGRectIntersectsRect(*(CGRect *)(a1 + 40), v29)
      && (+[UIScreen mainScreen],
          double v19 = objc_claimAutoreleasedReturnValue(),
          [v19 bounds],
          double v21 = vabdd_f64(v20, *(double *)(a1 + 48) + *(double *)(a1 + 64)),
          v19,
          v21 < 2.22044605e-16))
    {
      v28.origin.x = v7;
      v28.origin.y = v9;
      v28.size.width = v11;
      v28.size.height = v13;
      double v22 = v9 - (CGRectGetMaxY(v28) - *(double *)(a1 + 48));
      if (v22 >= 0.0) {
        double v23 = v22;
      }
      else {
        double v23 = 0.0;
      }
      [*(id *)(*(void *)(a1 + 32) + 8) frame];
      if (vabdd_f64(v24, v23) >= 0.001)
      {
        if (([*(id *)(a1 + 32) ignoreNextNubbitPositionUpdate] & 1) == 0) {
          [*(id *)(a1 + 32) _saveNubbitPosition];
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setFrame:", v7, v23, v11, v13);
      }
      double v25 = *(void **)(a1 + 32);
      return [v25 setIgnoreNextNubbitPositionUpdate:1];
    }
    else
    {
      id result = [*(id *)(a1 + 32) ignoreNextNubbitPositionUpdate];
      if ((result & 1) == 0)
      {
        double v26 = *(void **)(a1 + 32);
        return [v26 _saveNubbitPosition];
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) setIgnoreNextNubbitPositionUpdate:0];
    CGRect v17 = *(void **)(*(void *)(a1 + 32) + 8);
    return objc_msgSend(v17, "setFrame:", v7, v9, v11, v13);
  }
  return result;
}

void sub_17854(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) stateManager];
  unsigned int v3 = [v2 inTabMode];

  if (v3)
  {
    double v4 = *(void **)(a1 + 32);
    [v4 _registerNubbit];
  }
}

id AXSpeakBundle()
{
  if (qword_30230 != -1) {
    dispatch_once(&qword_30230, &stru_28BD0);
  }
  v0 = (void *)qword_30228;

  return v0;
}

void sub_17E2C(id a1)
{
  uint64_t v1 = +[NSBundle bundleForClass:objc_opt_class()];
  double v2 = (void *)qword_30228;
  qword_30228 = v1;
}

id AXSpeakThisLocString(void *a1)
{
  id v1 = a1;
  double v2 = AXSpeakBundle();
  unsigned int v3 = [v2 localizedStringForKey:v1 value:v1 table:@"Localizable"];

  return v3;
}

id AXSpeakThisSpeakingRateStringForSpeed(double a1)
{
  if (fabs(a1 + -0.5) < 0.001)
  {
    double v2 = @"SPEED_HALF";
LABEL_9:
    unsigned int v3 = AXSpeakThisLocString(v2);
    goto LABEL_10;
  }
  if (fabs(a1 + -1.0) < 0.001)
  {
    double v2 = @"SPEED_NORMAL";
    goto LABEL_9;
  }
  if (fabs(a1 + -1.5) < 0.001)
  {
    double v2 = @"SPEED_ONE_AND_HALF";
    goto LABEL_9;
  }
  if (fabs(a1 + -2.0) < 0.001)
  {
    double v2 = @"SPEED_TWO";
    goto LABEL_9;
  }
  double v5 = AXSpeakThisLocString(@"SPEED_GENERIC");
  unsigned int v3 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, *(void *)&a1);

LABEL_10:

  return v3;
}

void sub_1805C(id a1)
{
  id v1 = objc_alloc_init(SpeakThisUIStateManager);
  double v2 = (void *)qword_30240;
  qword_30240 = (uint64_t)v1;
}

void sub_186BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_186D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_186E4(uint64_t a1)
{
}

id sub_186EC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _handleEvent:a2];
}

void sub_1904C(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) delegate];
  unsigned int v3 = [v2 isSpeaking];

  double v4 = [*(id *)(a1 + 32) delegate];
  id v5 = v4;
  if (v3) {
    [v4 stopButtonPressed];
  }
  else {
    [v4 startNewReadAllFromGesture];
  }
}

void sub_190CC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 exitSpeakFingerModeWithEventProcessor:*(void *)(a1 + 32)];
}

void sub_19120(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "speakElementAtPoint:withEventProcessor:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void sub_19258()
{
  sub_F9BC();
  sub_F940(&dword_0, v0, v1, "Screen changed", v2, v3, v4, v5, v6);
}

void sub_1928C()
{
  sub_F9BC();
  sub_F940(&dword_0, v0, v1, "Page scrolled", v2, v3, v4, v5, v6);
}

void sub_192C0(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = *(void *)(a1 + 128);
  uint64_t v4 = +[NSThread callStackSymbols];
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  double v8 = v4;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Hiding all UI: %@, %@", (uint8_t *)&v5, 0x16u);
}

void sub_19378(void *a1, NSObject *a2)
{
  [a1 count];
  sub_F95C();
  sub_F9C8(&dword_0, a2, v3, "Stopping opaque element fetch because nil element found. Stopped after finding %lu elements.", v4);
}

void sub_193F8(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = +[NSNumber numberWithInt:a1];
  sub_F95C();
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Could not make RBSTarget for %@", v4, 0xCu);
}

void sub_19498()
{
  sub_F95C();
  sub_F980(&dword_0, v0, v1, "Received error when resuming speaking, even though orator claimed we could resume: %@", v2, v3, v4, v5, v6);
}

void sub_19500(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "updating speaking rate to: %d", (uint8_t *)v2, 8u);
}

void sub_19578()
{
  sub_F95C();
  sub_F980(&dword_0, v0, v1, "Received unknown message identifier %lu.", v2, v3, v4, v5, v6);
}

void sub_195E0()
{
  sub_F95C();
  sub_F980(&dword_0, v0, v1, "unable to find AXElement for app with bundleID: %@", v2, v3, v4, v5, v6);
}

void sub_19648()
{
  sub_F95C();
  sub_F980(&dword_0, v0, v1, "view with identifier:%@, not found", v2, v3, v4, v5, v6);
}

void sub_196B0()
{
  sub_F9BC();
  sub_F940(&dword_0, v0, v1, "Not getting text rects because the app being spoken is not foremost", v2, v3, v4, v5, v6);
}

void sub_196E4(NSRange a1, NSObject *a2)
{
  uint64_t v3 = NSStringFromRange(a1);
  sub_F95C();
  sub_F9C8(&dword_0, a2, v4, "Range in element was %{public}@", v5);
}

void sub_19774()
{
  sub_F95C();
  sub_F9C8(&dword_0, v0, v1, "Got sentence rects %{public}@", v2);
}

void sub_197E0()
{
  sub_F95C();
  sub_F9C8(&dword_0, v0, v1, "Got text rects %{public}@", v2);
}

void sub_1984C()
{
  sub_F9BC();
  sub_F940(&dword_0, v0, v1, "More elements were requested, but speak screen has stopped, so not providing any additional content.", v2, v3, v4, v5, v6);
}

void sub_19880()
{
  sub_F95C();
  sub_F9C8(&dword_0, v0, v1, "Content view controller already exists for %@", v2);
}

void sub_198EC()
{
  sub_F968();
  sub_F99C(&dword_0, v0, v1, "Adding content view controller %@ for window scene: %@");
}

void sub_19954()
{
  sub_F95C();
  sub_F980(&dword_0, v0, v1, "Window scene returned nil view controller: %@", v2, v3, v4, v5, v6);
}

void sub_199BC()
{
  sub_F968();
  sub_F99C(&dword_0, v0, v1, "Removing content view controller %@ for window scene: %@");
}

void sub_19A24()
{
  sub_F968();
  sub_F99C(&dword_0, v0, v1, "Updating content view controller %@ for window scene: %@");
}

void sub_19A8C()
{
  sub_F9BC();
  sub_F940(&dword_0, v0, v1, "Active display changed", v2, v3, v4, v5, v6);
}

void sub_19AC0()
{
  sub_F9BC();
  sub_F940(&dword_0, v0, v1, "External display connected", v2, v3, v4, v5, v6);
}

void sub_19AF4()
{
  sub_F9BC();
  sub_F940(&dword_0, v0, v1, "External display disconnected", v2, v3, v4, v5, v6);
}

void sub_19B28(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Added event context for contextID: %u", (uint8_t *)v2, 8u);
}

void sub_19BA0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to remove event context for contextID: %u", (uint8_t *)v2, 8u);
}

void sub_19C18(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Removed event context for contextID: %u", (uint8_t *)v2, 8u);
}

uint64_t AXDeviceHasJindo()
{
  return _AXDeviceHasJindo();
}

uint64_t AXDeviceIsPad()
{
  return _AXDeviceIsPad();
}

uint64_t AXFormatLocalizedPlaybackSpeedFactor()
{
  return _AXFormatLocalizedPlaybackSpeedFactor();
}

uint64_t AXLogSpeakScreen()
{
  return _AXLogSpeakScreen();
}

uint64_t AXOverrideRequestingClientType()
{
  return _AXOverrideRequestingClientType();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t AXPerformBlockOnMainThread()
{
  return _AXPerformBlockOnMainThread();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return _AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t AXPerformBlockSynchronouslyOnMainThread()
{
  return _AXPerformBlockSynchronouslyOnMainThread();
}

uint64_t AXReadAllUtilitiesElementsToCombineForReadAll()
{
  return _AXReadAllUtilitiesElementsToCombineForReadAll();
}

uint64_t AXSpeakHighlightColor()
{
  return _AXSpeakHighlightColor();
}

AXError AXUIElementGetPid(AXUIElementRef element, pid_t *pid)
{
  return _AXUIElementGetPid(element, pid);
}

CFTypeID AXUIElementGetTypeID(void)
{
  return _AXUIElementGetTypeID();
}

AXError AXUIElementSetMessagingTimeout(AXUIElementRef element, float timeoutInSeconds)
{
  return _AXUIElementSetMessagingTimeout(element, timeoutInSeconds);
}

Boolean AXValueGetValue(AXValueRef value, AXValueType theType, void *valuePtr)
{
  return _AXValueGetValue(value, theType, valuePtr);
}

uint64_t AX_CGRectGetCenter()
{
  return _AX_CGRectGetCenter();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGRect CGRectFromString(NSString *string)
{
  return _CGRectFromString(string);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return _UIAccessibilityIsSwitchControlRunning();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
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

UIImageSymbolWeight UIImageSymbolWeightForFontWeight(UIFontWeight fontWeight)
{
  return _UIImageSymbolWeightForFontWeight(fontWeight);
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return __AXSApplicationAccessibilityEnabled();
}

uint64_t _AXSApplicationAccessibilitySetEnabled()
{
  return __AXSApplicationAccessibilitySetEnabled();
}

uint64_t _AXSQuickSpeakHighlightTextEnabled()
{
  return __AXSQuickSpeakHighlightTextEnabled();
}

uint64_t _AXSSpeakThisEnabled()
{
  return __AXSSpeakThisEnabled();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
}

uint64_t _AXSetAllowsSuspendedAppServer()
{
  return __AXSetAllowsSuspendedAppServer();
}

void _Block_object_dispose(const void *a1, const int a2)
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return [a1 CGRectValue];
}

id objc_msgSend__assertionAttributesForFetchingMoreContent(void *a1, const char *a2, ...)
{
  return [a1 _assertionAttributesForFetchingMoreContent];
}

id objc_msgSend__assertionAttributesForStayingAlive(void *a1, const char *a2, ...)
{
  return [a1 _assertionAttributesForStayingAlive];
}

id objc_msgSend__buttons(void *a1, const char *a2, ...)
{
  return [a1 _buttons];
}

id objc_msgSend__clearAllAssertions(void *a1, const char *a2, ...)
{
  return [a1 _clearAllAssertions];
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return [a1 _contextId];
}

id objc_msgSend__didToggleHighlightContentSetting(void *a1, const char *a2, ...)
{
  return [a1 _didToggleHighlightContentSetting];
}

id objc_msgSend__didToggleSpeakScreenSetting(void *a1, const char *a2, ...)
{
  return [a1 _didToggleSpeakScreenSetting];
}

id objc_msgSend__dispatchQueueForFetches(void *a1, const char *a2, ...)
{
  return [a1 _dispatchQueueForFetches];
}

id objc_msgSend__enqueueCollapseTimer(void *a1, const char *a2, ...)
{
  return [a1 _enqueueCollapseTimer];
}

id objc_msgSend__handleFinishShowingUI(void *a1, const char *a2, ...)
{
  return [a1 _handleFinishShowingUI];
}

id objc_msgSend__handleHideUI(void *a1, const char *a2, ...)
{
  return [a1 _handleHideUI];
}

id objc_msgSend__handleIdleTimerReset(void *a1, const char *a2, ...)
{
  return [a1 _handleIdleTimerReset];
}

id objc_msgSend__handleLoadSpeakUnderfingerUI(void *a1, const char *a2, ...)
{
  return [a1 _handleLoadSpeakUnderfingerUI];
}

id objc_msgSend__handlePauseSpeaking(void *a1, const char *a2, ...)
{
  return [a1 _handlePauseSpeaking];
}

id objc_msgSend__handleResumeSpeaking(void *a1, const char *a2, ...)
{
  return [a1 _handleResumeSpeaking];
}

id objc_msgSend__handleSpeakFaster(void *a1, const char *a2, ...)
{
  return [a1 _handleSpeakFaster];
}

id objc_msgSend__handleSpeakSlower(void *a1, const char *a2, ...)
{
  return [a1 _handleSpeakSlower];
}

id objc_msgSend__handleToggleSpeaking(void *a1, const char *a2, ...)
{
  return [a1 _handleToggleSpeaking];
}

id objc_msgSend__handleUpdateUIForSpeakUnderFingerSettingsChange(void *a1, const char *a2, ...)
{
  return [a1 _handleUpdateUIForSpeakUnderFingerSettingsChange];
}

id objc_msgSend__initializeContainingView(void *a1, const char *a2, ...)
{
  return [a1 _initializeContainingView];
}

id objc_msgSend__initializeUIIfNeccessary(void *a1, const char *a2, ...)
{
  return [a1 _initializeUIIfNeccessary];
}

id objc_msgSend__registerNubbit(void *a1, const char *a2, ...)
{
  return [a1 _registerNubbit];
}

id objc_msgSend__roundButtons(void *a1, const char *a2, ...)
{
  return [a1 _roundButtons];
}

id objc_msgSend__saveNubbitPosition(void *a1, const char *a2, ...)
{
  return [a1 _saveNubbitPosition];
}

id objc_msgSend__sceneIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _sceneIdentifier];
}

id objc_msgSend__speakFingerStateChanged(void *a1, const char *a2, ...)
{
  return [a1 _speakFingerStateChanged];
}

id objc_msgSend__squareButtons(void *a1, const char *a2, ...)
{
  return [a1 _squareButtons];
}

id objc_msgSend__systemApp(void *a1, const char *a2, ...)
{
  return [a1 _systemApp];
}

id objc_msgSend__unregisterNubbit(void *a1, const char *a2, ...)
{
  return [a1 _unregisterNubbit];
}

id objc_msgSend__updateAccessibilityElements(void *a1, const char *a2, ...)
{
  return [a1 _updateAccessibilityElements];
}

id objc_msgSend__updateForContinuityStateChange(void *a1, const char *a2, ...)
{
  return [a1 _updateForContinuityStateChange];
}

id objc_msgSend__updateGestureRecognizers(void *a1, const char *a2, ...)
{
  return [a1 _updateGestureRecognizers];
}

id objc_msgSend__updateIsHighlightVisible(void *a1, const char *a2, ...)
{
  return [a1 _updateIsHighlightVisible];
}

id objc_msgSend__updateNubbitForTabModeChange(void *a1, const char *a2, ...)
{
  return [a1 _updateNubbitForTabModeChange];
}

id objc_msgSend__updateSpeedButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 _updateSpeedButtonTitle];
}

id objc_msgSend__updateTabButtonToExpandCollapseButton(void *a1, const char *a2, ...)
{
  return [a1 _updateTabButtonToExpandCollapseButton];
}

id objc_msgSend__updateTabButtonToSpeakFingerButton(void *a1, const char *a2, ...)
{
  return [a1 _updateTabButtonToSpeakFingerButton];
}

id objc_msgSend__updateVCWithLatestHighlightColors(void *a1, const char *a2, ...)
{
  return [a1 _updateVCWithLatestHighlightColors];
}

id objc_msgSend__windowSceneForActiveDisplay(void *a1, const char *a2, ...)
{
  return [a1 _windowSceneForActiveDisplay];
}

id objc_msgSend_activeDisplayId(void *a1, const char *a2, ...)
{
  return [a1 activeDisplayId];
}

id objc_msgSend_activeWebContentIsHidden(void *a1, const char *a2, ...)
{
  return [a1 activeWebContentIsHidden];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assertionsForFetchingContent(void *a1, const char *a2, ...)
{
  return [a1 assertionsForFetchingContent];
}

id objc_msgSend_assertionsForStayingAlive(void *a1, const char *a2, ...)
{
  return [a1 assertionsForStayingAlive];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_axElement(void *a1, const char *a2, ...)
{
  return [a1 axElement];
}

id objc_msgSend_barDidReceiveFocus(void *a1, const char *a2, ...)
{
  return [a1 barDidReceiveFocus];
}

id objc_msgSend_borderEffectView(void *a1, const char *a2, ...)
{
  return [a1 borderEffectView];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_buttonEffectView(void *a1, const char *a2, ...)
{
  return [a1 buttonEffectView];
}

id objc_msgSend_cachedIsHighlightVisible(void *a1, const char *a2, ...)
{
  return [a1 cachedIsHighlightVisible];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_changeToResumeButton(void *a1, const char *a2, ...)
{
  return [a1 changeToResumeButton];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collapseNubbit(void *a1, const char *a2, ...)
{
  return [a1 collapseNubbit];
}

id objc_msgSend_collapseTimer(void *a1, const char *a2, ...)
{
  return [a1 collapseTimer];
}

id objc_msgSend_configurationWithoutTextStyle(void *a1, const char *a2, ...)
{
  return [a1 configurationWithoutTextStyle];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return [a1 contextID];
}

id objc_msgSend_contextIdForActiveDisplay(void *a1, const char *a2, ...)
{
  return [a1 contextIdForActiveDisplay];
}

id objc_msgSend_controlBarSize(void *a1, const char *a2, ...)
{
  return [a1 controlBarSize];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentAppBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 currentAppBundleIdentifier];
}

id objc_msgSend_currentApplication(void *a1, const char *a2, ...)
{
  return [a1 currentApplication];
}

id objc_msgSend_currentContent(void *a1, const char *a2, ...)
{
  return [a1 currentContent];
}

id objc_msgSend_currentControllerTitle(void *a1, const char *a2, ...)
{
  return [a1 currentControllerTitle];
}

id objc_msgSend_currentSpeakingRange(void *a1, const char *a2, ...)
{
  return [a1 currentSpeakingRange];
}

id objc_msgSend_currentSpeakingRateChanged(void *a1, const char *a2, ...)
{
  return [a1 currentSpeakingRateChanged];
}

id objc_msgSend_currentSpeechRateForAdjustment(void *a1, const char *a2, ...)
{
  return [a1 currentSpeechRateForAdjustment];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_currentUnmodifiedSentenceRects(void *a1, const char *a2, ...)
{
  return [a1 currentUnmodifiedSentenceRects];
}

id objc_msgSend_currentVoiceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 currentVoiceIdentifier];
}

id objc_msgSend_currentWordRange(void *a1, const char *a2, ...)
{
  return [a1 currentWordRange];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didPause(void *a1, const char *a2, ...)
{
  return [a1 didPause];
}

id objc_msgSend_didResume(void *a1, const char *a2, ...)
{
  return [a1 didResume];
}

id objc_msgSend_didStop(void *a1, const char *a2, ...)
{
  return [a1 didStop];
}

id objc_msgSend_displayConfiguration(void *a1, const char *a2, ...)
{
  return [a1 displayConfiguration];
}

id objc_msgSend_displayID(void *a1, const char *a2, ...)
{
  return [a1 displayID];
}

id objc_msgSend_displayIdentity(void *a1, const char *a2, ...)
{
  return [a1 displayIdentity];
}

id objc_msgSend_doubleSpeakingRateAsInt(void *a1, const char *a2, ...)
{
  return [a1 doubleSpeakingRateAsInt];
}

id objc_msgSend_doubleTapRecognizer(void *a1, const char *a2, ...)
{
  return [a1 doubleTapRecognizer];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_element(void *a1, const char *a2, ...)
{
  return [a1 element];
}

id objc_msgSend_eventProcessor(void *a1, const char *a2, ...)
{
  return [a1 eventProcessor];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_expandNubbit(void *a1, const char *a2, ...)
{
  return [a1 expandNubbit];
}

id objc_msgSend_explanation(void *a1, const char *a2, ...)
{
  return [a1 explanation];
}

id objc_msgSend_fastForwardButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 fastForwardButtonPressed];
}

id objc_msgSend_fingerWasLiftedInSpeakUnderFingerMode(void *a1, const char *a2, ...)
{
  return [a1 fingerWasLiftedInSpeakUnderFingerMode];
}

id objc_msgSend_finishLoading(void *a1, const char *a2, ...)
{
  return [a1 finishLoading];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_focusManager(void *a1, const char *a2, ...)
{
  return [a1 focusManager];
}

id objc_msgSend_fontAttributes(void *a1, const char *a2, ...)
{
  return [a1 fontAttributes];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_halfSpeakingRateAsInt(void *a1, const char *a2, ...)
{
  return [a1 halfSpeakingRateAsInt];
}

id objc_msgSend_handInfo(void *a1, const char *a2, ...)
{
  return [a1 handInfo];
}

id objc_msgSend_hardwareIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hardwareIdentifier];
}

id objc_msgSend_hasWebContent(void *a1, const char *a2, ...)
{
  return [a1 hasWebContent];
}

id objc_msgSend_headerTapped(void *a1, const char *a2, ...)
{
  return [a1 headerTapped];
}

id objc_msgSend_hideStopButton(void *a1, const char *a2, ...)
{
  return [a1 hideStopButton];
}

id objc_msgSend_highlightColor(void *a1, const char *a2, ...)
{
  return [a1 highlightColor];
}

id objc_msgSend_highlightSelectionRects(void *a1, const char *a2, ...)
{
  return [a1 highlightSelectionRects];
}

id objc_msgSend_highlightSentences(void *a1, const char *a2, ...)
{
  return [a1 highlightSentences];
}

id objc_msgSend_highlightView(void *a1, const char *a2, ...)
{
  return [a1 highlightView];
}

id objc_msgSend_highlightWords(void *a1, const char *a2, ...)
{
  return [a1 highlightWords];
}

id objc_msgSend_hitTestCategoryAssertion(void *a1, const char *a2, ...)
{
  return [a1 hitTestCategoryAssertion];
}

id objc_msgSend_ignoreNextNubbitPositionUpdate(void *a1, const char *a2, ...)
{
  return [a1 ignoreNextNubbitPositionUpdate];
}

id objc_msgSend_inTabMode(void *a1, const char *a2, ...)
{
  return [a1 inTabMode];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAXAttributedString(void *a1, const char *a2, ...)
{
  return [a1 isAXAttributedString];
}

id objc_msgSend_isContinuitySessionActive(void *a1, const char *a2, ...)
{
  return [a1 isContinuitySessionActive];
}

id objc_msgSend_isFetchingContent(void *a1, const char *a2, ...)
{
  return [a1 isFetchingContent];
}

id objc_msgSend_isHandlingHIDEvents(void *a1, const char *a2, ...)
{
  return [a1 isHandlingHIDEvents];
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return [a1 isPaused];
}

id objc_msgSend_isPausingAssistiveTechnology(void *a1, const char *a2, ...)
{
  return [a1 isPausingAssistiveTechnology];
}

id objc_msgSend_isReadingFromFrontmostApp(void *a1, const char *a2, ...)
{
  return [a1 isReadingFromFrontmostApp];
}

id objc_msgSend_isSpeaking(void *a1, const char *a2, ...)
{
  return [a1 isSpeaking];
}

id objc_msgSend_isSpringBoard(void *a1, const char *a2, ...)
{
  return [a1 isSpringBoard];
}

id objc_msgSend_isVisible(void *a1, const char *a2, ...)
{
  return [a1 isVisible];
}

id objc_msgSend_isWaitingForPageScroll(void *a1, const char *a2, ...)
{
  return [a1 isWaitingForPageScroll];
}

id objc_msgSend_keyCode(void *a1, const char *a2, ...)
{
  return [a1 keyCode];
}

id objc_msgSend_keyDown(void *a1, const char *a2, ...)
{
  return [a1 keyDown];
}

id objc_msgSend_keyInfo(void *a1, const char *a2, ...)
{
  return [a1 keyInfo];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastSpokenSubstringRange(void *a1, const char *a2, ...)
{
  return [a1 lastSpokenSubstringRange];
}

id objc_msgSend_lastUtteranceLanguageCode(void *a1, const char *a2, ...)
{
  return [a1 lastUtteranceLanguageCode];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longPressRecognizer(void *a1, const char *a2, ...)
{
  return [a1 longPressRecognizer];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainAccessQueue(void *a1, const char *a2, ...)
{
  return [a1 mainAccessQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_maximizedConstraints(void *a1, const char *a2, ...)
{
  return [a1 maximizedConstraints];
}

id objc_msgSend_minimizedConstraints(void *a1, const char *a2, ...)
{
  return [a1 minimizedConstraints];
}

id objc_msgSend_modifierState(void *a1, const char *a2, ...)
{
  return [a1 modifierState];
}

id objc_msgSend_moveBackInBounds(void *a1, const char *a2, ...)
{
  return [a1 moveBackInBounds];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_needToRefreshContextIds(void *a1, const char *a2, ...)
{
  return [a1 needToRefreshContextIds];
}

id objc_msgSend_nextFocusedView(void *a1, const char *a2, ...)
{
  return [a1 nextFocusedView];
}

id objc_msgSend_notifyUpdateElementVisualsEventDidOccur(void *a1, const char *a2, ...)
{
  return [a1 notifyUpdateElementVisualsEventDidOccur];
}

id objc_msgSend_nubbitSize(void *a1, const char *a2, ...)
{
  return [a1 nubbitSize];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_oneAndAHalfSpeakingRateAsInt(void *a1, const char *a2, ...)
{
  return [a1 oneAndAHalfSpeakingRateAsInt];
}

id objc_msgSend_pathLocation(void *a1, const char *a2, ...)
{
  return [a1 pathLocation];
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return [a1 paths];
}

id objc_msgSend_pauseButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 pauseButtonPressed];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_playButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 playButtonPressed];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_quickSpeakHighlightOption(void *a1, const char *a2, ...)
{
  return [a1 quickSpeakHighlightOption];
}

id objc_msgSend_quickSpeakNubbitNormalizedPosition(void *a1, const char *a2, ...)
{
  return [a1 quickSpeakNubbitNormalizedPosition];
}

id objc_msgSend_quickSpeakSentenceHighlightColor(void *a1, const char *a2, ...)
{
  return [a1 quickSpeakSentenceHighlightColor];
}

id objc_msgSend_quickSpeakSentenceHighlightOption(void *a1, const char *a2, ...)
{
  return [a1 quickSpeakSentenceHighlightOption];
}

id objc_msgSend_quickSpeakWordHighlightColor(void *a1, const char *a2, ...)
{
  return [a1 quickSpeakWordHighlightColor];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return [a1 rangeValue];
}

id objc_msgSend_reachabilityOffset(void *a1, const char *a2, ...)
{
  return [a1 reachabilityOffset];
}

id objc_msgSend_readNextPageCompletion(void *a1, const char *a2, ...)
{
  return [a1 readNextPageCompletion];
}

id objc_msgSend_rectValue(void *a1, const char *a2, ...)
{
  return [a1 rectValue];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_rewindButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 rewindButtonPressed];
}

id objc_msgSend_rootElementAccessibilityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 rootElementAccessibilityIdentifier];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_sceneIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sceneIdentifier];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_sendUserEventOccurred(void *a1, const char *a2, ...)
{
  return [a1 sendUserEventOccurred];
}

id objc_msgSend_sentenceHighlightSelectionRects(void *a1, const char *a2, ...)
{
  return [a1 sentenceHighlightSelectionRects];
}

id objc_msgSend_sentenceHighlightView(void *a1, const char *a2, ...)
{
  return [a1 sentenceHighlightView];
}

id objc_msgSend_sentenceRanges(void *a1, const char *a2, ...)
{
  return [a1 sentenceRanges];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return [a1 sharedDisplayManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_showLoading(void *a1, const char *a2, ...)
{
  return [a1 showLoading];
}

id objc_msgSend_showMainUI(void *a1, const char *a2, ...)
{
  return [a1 showMainUI];
}

id objc_msgSend_showSpeakFingerUI(void *a1, const char *a2, ...)
{
  return [a1 showSpeakFingerUI];
}

id objc_msgSend_showSpeechController(void *a1, const char *a2, ...)
{
  return [a1 showSpeechController];
}

id objc_msgSend_showStopButton(void *a1, const char *a2, ...)
{
  return [a1 showStopButton];
}

id objc_msgSend_showUI(void *a1, const char *a2, ...)
{
  return [a1 showUI];
}

id objc_msgSend_singleTapRecognizer(void *a1, const char *a2, ...)
{
  return [a1 singleTapRecognizer];
}

id objc_msgSend_speakFaster(void *a1, const char *a2, ...)
{
  return [a1 speakFaster];
}

id objc_msgSend_speakFingerState(void *a1, const char *a2, ...)
{
  return [a1 speakFingerState];
}

id objc_msgSend_speakSlower(void *a1, const char *a2, ...)
{
  return [a1 speakSlower];
}

id objc_msgSend_speakUnderFingerButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 speakUnderFingerButtonPressed];
}

id objc_msgSend_speakUnderFingerModeStarted(void *a1, const char *a2, ...)
{
  return [a1 speakUnderFingerModeStarted];
}

id objc_msgSend_speakingRangeAndElements(void *a1, const char *a2, ...)
{
  return [a1 speakingRangeAndElements];
}

id objc_msgSend_speakingRateAsMultiplier(void *a1, const char *a2, ...)
{
  return [a1 speakingRateAsMultiplier];
}

id objc_msgSend_speechControllerDoubleTapAction(void *a1, const char *a2, ...)
{
  return [a1 speechControllerDoubleTapAction];
}

id objc_msgSend_speechControllerIdleOpacity(void *a1, const char *a2, ...)
{
  return [a1 speechControllerIdleOpacity];
}

id objc_msgSend_speechControllerLongPressAction(void *a1, const char *a2, ...)
{
  return [a1 speechControllerLongPressAction];
}

id objc_msgSend_speedButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 speedButtonPressed];
}

id objc_msgSend_springBoardActionHandlerId(void *a1, const char *a2, ...)
{
  return [a1 springBoardActionHandlerId];
}

id objc_msgSend_standardSpeakingRateAsInt(void *a1, const char *a2, ...)
{
  return [a1 standardSpeakingRateAsInt];
}

id objc_msgSend_startNewReadAllFromGesture(void *a1, const char *a2, ...)
{
  return [a1 startNewReadAllFromGesture];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateManager(void *a1, const char *a2, ...)
{
  return [a1 stateManager];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_stopButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 stopButtonPressed];
}

id objc_msgSend_stopSpeakFingerButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 stopSpeakFingerButtonPressed];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stroke(void *a1, const char *a2, ...)
{
  return [a1 stroke];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_systemApplication(void *a1, const char *a2, ...)
{
  return [a1 systemApplication];
}

id objc_msgSend_systemWideElement(void *a1, const char *a2, ...)
{
  return [a1 systemWideElement];
}

id objc_msgSend_tabModeButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 tabModeButtonPressed];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_temporarilyHideUI(void *a1, const char *a2, ...)
{
  return [a1 temporarilyHideUI];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traits(void *a1, const char *a2, ...)
{
  return [a1 traits];
}

id objc_msgSend_translateKeycode(void *a1, const char *a2, ...)
{
  return [a1 translateKeycode];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uiElement(void *a1, const char *a2, ...)
{
  return [a1 uiElement];
}

id objc_msgSend_uiStateChanged(void *a1, const char *a2, ...)
{
  return [a1 uiStateChanged];
}

id objc_msgSend_underlineColor(void *a1, const char *a2, ...)
{
  return [a1 underlineColor];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateButtonConstraints(void *a1, const char *a2, ...)
{
  return [a1 updateButtonConstraints];
}

id objc_msgSend_updateElementVisualsCoalescer(void *a1, const char *a2, ...)
{
  return [a1 updateElementVisualsCoalescer];
}

id objc_msgSend_updateNubbitGestureRecognizers(void *a1, const char *a2, ...)
{
  return [a1 updateNubbitGestureRecognizers];
}

id objc_msgSend_updateVisualRects(void *a1, const char *a2, ...)
{
  return [a1 updateVisualRects];
}

id objc_msgSend_userManuallyExitedSpeakUnderFingerMode(void *a1, const char *a2, ...)
{
  return [a1 userManuallyExitedSpeakUnderFingerMode];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowContextId(void *a1, const char *a2, ...)
{
  return [a1 windowContextId];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}

id objc_msgSend_windowSceneIdentifierForWindowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowSceneIdentifierForWindowScene:");
}