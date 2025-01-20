void sub_100006240(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;

  v4 = a2;
  v5 = a3;
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(id)objc_opt_class() description];
    v8 = 138413058;
    v9 = v7;
    v10 = 2080;
    v11 = "-[HSPCGuestAccessTableViewController commitConfiguration]_block_invoke";
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) completed _enableAccessToGuestPinCodeItems. result = %@, error = %@", (uint8_t *)&v8, 0x2Au);
  }
}

NAFuture *__cdecl sub_10000634C(id a1, id a2)
{
  return +[NAFuture futureWithResult:&off_1000AFED8];
}

NAFuture *__cdecl sub_100006360(id a1, NSError *a2)
{
  if ([(NSError *)a2 na_isCancelledError]) {
    v2 = &off_1000AFEC0;
  }
  else {
    v2 = &off_1000AFED8;
  }
  v3 = +[NAFuture futureWithResult:v2];

  return (NAFuture *)v3;
}

void sub_1000070C4(id a1, NSError *a2, int64_t a3)
{
  v3 = a2;
  if (v3)
  {
    v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100065AD8((uint64_t)v3, v4);
    }
  }
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMSiriEndpointOnboardingResultAsString();
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Call succeeded with following result: %@", (uint8_t *)&v7, 0xCu);
  }
}

id sub_100007738(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 voiceName];
  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    v6 = [v3 outputVoiceGenderCode];
    id v5 = +[HFUtilities outputGenderFromString:v6];
  }
  int v7 = [v3 voiceName];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = +[AFLocalization sharedInstance];
    v11 = [v3 outputVoiceLanguageCode];
    v12 = [v10 voiceNamesForOutputLanguageCode:v11 gender:v5];
    id v9 = [v12 firstObject];
  }
  v13 = [v3 inputLanguageCode];
  v14 = [*(id *)(a1 + 32) config];
  v15 = [v14 recognitionLanguage];
  if ([v13 isEqualToString:v15])
  {
    v16 = [v3 outputVoiceLanguageCode];
    v17 = [*(id *)(a1 + 40) languageCode];
    if ([v16 isEqualToString:v17])
    {
      v18 = [*(id *)(a1 + 40) name];
      id v19 = [v9 isEqualToString:v18];
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

id sub_100007900(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_100007910(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v7 = v3;
  if (objc_opt_isKindOfClass()) {
    v4 = v7;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) navigationController];
    [v6 pushViewController:v5 animated:1];
  }
}

id sub_100007AC0()
{
  v0 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline addingSymbolicTraits:32770 options:0];
  v1 = +[UIFont fontWithDescriptor:v0 size:0.0];

  return v1;
}

id sub_100007B38()
{
  v0 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline addingSymbolicTraits:0x8000 options:0];
  v1 = +[UIFont fontWithDescriptor:v0 size:0.0];

  return v1;
}

void sub_100008088(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v7 = v3;
  if (objc_opt_isKindOfClass()) {
    v4 = v7;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) navigationController];
    [v6 pushViewController:v5 animated:1];
  }
}

void sub_100009030(uint64_t a1)
{
  [*(id *)(a1 + 32) userDidRespondToConsentRequestForSetupAccessoryDescription:*(void *)(a1 + 40) withResponse:3];
  id v3 = [*(id *)(a1 + 48) navigationController];
  id v2 = [v3 popViewControllerAnimated:1];
}

id sub_10000909C(uint64_t a1)
{
  return [*(id *)(a1 + 32) userDidRespondToConsentRequestForSetupAccessoryDescription:*(void *)(a1 + 40) withResponse:2];
}

void sub_100009330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPINCodeLengthMin:a2];
  [WeakRetained setPINCodeLengthMax:a3];
  [WeakRetained _updateSubtitle];
  id v5 = [WeakRetained textFieldText];
  [WeakRetained _updateContinueActionEnabledFor:v5];
}

void sub_10000972C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id sub_100009760(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained pinCodeManager];
  uint64_t v3 = [v2 currentUserPinCode];

  return v3;
}

void sub_1000097C4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 pinCodeValue];

  if (v4)
  {
    id v5 = [v4 length];
    [(id)qword_1000CB558 setMinimumIntegerDigits:v5];
    v6 = [(id)qword_1000CB558 numberFromString:v4];
    id v7 = [(id)qword_1000CB558 stringForObjectValue:v6];
    [WeakRetained setTextFieldText:v7];

    v8 = [WeakRetained textField];
    [v8 setUserInteractionEnabled:0];

    id v9 = [WeakRetained continueAction];
    [v9 setEnabled:1];

    v10 = [WeakRetained textField];
    [v10 resignFirstResponder];
  }
  else
  {
    v11 = [WeakRetained addOptionalButtonWithTitleKey:@"HSProximityCardPINCode_ContinueWithoutPINCodeButton" target:WeakRetained futureSelector:"_skipPINCodeButtonTapped"];
    [WeakRetained setOptionalAction:v11];

    v12 = [WeakRetained optionalAction];
    [v12 setEnabled:1];

    v13 = [WeakRetained continueAction];
    [v13 setEnabled:0];

    v6 = HULocalizedString();
    v10 = [WeakRetained footnoteLabel];
    [v10 setText:v6];
  }
}

void sub_100009C1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 96));
  _Unwind_Resume(a1);
}

_UNKNOWN **sub_100009C58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained coordinator];
  if ([v2 launchReason] == (id)4) {
    goto LABEL_4;
  }
  id v3 = [WeakRetained coordinator];
  if ([v3 launchReason] == (id)5)
  {

LABEL_4:
    goto LABEL_5;
  }
  v6 = [WeakRetained coordinator];
  id v7 = [v6 launchReason];

  if (v7 != (id)6)
  {
    uint64_t v4 = &off_1000AFF68;
    goto LABEL_6;
  }
LABEL_5:
  uint64_t v4 = &off_1000AFF50;
LABEL_6:

  return v4;
}

id sub_100009D14(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = objc_getAssociatedObject(v3, HFAssociatedPinCodeKey);
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = HFOperationAddExistingUsersPINCodeToNewLock;
  v8 = [v3 domain];
  if (![v8 isEqualToString:HMErrorDomain] || objc_msgSend(v3, "code") != (id)2602) {
    goto LABEL_8;
  }
  v22 = [v6 userLabel];
  v21 = [v22 user];
  id v9 = [v21 uniqueIdentifier];
  v10 = [*(id *)(a1 + 32) config];
  v11 = [v10 home];
  v12 = [v11 currentUser];
  v13 = [v12 uniqueIdentifier];
  unsigned int v20 = [v9 isEqual:v13];

  if (v20)
  {
    v8 = v7;
    id v7 = HFOperationAddPINCode;
LABEL_8:
  }
  id v14 = objc_alloc_init((Class)NAFuture);
  v15 = +[HFErrorHandler sharedHandler];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100009F7C;
  v23[3] = &unk_1000A8FE8;
  id v16 = v14;
  id v24 = v16;
  id v25 = *(id *)(a1 + 40);
  [v15 handleError:v3 operationType:v7 options:0 retryBlock:0 cancelBlock:v23];

  v17 = v25;
  id v18 = v16;

  return v18;
}

void sub_100009F7C(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithResult:v2];
}

id sub_100009FD8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained pinCodeManager];
  id v3 = [v2 currentUserPinCode];

  return v3;
}

id sub_10000A03C(id *a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = WeakRetained;
  if (a2)
  {
    id v6 = [WeakRetained _updatePINCodesForAllUsers];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000B120;
    v20[3] = &unk_1000A91A0;
    v20[4] = v5;
    id v21 = a1[4];
    id v7 = [v6 flatMap:v20];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000B194;
    v18[3] = &unk_1000A9128;
    id v19 = a1[5];
    v8 = [v7 recover:v18];
  }
  else
  {
    id v9 = [WeakRetained textFieldText];
    id v29 = 0;
    v10 = +[HFPinCodeManager asciiStringForLocalizedPINString:v9 error:&v29];
    id v11 = v29;

    v12 = [v5 pinCodeManager];
    v13 = [v12 checkForValidationErrorsWithPINCodeValue:v10 originalPINCode:0];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000A320;
    v26[3] = &unk_1000A9060;
    id v14 = a1[4];
    id v27 = v11;
    id v28 = v14;
    id v6 = v11;
    v15 = [v13 recover:v26];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000A7DC;
    v22[3] = &unk_1000A9178;
    v22[4] = v5;
    id v23 = v10;
    id v24 = a1[4];
    id v25 = a1[5];
    id v16 = v10;
    v8 = [v15 flatMap:v22];
  }

  return v8;
}

id sub_10000A320(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)NAFuture);
  id v5 = [v3 userInfo];
  id v6 = [v5 objectForKey:HFErrorUserInfoOptionsKey];
  id v7 = [v6 objectForKey:HFErrorHandlerOptionRetryButtonTextKey];

  if (v7)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000A53C;
    v22[3] = &unk_1000A9038;
    id v23 = v3;
    id v24 = v4;
    id v25 = *(id *)(a1 + 40);
    v8 = objc_retainBlock(v22);
  }
  else
  {
    v8 = 0;
  }
  id v9 = *(void **)(a1 + 32);
  if (v9)
  {
    id v10 = v9;

    id v3 = v10;
  }
  id v11 = +[HFErrorHandler sharedHandler];
  uint64_t v12 = HFOperationChangePINCodeValue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000A678;
  v18[3] = &unk_1000A9038;
  id v19 = v3;
  id v13 = v4;
  id v20 = v13;
  id v21 = *(id *)(a1 + 40);
  id v14 = v3;
  [v11 handleError:v14 operationType:v12 options:0 retryBlock:v8 cancelBlock:v18];

  v15 = v21;
  id v16 = v13;

  return v16;
}

void sub_10000A53C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) code];
  id v3 = HFLogForCategory();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2 == (id)77)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Optional PIN Code validation was dismissed by user. Proceeding to set PIN Code. %@", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 40) finishWithNoResult];
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unknown PIN Code validation error requested retry. Closing prox card without setting PIN Code. %@", (uint8_t *)&v9, 0xCu);
    }

    id v7 = *(void **)(a1 + 40);
    v8 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [v7 finishWithResult:v8];
  }
}

void sub_10000A678(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 32);
  if ([*(id *)(a1 + 32) code] == (id)75
    || [(id)*v2 code] == (id)74
    || [(id)*v2 code] == (id)77
    || [(id)*v2 code] == (id)82)
  {
    id v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *v2;
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Mandatory PIN Code validation. Remaining on this prox card so user can fix issue. %@", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 40) finishWithResult:&off_1000AFF80];
  }
  else
  {
    uint64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100065B50(v2, v5);
    }

    uint64_t v6 = *(void **)(a1 + 40);
    id v7 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [v6 finishWithResult:v7];
  }
}

id sub_10000A7DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = +[NAFuture futureWithResult:v3];
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) pinCodeManager];
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) config];
    int v8 = [v7 home];
    uint64_t v9 = [v8 currentUser];
    uint64_t v10 = [v5 setUserPinCode:v6 forUser:v9];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000AA20;
    v18[3] = &unk_1000A9088;
    void v18[4] = *(void *)(a1 + 32);
    id v11 = [v10 addSuccessBlock:v18];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000AC04;
    v17[3] = &unk_1000A90D8;
    v17[4] = *(void *)(a1 + 32);
    uint64_t v12 = [v11 recover:v17];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000AEEC;
    v14[3] = &unk_1000A9150;
    v14[4] = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    uint64_t v4 = [v12 flatMap:v14];
  }

  return v4;
}

void sub_10000AA20(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v5;
    __int16 v17 = 2080;
    id v18 = "-[HSPCPINCodeTextFieldViewController commitConfiguration]_block_invoke_2";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) Completed adding new User PIN Code.", buf, 0x16u);
  }

  [*(id *)(a1 + 32) _updateOnboardingFlags];
  id v6 = objc_alloc((Class)HFPinCodeItem);
  id v7 = [*(id *)(a1 + 32) config];
  int v8 = [v7 home];
  id v9 = [v6 initWithPinCode:v3 inHome:v8 onAccessory:0];

  uint64_t v10 = [*(id *)(a1 + 32) config:HFAnalyticsDataHomeKey];
  id v11 = [v10 home];
  v14[0] = v11;
  v14[1] = &off_1000AFF68;
  v13[1] = HFAnalyticsAccessCodeOperationTypeKey;
  v13[2] = HFAnalyticsAccessCodeItem;
  v13[3] = HFAnalyticsAccessCodeDuringOnboardingKey;
  v14[2] = v9;
  v14[3] = &__kCFBooleanTrue;
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  +[HFAnalytics sendEvent:26 withData:v12];
}

id sub_10000AC04(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v22 = v5;
    __int16 v23 = 2080;
    id v24 = "-[HSPCPINCodeTextFieldViewController commitConfiguration]_block_invoke";
    __int16 v25 = 2112;
    id v26 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) Adding new User PIN Code failed %@", buf, 0x20u);
  }

  id v6 = objc_alloc_init((Class)NAFuture);
  id v7 = [*(id *)(a1 + 32) config];
  int v8 = [v7 addedAccessory];
  if (![v8 supportsCHIP]) {
    goto LABEL_8;
  }
  id v9 = [v3 domain];
  if (([v9 isEqualToString:HMErrorDomain] & 1) == 0)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v10 = [v3 code];

  if (v10 == (id)2602)
  {
    [*(id *)(a1 + 32) _updateOnboardingFlags];
    [v6 finishWithNoResult];
    goto LABEL_10;
  }
LABEL_9:
  id v11 = +[HFErrorHandler sharedHandler];
  uint64_t v12 = HFOperationAddPINCode;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000AEE4;
  v17[3] = &unk_1000A90B0;
  id v18 = v6;
  [v11 handleError:v3 operationType:v12 options:0 retryBlock:0 cancelBlock:v17];

LABEL_10:
  v19[0] = HFAnalyticsDataHomeKey;
  id v13 = [*(id *)(a1 + 32) config];
  id v14 = [v13 home];
  v20[0] = v14;
  v20[1] = &off_1000AFF68;
  v19[1] = HFAnalyticsAccessCodeOperationTypeKey;
  v19[2] = HFAnalyticsAccessCodeDuringOnboardingKey;
  v19[3] = HFAnalyticsDataErrorKey;
  v20[2] = &__kCFBooleanTrue;
  v20[3] = v3;
  id v15 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];

  +[HFAnalytics sendEvent:26 withData:v15];

  return v6;
}

id sub_10000AEE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

id sub_10000AEEC(id *a1)
{
  id v2 = [a1[4] coordinator];
  if ([v2 launchReason] == (id)5)
  {

LABEL_4:
    uint64_t v5 = (*((void (**)(void))a1[5] + 2))();
    id v6 = +[NAFuture futureWithResult:v5];

    goto LABEL_6;
  }
  id v3 = [a1[4] coordinator];
  id v4 = [v3 launchReason];

  if (v4 == (id)6) {
    goto LABEL_4;
  }
  id v7 = [a1[4] _updatePINCodesForAllUsers];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000B0A8;
  v12[3] = &unk_1000A9100;
  id v13 = a1[5];
  int v8 = [v7 flatMap:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000B110;
  v10[3] = &unk_1000A9128;
  id v11 = a1[6];
  id v6 = [v8 recover:v10];

LABEL_6:

  return v6;
}

id sub_10000B0A8(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = +[NAFuture futureWithResult:v1];

  return v2;
}

uint64_t sub_10000B110(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000B120(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateOnboardingFlags];
  id v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v3 = +[NAFuture futureWithResult:v2];

  return v3;
}

uint64_t sub_10000B194(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000B55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B580(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v9 = @"Failed";
    }
    else {
      CFStringRef v9 = @"Succeeded";
    }
    id v10 = [WeakRetained config];
    id v11 = [v10 addedAccessory];
    int v12 = 138413570;
    id v13 = WeakRetained;
    __int16 v14 = 2080;
    id v15 = "-[HSPCPINCodeTextFieldViewController _updatePINCodesForAllUsers]_block_invoke";
    __int16 v16 = 2112;
    CFStringRef v17 = v9;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%@:%s) %@ enabling PIN codes for all users on new accessory %@. result: %@, error: %@", (uint8_t *)&v12, 0x3Eu);
  }
}

void sub_10000E414(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 224));
  _Unwind_Resume(a1);
}

id sub_10000E48C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(id)objc_opt_class() description];
    if ([v3 BOOLValue]) {
      CFStringRef v6 = @"Not";
    }
    else {
      CFStringRef v6 = &stru_1000ABBA8;
    }
    id v7 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:*(void *)(a1 + 40)];
    int v11 = 138413314;
    int v12 = v5;
    __int16 v13 = 2080;
    __int16 v14 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
    __int16 v15 = 2112;
    CFStringRef v16 = v6;
    __int16 v17 = 2112;
    __int16 v18 = v7;
    __int16 v19 = 1024;
    unsigned int v20 = [v3 BOOLValue];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%@ : %s) %@ skipping %@ because hasWalletKeyCompatibleDevice is %{BOOL}d.", (uint8_t *)&v11, 0x30u);
  }
  int v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 BOOLValue] ^ 1);
  CFStringRef v9 = +[NAFuture futureWithResult:v8];

  return v9;
}

id sub_10000E638(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue])
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [v3 hf_fetchWalletKeyDeviceStateForCurrentDevice];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000E880;
    v17[3] = &unk_1000A9240;
    uint64_t v19 = *(void *)(a1 + 48);
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 56);
    id v18 = v5;
    uint64_t v20 = v6;
    id v7 = [v4 flatMap:v17];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000EAF4;
    v14[3] = &unk_1000A9268;
    uint64_t v16 = *(void *)(a1 + 48);
    int8x16_t v13 = *(int8x16_t *)(a1 + 32);
    id v8 = (id)v13.i64[0];
    int8x16_t v15 = vextq_s8(v13, v13, 8uLL);
    CFStringRef v9 = [v7 recover:v14];
  }
  else
  {
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(%s) Skipping %@ because this device does not support wallet home key.", buf, 0x16u);
    }
    CFStringRef v9 = +[NAFuture futureWithResult:&__kCFBooleanTrue];
  }

  return v9;
}

id sub_10000E880(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 walletKey];
  id v5 = [v4 isUWBUnlockEnabled];

  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      CFStringRef v7 = @"Skipping";
    }
    else {
      CFStringRef v7 = @"Not skipping";
    }
    uint64_t v19 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:*(void *)(a1 + 40)];
    uint64_t v20 = [*(id *)(a1 + 32) addedAccessory];
    id v8 = [v20 hf_minimumDescription];
    CFStringRef v9 = [*(id *)(a1 + 32) home];
    id v10 = +[HUHomeUIServiceLaunchUserInfo launchReasonDescription:*(void *)(a1 + 48)];
    int v11 = [v3 walletKey];
    if (v11) {
      CFStringRef v12 = @"exists";
    }
    else {
      CFStringRef v12 = @"does NOT exist";
    }
    int8x16_t v13 = [v3 walletKey];
    unsigned int v14 = [v13 isUWBUnlockEnabled];
    *(_DWORD *)buf = 136317186;
    __int16 v22 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
    CFStringRef v15 = @"NOT enabled";
    CFStringRef v24 = v7;
    __int16 v23 = 2112;
    if (v14) {
      CFStringRef v15 = @"enabled";
    }
    __int16 v25 = 2112;
    id v26 = v19;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    v30 = v9;
    __int16 v31 = 2112;
    v32 = v10;
    __int16 v33 = 2112;
    CFStringRef v34 = v12;
    __int16 v35 = 2112;
    CFStringRef v36 = v15;
    __int16 v37 = 1024;
    int v38 = (int)v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%s) %@ prox card %@ for accessory %@ in home %@. Launch reason = %@. wallet key %@. UWB is %@. shouldSkip so far is %{BOOL}d.", buf, 0x58u);
  }
  uint64_t v16 = +[NSNumber numberWithBool:v5];
  __int16 v17 = +[NAFuture futureWithResult:v16];

  return v17;
}

id sub_10000EAF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100065BCC(a1);
  }

  id v5 = +[NAFuture futureWithResult:&__kCFBooleanTrue];

  return v5;
}

id sub_10000EB8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100065CBC(a1);
  }

  id v5 = +[NAFuture futureWithResult:&__kCFBooleanTrue];

  return v5;
}

id sub_10000EC24(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue])
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [v3 hf_fetchWalletKeyDeviceStateForCurrentDevice];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000EE20;
    v12[3] = &unk_1000A92B8;
    id v5 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    id v13 = v5;
    uint64_t v6 = [v4 flatMap:v12];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000F2F0;
    v10[3] = &unk_1000A90D8;
    id v11 = *(id *)(a1 + 32);
    CFStringRef v7 = [v6 recover:v10];
  }
  else
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(HSSetupstateMachine:%s) Skipping HSProxCardSetupUIStepWalletKeyExpressMode because this device is does not support wallet key.", buf, 0xCu);
    }

    CFStringRef v7 = +[NAFuture futureWithResult:&__kCFBooleanTrue];
  }

  return v7;
}

id sub_10000EE20(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(void *)(a1 + 40))
  {
    id v13 = [v3 walletKey];

    if (v13)
    {
      CFStringRef v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [*(id *)(a1 + 32) addedAccessory];
        CFStringRef v15 = [*(id *)(a1 + 32) home];
        *(_DWORD *)buf = 136315650;
        __int16 v37 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
        __int16 v38 = 2112;
        CFStringRef v39 = v14;
        __int16 v40 = 2112;
        v41 = v15;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(HSSetupstateMachine:%s) Skipping express mode prox card because while adding accessory %@, wallet key already exists for %@", buf, 0x20u);
      }
      goto LABEL_13;
    }
  }
  if (_os_feature_enabled_impl())
  {
    id v5 = [v4 walletKey];
    unsigned int v6 = [v5 isUWBUnlockEnabled];

    if (v6)
    {
      CFStringRef v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [*(id *)(a1 + 32) addedAccessory];
        CFStringRef v9 = [v4 walletKey];
        *(_DWORD *)buf = 136315650;
        __int16 v37 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
        __int16 v38 = 2112;
        CFStringRef v39 = v8;
        __int16 v40 = 2112;
        v41 = v9;
        id v10 = "(%s) Skipping Tap to unlock prox card for accessory %@ wallet key %@ has UWB unlock already enabled. Expec"
              "ted behaviour is to NOT show both UWB and TTU. Only show one of them.";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v10, buf, 0x20u);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  id v11 = [v4 walletKey];
  unsigned int v12 = [v11 isExpressEnabled];

  if (v12)
  {
    CFStringRef v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) addedAccessory];
      CFStringRef v9 = [v4 walletKey];
      *(_DWORD *)buf = 136315650;
      __int16 v37 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
      __int16 v38 = 2112;
      CFStringRef v39 = v8;
      __int16 v40 = 2112;
      v41 = v9;
      id v10 = "(%s) Skipping Tap to unlock prox card for accessory %@ because wallet key %@ has tap to unlock already turned on.";
      goto LABEL_9;
    }
LABEL_13:

    uint64_t v16 = +[NAFuture futureWithResult:&__kCFBooleanTrue];
    goto LABEL_27;
  }
  __int16 v17 = [*(id *)(a1 + 32) home];
  unsigned int v18 = [v17 hf_currentUserIsOwner];

  uint64_t v19 = [*(id *)(a1 + 32) home];
  unsigned int v20 = [v19 hf_currentUserIsAdministrator];

  id v21 = [*(id *)(a1 + 32) home];
  unsigned int v22 = [v21 hf_hasHomeHubSupportingWalletKey];

  __int16 v23 = [*(id *)(a1 + 32) addedAccessory];
  uint64_t v24 = [v23 supportsWalletKey] ^ 1;
  if ((v24 & 1) == 0 && (v18 & 1) == 0)
  {
    if (v22 & v20)
    {
      uint64_t v24 = 0;
    }
    else
    {
      __int16 v25 = [*(id *)(a1 + 32) home];
      uint64_t v24 = [v25 hasOnboardedForWalletKey] ^ 1;
    }
  }

  id v26 = HFLogForCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v27 = @"Not Skipping";
    if (v24) {
      CFStringRef v27 = @"Skipping";
    }
    CFStringRef v35 = v27;
    id v28 = [*(id *)(a1 + 32) addedAccessory];
    __int16 v29 = [*(id *)(a1 + 32) addedAccessory];
    unsigned int v30 = v20;
    if ([v29 supportsWalletKey]) {
      CFStringRef v31 = @"supports";
    }
    else {
      CFStringRef v31 = @"doesn't support";
    }
    v32 = [*(id *)(a1 + 32) home];
    *(_DWORD *)buf = 136316930;
    __int16 v37 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
    __int16 v38 = 2112;
    CFStringRef v39 = v35;
    __int16 v40 = 2112;
    v41 = v28;
    __int16 v42 = 2112;
    CFStringRef v43 = v31;
    __int16 v44 = 1024;
    unsigned int v45 = v18;
    __int16 v46 = 1024;
    unsigned int v47 = v30;
    __int16 v48 = 1024;
    unsigned int v49 = v22;
    __int16 v50 = 1024;
    unsigned int v51 = [v32 hasOnboardedForWalletKey];
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "(%s) %@ express mode prox card because %@ %@ wallet key. isOwner: %{BOOL}d  isAdmin: %{BOOL}d  home hub supports wallet key:%{BOOL}d. hasOnboardedForWalletKey:%{BOOL}d", buf, 0x42u);
  }
  __int16 v33 = +[NSNumber numberWithInt:v24];
  uint64_t v16 = +[NAFuture futureWithResult:v33];

LABEL_27:

  return v16;
}

id sub_10000F2F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100065DAC((uint64_t)v3, a1);
  }

  id v5 = +[NAFuture futureWithResult:&__kCFBooleanTrue];

  return v5;
}

id sub_10000F388(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  unsigned int v5 = [a1[4] hf_currentUserIsOwner];
  unsigned int v6 = [a1[4] hf_hasHomeHubSupportingAccessCodes];
  CFStringRef v7 = [a1[5] addedAccessory];
  if ([v7 supportsAccessCodes]) {
    BOOL v8 = (v5 | v6) == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    unsigned int v9 = 0;
  }
  else {
    unsigned int v9 = [v3 BOOLValue];
  }

  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      CFStringRef v11 = @"Not";
    }
    else {
      CFStringRef v11 = &stru_1000ABBA8;
    }
    unsigned int v12 = [a1[5] addedAccessory];
    int v16 = 138413826;
    id v17 = WeakRetained;
    __int16 v18 = 2080;
    uint64_t v19 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
    __int16 v20 = 2112;
    CFStringRef v21 = v11;
    __int16 v22 = 1024;
    unsigned int v23 = [v12 supportsAccessCodes];
    __int16 v24 = 1024;
    unsigned int v25 = [v3 BOOLValue];
    __int16 v26 = 1024;
    unsigned int v27 = v5;
    __int16 v28 = 1024;
    unsigned int v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(%@:%s) %@ Skipping PIN Code text field prox card. supportsAccessCodes: %{BOOL}d hasValidConstraints: %{BOOL}d  currentUserIsOwner:%{BOOL}d  hubSupported:%{BOOL}d", (uint8_t *)&v16, 0x38u);
  }
  id v13 = +[NSNumber numberWithInt:v9 ^ 1];
  uint64_t v14 = +[NAFuture futureWithResult:v13];

  return v14;
}

id sub_10000F58C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [v3 count];
  unsigned int v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = [WeakRetained description];
    uint64_t v8 = objc_opt_class();
    if (v5) {
      CFStringRef v9 = @"Not Skipping";
    }
    else {
      CFStringRef v9 = @"Skipping";
    }
    int v13 = 138413314;
    uint64_t v14 = v8;
    __int16 v15 = 2080;
    int v16 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
    __int16 v17 = 2112;
    CFStringRef v18 = v9;
    __int16 v19 = 2048;
    id v20 = [v3 count];
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) %@ guest access because count is %ld for guestPinCodes %@", (uint8_t *)&v13, 0x34u);
  }
  id v10 = +[NSNumber numberWithBool:v5 == 0];
  CFStringRef v11 = +[NAFuture futureWithResult:v10];

  return v11;
}

id sub_10000F738(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100065E60(WeakRetained);
  }

  unsigned int v6 = +[NAFuture futureWithResult:&__kCFBooleanTrue];

  return v6;
}

uint64_t sub_100010274(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 home];
  unsigned int v5 = [v4 hf_userIsRestrictedGuest:v3];

  return v5 ^ 1;
}

id sub_1000102D0(id a1, HMUser *a2)
{
  return [(HMUser *)a2 hf_prettyDescription];
}

id sub_100010F34(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    unsigned int v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v10 = 138412802;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    int v13 = v6;
    __int16 v14 = 1024;
    unsigned int v15 = [v3 BOOLValue];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: Voice Profile already exists? %{BOOL}d ...", (uint8_t *)&v10, 0x1Cu);
  }
  CFStringRef v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 BOOLValue]);
  uint64_t v8 = +[NAFuture futureWithResult:v7];

  return v8;
}

NAFuture *__cdecl sub_10001107C(id a1, NSError *a2)
{
  id v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[HUHomeFeatureOnboardingUtilities isVoiceProfileAvailableOnThisDeviceForLanguage:0]);
  id v3 = +[NAFuture futureWithResult:v2];

  return (NAFuture *)v3;
}

void sub_10001112C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_10001114C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x34u);
}

void sub_100012520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012548(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isPreloaded])
  {
    unsigned int v6 = [*(id *)(a1 + 32) hf_setFaceRecognitionEnabled:[v3 isOn]];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100012650;
    v8[3] = &unk_1000A93E0;
    objc_copyWeak(&v9, v4);
    id v7 = [v6 addFailureBlock:v8];

    objc_destroyWeak(&v9);
  }
}

void sub_10001263C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100012650(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100065FB0((uint64_t)v3, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v6 = [WeakRetained identifyPeopleFeature];
  [v6 setOn:0];
}

id sub_10001292C(uint64_t a1, void *a2)
{
  return [a2 setDelegate:*(void *)(a1 + 32)];
}

id sub_1000129E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)HUConfigurationWrapperViewController) initWithContentViewController:v3 configurationDelegate:*(void *)(a1 + 32)];

  return v4;
}

id sub_10001368C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disableSiri];
}

id sub_100013EE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableSiriWithFuture:*(void *)(a1 + 40)];
}

id sub_100013EEC(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:&off_1000B0010];
}

void sub_10001422C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100014258(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v5)
  {
    uint64_t v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100066080();
    }

    [WeakRetained _setupOnBoardSelectionsWithLanguageValue:0];
    [WeakRetained _applyOnBoardingSelectionsWithFuture:*(void *)(a1 + 48)];
  }
  else
  {
    CFStringRef v34 = [v6 na_firstObjectPassingTest:&stru_1000A94E8];
    id v9 = [v34 value];
    objc_opt_class();
    id v10 = v9;
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000147B8;
    v39[3] = &unk_1000A9510;
    id v13 = (id)objc_opt_new();
    id v40 = v13;
    [v12 na_each:v39];
    __int16 v14 = [WeakRetained config];
    [v14 setAvailableSiriLanguageValues:v12];

    unsigned int v15 = [v13 allObjects];
    int v16 = [WeakRetained config];
    [v16 setListOfVoices:v15];

    __int16 v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v18 = [WeakRetained config];
      __int16 v19 = [v18 listOfVoices];
      *(_DWORD *)buf = 138412546;
      CFStringRef v43 = v34;
      __int16 v44 = 2112;
      unsigned int v45 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Successfully fetched available Siri languages from HomeKit [%@] list Of Voices = %@", buf, 0x16u);
    }
    if (*(void *)(a1 + 32) && [v12 count])
    {
      id v20 = [WeakRetained _languageValueMatchingRecognitionLanguage:*(void *)(a1 + 40) outputVoice:*(void *)(a1 + 32)];
      if (!v20)
      {
        __int16 v21 = [WeakRetained config];
        [v21 setShouldShowSiriRecognitionLanguageSetup:1];

        id v22 = [WeakRetained config];
        [v22 setShouldShowVoiceSelectionSetup:1];
      }
      unsigned int v23 = HFLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = [WeakRetained config];
        unsigned int v25 = [v24 shouldShowSiriRecognitionLanguageSetup];
        *(_DWORD *)buf = 67109120;
        LODWORD(v43) = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "shouldShowSiriRecognitionLanguageSetup %{BOOL}d", buf, 8u);
      }
    }
    else
    {
      id v20 = 0;
    }
    __int16 v26 = [WeakRetained config];
    unsigned __int8 v27 = [v26 shouldShowSiriRecognitionLanguageSetup];

    if (v27)
    {
      __int16 v28 = HFLogForCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Finishing future as we don't have a languageValue which means we need to show language selection", buf, 2u);
      }

      [*(id *)(a1 + 48) finishWithResult:&off_1000AFFF8];
    }
    else
    {
      unsigned int v29 = [WeakRetained enablementFlowConfigurationProvider];

      if (!v29)
      {
        id v30 = objc_alloc_init((Class)AFEnablementFlowConfigurationProvider);
        [WeakRetained setEnablementFlowConfigurationProvider:v30];
      }
      CFStringRef v31 = [WeakRetained enablementConfiguration];

      if (!v31)
      {
        v32 = [WeakRetained enablementFlowConfigurationProvider];
        uint64_t v41 = *(void *)(a1 + 40);
        __int16 v33 = +[NSArray arrayWithObjects:&v41 count:1];
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100014818;
        v35[3] = &unk_1000A9588;
        v35[4] = WeakRetained;
        id v36 = *(id *)(a1 + 40);
        id v37 = v20;
        id v38 = *(id *)(a1 + 48);
        [v32 configurationForEnablementFlow:1 recognitionLanguageCodes:v33 completion:v35];
      }
    }
  }
}

BOOL sub_100014770(id a1, HMImmutableSetting *a2)
{
  id v2 = [(HMImmutableSetting *)a2 keyPath];
  unsigned __int8 v3 = [v2 isEqualToString:HFSiriAvailableLanguagesSettingKeyPath];

  return v3;
}

void sub_1000147B8(uint64_t a1, uint64_t a2)
{
  id v3 = +[HFUtilities voiceInfoFromSettingLanguageValue:a2];
  [*(id *)(a1 + 32) na_safeAddObject:v3];
}

void sub_100014818(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    [*(id *)(a1 + 32) setEnablementConfiguration:v5];
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) config];
    [v7 setRecognitionLanguage:v6];

    uint64_t v8 = [*(id *)(a1 + 32) config];
    id v9 = [v8 availableSiriLanguageValues];
    id v10 = [v9 count];
    if (v10)
    {
      id v2 = [*(id *)(a1 + 32) config];
      id v3 = [v2 listOfVoices];
      if ([v3 count]) {
        id v11 = [v5 requiresVoiceSelectionForRecognitionLanguage:*(void *)(a1 + 40)];
      }
      else {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
    id v12 = [*(id *)(a1 + 32) config];
    [v12 setShouldShowVoiceSelectionSetup:v11];

    if (v10)
    {
    }
    id v13 = [v5 voiceSelectionAllowsRandomSelection];
    __int16 v14 = [*(id *)(a1 + 32) config];
    [v14 setAllowsRandomVoiceSelection:v13];
  }
  unsigned int v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = [*(id *)(a1 + 32) config];
    unsigned int v17 = [v16 shouldShowVoiceSelectionSetup];
    CFStringRef v18 = [*(id *)(a1 + 32) config];
    *(_DWORD *)buf = 67109376;
    unsigned int v23 = v17;
    __int16 v24 = 1024;
    unsigned int v25 = [v18 allowsRandomVoiceSelection];
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "requiresVoiceSelectionForRecognitionLanguage = %{BOOL}d - allowsRandomVoiceSelection = %{BOOL}d", buf, 0xEu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014AA0;
  block[3] = &unk_1000A9560;
  block[4] = *(void *)(a1 + 32);
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100014AA0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) config];
  unsigned __int8 v3 = [v2 shouldShowVoiceSelectionSetup];

  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finishing Use Siri Setup", buf, 2u);
    }

    id v5 = [*(id *)(a1 + 32) commitConfiguration];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100014BEC;
    v9[3] = &unk_1000A9538;
    id v10 = *(id *)(a1 + 48);
    id v6 = [v5 addCompletionBlock:v9];
  }
  else
  {
    [*(id *)(a1 + 32) _setupOnBoardSelectionsWithLanguageValue:*(void *)(a1 + 40)];
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    [v7 _applyOnBoardingSelectionsWithFuture:v8];
  }
}

id sub_100014BEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

void sub_100014FF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) config];
  id v6 = [v5 onboardingSelections];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000150C0;
  v8[3] = &unk_1000A95D8;
  id v9 = v3;
  id v7 = v3;
  [v4 applyOnboardingSelections:v6 completionHandler:v8];
}

void sub_1000150C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006617C();
    }
  }
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMSiriEndpointOnboardingResultAsString();
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Call succeeded with following result: %@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) finishWithNoResult];
}

id sub_1000152F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 voiceName];
  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [v3 outputVoiceGenderCode];
    id v5 = +[HFUtilities outputGenderFromString:v6];
  }
  int v7 = [v3 voiceName];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = +[AFLocalization sharedInstance];
    id v11 = [v3 outputVoiceLanguageCode];
    id v12 = [v10 voiceNamesForOutputLanguageCode:v11 gender:v5];
    id v9 = [v12 firstObject];
  }
  id v13 = [v3 inputLanguageCode];
  __int16 v14 = [*(id *)(a1 + 32) config];
  unsigned int v15 = [v14 recognitionLanguage];
  if ([v13 isEqualToString:v15])
  {
    int v16 = [v3 outputVoiceLanguageCode];
    unsigned int v17 = [*(id *)(a1 + 40) languageCode];
    if ([v16 isEqualToString:v17])
    {
      CFStringRef v18 = [*(id *)(a1 + 40) name];
      id v19 = [v9 isEqualToString:v18];
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

void sub_10001597C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) config];
  id v6 = [v5 onboardingSelections];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015A44;
  v8[3] = &unk_1000A95D8;
  id v9 = v3;
  id v7 = v3;
  [v4 applyOnboardingSelections:v6 completionHandler:v8];
}

void sub_100015A44(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006617C();
    }
  }
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMSiriEndpointOnboardingResultAsString();
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Call succeeded with following result: %@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) finishWithNoResult];
}

id sub_100015B54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

void sub_100015E3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100016F50(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) coordinator];
  id v3 = [*(id *)(a1 + 32) coordinator];
  id v4 = [v3 setupAccessoryDescription];
  id v5 = [v4 setupAccessoryPayload];
  id v6 = [v2 showCustomCommissioningFlowAlertIfNecessaryForPayload:v5 onViewController:*(void *)(a1 + 32)];

  return v6;
}

NAFuture *__cdecl sub_100016FF4(id a1, HMSetupAccessoryPayload *a2)
{
  id v2 = a2;
  id v3 = +[NAFuture futureWithNoResult];
  id v4 = +[NSString stringWithFormat:@"Continue with payload %@", v2];

  id v5 = [v3 hs_commitConfigurationFutureWithContextMessage:v4];

  return (NAFuture *)v5;
}

id sub_100017094(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "customCommissioningFlowFuture flatMap hit error %@", (uint8_t *)&v13, 0xCu);
  }

  id v5 = [v3 domain];
  id v6 = v5;
  if (v5 == (void *)HFErrorDomain)
  {
    id v7 = [v3 code];

    if (v7 == (id)96)
    {
      uint64_t v8 = +[NAFuture futureWithNoResult];
      uint64_t v9 = [v8 hs_commitConfigurationAndDismissFutureWithContextMessage:@"User hit Cancel button on custom commissioning flow alert popup. Dismissing."];
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v10 = [*(id *)(a1 + 32) config];
  [v10 setPairingError:v3];

  uint64_t v8 = +[NAFuture futureWithNoResult];
  uint64_t v9 = [v8 hs_commitConfigurationFutureWithContextMessage:@"Hit other errors. Displaying the error."];
LABEL_8:
  id v11 = (void *)v9;

  return v11;
}

id sub_1000185C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disableSiri];
}

void sub_100018AA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018B44;
  v7[3] = &unk_1000A95D8;
  id v8 = v3;
  id v6 = v3;
  [v5 applyOnboardingSelections:v4 completionHandler:v7];
}

void sub_100018B44(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100065AD8((uint64_t)v3, v4);
    }
  }
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMSiriEndpointOnboardingResultAsString();
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Call succeeded with following result: %@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) finishWithNoResult];
}

void sub_100019314(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  int v7 = objc_opt_new();
  id v8 = [*(id *)(a1 + 32) config];
  uint64_t v9 = [v8 recognitionLanguage];
  id v10 = [v9 componentsSeparatedByString:@"-"];

  id v11 = [*(id *)(a1 + 32) config];
  id v12 = [v11 availableSiriLanguageValues];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000195F0;
  v25[3] = &unk_1000A9690;
  id v13 = v10;
  id v26 = v13;
  id v14 = v4;
  id v27 = v14;
  id v15 = v7;
  id v28 = v15;
  id v16 = v6;
  id v29 = v16;
  id v17 = v5;
  id v30 = v17;
  [v12 na_each:v25];

  if (![v15 count])
  {
    CFStringRef v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [*(id *)(a1 + 32) config];
      id v20 = [v19 recognitionLanguage];
      *(_DWORD *)buf = 138412546;
      v32 = v20;
      __int16 v33 = 2112;
      id v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "iOS recognitionLanguage [%@] is not included in config.availableSiriLanguageValues. Using localized languages from HomeKit's availableSiriLanguageValues  [%@]", buf, 0x16u);
    }
    id v21 = v17;

    id v22 = v14;
    id v15 = v21;
    id v16 = v22;
  }
  unsigned int v23 = [v15 sortedArrayUsingComparator:&stru_1000A96D0];
  [*(id *)(a1 + 32) setRecognitionLanguages:v23];

  id v24 = [v16 copy];
  [*(id *)(a1 + 32) setLocalizedLanguageToLanguageCodeMap:v24];

  [v3 finishWithNoResult];
}

void sub_1000195F0(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 inputLanguageCode];
  id v13 = [v4 componentsSeparatedByString:@"-"];

  id v5 = [v3 inputLanguageCode];

  id v6 = +[AFLocalization sharedInstance];
  int v7 = [v6 localizedNameForSiriLanguage:v5 inDisplayLanguage:0];

  id v8 = [v13 objectAtIndexedSubscript:0];
  uint64_t v9 = [a1[4] objectAtIndexedSubscript:0];
  unsigned int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    if (!v7) {
      goto LABEL_8;
    }
    id v11 = [a1[5] objectForKeyedSubscript:v7];

    if (!v11)
    {
      [a1[6] na_safeAddObject:v7];
      [a1[7] setObject:v5 forKey:v7];
    }
  }
  else if (!v7)
  {
    goto LABEL_8;
  }
  id v12 = [a1[5] objectForKeyedSubscript:v7];

  if (!v12)
  {
    [a1[8] na_safeAddObject:v7];
    [a1[5] setObject:v5 forKey:v7];
  }
LABEL_8:
}

int64_t sub_100019770(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a2 localizedCompare:a3];
}

id sub_10001A0F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)HFCAPackageIconDescriptor);
  id v5 = [v4 initWithPackageIdentifier:v3 state:HFCAPackageStateKeypad];

  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_10001A1F8;
  id v12 = &unk_1000A8F20;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v9);
  int v7 = +[NAFuture futureWithNoResult];

  return v7;
}

id sub_10001A1F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWithIconDescriptor:*(void *)(a1 + 40) displayStyle:1 animated:1];
}

void sub_10001A5AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_10001A5D8(id a1)
{
  id v3 = +[HFOpenURLRouter sharedInstance];
  v1 = +[NSURL hf_openiCloudPreferencesURL];
  id v2 = [v3 openURL:v1];
}

id sub_10001A650(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:&off_1000B00A0];
}

id sub_10001A660(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  unsigned int v6 = [v4 BOOLValue];

  if (v6)
  {
    [*(id *)(a1 + 32) finishWithResult:&off_1000B00A0];
  }
  else
  {
    int v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = WeakRetained;
      __int16 v20 = 2080;
      id v21 = "-[HSPCPINCodeViewController commitConfiguration]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Presenting error alert because pinCodeManager returned NO for hasValidConstraints.", buf, 0x16u);
    }

    uint64_t v16 = HFErrorUserInfoOperationTypeKey;
    uint64_t v17 = HFOperationAddPINCode;
    id v8 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v9 = objc_alloc((Class)NSError);
    id v10 = [v9 initWithDomain:HFErrorDomain code:83 userInfo:v8];
    id v11 = +[HFErrorHandler sharedHandler];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001A88C;
    v14[3] = &unk_1000A90B0;
    id v15 = *(id *)(a1 + 32);
    [v11 handleError:v10 retryBlock:0 cancelBlock:v14];
  }
  id v12 = +[NAFuture futureWithNoResult];

  return v12;
}

id sub_10001A88C(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:&off_1000B00A0];
}

void sub_10001AA9C(id a1, HFServiceLikeItem *a2)
{
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v4, 0xCu);
  }
}

id sub_10001AE0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) serviceLikeItems];
  unsigned __int8 v5 = [v4 containsObject:v3];

  if (v5)
  {
    unsigned int v6 = 0;
  }
  else
  {
    unsigned int v6 = [v3 description];
  }

  return v6;
}

id sub_10001C274(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  int v4 = [*(id *)(a1 + 32) setupAccessoryDescription];
  unsigned __int8 v5 = [v4 accessoryUUID];
  id v6 = [v3 isEqual:v5];

  return v6;
}

id sub_10001C2E8(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  int v4 = [*(id *)(a1 + 32) setupAccessoryDescription];
  unsigned __int8 v5 = [v4 accessoryName];
  id v6 = [v3 isEqual:v5];

  return v6;
}

void sub_10001CC9C(uint64_t a1)
{
  id v4 = +[HFOpenURLRouter sharedInstance];
  id v2 = [*(id *)(a1 + 32) URL];
  id v3 = [v4 openURL:v2];
}

NAFuture *sub_10001D3B8(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserGivenAccessoryName:*(void *)(a1 + 40)];

  return +[NAFuture futureWithNoResult];
}

void sub_10001E37C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001E3A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(unsigned __int8 *)(a1 + 64);
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "-[HSSetupStateMachineCHIPPartnerConfiguration stageCHIPAccessory]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    __int16 v19 = 1024;
    int v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Staging CHIP accessory with payload %@ scanningNetworks %{BOOL}d", buf, 0x1Cu);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  int v7 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  BOOL v10 = *(unsigned char *)(a1 + 64) != 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001E54C;
  v12[3] = &unk_1000A9868;
  objc_copyWeak(&v14, (id *)(a1 + 56));
  id v11 = v3;
  id v13 = v11;
  [v7 stageCHIPAccessoryPairingInStepsWithPayload:v8 delegate:v9 scanningNetworks:v10 completionHandler:v12];

  objc_destroyWeak(&v14);
}

void sub_10001E530(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001E54C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v7)
  {
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      uint64_t v18 = "-[HSSetupStateMachineCHIPPartnerConfiguration stageCHIPAccessory]_block_invoke";
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Staged CHIP accessory. stagedCHIPAccessoryPairingIdentifier: %@", (uint8_t *)&v17, 0x16u);
    }

    [WeakRetained setStagedCHIPPairingIdentifier:v7];
    [*(id *)(a1 + 32) finishWithResult:v7];
    if (v8)
    {
      id v12 = HFLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315394;
        uint64_t v18 = "-[HSSetupStateMachineCHIPPartnerConfiguration stageCHIPAccessory]_block_invoke";
        __int16 v19 = 2112;
        id v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Staged CHIP accessory. devicePairingUUID: %@", (uint8_t *)&v17, 0x16u);
      }

      [WeakRetained setChipDevicePairingUUID:v8];
      [WeakRetained _updateAccessoryNameWithCHIPPairingIdentifier:v8];
    }
  }
  else if (objc_msgSend(v9, "hf_isAlreadyPairedError"))
  {
    id v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      uint64_t v18 = "-[HSSetupStateMachineCHIPPartnerConfiguration stageCHIPAccessory]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Staged CHIP accessory without stagedCHIPAccessoryPairingIdentifier as it is already paired.", (uint8_t *)&v17, 0xCu);
    }

    [*(id *)(a1 + 32) finishWithError:v9];
  }
  else
  {
    if (v9)
    {
      id v14 = v9;
    }
    else
    {
      id v14 = +[NSError hmfUnspecifiedError];
    }
    id v15 = v14;
    uint64_t v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100066490();
    }

    [WeakRetained setPairingError:v15];
    [WeakRetained setPhase:9];
    [WeakRetained _updateStatusTextAndNotifyDelegate:0];
    [*(id *)(a1 + 32) finishWithError:v15];
  }
}

id sub_10001ECB4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) createCHIPSetupPayloadStringForStagedPairingWithIdentifier:*(void *)(a1 + 40) completionHandler:a2];
}

id sub_10001ECC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[HSSetupStateMachineCHIPPartnerConfiguration pairStagedCHIPAccessoryToPartnerAppHome]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Created CHIP setup payload string: %@", buf, 0x16u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001EE44;
  v10[3] = &unk_1000A98E0;
  uint64_t v5 = *(void **)(a1 + 40);
  void v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v3;
  id v6 = v3;
  id v7 = +[NAFuture futureWithErrorOnlyHandlerAdapterBlock:v10];
  id v8 = [v7 addCompletionBlock:&stru_1000A9920];

  return v7;
}

void sub_10001EE44(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 chipDevicePairingUUID];

  if (!v5)
  {
    id v6 = +[NSUUID UUID];
    [*(id *)(a1 + 32) setChipDevicePairingUUID:v6];
  }
  id v11 = [*(id *)(a1 + 32) targetEcosystem];
  id v7 = [v11 extensionMessenger];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  BOOL v10 = [*(id *)(a1 + 32) chipDevicePairingUUID];
  [v7 pairDeviceInHome:v9 onboardingPayload:v8 uuid:v10 completionHandler:v4];
}

void sub_10001EF2C(id a1, id a2, NSError *a3)
{
  id v4 = a2;
  uint64_t v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    BOOL v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Response from PEA pairing attempt.  Result: %@, error: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_10001F104(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10001F128(id *a1, void *a2, void *a3)
{
  id v5 = a3;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001F390;
  v28[3] = &unk_1000A9970;
  id v29 = a1[5];
  id v6 = [a2 na_firstObjectPassingTest:v28];
  [a1[4] setCurrentPairing:v6];

  uint64_t v7 = [a1[4] currentPairing];
  if (v7)
  {
    id v8 = (void *)v7;
    __int16 v9 = [a1[4] currentPairing];
    uint64_t v10 = [v9 name];
    if (v10)
    {
      id v11 = (void *)v10;
      id v12 = [a1[4] currentPairing];
      id v13 = [v12 name];
      id v14 = [v13 length];

      if (v14)
      {
        id WeakRetained = objc_loadWeakRetained(a1 + 6);
        id v16 = [WeakRetained setupDescription];
        int v17 = [WeakRetained currentPairing];
        uint64_t v18 = [v17 name];
        [v16 updateAccessoryName:v18];

        __int16 v19 = HFLogForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [WeakRetained setupDescription];
          id v21 = [v20 accessoryName];
          *(_DWORD *)buf = 138412290;
          CFStringRef v31 = v21;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updated Matter accessory name to: %@", buf, 0xCu);
        }
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  id WeakRetained = HFLogForCategory();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
    sub_1000665F4((uint64_t)v5, WeakRetained, v22, v23, v24, v25, v26, v27);
  }
LABEL_10:
}

id sub_10001F390(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

id sub_10001F6CC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cancelStagingForStagingRequestUUID:*(void *)(a1 + 40) completionHandler:a2];
}

void sub_10001F6DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100066670(a1, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Canceled staging.  id: %@", (uint8_t *)&v8, 0xCu);
  }
}

void sub_10001FA04(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000666FC(a1, (uint64_t)v3, v5);
    }

    [*(id *)(a1 + 40) rejectDeviceCredentialForStagingRequestUUID:*(void *)(a1 + 48)];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315394;
      int v8 = "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveDeviceCredential:forStagingRequestUUID:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Confirming device credential: %@", (uint8_t *)&v7, 0x16u);
    }

    [*(id *)(a1 + 40) confirmDeviceCredentialForStagingRequestUUID:*(void *)(a1 + 48)];
  }
}

void sub_10001FCD4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = HFLogForCategory();
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100066798();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveThreadScanResults:forStagingRequestUUID:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Selecting Thread network association %@", (uint8_t *)&v9, 0x16u);
    }

    [*(id *)(a1 + 32) selectThreadNetworkAssociation:v5 forStagingRequestUUID:*(void *)(a1 + 40)];
  }
}

void sub_10001FFA8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = HFLogForCategory();
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006680C();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveWiFiScanResults:forStagingRequestUUID:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Selecting WiFi network association %@", (uint8_t *)&v9, 0x16u);
    }

    [*(id *)(a1 + 32) selectWiFiNetworkAssociation:v5 forStagingRequestUUID:*(void *)(a1 + 40)];
  }
}

void sub_1000206FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100020748(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100066880((uint64_t)WeakRetained, v2, v3, v4, v5, v6, v7, v8);
  }

  if (WeakRetained)
  {
    if ([WeakRetained phase] == (id)2)
    {
      [WeakRetained _updateStatusTextAndNotifyDelegate:1];
    }
    else
    {
      int v9 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", [WeakRetained phase]);
      NSLog(@"The 'accessory not found' soft timeout timer should only fire if we remain in the 'discoverAccessories' phase for too long, but instead, we're in the %@ phase", v9);
    }
  }
}

void sub_100020808(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000668EC(v2);
  }

  if (WeakRetained)
  {
    if ([WeakRetained phase] == (id)2)
    {
      uint64_t v3 = +[NSError hf_errorWithCode:6];
      uint64_t v4 = +[NSError hf_mappedHMError:v3];
      uint64_t v5 = [WeakRetained context];
      uint64_t v6 = [v5 setupAccessoryDescription];
      [v6 setCancellationReason:v4];

      uint64_t v7 = [WeakRetained discoveredAccessoryToPair];
      [v7 updateStatus:3 error:v3];

      [WeakRetained setPairingError:v3];
      [WeakRetained setPhase:9];
      id v8 = [WeakRetained cancelStagingForCHIPPairing];
    }
    else
    {
      uint64_t v3 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", [WeakRetained phase]);
      NSLog(@"The 'accessory not found' fatal timeout timer should only fire if we remain in the 'discoverAccessories' phase for too long, but instead, we're in the %@ phase", v3);
    }
  }
}

void sub_100020FFC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_1000213A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 BOOLValue]) {
    [*(id *)(a1 + 32) _enableVoiceRecognition];
  }
  uint64_t v4 = +[NAFuture futureWithResult:v3];

  return v4;
}

id sub_1000214BC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 config];
  uint64_t v6 = [(id)v5 delegate];
  uint64_t v7 = [*(id *)(a1 + 32) config];
  id v8 = [v6 stateMachineConfigurationGetLaunchReason:v7];

  LOBYTE(v5) = [v4 BOOLValue];
  if (v5)
  {
    if (v8 == (id)3)
    {
      uint64_t v9 = +[HUHomeFeatureOnboardingUtilities checkVoiceProfileAvailabiltyForLanguage:0];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000216B0;
      v18[3] = &unk_1000A9218;
      long long v19 = *(_OWORD *)(a1 + 32);
      uint64_t v10 = [v9 flatMap:v18];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000217EC;
      v16[3] = &unk_1000A9AB0;
      long long v17 = *(_OWORD *)(a1 + 32);
      __int16 v11 = [v10 recover:v16];

      goto LABEL_10;
    }
    uint64_t v14 = [*(id *)(a1 + 32) commitConfiguration];
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) config];
    [v12 setShouldSkipVoiceProfileSetup:1];

    if (v8 == (id)3) {
      id v13 = &off_1000B0118;
    }
    else {
      id v13 = &off_1000B0100;
    }
    uint64_t v14 = +[NAFuture futureWithResult:v13];
  }
  __int16 v11 = (void *)v14;
LABEL_10:

  return v11;
}

id sub_1000216B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v10 = 138412802;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 1024;
    unsigned int v15 = [v3 BOOLValue];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: Voice Profile already exists? %{BOOL}d ...", (uint8_t *)&v10, 0x1Cu);
  }
  if ([v3 BOOLValue]) {
    uint64_t v7 = &off_1000B0118;
  }
  else {
    uint64_t v7 = &off_1000B0100;
  }
  id v8 = +[NAFuture futureWithResult:v7];

  return v8;
}

id sub_1000217EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100066930(a1);
  }

  if (+[HUHomeFeatureOnboardingUtilities isVoiceProfileAvailableOnThisDeviceForLanguage:0])uint64_t v5 = &off_1000B0118; {
  else
  }
    uint64_t v5 = &off_1000B0100;
  uint64_t v6 = +[NAFuture futureWithResult:v5];

  return v6;
}

void sub_100021B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100021BCC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100021BDC(uint64_t a1)
{
}

id sub_100021BE4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) config];
  [v2 setShouldSkipVoiceProfileSetup:1];

  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v11 = 138412290;
    __int16 v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ User has opted to not enable voice recognition. Setting flag to skip voice profile setup flow.", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v5 = [*(id *)(a1 + 32) config];
  uint64_t v6 = [v5 delegate];
  uint64_t v7 = [*(id *)(a1 + 32) config];
  id v8 = [v6 stateMachineConfigurationGetLaunchReason:v7];

  if (v8 == (id)3) {
    uint64_t v9 = &off_1000B0118;
  }
  else {
    uint64_t v9 = &off_1000B0100;
  }
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) finishWithResult:v9];
}

void sub_100021D3C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) config];
  id v3 = [v2 delegate];
  id v4 = [*(id *)(a1 + 32) config];
  id v5 = [v3 stateMachineConfigurationGetLaunchReason:v4];

  uint64_t v6 = [*(id *)(a1 + 32) _checkForiCloudSiriEnabledAndEnableVoiceRecognition];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100021E34;
  v9[3] = &unk_1000A9B50;
  long long v10 = *(_OWORD *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = v5;
  uint64_t v12 = v7;
  id v8 = [v6 flatMap:v9];
}

id sub_100021E34(uint64_t a1, void *a2)
{
  if (([a2 BOOLValue] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) config];
    [v3 setShouldSkipVoiceProfileSetup:1];

    if (*(void *)(a1 + 48) == 3) {
      id v4 = &off_1000B0118;
    }
    else {
      id v4 = &off_1000B0100;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) finishWithResult:v4];
  }
  if (*(void *)(a1 + 48) == 3)
  {
    uint64_t v5 = [*(id *)(a1 + 32) _enableVoiceRecognitionAndCommitConfiguration];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = +[HUHomeFeatureOnboardingUtilities checkVoiceProfileAvailabiltyForLanguage:0];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100021FF8;
    v16[3] = &unk_1000A9B00;
    uint64_t v18 = *(void *)(a1 + 56);
    long long v17 = *(_OWORD *)(a1 + 32);
    id v9 = [v8 addFailureBlock:v16];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002209C;
    v13[3] = &unk_1000A9B28;
    uint64_t v15 = *(void *)(a1 + 56);
    long long v14 = *(_OWORD *)(a1 + 32);
    id v10 = [v8 addSuccessBlock:v13];
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) finishWithResult:&off_1000B0100];
  }
  id v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v11;
}

void sub_100021FF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000669C4(a1);
  }

  if (+[HUHomeFeatureOnboardingUtilities isVoiceProfileAvailableOnThisDeviceForLanguage:0])uint64_t v5 = &off_1000B0118; {
  else
  }
    uint64_t v5 = &off_1000B0100;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) finishWithResult:v5];
}

id sub_10002209C(uint64_t a1)
{
  uint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@:%@ Successfully fetched Siri Voice Profile", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) finishWithResult:&off_1000B0118];
}

void sub_1000228AC(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue])
  {
    sub_100060C64(@"HSProximityCardLockAddedToHomeSubtitle");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setSubtitle:];
  }
  else
  {
    uint64_t v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      id v10 = "-[HSPCDoneViewController initWithCoordinator:config:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%@: %s) Not adding subtitles about wallet key when adding accessory %@. hasWalletKey returned NO", buf, 0x20u);
    }
  }
}

void sub_100022B94(uint64_t a1)
{
  id v4 = +[HFOpenURLRouter sharedInstance];
  uint64_t v2 = [*(id *)(a1 + 32) URL];
  id v3 = [v4 openURL:v2];
}

void sub_1000235EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100023610(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = +[NSMutableArray array];
  id v3 = [WeakRetained titleLabel];
  id v4 = [v3 text];
  id v5 = [v4 length];

  id v6 = [WeakRetained bodyTextView];
  uint64_t v7 = [v6 attributedText];
  id v8 = [v7 length];

  __int16 v9 = [WeakRetained titleLabel];
  id v10 = v9;
  if (!v5)
  {
    [v9 setHidden:1];

    if (!v8) {
      goto LABEL_7;
    }
LABEL_5:
    CFStringRef v31 = [WeakRetained bodyTextView];
    [v31 setHidden:0];

    v32 = [WeakRetained bodyTextView];
    __int16 v33 = v32;
    if (v5)
    {
      id v34 = [v32 firstBaselineAnchor];
      CFStringRef v35 = [WeakRetained titleLabel];
      id v36 = [v35 lastBaselineAnchor];
      id v37 = [WeakRetained titleLabel];
      id v38 = [v37 font];
      [v38 _scaledValueForValue:18.0];
      CFStringRef v39 = [v34 constraintEqualToAnchor:v36];
      [v2 addObject:v39];
    }
    else
    {
      id v34 = [v32 topAnchor];
      CFStringRef v35 = [WeakRetained contentView];
      id v36 = [v35 topAnchor];
      id v37 = [v34 constraintEqualToAnchor:v36 constant:10.0];
      [v2 addObject:v37];
    }

    uint64_t v41 = [WeakRetained bodyTextView];
    __int16 v42 = [v41 leadingAnchor];
    CFStringRef v43 = [WeakRetained contentView];
    __int16 v44 = [v43 leadingAnchor];
    unsigned int v45 = [v42 constraintEqualToAnchor:v44 constant:40.0];
    [v2 addObject:v45];

    __int16 v46 = [WeakRetained bodyTextView];
    unsigned int v47 = [v46 trailingAnchor];
    __int16 v48 = [WeakRetained contentView];
    unsigned int v49 = [v48 trailingAnchor];
    __int16 v50 = [v47 constraintEqualToAnchor:v49 constant:-40.0];
    [v2 addObject:v50];

    id v40 = [WeakRetained bodyTextView];
    unsigned int v51 = [v40 lastBaselineAnchor];
    v52 = [WeakRetained contentView];
    v53 = [v52 bottomAnchor];
    v54 = [v51 constraintEqualToAnchor:v53 constant:-10.0];
    [v2 addObject:v54];

    goto LABEL_10;
  }
  [v9 setHidden:0];

  __int16 v11 = [WeakRetained titleLabel];
  uint64_t v12 = [v11 topAnchor];
  id v13 = [WeakRetained contentView];
  long long v14 = [v13 topAnchor];
  uint64_t v15 = [v12 constraintEqualToAnchor:v14 constant:10.0];
  [v2 addObject:v15];

  id v16 = [WeakRetained titleLabel];
  long long v17 = [v16 leadingAnchor];
  uint64_t v18 = [WeakRetained contentView];
  long long v19 = [v18 leadingAnchor];
  id v20 = [v17 constraintEqualToAnchor:v19 constant:40.0];
  [v2 addObject:v20];

  id v21 = [WeakRetained titleLabel];
  uint64_t v22 = [v21 trailingAnchor];
  uint64_t v23 = [WeakRetained contentView];
  uint64_t v24 = [v23 trailingAnchor];
  uint64_t v25 = [v22 constraintEqualToAnchor:v24 constant:-40.0];
  [v2 addObject:v25];

  if (v8) {
    goto LABEL_5;
  }
  uint64_t v26 = [WeakRetained titleLabel];
  uint64_t v27 = [v26 lastBaselineAnchor];
  id v28 = [WeakRetained contentView];
  id v29 = [v28 bottomAnchor];
  id v30 = [v27 constraintEqualToAnchor:v29 constant:-10.0];
  [v2 addObject:v30];

LABEL_7:
  id v40 = [WeakRetained bodyTextView];
  [v40 setHidden:1];
LABEL_10:

  return v2;
}

id sub_100024480(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_alloc((Class)HUCameraRecordingSettingsModule);
  id v6 = +[NSSet setWithArray:*(void *)(a1 + 32)];
  id v7 = [v5 initWithItemUpdater:v4 cameraProfiles:v6 displayStyle:2];

  id v10 = v7;
  id v8 = +[NSArray arrayWithObjects:&v10 count:1];

  return v8;
}

HUItemModuleController *__cdecl sub_100024568(id a1, HFItemModule *a2)
{
  uint64_t v2 = a2;
  id v3 = [objc_alloc((Class)HUCameraSettingsModuleController) initWithModule:v2];

  [v3 setUseProxSetupPresentationStyle:1];

  return (HUItemModuleController *)v3;
}

void sub_1000249F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100024A90;
  v6[3] = &unk_1000A9C30;
  id v7 = v3;
  id v5 = v3;
  [v4 enableMultiUserWithCompletionHandler:v6];
}

void sub_100024A90(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to enable multi user for home with error %@", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 32) finishWithError:v3];
  }
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully enabled multi user for home", (uint8_t *)&v6, 2u);
  }

  [*(id *)(a1 + 32) finishWithNoResult];
}

void sub_100024F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

id sub_100024FA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  id v7 = v6;

  id v8 = [WeakRetained config];
  [v8 setHome:v7];

  __int16 v9 = +[NAFuture futureWithNoResult];

  return v9;
}

id sub_100025128(uint64_t a1, void *a2)
{
  id v3 = [a2 na_map:&stru_1000A9C70];
  id v4 = HULocalizedString();
  id v5 = +[NSSet setWithArray:v3];
  int v6 = +[HFUtilities uniqueHomeKitNameForName:v4 allNames:v5];

  [*(id *)(a1 + 32) setTextFieldText:v6];
  [*(id *)(a1 + 32) setTextFieldPlaceholderText:v6];
  id v7 = +[NAFuture futureWithNoResult];

  return v7;
}

id sub_10002520C(id a1, HMHome *a2)
{
  return [(HMHome *)a2 name];
}

void sub_1000254E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100025508(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)WeakRetained[8];
  WeakRetained[8] = v3;
  id v6 = v3;

  id v7 = [WeakRetained _shouldShowSingleContinueButton];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100025604;
  v11[3] = &unk_1000A9A88;
  id v12 = WeakRetained;
  id v8 = WeakRetained;
  __int16 v9 = [v7 flatMap:v11];

  return v9;
}

id sub_100025604(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100060C64(@"HSProximityCardWalletKeyExpressModeTapToUnlockSubtitle");
  id v6 = *(void **)(a1 + 32);
  id v5 = (id *)(a1 + 32);
  [v6 setSubtitle:v4];

  LODWORD(v4) = [v3 BOOLValue];
  id v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      id v9 = *v5;
      *(_DWORD *)buf = 138412546;
      id v22 = v9;
      __int16 v23 = 2080;
      uint64_t v24 = "-[HSPCWalletKeyExpressModeViewController initWithCoordinator:config:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Showing educational prox card about Wallet Key because shouldShowSingleContinueButton is YES", buf, 0x16u);
    }

    id v10 = [*v5 addProminentButtonWithTitleKey:@"HUContinueTitle" target:*v5 futureSelector:"commitConfiguration"];
    [*v5 setContinueAction:v10];
  }
  else
  {
    if (v8)
    {
      id v11 = *v5;
      *(_DWORD *)buf = 138412546;
      id v22 = v11;
      __int16 v23 = 2080;
      uint64_t v24 = "-[HSPCWalletKeyExpressModeViewController initWithCoordinator:config:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Prompting about enabling Express Mode because hasOnboardedForWalletKey is NO", buf, 0x16u);
    }

    id v12 = [*v5 addProminentButtonWithTitleKey:@"HSProximityCardWalletKeyExpressModeTapToUnlock_EnableTapToUnlockButton" target:*v5 futureSelector:"commitConfiguration"];
    id v10 = HULocalizedString();
    id v13 = objc_alloc_init((Class)LAContext);
    id v20 = 0;
    unsigned int v14 = [v13 canEvaluatePolicy:2 error:&v20];
    id v15 = v20;
    if (v14)
    {
      HULocalizedBiometryString();
      v10 = id v16 = v10;
    }
    else
    {
      id v16 = HFLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100066A5C((uint64_t *)v5, (uint64_t)v15, v16);
      }
    }

    id v17 = [*v5 addOptionalButtonWithTitleKey:v10 target:*v5 futureSelector:"_requireAuthenticationButtonTapped"];
  }

  uint64_t v18 = +[NAFuture futureWithNoResult];

  return v18;
}

NAFuture *__cdecl sub_1000258A4(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[HSPCWalletKeyExpressModeViewController initWithCoordinator:config:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(HSPCWalletKeyExpressModeViewController : %s) hf_fetchWalletKeyDeviceState returned error %@", (uint8_t *)&v6, 0x16u);
  }

  id v4 = +[NAFuture futureWithNoResult];

  return (NAFuture *)v4;
}

void sub_100025990(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = [(id)objc_opt_class() description];
    *(_DWORD *)buf = 138413058;
    unsigned int v14 = v8;
    __int16 v15 = 2080;
    id v16 = "-[HSPCWalletKeyExpressModeViewController initWithCoordinator:config:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%@ :%s) Populating mica asset %@. error %@", buf, 0x2Au);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100025B1C;
  v10[3] = &unk_1000A8F20;
  id v11 = *(id *)(a1 + 40);
  id v12 = v5;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

id sub_100025B1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWithIconDescriptor:*(void *)(a1 + 40) displayStyle:1 animated:1];
}

void sub_100026070(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_1000260B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = +[HSPCWalletKeyExpressModeViewController _expresssModePassConflictError:*(void *)(a1 + 32)];
  id v6 = +[HFErrorHandler sharedHandler];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000261F4;
  v10[3] = &unk_1000A8F20;
  void v10[4] = WeakRetained;
  id v11 = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100026268;
  v8[3] = &unk_1000A90B0;
  id v9 = v11;
  id v7 = v11;
  [v6 handleError:v5 retryBlock:v10 cancelBlock:v8];
}

void sub_1000261F4(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _addWalletKeyWithExpressMode];
  uint64_t v2 = [*(id *)(a1 + 40) completionHandlerAdapter];
  id v3 = [v4 addCompletionBlock:v2];
}

id sub_100026268(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:&off_1000B01C0];
}

void sub_100026278(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = +[HSPCWalletKeyExpressModeViewController _expresssModePassConflictError:*(void *)(a1 + 32)];
  id v6 = +[HFErrorHandler sharedHandler];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000263BC;
  v10[3] = &unk_1000A8F20;
  void v10[4] = WeakRetained;
  id v11 = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000263C8;
  v8[3] = &unk_1000A90B0;
  id v9 = v11;
  id v7 = v11;
  [v6 handleError:v5 retryBlock:v10 cancelBlock:v8];
}

id sub_1000263BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableExpressModeAfterAuthWithPromise:*(void *)(a1 + 40)];
}

id sub_1000263C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:&off_1000B01C0];
}

void sub_1000263D8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _enableExpressModeAfterAuthWithPromise:v3];
}

void sub_100026654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100026678(id *a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026764;
  block[3] = &unk_1000A9DD0;
  objc_copyWeak(&v11, a1 + 6);
  id v8 = v5;
  id v9 = a1[4];
  id v10 = a1[5];
  char v12 = a2;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v11);
}

void sub_100026764(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(void *)(a1 + 32))
  {
    id v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      id v27 = WeakRetained;
      __int16 v28 = 2080;
      id v29 = "-[HSPCWalletKeyExpressModeViewController _enableExpressModeAfterAuthWithPromise:]_block_invoke_2";
      __int16 v30 = 2112;
      uint64_t v31 = v17;
      __int16 v32 = 2112;
      uint64_t v33 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "(%@:%s) When evaluating authentication policy, authError = %@. Invalidating laContext %@", buf, 0x2Au);
    }
LABEL_4:

    [*(id *)(a1 + 40) invalidate];
    [*(id *)(a1 + 48) finishWithResult:&off_1000B01C0];
    goto LABEL_16;
  }
  int v4 = *(unsigned __int8 *)(a1 + 64);
  id v3 = HFLogForCategory();
  BOOL v5 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v5)
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      id v27 = WeakRetained;
      __int16 v28 = 2080;
      id v29 = "-[HSPCWalletKeyExpressModeViewController _enableExpressModeAfterAuthWithPromise:]_block_invoke";
      __int16 v30 = 2112;
      uint64_t v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%@:%s) Authentication failed. Invalidating laContext %@", buf, 0x20u);
    }
    goto LABEL_4;
  }
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    id v27 = WeakRetained;
    __int16 v28 = 2080;
    id v29 = "-[HSPCWalletKeyExpressModeViewController _enableExpressModeAfterAuthWithPromise:]_block_invoke";
    __int16 v30 = 2112;
    uint64_t v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%@:%s) Authentication succeeded to enable express mode Tap to Unlock for currently existing Wallet Key with localAuthenticationContext %@", buf, 0x20u);
  }

  id v7 = [*(id *)(a1 + 40) externalizedContext];
  if (v7)
  {
    id v8 = [WeakRetained config];
    id v9 = [v8 home];
    id v10 = [v9 hf_enableExpressModeForWalletKeyWithAuthData:v7];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100026BA0;
    v24[3] = &unk_1000A9D80;
    v24[4] = WeakRetained;
    id v25 = *(id *)(a1 + 48);
    id v11 = [v10 flatMap:v24];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100026D3C;
    v22[3] = &unk_1000A90D8;
    id v23 = *(id *)(a1 + 48);
    char v12 = [v11 recover:v22];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100026E38;
    v19[3] = &unk_1000A9DA8;
    id v20 = *(id *)(a1 + 40);
    id v21 = WeakRetained;
    id v13 = [v12 addCompletionBlock:v19];
  }
  else
  {
    __int16 v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      id v27 = WeakRetained;
      __int16 v28 = 2080;
      id v29 = "-[HSPCWalletKeyExpressModeViewController _enableExpressModeAfterAuthWithPromise:]_block_invoke";
      __int16 v30 = 2112;
      uint64_t v31 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "(%@:%s) authData is nil. Invalidating laContext %@", buf, 0x20u);
    }

    [*(id *)(a1 + 40) invalidate];
    [*(id *)(a1 + 48) finishWithResult:&off_1000B01A8];
  }

LABEL_16:
}

id sub_100026BA0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) config];
  id v3 = [v2 home];
  int v4 = [v3 hf_walletKeyUUID];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100026C88;
  v8[3] = &unk_1000A9840;
  BOOL v5 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v6 = [v4 flatMap:v8];

  return v6;
}

id sub_100026C88(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    [*(id *)(a1 + 32) _updateHasOnboardedForWalletKey:v6];
  }
  [*(id *)(a1 + 40) finishWithResult:&off_1000B01A8];
  id v7 = +[NAFuture futureWithNoResult];

  return v7;
}

id sub_100026D3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[HFErrorHandler sharedHandler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100026E28;
  v7[3] = &unk_1000A90B0;
  id v8 = *(id *)(a1 + 32);
  [v4 handleError:v3 retryBlock:0 cancelBlock:v7];

  BOOL v5 = +[NAFuture futureWithNoResult];

  return v5;
}

id sub_100026E28(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:&off_1000B01A8];
}

void sub_100026E38(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 138412802;
    uint64_t v6 = v3;
    __int16 v7 = 2080;
    id v8 = "-[HSPCWalletKeyExpressModeViewController _enableExpressModeAfterAuthWithPromise:]_block_invoke_5";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "(%@:%s) Completed hf_enableExpressModeForWalletKeyWithAuthData. Invalidating laContext %@", (uint8_t *)&v5, 0x20u);
  }
}

id sub_10002779C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateHasOnboardedForWalletKey:a2];
}

NAFuture *__cdecl sub_1000277A8(id a1, NSNull *a2)
{
  return +[NAFuture futureWithResult:&off_1000B01A8];
}

id sub_1000277BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[HSPCWalletKeyExpressModeViewController _addWalletKeyWithiPhoneExpressModeOptions:pairedWatchesExpressModeOpti"
         "ons:]_block_invoke_3";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(HSPCWalletKeyExpressModeViewController:%s) Completed adding Wallet Keyfor iPhone with results %@", (uint8_t *)&v7, 0x16u);
  }

  id v5 = *(id *)(a1 + 32);
  return v5;
}

id sub_10002789C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[HSPCWalletKeyExpressModeViewController _addWalletKeyWithiPhoneExpressModeOptions:pairedWatchesExpressModeOpt"
          "ions:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(HSPCWalletKeyExpressModeViewController:%s) Failed adding Wallet Key for iPhone with iPhoneWalletKeyError %@", buf, 0x16u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100027A94;
  v12[3] = &unk_1000A90B0;
  id v13 = objc_alloc_init((Class)NAFuture);
  id v5 = v13;
  uint64_t v6 = objc_retainBlock(v12);
  int v7 = +[HFErrorHandler sharedHandler];
  [v7 handleError:v3 retryBlock:0 cancelBlock:v6];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100027AA4;
  v10[3] = &unk_1000A9E88;
  id v11 = *(id *)(a1 + 32);
  id v8 = [v5 flatMap:v10];

  return v8;
}

id sub_100027A94(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:&off_1000B01A8];
}

id sub_100027AA4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_100027EAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addWalletKeyWithoutExpressMode];
}

BOOL sub_1000285F0(id a1, HFItem *a2)
{
  uint64_t v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  unsigned __int8 v6 = [(HFItem *)v5 isUnknownGuest];
  return v6;
}

void sub_100028C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

NAFuture *__cdecl sub_100028C6C(id a1, NSNull *a2)
{
  return +[NAFuture futureWithResult:&off_1000B01D8];
}

id sub_100028C80(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100066AFC(WeakRetained, (uint64_t)v3, v5);
  }

  unsigned __int8 v6 = [v3 domain];
  int v7 = v6;
  if (v6 == (void *)HFErrorDomain)
  {
    id v8 = [v3 code];

    if (v8 == (id)96)
    {
      __int16 v9 = +[NAFuture futureWithNoResult];
      id v10 = [v9 hs_commitConfigurationAndDismissFutureWithContextMessage:@"User hit Cancel button on custom commissioning flow alert popup. Dismissing."];

      goto LABEL_12;
    }
  }
  else
  {
  }
  id v11 = [WeakRetained config];
  char v12 = [v11 pairingError];
  id v13 = [v12 userInfo];
  uint64_t v14 = [v13 objectForKeyedSubscript:HFErrorUserInfoOptionsKey];
  __int16 v15 = [v14 objectForKeyedSubscript:HFErrorUserInfoOptionDescriptionKey];
  __int16 v16 = v15;
  if (!v15)
  {
    __int16 v16 = HULocalizedString();
  }
  id v17 = [WeakRetained footnoteLabel];
  [v17 setText:v16];

  if (!v15) {
  id v10 = +[NAFuture futureWithResult:&off_1000B01F0];
  }
LABEL_12:

  return v10;
}

void sub_10002940C(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = (void *)a1[4];
  uint64_t v4 = (void *)a1[5];
  uint64_t v6 = a1[6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000294D0;
  v8[3] = &unk_1000A9F38;
  id v9 = v4;
  id v10 = v3;
  id v7 = v3;
  [v5 checkName:v9 inHome:v6 withValidationOptions:1 completionHandler:v8];
}

void sub_1000294D0(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000295C4;
  block[3] = &unk_1000A9F10;
  id v11 = a4;
  char v15 = a2;
  id v12 = *(id *)(a1 + 32);
  id v13 = v7;
  id v14 = *(id *)(a1 + 40);
  id v8 = v7;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1000295C4(uint64_t a1)
{
  if (*(void *)(a1 + 32) || !*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = HFLogForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100066BAC(a1, v2, v3);
    }

    uint64_t v4 = *(void **)(a1 + 32);
    if (v4)
    {
      id v5 = v4;
    }
    else
    {
      id v5 = +[NSError hf_errorWithCode:1];
    }
    uint64_t v6 = v5;
    uint64_t v7 = HFOperationNamingObject;
    id v8 = [*(id *)(a1 + 40) length];
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v13 = HFErrorHandlerOptionFailedItemNameKey;
      uint64_t v14 = v9;
      id v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    }
    else
    {
      id v10 = 0;
    }
    id v11 = [v6 hf_errorWithOperationType:v7 options:v10];

    if (v8) {
    [*(id *)(a1 + 56) finishWithError:v11];
    }
  }
  return [*(id *)(a1 + 56) finishWithNoResult];
}

id sub_100029808(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) validateName:a2];
}

id sub_100029B34(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 name];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id sub_100029B78(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) assignAccessory:*(void *)(a1 + 40) toRoom:*(void *)(a1 + 48) completionHandler:a2];
}

void sub_100029B8C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = HFLogForCategory();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100066C2C(a1, (uint64_t)v6, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Succesfully applied room %@ | %@", (uint8_t *)&v10, 0x16u);
  }
}

void sub_100029F2C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 extensionMessenger];
  id v5 = [*(id *)(a1 + 40) userGivenAccessoryName];
  id v6 = [*(id *)(a1 + 40) selectedPartnerRoom];
  [v7 configureDeviceWithName:v5 room:v6 completionHandler:v4];
}

void sub_10002A590(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Apply accessory %@ name %@", (uint8_t *)&v7, 0x16u);
  }

  [*(id *)(a1 + 32) updateName:*(void *)(a1 + 40) completionHandler:v3];
}

void sub_10002A668(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = HFLogForCategory();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100066D58();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully applied accessory level name %@ to accessory", (uint8_t *)&v8, 0xCu);
  }
}

void sub_10002A74C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 hf_primaryService];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 updateName:*(void *)(a1 + 40) completionHandler:v4];
}

void sub_10002A7BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100066DC4((uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully named Television primary service %@", (uint8_t *)&v8, 0xCu);
  }
}

void sub_10002A89C(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) updateName:*(void *)(a1 + 40) completionHandler:a2];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Apply accessory %@ service %@ name %@ (same as accessory name)", (uint8_t *)&v7, 0x20u);
  }
}

void sub_10002A970(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = HFLogForCategory();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100066E3C();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully applied primary service level name %@ to accessory", (uint8_t *)&v8, 0xCu);
  }
}

void sub_10002AC00(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSDate date];
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating date added to %@ for %@", buf, 0x16u);
  }

  uint64_t v7 = [*(id *)(a1 + 32) hf_updateDateAdded:v4];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002AD78;
  v10[3] = &unk_1000A9DA8;
  id v11 = *(id *)(a1 + 32);
  id v12 = v3;
  id v8 = v3;
  id v9 = [v7 addCompletionBlock:v10];
}

void sub_10002AD78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = HFLogForCategory();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100066EA8((uint64_t)v5, a1, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updated date added for %@", (uint8_t *)&v10, 0xCu);
  }

  [*(id *)(a1 + 40) finishWithResult:v6 error:v5];
}

void sub_10002AF88(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Apply service %@ name %@", (uint8_t *)&v7, 0x16u);
  }

  [*(id *)(a1 + 32) updateName:*(void *)(a1 + 40) completionHandler:v3];
}

id sub_10002B2D4(id a1, HMService *a2)
{
  uint64_t v2 = a2;
  id v3 = [(HMService *)v2 serviceType];
  unsigned int v4 = [v3 isEqualToString:HMServiceTypeInputSource];

  if (v4) {
    +[HSSetupStateMachineConfiguration writeVisibilityState:&off_1000B0208 toInputSourceService:v2];
  }
  else {
  uint64_t v5 = +[HSSetupStateMachineConfiguration writeConfigurationState:3 toService:v2];
  }

  return v5;
}

id sub_10002B414(id a1, HMService *a2)
{
  uint64_t v2 = a2;
  id v3 = [(HMService *)v2 serviceType];
  unsigned int v4 = [v3 isEqualToString:HMServiceTypeInputSource];

  if (v4) {
    +[HSSetupStateMachineConfiguration writeVisibilityState:&off_1000B0220 toInputSourceService:v2];
  }
  else {
  uint64_t v5 = +[HSSetupStateMachineConfiguration writeConfigurationState:2 toService:v2];
  }

  return v5;
}

id sub_10002B6E8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeValue:*(void *)(a1 + 40) completionHandler:a2];
}

void sub_10002B6F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = HFLogForCategory();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100067070();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sucesfully wrote targetVisbilityState: %@ to service %@", (uint8_t *)&v9, 0x16u);
  }
}

id sub_10002B8A0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateConfigurationState:*(void *)(a1 + 40) completionHandler:a2];
}

void sub_10002B908(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_10002B928(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10002B944(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

BOOL sub_10002BE14(id a1, HMService *a2)
{
  uint64_t v2 = [(HMService *)a2 serviceType];
  unsigned __int8 v3 = [v2 isEqualToString:HMServiceTypeInputSource];

  return v3;
}

BOOL sub_10002BEB0(id a1, HMService *a2)
{
  return [(HMService *)a2 configurationState] != (id)2;
}

uint64_t sub_10002BF50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) config];
  uint64_t v8 = [v7 addedAccessory];
  uint64_t v9 = [v8 televisionProfiles];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002C0F8;
  v19[3] = &unk_1000AA0E8;
  id v10 = v5;
  id v20 = v10;
  __int16 v11 = [v9 na_firstObjectPassingTest:v19];

  [v11 hf_mediaSourceComparator];
  uint64_t v12 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  if (!v12
    || ([v10 mediaSourceIdentifier],
        id v13 = objc_claimAutoreleasedReturnValue(),
        [v6 mediaSourceIdentifier],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = ((uint64_t (**)(void, void *, void *))v12)[2](v12, v13, v14),
        v14,
        v13,
        !v15))
  {
    v18.receiver = *(id *)(a1 + 32);
    v18.super_class = (Class)HSPCNameInputSourcesViewController;
    [super serviceComparator];
    uint64_t v16 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v15 = ((uint64_t (**)(void, id, id))v16)[2](v16, v10, v6);
  }
  return v15;
}

id sub_10002C0F8(uint64_t a1, void *a2)
{
  unsigned __int8 v3 = [a2 services];
  id v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

void sub_10002C6CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10002C6F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained showActivityIndicatorWithStatus:&stru_1000ABBA8];
  unsigned __int8 v3 = +[NAScheduler mainThreadScheduler];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002C834;
  v10[3] = &unk_1000A90B0;
  void v10[4] = WeakRetained;
  id v4 = [v3 afterDelay:v10 performBlock:1.0];

  id v5 = [*(id *)(a1 + 32) activeTuple];
  id v6 = [v5 accessory];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002C83C;
  v8[3] = &unk_1000A9C30;
  id v9 = v6;
  id v7 = v6;
  [v7 identifyWithCompletionHandler:v8];
}

id sub_10002C834(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideActivityIndicator];
}

void sub_10002C83C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v5) {
      sub_100067178(a1);
    }

    id v4 = +[HFErrorHandler sharedHandler];
    [v4 logError:v3 operationDescription:HFOperationIdentifyAccessory];
  }
  else if (v5)
  {
    sub_1000670DC(a1, v4);
  }
}

void sub_10002CBA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002CBC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HULocalizedString();
  BOOL v5 = +[UIAlertController alertControllerWithTitle:v4 message:*(void *)(a1 + 32) preferredStyle:1];

  id v6 = HULocalizedString();
  objc_initWeak(location, *(id *)(a1 + 40));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002CED8;
  v22[3] = &unk_1000AA160;
  objc_copyWeak(v25, location);
  id v24 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void **)(a1 + 64);
  id v23 = v7;
  v25[1] = v8;
  id v9 = +[UIAlertAction actionWithTitle:v6 style:0 handler:v22];
  [v5 addAction:v9];
  id v10 = HULocalizedString();
  __int16 v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:0];
  [v5 addAction:v11];

  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v12 = HULocalizedString();
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_10002D040;
    objc_super v18 = &unk_1000AA188;
    id v13 = *(void **)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 40);
    id v20 = v13;
    objc_copyWeak(v21, location);
    v21[1] = *(id *)(a1 + 64);
    uint64_t v14 = +[UIAlertAction actionWithTitle:v12 style:0 handler:&v15];

    [v5 addAction:v14, v15, v16, v17, v18, v19];
    objc_destroyWeak(v21);
  }
  [v5 setPreferredAction:v9];
  [*(id *)(a1 + 40) presentViewController:v5 animated:1 completion:0];

  objc_destroyWeak(v25);
  objc_destroyWeak(location);
}

void sub_10002CE9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_10002CED8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  if (objc_opt_respondsToSelector())
  {
    id v4 = [WeakRetained dismissButtonBlock];
    v4[2]();
  }
  BOOL v5 = [WeakRetained dismissFuture];
  [WeakRetained handleButtonDirectiveFuture:v5];

  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    v10[0] = HFAnalyticsDataAccessoryCategoryTypeKey;
    id v7 = [v6 category];
    uint64_t v8 = [v7 categoryType];
    v10[1] = HFAnalyticsResumeSetupSelectedOptionKey;
    v11[0] = v8;
    v11[1] = &off_1000B0250;
    id v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

    +[HFAnalytics sendEvent:*(void *)(a1 + 56) withData:v9];
  }
}

void sub_10002D040(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) showActivityIndicatorWithStatus:&stru_1000ABBA8];
  id v4 = [*(id *)(a1 + 32) dismissButtonAction];
  [v4 setEnabled:0];

  BOOL v5 = [*(id *)(a1 + 40) home];
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  uint64_t v12 = sub_10002D214;
  id v13 = &unk_1000A93E0;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  [v5 removeAccessory:v6 completionHandler:&v10];
  v15[0] = HFAnalyticsDataAccessoryCategoryTypeKey;
  id v7 = [*(id *)(a1 + 40) category:v10, v11, v12, v13];
  uint64_t v8 = [v7 categoryType];
  v15[1] = HFAnalyticsResumeSetupSelectedOptionKey;
  v16[0] = v8;
  v16[1] = &off_1000B0268;
  id v9 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  +[HFAnalytics sendEvent:*(void *)(a1 + 56) withData:v9];
  objc_destroyWeak(&v14);
}

void sub_10002D1F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10002D214(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained hideActivityIndicator];
  v1 = [WeakRetained dismissFuture];
  [WeakRetained handleButtonDirectiveFuture:v1];
}

void sub_10002D27C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [WeakRetained dismissFuture];
  [WeakRetained handleButtonDirectiveFuture:v3];
}

void sub_10002D50C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002D52C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained futureReturningDirectiveFromTarget:*(void *)(a1 + 32) selector:*(void *)(a1 + 48)];
  [WeakRetained handleButtonDirectiveFuture:v2 target:*(void *)(a1 + 32)];
}

void sub_10002D7F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

id sub_10002D818(uint64_t a1, void *a2)
{
  unsigned int v3 = [a2 intValue];
  if (v3 == 1)
  {
    id v14 = *(void **)(a1 + 32);
    if (v14) {
      [v14 dismissProxCardFlowAfterExecuting:0];
    }
    else {
      [*(id *)(a1 + 48) dismissViewControllerAnimated:1 completion:0];
    }
    goto LABEL_11;
  }
  if (v3)
  {
LABEL_11:
    id v13 = +[NAFuture futureWithNoResult];
    goto LABEL_12;
  }
  id v4 = *(void **)(a1 + 32);
  if (!v4)
  {
    NSLog(&CFSTR("Coordinator is nil.  Are you sure your HSProxCardConfigurable stored the coordinator passed at initialization"
                 " to self.coordinator?").isa);
    BOOL v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006721C(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    id v4 = *(void **)(a1 + 32);
  }
  id v13 = [v4 nextViewControllerWithTarget:*(void *)(a1 + 40)];
LABEL_12:

  return v13;
}

void sub_10002D8E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained hideActivityIndicator];
  if (v6)
  {
    uint64_t v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100067254();
    }
  }
  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    uint64_t v12 = [WeakRetained navigationController];
    [v12 pushViewController:v11 animated:1];
  }
}

NAFuture *__cdecl sub_10002DB94(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = v5;
  if (!v5)
  {
    NSLog(@"Action returned a non valid object.  It should return NSNumber wrapping HSSetupButtonActionDirective");
    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100067410(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    id v6 = &off_1000B0268;
  }
  uint64_t v15 = +[NAFuture futureWithResult:v6];

  return (NAFuture *)v15;
}

void sub_10002DD3C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_10002DF30(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_10002E1FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10002E228(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 matchedLibraryItems];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v3 matchedLibraryItems];
      *(_DWORD *)buf = 138412290;
      __int16 v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Resolved to installed app %@", buf, 0xCu);
    }
    id v8 = objc_alloc((Class)HULinkedApplicationLibraryItem);
    id v9 = [v3 matchedLibraryItems];
    uint64_t v10 = [v9 anyObject];
    id v11 = [v8 initWithApplicationProxy:v10];
    [*(id *)(a1 + 32) setLinkedApplicationItem:v11];

LABEL_9:
    uint64_t v19 = [*(id *)(a1 + 32) linkedApplicationItem];
    id v20 = [v19 updateWithOptions:&__NSDictionary0__struct];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10002E6B8;
    v27[3] = &unk_1000AA298;
    v27[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v28, (id *)(a1 + 56));
    id v21 = [v20 flatMap:v27];
    objc_destroyWeak(&v28);

    goto LABEL_10;
  }
  uint64_t v12 = [v3 matchedStoreItems];
  id v13 = [v12 count];

  if (v13)
  {
    uint64_t v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v3 matchedStoreItems];
      *(_DWORD *)buf = 138412290;
      __int16 v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Resolved to app store download %@", buf, 0xCu);
    }
    id v16 = objc_alloc((Class)HULinkedApplicationStoreItem);
    id v9 = [v3 matchedStoreItems];
    id v17 = [v9 anyObject];
    id v18 = [v16 initWithStoreItem:v17];
    [*(id *)(a1 + 32) setLinkedApplicationItem:v18];

    goto LABEL_9;
  }
  if ([*(id *)(a1 + 40) isEqualToString:HMAppStoreIDAppShack]
    && +[HFUtilities isInternalInstall])
  {
    id v23 = HFLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Resolved to internal store download", buf, 2u);
    }

    id v9 = [objc_alloc((Class)HULinkedApplicationInternalStoreItem) initWithBundleIdentifier:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setLinkedApplicationItem:v9];
    goto LABEL_9;
  }
  if ([*(id *)(a1 + 40) isEqualToString:HMAppStoreIDLocal]
    && +[HFUtilities isInternalInstall])
  {
    id v24 = HFLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Resolved to internal sideload", buf, 2u);
    }

    id v9 = [objc_alloc((Class)HULinkedApplicationInternalSideloadItem) initWithBundleIdentifier:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setLinkedApplicationItem:v9];
    goto LABEL_9;
  }
  id v25 = HFLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_100067480(v25);
  }

  uint64_t v26 = HULocalizedString();
  [*(id *)(a1 + 32) setSubtitle:v26];

  id v21 = +[NAFuture futureWithNoResult];
LABEL_10:

  return v21;
}

void sub_10002E69C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_10002E6B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:HFResultDisplayTitleKey];
  id v5 = HULocalizedString();
  id v6 = [v3 objectForKeyedSubscript:HFResultApplicationIsInstalled];
  unsigned int v7 = [v6 BOOLValue];

  if (!v7)
  {
    id v9 = [v3 objectForKeyedSubscript:HFResultApplicationStoreURL];

    if (!v9)
    {
      id v11 = [*(id *)(a1 + 32) linkedApplicationItem];
      objc_opt_class();
      objc_opt_isKindOfClass();

      id v8 = HULocalizedString();
      goto LABEL_12;
    }
    id v8 = HULocalizedString();

    if (v4) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v10 = HULocalizedString();
    goto LABEL_10;
  }
  id v8 = HULocalizedString();

  if (!v4) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v10 = HULocalizedStringWithFormat();
LABEL_10:
  id v5 = (void *)v10;
  if (!v10) {
    goto LABEL_13;
  }
  [*(id *)(a1 + 32) setSubtitle:v8];
  uint64_t v12 = *(void **)(a1 + 32);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  id v21[2] = sub_10002E970;
  v21[3] = &unk_1000AA270;
  v21[4] = v12;
  id v13 = +[PRXAction actionWithTitle:v5 style:0 handler:v21];
  id v14 = [v12 addAction:v13];

LABEL_12:
LABEL_13:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v16 = [WeakRetained contentView];
  [v16 setNeedsUpdateConstraints];

  id v17 = [WeakRetained view];
  [v17 bounds];
  [WeakRetained updatePreferredContentSizeForCardWidth:v18];

  uint64_t v19 = +[NAFuture futureWithNoResult];

  return v19;
}

void sub_10002E970(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) linkedApplicationItem];
  id v3 = [v2 latestResults];
  id v12 = [v3 objectForKeyedSubscript:HFResultDisplayTitleKey];

  id v4 = [*(id *)(a1 + 32) linkedApplicationItem];
  id v5 = [v4 latestResults];
  id v6 = [v5 objectForKeyedSubscript:HFResultApplicationBundleIdentifier];

  unsigned int v7 = [*(id *)(a1 + 32) linkedApplicationItem];
  id v8 = [v7 latestResults];
  id v9 = [v8 objectForKeyedSubscript:HFResultApplicationStoreURL];

  id v10 = [objc_alloc((Class)HFAppPunchoutRequest) initWithName:v12 bundleID:v6 payloadURL:0 storeURL:v9];
  [*(id *)(a1 + 32) setPunchoutRequest:v10];

  id v11 = [*(id *)(a1 + 32) popupDelegate];
  [v11 pairingPopupDidFinish:*(void *)(a1 + 32)];
}

id sub_10002EF40(uint64_t a1)
{
  return [*(id *)(a1 + 32) commitConfiguration];
}

id sub_10002F624(uint64_t a1)
{
  return [*(id *)(a1 + 32) performPRXLayoutPass];
}

void sub_10002F950(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) sharingDevice];
  unsigned int v5 = [v4 deviceActionType];

  if (v5 != 11 && v5 != 33) {
    NSLog(@"We only support sharing devices with the SFDeviceActionType[Speaker]Setup actionType. Treating this as a speaker anyway");
  }
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received request to start pairing a speaker. Calling into Sharing to show the prox card", buf, 2u);
  }

  id v7 = objc_alloc_init((Class)SFClient);
  id v8 = [*(id *)(a1 + 32) sharingDevice];
  id v9 = [*(id *)(a1 + 40) coordinator];
  id v10 = [v9 home];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002FACC;
  v12[3] = &unk_1000A9C30;
  id v13 = v3;
  id v11 = v3;
  [v7 setupDevice:v8 home:v10 completion:v12];
}

void sub_10002FACC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Request to start pairing speaker finished with error: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) finishWithNoResult];
}

void sub_10002FB90(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 commitConfiguration];
  [v1 handleButtonDirectiveFuture:v2];
}

id sub_10002FE68(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchAirportUtility];
}

id sub_10002FE70(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchAppStore];
}

void sub_10002FFFC(id a1, AMSLookupResult *a2, NSError *a3)
{
  if (!a3)
  {
    uint64_t v14 = v3;
    uint64_t v15 = v4;
    int v5 = [(AMSLookupResult *)a2 allItems];
    id v6 = [v5 na_firstObjectPassingTest:&stru_1000AA3A8];

    if (v6)
    {
      id v7 = +[HFOpenURLRouter sharedInstance];
      id v8 = [v6 productPageURL];
      id v9 = [v7 openURL:v8];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      void v11[2] = sub_100030160;
      v11[3] = &unk_1000AA3D0;
      id v12 = 0;
      id v13 = v6;
      id v10 = [v9 addFailureBlock:v11];
    }
  }
}

BOOL sub_10003011C(id a1, AMSLookupItem *a2)
{
  id v2 = [(AMSLookupItem *)a2 bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.airport.mobileairportutility"];

  return v3;
}

void sub_100030160(uint64_t a1)
{
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000674C4(a1, v2);
  }
}

BOOL sub_100030930(id a1, PRXButton *a2)
{
  id v2 = [(PRXButton *)a2 currentTitle];
  unsigned __int8 v3 = HULocalizedString();
  unsigned __int8 v4 = [v2 isEqualToString:v3];

  return v4;
}

id sub_100031164(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)HFMediaAccessoryItem) initWithValueSource:*(void *)(a1 + 32) mediaProfileContainer:v3];

  int v5 = [v4 enableDoorbellChime:*(unsigned __int8 *)(a1 + 40)];

  return v5;
}

BOOL sub_100031368(id a1, HFMediaProfileContainer *a2)
{
  id v2 = [(HFMediaProfileContainer *)a2 settings];
  id v3 = [v2 hf_accessorySettingAtKeyPath:HFHomePodMediaAccessorySettingKeyPathDoorbellChimeEnabled];

  return v3 != 0;
}

void sub_100031B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10003279C(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_1000CB568)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_1000328C8;
    v3[4] = &unk_1000AA538;
    v3[5] = v3;
    long long v4 = off_1000AA520;
    uint64_t v5 = 0;
    qword_1000CB568 = _sl_dlopen();
  }
  if (!qword_1000CB568) {
    sub_100067574(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SUICOrbView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_1000675F4();
  }
  qword_1000CB560 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000328C8()
{
  uint64_t result = _sl_dlopen();
  qword_1000CB568 = result;
  return result;
}

id sub_100032F34(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) config];
  id v2 = [v1 configureAccessoryName];

  return v2;
}

id sub_100032F84(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) config];
  id v2 = [v1 configureAccessoryDateAdded];

  return v2;
}

id sub_1000331C8(id a1, HMAccessory *a2)
{
  return [(HMAccessory *)a2 name];
}

void sub_10003401C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100034048(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = (void *)WeakRetained[8];
  WeakRetained[8] = v3;
  id v6 = v3;

  id v7 = [WeakRetained _shouldShowSingleContinueButton];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_100034144;
  v11[3] = &unk_1000A9A88;
  id v12 = WeakRetained;
  id v8 = WeakRetained;
  id v9 = [v7 flatMap:v11];

  return v9;
}

NAFuture *sub_100034144(uint64_t a1, void *a2)
{
  unsigned int v3 = [a2 BOOLValue];
  long long v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [*(id *)(a1 + 32) addProminentButtonWithTitleKey:@"HUContinueTitle" target:*(void *)(a1 + 32) futureSelector:"commitConfiguration"];
    [*(id *)(a1 + 32) setContinueAction:v5];
  }
  else
  {
    id v6 = sub_100060C64(@"HSProximityCardWalletKeyUWB_TurnOnUWBButton");
    id v7 = [v4 addProminentButtonWithTitleKey:v6 target:*(void *)(a1 + 32) futureSelector:"commitConfiguration"];

    uint64_t v5 = HULocalizedString();
    id v8 = [*(id *)(a1 + 32) addOptionalButtonWithTitleKey:v5 target:*(void *)(a1 + 32) futureSelector:"_notNowTapped"];
  }

  return +[NAFuture futureWithNoResult];
}

id sub_100034238(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    id v11 = "-[HSPCWalletKeyUWBViewController initWithCoordinator:config:]_block_invoke_3";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) hf_fetchWalletKeyDeviceState returned error %@", (uint8_t *)&v8, 0x20u);
  }

  id v6 = +[NAFuture futureWithNoResult];

  return v6;
}

void sub_100034894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000348B8(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _enableUWBOfExistingWalletKeyAfterAuthWithPromise:v3];
}

id sub_10003523C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateHasOnboardedForWalletKey:a2];
}

NAFuture *__cdecl sub_100035248(id a1, NSNull *a2)
{
  return +[NAFuture futureWithResult:&off_1000B02F8];
}

id sub_10003525C(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(id)objc_opt_class() description];
    int v8 = 138412802;
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    id v11 = "-[HSPCWalletKeyUWBViewController _addWalletKeyWithiPhoneUWBOptions:pairedWatchesUWBOptions:]_block_invoke_3";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) Completed adding Wallet Key for iPhone with results %@", (uint8_t *)&v8, 0x20u);
  }
  id v6 = *(id *)(a1 + 40);

  return v6;
}

id sub_100035360(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(id)objc_opt_class() description];
    *(_DWORD *)buf = 138412802;
    id v16 = v5;
    __int16 v17 = 2080;
    double v18 = "-[HSPCWalletKeyUWBViewController _addWalletKeyWithiPhoneUWBOptions:pairedWatchesUWBOptions:]_block_invoke";
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) Failed adding Wallet Key for iPhone with iPhoneWalletKeyError %@", buf, 0x20u);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003557C;
  v13[3] = &unk_1000A90B0;
  id v14 = objc_alloc_init((Class)NAFuture);
  id v6 = v14;
  id v7 = objc_retainBlock(v13);
  int v8 = +[HFErrorHandler sharedHandler];
  [v8 handleError:v3 retryBlock:0 cancelBlock:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_10003558C;
  v11[3] = &unk_1000A9E88;
  id v12 = *(id *)(a1 + 40);
  uint64_t v9 = [v6 flatMap:v11];

  return v9;
}

id sub_10003557C(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:&off_1000B02F8];
}

id sub_10003558C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100035874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100035898(id *a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035984;
  block[3] = &unk_1000A9DD0;
  objc_copyWeak(&v11, a1 + 6);
  char v12 = a2;
  id v8 = v5;
  id v9 = a1[4];
  id v10 = a1[5];
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v11);
}

void sub_100035984(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(unsigned char *)(a1 + 64) && !*(void *)(a1 + 32))
  {
    long long v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      id v26 = WeakRetained;
      __int16 v27 = 2080;
      id v28 = "-[HSPCWalletKeyUWBViewController _enableUWBOfExistingWalletKeyAfterAuthWithPromise:]_block_invoke";
      __int16 v29 = 2112;
      *(void *)__int16 v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) Authentication succeeded to enable UWB for currently existing Wallet Key with localAuthenticationContext %@", buf, 0x20u);
    }

    id v6 = [*(id *)(a1 + 40) externalizedContext];
    if (v6)
    {
      id v7 = [WeakRetained config];
      id v8 = [v7 home];
      [v8 hf_enableUWBForWalletKeyWithAuthData:v6 enableNFCExpress:1];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100035D74;
      v23[3] = &unk_1000A9D80;
      void v23[4] = WeakRetained;
      id v24 = *(id *)(a1 + 48);
      id v10 = [v9 flatMap:v23];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      id v21[2] = sub_100035F10;
      v21[3] = &unk_1000A90D8;
      id v22 = *(id *)(a1 + 48);
      id v11 = [v10 recover:v21];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10003600C;
      v18[3] = &unk_1000A9DA8;
      id v19 = *(id *)(a1 + 40);
      id v20 = WeakRetained;
      id v12 = [v11 addCompletionBlock:v18];
    }
    else
    {
      id v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        id v26 = WeakRetained;
        __int16 v27 = 2080;
        id v28 = "-[HSPCWalletKeyUWBViewController _enableUWBOfExistingWalletKeyAfterAuthWithPromise:]_block_invoke";
        __int16 v29 = 2112;
        *(void *)__int16 v30 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(%@:%s) authData is nil. Invalidating LAContext %@", buf, 0x20u);
      }

      [*(id *)(a1 + 40) invalidate];
      [*(id *)(a1 + 48) finishWithResult:&off_1000B02F8];
    }
  }
  else
  {
    id v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v15 = *(unsigned __int8 *)(a1 + 64);
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138413314;
      id v26 = WeakRetained;
      __int16 v27 = 2080;
      id v28 = "-[HSPCWalletKeyUWBViewController _enableUWBOfExistingWalletKeyAfterAuthWithPromise:]_block_invoke_2";
      __int16 v29 = 1024;
      *(_DWORD *)__int16 v30 = v15;
      *(_WORD *)&v30[4] = 2112;
      *(void *)&v30[6] = v16;
      __int16 v31 = 2112;
      uint64_t v32 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "(%@:%s) When evaluating authentication policy, success = %{BOOL}d. authError = %@. Invalidating LAContext %@", buf, 0x30u);
    }

    [*(id *)(a1 + 40) invalidate];
    [*(id *)(a1 + 48) finishWithResult:&off_1000B0310];
  }
}

id sub_100035D74(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) config];
  id v3 = [v2 home];
  long long v4 = [v3 hf_walletKeyUUID];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100035E5C;
  v8[3] = &unk_1000A9840;
  uint64_t v5 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v6 = [v4 flatMap:v8];

  return v6;
}

id sub_100035E5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    [*(id *)(a1 + 32) _updateHasOnboardedForWalletKey:v6];
  }
  [*(id *)(a1 + 40) finishWithResult:&off_1000B02F8];
  id v7 = +[NAFuture futureWithNoResult];

  return v7;
}

id sub_100035F10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[HFErrorHandler sharedHandler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100035FFC;
  v7[3] = &unk_1000A90B0;
  id v8 = *(id *)(a1 + 32);
  [v4 handleError:v3 retryBlock:0 cancelBlock:v7];

  uint64_t v5 = +[NAFuture futureWithNoResult];

  return v5;
}

id sub_100035FFC(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:&off_1000B02F8];
}

void sub_10003600C(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 138412802;
    uint64_t v6 = v3;
    __int16 v7 = 2080;
    id v8 = "-[HSPCWalletKeyUWBViewController _enableUWBOfExistingWalletKeyAfterAuthWithPromise:]_block_invoke_5";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "(%@:%s) Completed hf_enableUWBForWalletKeyWithAuthData. Invalidating LAContext %@", (uint8_t *)&v5, 0x20u);
  }
}

void sub_1000362B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000362E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    int v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100067670((uint64_t)v3, WeakRetained, v5);
    }
  }
}

void sub_100036730(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) walletKeyDeviceState];
  id v3 = [v2 walletKey];

  if (!v3) {
    id v4 = [*(id *)(a1 + 32) _addWalletKeyWithoutUWB];
  }
}

void sub_100036AE4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) popupDelegate];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) popupDelegate];
    [v3 pairingPopupDidCancel:*(void *)(a1 + 32)];
  }
}

void sub_100036FEC(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 commitConfiguration];
  [v1 handleButtonDirectiveFuture:v2];
}

id sub_100037100()
{
  if (qword_1000CB570 != -1) {
    dispatch_once(&qword_1000CB570, &stru_1000AA5E0);
  }
  v0 = (void *)qword_1000CB578;

  return v0;
}

void sub_100037154(id a1)
{
  qword_1000CB578 = sub_10003718C();

  _objc_release_x1();
}

id sub_10003718C()
{
  v2[0] = &off_1000B0CD0;
  v2[1] = &off_1000B0CE8;
  v0 = +[NSArray arrayWithObjects:v2 count:2];

  return v0;
}

void sub_100037E4C(void *a1, void *a2)
{
  id v3 = a2;
  int v5 = (void *)a1[4];
  id v4 = (void *)a1[5];
  uint64_t v6 = a1[6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100037F0C;
  v8[3] = &unk_1000AA3D0;
  id v9 = v4;
  id v10 = v3;
  id v7 = v3;
  [v5 updateAssistantAccessControl:v9 forHome:v6 completionHandler:v8];
}

void sub_100037F0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      id v7 = "Failed to enable personal requests with error %@ for %@, ";
      id v8 = v4;
      uint32_t v9 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v5)
  {
    LOWORD(v10) = 0;
    id v7 = "Successfully enabled personal requests";
    id v8 = v4;
    uint32_t v9 = 2;
    goto LABEL_6;
  }

  [*(id *)(a1 + 40) finishWithNoResult];
}

id sub_100038C8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scrollToWells];
}

int64_t sub_100039864(id a1, HMAccessory *a2, HMAccessory *a3)
{
  id v4 = a2;
  BOOL v5 = a3;
  uint64_t v6 = [(HMAccessory *)v4 hf_userFriendlyLocalizedLowercaseDescription];
  id v7 = [(HMAccessory *)v5 hf_userFriendlyLocalizedLowercaseDescription];
  if ([v6 isEqual:v7])
  {
    unsigned int v8 = [(HMAccessory *)v4 isBridged];
    if (v8 == [(HMAccessory *)v5 isBridged])
    {
      int v10 = [(HMAccessory *)v4 name];
      id v11 = [(HMAccessory *)v5 name];
      int64_t v9 = (int64_t)[v10 localizedStandardCompare:v11];
    }
    else if ([(HMAccessory *)v4 isBridged])
    {
      int64_t v9 = 1;
    }
    else
    {
      int64_t v9 = -1;
    }
  }
  else
  {
    int64_t v9 = (int64_t)[v6 localizedStandardCompare:v7];
  }

  return v9;
}

BOOL sub_100039970(id a1, HMAccessory *a2)
{
  return ![(HMAccessory *)a2 isBridged];
}

BOOL sub_100039990(id a1, HMAccessory *a2)
{
  id v2 = [(HMAccessory *)a2 services];
  unsigned __int8 v3 = [v2 na_any:&stru_1000AA6C8];

  return v3;
}

BOOL sub_1000399D4(id a1, HMService *a2)
{
  id v2 = [(HMService *)a2 serviceType];
  unsigned __int8 v3 = [v2 isEqualToString:HMServiceTypeValve];

  return v3;
}

id sub_100039A1C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _tupleForAccessory:a2];
}

NSCopying *__cdecl sub_100039A28(id a1, HSAccessoryTuple *a2)
{
  return (NSCopying *)[(HSAccessoryTuple *)a2 accessoryCategoryOrPrimaryServiceType];
}

void sub_100039DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100039E04(uint64_t a1, void *a2, void *a3)
{
  id v25 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (v5)
  {
    [WeakRetained notifyDelegateOfPairingFailureWithError:v5];
  }
  else if (v25)
  {
    [WeakRetained didReceiveAccessories:];
  }
  else
  {
    [WeakRetained setPairingState:3];
    unsigned int v8 = +[NSError na_genericError];
    int64_t v9 = [v7 topAccessoryTuple];
    int v10 = [v9 configuration];
    [v10 setPairingError:v8];
  }
  id v11 = +[HSAccessoryPairingEventLogger sharedLogger];
  [v11 logPairingComplete];

  __int16 v12 = +[HSAccessoryPairingEventLogger sharedLogger];
  [v12 logNumberOfPairedAccessories:[v25 count]];

  uint64_t v13 = +[HSAccessoryPairingEventLogger sharedLogger];
  uint64_t v14 = [v7 topAccessoryTuple];
  int v15 = [v14 accessory];
  [v13 logAccessory:v15];

  uint64_t v16 = [v7 topAccessoryTuple];
  uint64_t v17 = [v16 configuration];
  double v18 = [v17 roomName];
  if (![v18 length])
  {

    goto LABEL_10;
  }
  id v19 = [v7 topAccessoryTuple];
  id v20 = [v19 configuration];
  id v21 = [v20 pairingError];

  if (v21)
  {
LABEL_10:
    id v22 = [v7 delegate];
    id v23 = [v7 topAccessoryTuple];
    id v24 = [v23 configuration];
    [v22 coordinator:v7 updatedConfiguration:v24];
  }
}

void sub_10003A358(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

id sub_10003A380(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_isAlreadyPairedError"))
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "stageCHIPAccessory Staged CHIP accessory without stagedCHIPAccessoryPairingIdentifier.", (uint8_t *)&v23, 2u);
    }

    id v5 = +[NAFuture futureWithResult:&stru_1000ABBA8];
    goto LABEL_21;
  }
  uint64_t v6 = [*(id *)(a1 + 32) pairingError];
  if (!v6) {
    goto LABEL_12;
  }
  id v7 = (void *)v6;
  unsigned int v8 = [*(id *)(a1 + 32) pairingError];
  int64_t v9 = [v8 domain];
  if (([v9 isEqualToString:HFErrorDomain] & 1) == 0)
  {

    goto LABEL_12;
  }
  int v10 = [*(id *)(a1 + 32) pairingError];
  id v11 = [v10 code];

  if (v11 != (id)6)
  {
LABEL_12:
    uint64_t v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      id v24 = v3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "stageCHIPAccessory hit error %@", (uint8_t *)&v23, 0xCu);
    }

    [*(id *)(a1 + 32) setPairingError:v3];
    goto LABEL_15;
  }
  uint64_t v12 = [*(id *)(a1 + 32) pairingError];

  uint64_t v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "stageCHIPAccessory Accessory Discovery Timed Out", (uint8_t *)&v23, 2u);
  }

  id v3 = (id)v12;
LABEL_15:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v16 = +[NSMutableDictionary dictionary];
  uint64_t v17 = [*(id *)(a1 + 32) statusTitle];
  [v16 setObject:v17 forKeyedSubscript:HFErrorUserInfoOptionTitleKey];

  double v18 = [*(id *)(a1 + 32) statusDescription];
  [v16 setObject:v18 forKeyedSubscript:HFErrorUserInfoOptionDescriptionKey];

  id v19 = [v16 count];
  if (v19) {
    id v20 = [v16 copy];
  }
  else {
    id v20 = 0;
  }
  uint64_t v21 = [v3 hf_errorWithOperationType:0 options:v20];

  if (v19) {
  [WeakRetained notifyDelegateOfPairingFailureWithError:v21];
  }
  id v5 = +[NAFuture futureWithResult:&stru_1000ABBA8];

  id v3 = (id)v21;
LABEL_21:

  return v5;
}

void sub_10003A6B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = (uint64_t)v3;
    __int16 v23 = 2048;
    id v24 = [v3 length];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "stagePairingFuture result %@ length %lu", buf, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) pairingError];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 40) delegate];
    [v6 coordinator:*(void *)(a1 + 40) updatedConfiguration:*(void *)(a1 + 32)];
  }
  else
  {
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      int64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v10;
      __int16 v27 = 2112;
      uint64_t v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ pairing starting with partnerConfig: %@ coordinator: %@", buf, 0x2Au);
    }
    uint64_t v12 = [*(id *)(a1 + 32) pairStagedCHIPAccessoryToPartnerAppHome];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10003A954;
    v19[3] = &unk_1000A90D8;
    id v20 = *(id *)(a1 + 32);
    uint64_t v13 = [v12 recover:v19];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003AA44;
    v17[3] = &unk_1000AA7A8;
    int8x16_t v16 = *(int8x16_t *)(a1 + 32);
    id v14 = (id)v16.i64[0];
    int8x16_t v18 = vextq_s8(v16, v16, 8uLL);
    id v15 = [v13 addSuccessBlock:v17];

    uint64_t v6 = v20;
  }
}

id sub_10003A954(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "pairStagedCHIPAccessoryToPartnerAppHome hit error %@", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 32) setPairingError:v3];
  id v5 = +[NAFuture futureWithNoResult];

  return v5;
}

void sub_10003AA44(uint64_t a1)
{
  uint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "pairStagedCHIPAccessoryToPartnerAppHome succeeded.", v4, 2u);
  }

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 coordinator:*(void *)(a1 + 32) updatedConfiguration:*(void *)(a1 + 40)];
}

id sub_10003AE18(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  if ([*(id *)(a1 + 32) currentStep] == (id)47)
  {
    uint64_t v5 = [*(id *)(a1 + 40) nextUnconfiguredBridgedAccessory];
    uint64_t v6 = v4;
LABEL_3:

    id v4 = (id)v5;
    goto LABEL_8;
  }
  if ([*(id *)(a1 + 32) currentStep] == (id)52 && objc_msgSend(v3, "BOOLValue"))
  {
    int v7 = [*(id *)(a1 + 40) nextUnconfiguredBridgedAccessory];
    uint64_t v6 = v7;
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      id v8 = [*(id *)(a1 + 40) topAccessoryTuple];
    }
    uint64_t v5 = (uint64_t)v8;

    goto LABEL_3;
  }
LABEL_8:
  int64_t v9 = +[NAFuture futureWithResult:v4];

  return v9;
}

id sub_10003AF08(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setActiveTuple:v3];
  id v4 = *(id *)(a1 + 40);
  if (v4 == v3)
  {
    int64_t v9 = +[NAFuture futureWithNoResult];
    goto LABEL_8;
  }
  uint64_t v5 = [v4 accessory];
  uint64_t v6 = +[NAFuture futureWithNoResult];
  int v7 = [*(id *)(a1 + 32) topAccessoryTuple];
  id v8 = v7;
  if (v7 != *(void **)(a1 + 40))
  {

LABEL_6:
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    void v15[2] = sub_10003B0D8;
    v15[3] = &unk_1000AA848;
    id v16 = v5;
    uint64_t v11 = +[NAFuture futureWithErrorOnlyHandlerAdapterBlock:v15];

    uint64_t v6 = (void *)v11;
    goto LABEL_7;
  }
  unsigned __int8 v10 = [v5 hf_isNetworkRouter];

  if ((v10 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003B2A8;
  v13[3] = &unk_1000A9840;
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v3;
  int64_t v9 = [v6 flatMap:v13];

LABEL_8:

  return v9;
}

void sub_10003B0D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003B188;
  v6[3] = &unk_1000AA820;
  id v7 = v4;
  id v8 = v3;
  id v5 = v3;
  [v7 updatePendingConfigurationIdentifier:0 completionHandler:v6];
}

void sub_10003B188(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 136315394;
    id v8 = "-[HSProxCardCoordinator _generateNextStepWithActiveTuple:]_block_invoke_4";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s clearing pendingConfigurationIdentifier with updatePendingConfigurationIdentifier for accessory %@", (uint8_t *)&v7, 0x16u);
  }

  if (v3)
  {
    uint64_t v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10006784C(a1, (uint64_t)v3, v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_10003B2A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _generateNextStepWithActiveTuple:*(void *)(a1 + 40)];
}

void sub_10003B500(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

id sub_10003B528(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained activeTuple];
  id v4 = [v3 currentStep];

  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    id v8 = [WeakRetained activeTuple];
    __int16 v9 = [WeakRetained activeTuple];
    uint64_t v10 = [v9 accessory];
    uint64_t v11 = [v10 hf_prettyDescription];
    uint64_t v12 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:*(void *)(a1 + 40)];
    uint64_t v13 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:v4];
    *(_DWORD *)buf = 138413314;
    __int16 v31 = v7;
    __int16 v32 = 2048;
    id v33 = v8;
    __int16 v34 = 2112;
    CFStringRef v35 = v11;
    __int16 v36 = 2112;
    id v37 = v12;
    __int16 v38 = 2112;
    CFStringRef v39 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ tuple %p accessory %@ nextViewController %@->%@", buf, 0x34u);
  }
  if (v4 == (id)54)
  {
    id v14 = +[NSError hf_errorWithCode:37];
    id v15 = +[NAFuture futureWithError:v14];
  }
  else
  {
    id v16 = [WeakRetained activeTuple];
    id v14 = [v16 configuration];

    uint64_t v17 = [WeakRetained delegate];
    int8x16_t v18 = [v17 viewControllerForCoordinator:WeakRetained step:v4];

    if (v18)
    {
      id v15 = +[NAFuture futureWithResult:v18];
    }
    else
    {
      id v19 = +[HSSetupContentProvider contentForStep:v4 coordinator:WeakRetained config:v14];
      if (!v19) {
        NSLog(@"No VC found for step %zu", v4);
      }
      objc_opt_class();
      id v20 = v19;
      if (objc_opt_isKindOfClass()) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = 0;
      }
      id v22 = v21;

      if ([WeakRetained requiresIdentifyButton]) {
        [v22 addIdentifyButtonWithCoordinator:WeakRetained];
      }
      objc_opt_class();
      id v23 = v22;
      if (objc_opt_isKindOfClass()) {
        id v24 = v23;
      }
      else {
        id v24 = 0;
      }
      id v25 = v24;

      if (!v25)
      {
        uint64_t v26 = [WeakRetained _bridgedConfigurationOrdinalityString];
        if ([v26 length]) {
          [v23 setBottomTrayTitle:v26];
        }
      }
      __int16 v27 = HFLogForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:v4];
        *(_DWORD *)buf = 138412546;
        __int16 v31 = v28;
        __int16 v32 = 2112;
        id v33 = v20;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Prox Card UI Transition -> %@ | VC: %@", buf, 0x16u);
      }
      id v15 = +[NAFuture futureWithResult:v20];
    }
  }

  return v15;
}

id sub_10003B914(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (!v9 || [v9 canContinue]) {
    [v7 addDismissButtonWithCoordinator:*(void *)(a1 + 32)];
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 40) configureNextViewController:v4];
  }
  id v10 = v4;
  uint64_t v11 = &OBJC_PROTOCOL___HUPreloadableViewController;
  if ([v10 conformsToProtocol:v11]) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    id v14 = [v13 hu_preloadContent];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003BAF4;
    v17[3] = &unk_1000A9628;
    id v18 = v10;
    id v15 = [v14 flatMap:v17];
  }
  else
  {
    id v15 = +[NAFuture futureWithResult:v10];
  }

  return v15;
}

NAFuture *sub_10003BAF4(uint64_t a1)
{
  return +[NAFuture futureWithResult:*(void *)(a1 + 32)];
}

id sub_10003BB08(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = &OBJC_PROTOCOL___HSProxCardConfigurable;
  if ([v3 conformsToProtocol:v4]) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  char v7 = objc_opt_respondsToSelector();
  if (v6 && (v7 & 1) != 0)
  {
    id v8 = [v6 shouldSkip];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003BC90;
    v14[3] = &unk_1000AA228;
    id v9 = *(void **)(a1 + 40);
    void v14[4] = *(void *)(a1 + 32);
    id v15 = v9;
    id v16 = v3;
    id v10 = [v8 flatMap:v14];
  }
  else
  {
    uint64_t v11 = +[HSAccessoryPairingEventLogger sharedLogger];
    uint64_t v12 = [*(id *)(a1 + 32) activeTuple];
    [v11 logStepStart:[v12 currentStep]];

    id v10 = +[NAFuture futureWithResult:v3];
  }

  return v10;
}

id sub_10003BC90(uint64_t a1, void *a2)
{
  unsigned int v3 = [a2 BOOLValue];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    char v7 = [*(id *)(a1 + 32) activeTuple];
    id v8 = [*(id *)(a1 + 32) activeTuple];
    id v9 = [v8 accessory];
    id v10 = [v9 hf_prettyDescription];
    uint64_t v11 = [*(id *)(a1 + 32) activeTuple];
    uint64_t v12 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", [v11 currentStep]);
    int v17 = 138413314;
    id v18 = v6;
    __int16 v19 = 2048;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 1024;
    unsigned int v26 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ tuple %p accessory %@ nextViewController for step %@ has skip logic and shouldSkip = %d", (uint8_t *)&v17, 0x30u);
  }
  if (v3)
  {
    [*(id *)(a1 + 32) nextViewControllerWithTarget:*(void *)(a1 + 40)];
  }
  else
  {
    id v14 = +[HSAccessoryPairingEventLogger sharedLogger];
    id v15 = [*(id *)(a1 + 32) activeTuple];
    [v14 logStepStart:[v15 currentStep]];

    +[NAFuture futureWithResult:*(void *)(a1 + 48)];
  id v13 = };

  return v13;
}

void sub_10003BE9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:HFErrorDomain])
  {
    id v5 = [v3 code];

    if (v5 == (id)37)
    {
      id v6 = HFLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v9 = "-[HSProxCardCoordinator nextViewControllerWithTarget:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Unable to determine next view controller because we have reached HSProxCardSetupUIStepDismiss.  Will dismiss flow", buf, 0xCu);
      }

      [*(id *)(a1 + 32) dismissProxCardFlowAfterExecuting:0];
      goto LABEL_10;
    }
  }
  else
  {
  }
  NSLog(@"%s Unable to determine the next view controller: %@", "-[HSProxCardCoordinator nextViewControllerWithTarget:]_block_invoke", v3);
  char v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000678E8((uint64_t)v3, v7);
  }

LABEL_10:
}

void sub_10003C538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10003C564(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 accessory];
  if (v4 && (uint64_t)[v3 currentStep] <= 45)
  {
    id v5 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", [v3 currentStep]);
  }
  else
  {
    id v5 = 0;
  }
  if ([v4 isBridged])
  {
    uint64_t v6 = [v4 room];
    if (v6)
    {
      char v7 = (void *)v6;
      id v8 = [v4 room];
      id v9 = [*(id *)(a1 + 32) roomForEntireHome];
      unsigned __int8 v10 = [v8 isEqual:v9];

      if ((v10 & 1) == 0)
      {

        id v5 = 0;
      }
    }
  }
  uint64_t v11 = [v4 pendingConfigurationIdentifier];
  uint64_t v12 = v11;
  if (v4 && ((v5 == 0) == (v11 != 0) || v11 && ([v11 isEqualToString:v5] & 1) == 0))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    void v15[2] = sub_10003C76C;
    v15[3] = &unk_1000A98E0;
    id v16 = v4;
    id v17 = v5;
    id v18 = v12;
    id v13 = +[NAFuture futureWithErrorOnlyHandlerAdapterBlock:v15];
  }
  else
  {
    id v13 = +[NAFuture futureWithNoResult];
  }

  return v13;
}

void sub_10003C76C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003C84C;
  v7[3] = &unk_1000AA8E8;
  id v8 = v4;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  id v6 = v3;
  [v8 updatePendingConfigurationIdentifier:v5 completionHandler:v7];
}

void sub_10003C84C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    int v9 = 136315906;
    id v10 = "-[HSProxCardCoordinator dismissProxCardFlowAfterExecuting:]_block_invoke_3";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s setting pendingConfigurationIdentifier with updatePendingConfigurationIdentifier for accessory %@ {from: %@, to: %@}", (uint8_t *)&v9, 0x2Au);
  }

  if (v3)
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100067974(a1, (uint64_t)v3, v8);
    }
  }
  (*(void (**)(void))(a1[7] + 16))();
}

void sub_10003C980(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = [WeakRetained accessoryBrowser];
  [v5 stopSearchingForNewAccessoriesWithError:v4];

  uint64_t v6 = [WeakRetained delegate];
  [v6 coordinatorRequestedDismissal:WeakRetained];
}

BOOL sub_10003CE14(id a1, HSAccessoryTuple *a2)
{
  return ![(HSAccessoryTuple *)a2 isSetupComplete];
}

id sub_10003D21C(id a1, HSAccessoryTuple *a2)
{
  return [(HSAccessoryTuple *)a2 accessory];
}

void sub_10003D48C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003D4B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained pairAccessory];
}

BOOL sub_10003DEE8(id a1, HMAccessory *a2)
{
  uint64_t v2 = a2;
  if ([(HMAccessory *)v2 isBridged])
  {
    id v3 = [(HMAccessory *)v2 services];
    unsigned int v4 = [v3 na_any:&stru_1000AA9F8] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

BOOL sub_10003DF50(id a1, HMService *a2)
{
  uint64_t v2 = [(HMService *)a2 serviceType];
  unsigned __int8 v3 = [v2 isEqualToString:HMServiceTypeValve];

  return v3;
}

void sub_10003E6F8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 168));
  _Unwind_Resume(a1);
}

void sub_10003E744(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = +[HFHomeKitDispatcher sharedDispatcher];
  unsigned int v4 = [v6 homeManager];
  uint64_t v5 = [v4 accessorySetupCoordinator];
  [v5 createSetupAccessoryPayloadWithCHIPDecimalStringRepresentation:*(void *)(a1 + 32) completionHandler:v3];
}

id sub_10003E7D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [WeakRetained showCustomCommissioningFlowAlertIfNecessaryForPayload:v7 onViewController:*(void *)(a1 + 40)];
  }
  else
  {
    int v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [WeakRetained setupAccessoryDescription];
      __int16 v13 = [WeakRetained discoveredAccessory];
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 136316162;
      uint64_t v16 = "-[HSProxCardCoordinator _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:]_block_invoke_2";
      __int16 v17 = 2112;
      id v18 = v12;
      __int16 v19 = 2112;
      id v20 = v13;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Matter - Got no payload - [ setupAccessoryDescription:%@, discoveredAccessory:%@, setupCode:%@, result:%@]", (uint8_t *)&v15, 0x34u);
    }
    id v10 = +[NSError hf_errorWithCode:33];
    id v8 = +[NAFuture futureWithError:v10];
  }

  return v8;
}

id sub_10003E9B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = HFLogForCategory();
  int v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = [WeakRetained setupAccessoryDescription];
      __int16 v11 = [WeakRetained discoveredAccessory];
      uint64_t v12 = *(void **)(a1 + 32);
      int v21 = 136316162;
      uint64_t v22 = "-[HSProxCardCoordinator _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:]_block_invoke";
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v7;
      __int16 v27 = 2112;
      uint64_t v28 = v11;
      __int16 v29 = 2112;
      id v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Updating setupAccessoryDescription with payload - [ setupAccessoryDescription:%@, payload:%@, discoveredAccessory:%@, setupCode:%@ ]", (uint8_t *)&v21, 0x34u);
    }
    __int16 v13 = [WeakRetained setupAccessoryDescription];
    [v13 updateWithSetupAccessoryPayload:v7];

    uint64_t v14 = [WeakRetained pairingFuture];
    [v14 updateSetupPayload:v7];

    int v15 = +[NAFuture futureWithNoResult];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v18 = [WeakRetained setupAccessoryDescription];
      __int16 v19 = [WeakRetained discoveredAccessory];
      id v20 = *(void **)(a1 + 32);
      int v21 = 136316162;
      uint64_t v22 = "-[HSProxCardCoordinator _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:]_block_invoke";
      __int16 v23 = 2112;
      id v24 = v18;
      __int16 v25 = 2112;
      id v26 = v19;
      __int16 v27 = 2112;
      uint64_t v28 = v20;
      __int16 v29 = 2112;
      id v30 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Got no payload - [ setupAccessoryDescription:%@, discoveredAccessory:%@, setupCode:%@, result:%@]", (uint8_t *)&v21, 0x34u);
    }
    uint64_t v16 = +[NSError hf_errorWithCode:33];
    int v15 = +[NAFuture futureWithError:v16];
  }

  return v15;
}

NAFuture *sub_10003EC60(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) topAccessoryTuple];
  uint64_t v2 = [v1 configuration];
  [v2 setIsReadyToPair:1];

  return +[NAFuture futureWithNoResult];
}

void sub_10003F414(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = +[HFHomeKitDispatcher sharedDispatcher];
  unsigned int v4 = [v6 homeManager];
  id v5 = [v4 accessorySetupCoordinator];
  [v5 createCHIPSetupPayloadStringForStagedPairingWithIdentifier:*(void *)(a1 + 32) completionHandler:v3];
}

id sub_10003F4A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    id v20 = v5;
    __int16 v21 = 2112;
    id v22 = v3;
    __int16 v23 = 2112;
    uint64_t v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ retrieved setupPayloadString %@ from locker accessory %@", buf, 0x20u);
  }
  id v7 = [*(id *)(a1 + 40) discoveredAccessory];
  [v7 setRawSetupPayloadString:v3];

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003F708;
  v17[3] = &unk_1000AAA20;
  id v8 = v3;
  id v18 = v8;
  int v9 = +[NAFuture futureWithCompletionHandlerAdapterBlock:v17];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003F79C;
  v14[3] = &unk_1000AAA98;
  objc_copyWeak(v16, (id *)buf);
  id v10 = v8;
  __int16 v11 = *(void **)(a1 + 48);
  id v15 = v10;
  v16[1] = v11;
  uint64_t v12 = [v9 flatMap:v14];

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)buf);

  return v12;
}

void sub_10003F6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003F708(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = +[HFHomeKitDispatcher sharedDispatcher];
  unsigned int v4 = [v6 homeManager];
  id v5 = [v4 accessorySetupCoordinator];
  [v5 createSetupAccessoryPayloadWithSetupPayloadURLString:*(void *)(a1 + 32) completionHandler:v3];
}

id sub_10003F79C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = HFLogForCategory();
  int v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      id v10 = (char *)objc_claimAutoreleasedReturnValue();
      __int16 v11 = *(void **)(a1 + 32);
      int v20 = 138412802;
      __int16 v21 = v10;
      __int16 v22 = 2112;
      __int16 v23 = v11;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ createSetupAccessoryPayloadWithSetupPayloadURLString:completionHandler:, setupPayloadString %@, payload %@.", (uint8_t *)&v20, 0x20u);
    }
    uint64_t v12 = [WeakRetained setupAccessoryDescription];
    [v12 updateWithSetupAccessoryPayload:v7];

    __int16 v13 = [WeakRetained pairingFuture];
    [v13 updateSetupPayload:v7];

    uint64_t v14 = +[NAFuture futureWithNoResult];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = [WeakRetained setupAccessoryDescription];
      id v18 = [WeakRetained discoveredAccessory];
      uint64_t v19 = *(void *)(a1 + 32);
      int v20 = 136316162;
      __int16 v21 = "-[HSProxCardCoordinator didReceiveDiscoveredAccessory:]_block_invoke_2";
      __int16 v22 = 2112;
      __int16 v23 = v17;
      __int16 v24 = 2112;
      id v25 = v18;
      __int16 v26 = 2112;
      uint64_t v27 = v19;
      __int16 v28 = 2112;
      id v29 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Matter - Got no payload - [ setupAccessoryDescription:%@, discoveredAccessory:%@, setupPayloadString:%@, result:%@]", (uint8_t *)&v20, 0x34u);
    }
    id v15 = +[NSError hf_errorWithCode:33];
    uint64_t v14 = +[NAFuture futureWithError:v15];
  }

  return v14;
}

id sub_10003FA1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100067B80(a1, (uint64_t)v3, v4);
  }

  id v5 = +[NAFuture futureWithError:v3];

  return v5;
}

id sub_10003FD54(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isUsingHAPCommunicationProtocol])
  {
LABEL_8:
    unsigned int v4 = +[NAFuture futureWithNoResult];
    goto LABEL_9;
  }
  if (([*(id *)(a1 + 32) isUsingCHIPCommunicationProtocol] & 1) == 0)
  {
    __int16 v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"HSProxCardCoordinator.m" lineNumber:1239 description:@"Precondition not satisfied: self.isUsingCHIPCommunicationProtocol"];
  }
  uint64_t v2 = [*(id *)(a1 + 32) discoveredAccessory];

  if (v2)
  {
    id v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "We continue pairing within _discoveredAccessoryOrSetupCodeDidUpdateFromViewController", buf, 2u);
    }

    goto LABEL_8;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  id v21[2] = sub_100040044;
  v21[3] = &unk_1000A98B8;
  id v6 = *(void **)(a1 + 40);
  void v21[4] = *(void *)(a1 + 32);
  id v22 = v6;
  id v7 = +[NAFuture futureWithCompletionHandlerAdapterBlock:v21];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000400F4;
  v18[3] = &unk_1000AAB08;
  id v8 = *(void **)(a1 + 40);
  void v18[4] = *(void *)(a1 + 32);
  id v19 = v8;
  id v20 = *(id *)(a1 + 48);
  int v9 = [v7 flatMap:v18];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  id v16[2] = sub_100040200;
  v16[3] = &unk_1000AAB30;
  id v10 = *(void **)(a1 + 40);
  void v16[4] = *(void *)(a1 + 32);
  id v17 = v10;
  __int16 v11 = [v9 flatMap:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100040360;
  v14[3] = &unk_1000AA5C0;
  uint64_t v12 = *(void **)(a1 + 40);
  void v14[4] = *(void *)(a1 + 32);
  id v15 = v12;
  unsigned int v4 = [v11 recover:v14];

LABEL_9:

  return v4;
}

void sub_100040044(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 discoveredAccessory];
  [v5 setRawSetupPayloadString:*(void *)(a1 + 40)];

  id v8 = +[HFHomeKitDispatcher sharedDispatcher];
  id v6 = [v8 homeManager];
  id v7 = [v6 accessorySetupCoordinator];
  [v7 createSetupAccessoryPayloadWithCHIPDecimalStringRepresentation:*(void *)(a1 + 40) completionHandler:v4];
}

id sub_1000400F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) showCustomCommissioningFlowAlertIfNecessaryForPayload:v6 onViewController:*(void *)(a1 + 48)];
  }
  else
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100067C34(a1);
    }

    int v9 = +[NSError hf_errorWithCode:33];
    id v7 = +[NAFuture futureWithError:v9];
  }

  return v7;
}

id sub_100040200(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) setupAccessoryDescription];
  [v4 updateWithSetupAccessoryPayload:v3];

  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 32) setupAccessoryDescription];
    id v7 = [*(id *)(a1 + 32) discoveredAccessory];
    uint64_t v8 = *(void *)(a1 + 40);
    int v11 = 136316162;
    uint64_t v12 = "-[HSProxCardCoordinator didReceiveSetupCode:fromViewController:]_block_invoke";
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Updating setupAccessoryDescription with payload - [ setupAccessoryDescription:%@, payload:%@, discoveredAccessory:%@, setupCode:%@ ]", (uint8_t *)&v11, 0x34u);
  }
  int v9 = +[NAFuture futureWithNoResult];

  return v9;
}

id sub_100040360(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 domain];
  id v5 = v4;
  if (v4 != (void *)HFErrorDomain)
  {

LABEL_7:
    int v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100067CF8(a1);
    }

    uint64_t v12 = HULocalizedString();
    __int16 v13 = HULocalizedString();
    uint64_t v14 = +[NSError hf_errorWithCode:62 title:v12 description:v13];

    [*(id *)(a1 + 32) setSetupCode:0];
    id v3 = (id)v14;
    goto LABEL_10;
  }
  id v6 = [v3 code];

  if (v6 != (id)96) {
    goto LABEL_7;
  }
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [*(id *)(a1 + 32) setupAccessoryDescription];
    int v9 = [*(id *)(a1 + 32) discoveredAccessory];
    uint64_t v10 = *(void *)(a1 + 40);
    int v17 = 136315906;
    id v18 = "-[HSProxCardCoordinator didReceiveSetupCode:fromViewController:]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    uint64_t v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Custom commission flow was canceled - [ setupAccessoryDescription:%@, discoveredAccessory:%@, setupCode:%@]", (uint8_t *)&v17, 0x2Au);
  }
LABEL_10:
  __int16 v15 = +[NAFuture futureWithError:v3];

  return v15;
}

void sub_100040768(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HULocalizedString();
  id v5 = HULocalizedString();
  id v6 = +[UIAlertController alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v7 = HULocalizedString();
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  id v16[2] = sub_100040984;
  v16[3] = &unk_1000A94A8;
  id v8 = v3;
  id v17 = v8;
  int v9 = +[UIAlertAction actionWithTitle:v7 style:1 handler:v16];

  [v6 addAction:v9];
  uint64_t v10 = HULocalizedString();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100040A20;
  v13[3] = &unk_1000A9480;
  id v14 = v8;
  id v15 = *(id *)(a1 + 32);
  id v11 = v8;
  uint64_t v12 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v13];

  [v6 addAction:v12];
  [v6 setPreferredAction:v12];
  [*(id *)(a1 + 40) presentViewController:v6 animated:1 completion:0];
}

void sub_100040984(uint64_t a1)
{
  uint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Custom commission flow was canceled", v5, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  id v4 = +[NSError hf_errorWithCode:96];
  [v3 finishWithError:v4];
}

id sub_100040A20(uint64_t a1)
{
  uint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Custom commission flow will continue", v4, 2u);
  }

  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

void sub_100040F18(id a1)
{
  qword_1000CB580 = objc_alloc_init(HSAccessoryPairingEventLogger);

  _objc_release_x1();
}

NSArray *__cdecl sub_10004201C(id a1, NSDictionary *a2)
{
  return [(NSDictionary *)a2 allKeys];
}

NSArray *__cdecl sub_100042024(id a1, NSDictionary *a2)
{
  return [(NSDictionary *)a2 allValues];
}

void sub_10004230C(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a2 < a3)
  {
    uint64_t v20 = v11;
    uint64_t v21 = v10;
    uint64_t v22 = v9;
    uint64_t v23 = v8;
    uint64_t v24 = v7;
    uint64_t v25 = v6;
    uint64_t v26 = v5;
    uint64_t v27 = v4;
    uint64_t v28 = v12;
    uint64_t v29 = v13;
    unint64_t v16 = a2;
    do
    {
      id v18 = *(void **)(a1 + 32);
      __int16 v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v16, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
      [v18 addObject:v19];

      v16 += a4;
    }
    while (v16 < a3);
  }
}

void sub_100042D44(id a1)
{
  uint64_t v1 = HFLogForCategory();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_100067E40(v1);
  }
}

id sub_100042D8C(uint64_t a1)
{
  uint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Ending background task (assuming host app is connected by now)", v5, 2u);
  }

  id v3 = +[UIApplication sharedApplication];
  [v3 endBackgroundTask:[*(id *)(a1 + 32) backgroundTaskIdentifier]];

  return [*(id *)(a1 + 32) setBackgroundTaskIdentifier:UIBackgroundTaskInvalid];
}

id sub_100043340(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateNetworkProtection:1 andFinishWithActionResult:0];
}

id sub_100043350(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateNetworkProtection:0 andFinishWithActionResult:2];
}

void sub_100043590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000435B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained hideActivityIndicator];
  id v3 = [WeakRetained delegate];
  v6[0] = HUConfigurationResultActionKey;
  uint64_t v4 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v7[0] = v4;
  v6[1] = HUConfigurationResultCurrentViewControllerClassKey;
  v7[1] = objc_opt_class();
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [v3 viewController:WeakRetained didFinishWithConfigurationResults:v5];
}

uint64_t sub_100043B04(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 topAccessoryTuple];
  uint64_t v5 = [v4 accessory];
  uint64_t v6 = [v5 uniqueIdentifier];
  uint64_t v7 = [v3 accessory];

  uint64_t v8 = [v7 uniqueIdentifier];
  uint64_t v9 = [v6 isEqual:v8] ^ 1;

  return v9;
}

HMAccessory *__cdecl sub_100043CB4(id a1, HSAccessoryTuple *a2)
{
  return [(HSAccessoryTuple *)a2 accessory];
}

void sub_100043CBC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 updateAccessoriesPendingConfiguration:v3];
  [v4 finishWithResult:&off_1000B03D0];
}

void sub_100044B34(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 copy];
  [v2 addObjectsFromArray:v3];
}

void sub_100044E44(uint64_t a1, void *a2, unint64_t a3)
{
  id v17 = a2;
  if (*(void *)(a1 + 40) == a3 && [*(id *)(a1 + 32) isFirstResponder])
  {
    id v5 = [*(id *)(a1 + 32) tintColor];
    id v6 = [v5 CGColor];
    uint64_t v7 = [v17 layer];
    [v7 setBorderColor:v6];

    uint64_t v8 = [v17 layer];
    uint64_t v9 = v8;
    double v10 = 2.0;
  }
  else
  {
    id v11 = +[UIColor systemLightMidGrayColor];
    id v12 = [v11 CGColor];
    uint64_t v13 = [v17 layer];
    [v13 setBorderColor:v12];

    double v14 = 1.0;
    if (*(void *)(*(void *)(a1 + 32) + 32) <= 6uLL) {
      double v14 = *(double *)(a1 + 48) + 1.0;
    }
    uint64_t v8 = [v17 layer];
    uint64_t v9 = v8;
    double v10 = v14;
  }
  [v8 setBorderWidth:v10];

  if (*(void *)(a1 + 40) <= a3)
  {
    id v15 = [v17 label];
    [v15 setText:&stru_1000ABBA8];
  }
  else
  {
    id v15 = [*(id *)(*(void *)(a1 + 32) + 8) substringWithRange:a3, 1];
    unint64_t v16 = [v17 label];
    [v16 setText:v15];
  }
}

id sub_100046864(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAlertForBluetooth:*(unsigned __int8 *)(a1 + 40) Wifi:*(unsigned __int8 *)(a1 + 41)];
}

void sub_100046A20(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100067E84();
    }
  }
  else
  {
    if (a2 == 5) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    [*(id *)(a1 + 32) setBluetoothInterfaceStatus:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100046B14(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100067F04();
  }
}

void sub_1000470C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000470F0(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    NSLog(@"Missing Bluetooth and WiFi alert title for bluetooth interface state: %d WiFi interface state: %d", [*(id *)(a1 + 40) bluetoothInterfaceStatus], [*(id *)(a1 + 40) _wiFiInterfaceStatus]);
  }
  if (!*(void *)(a1 + 48)) {
    NSLog(@"Missing Bluetooth and WiFi alert description for bluetooth interface state: %d WiFi interface state: %d", [*(id *)(a1 + 40) bluetoothInterfaceStatus], [*(id *)(a1 + 40) _wiFiInterfaceStatus]);
  }
}

void sub_100047174(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNetworkInterfacePowerState:1];
}

void sub_100047468(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

id sub_100048400(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entitlementContext];
  unsigned int v3 = [v2 isEntitledForHomeKitSPI];

  if (v3)
  {
    uint64_t v4 = objc_opt_new();
  }
  else
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v16 = HMAccessoryCategoryTypeAppleTV;
    id v5 = +[NSArray arrayWithObjects:&v16 count:1];
    [v4 addObjectsFromArray:v5];

    id v6 = [*(id *)(a1 + 32) entitlementContext];
    unsigned __int8 v7 = [v6 isEntitledForAll3rdPartyAccessoryTypes];

    if ((v7 & 1) == 0)
    {
      uint64_t v15 = HMAccessoryCategoryTypeAirPort;
      uint64_t v8 = +[NSArray arrayWithObjects:&v15 count:1];
      [v4 addObjectsFromArray:v8];

      v14[0] = HMAccessoryCategoryTypeTelevision;
      v14[1] = HMAccessoryCategoryTypeTelevisionSetTopBox;
      v14[2] = HMAccessoryCategoryTypeTelevisionStreamingStick;
      uint64_t v9 = +[NSArray arrayWithObjects:v14 count:3];
      [v4 addObjectsFromArray:v9];

      double v10 = [*(id *)(a1 + 32) entitlementContext];
      LOBYTE(v9) = [v10 isEntitledForThirdPartySetupAccessoryPayload];

      if ((v9 & 1) == 0)
      {
        v13[0] = HMAccessoryCategoryTypeSpeaker;
        v13[1] = HMAccessoryCategoryTypeAudioReceiver;
        id v11 = +[NSArray arrayWithObjects:v13 count:2];
        [v4 addObjectsFromArray:v11];

        [v4 addObject:HMAccessoryCategoryTypeWiFiRouter];
      }
    }
  }

  return v4;
}

void sub_100048984(uint64_t a1)
{
  id v4 = +[UIColor clearColor];
  uint64_t v2 = [*(id *)(a1 + 32) navigationItem];
  unsigned int v3 = [v2 leftBarButtonItem];
  [v3 setTintColor:v4];
}

void sub_100048A00(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationItem];
  uint64_t v1 = [v2 leftBarButtonItem];
  [v1 setEnabled:0];
}

void sub_100048A60(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationItem];
  uint64_t v1 = [v2 leftBarButtonItem];
  [v1 setTintColor:0];
}

id sub_100049CCC()
{
  if (qword_1000CB590 != -1) {
    dispatch_once(&qword_1000CB590, &stru_1000AAE70);
  }
  v0 = (void *)qword_1000CB598;

  return v0;
}

void sub_100049D20(id a1)
{
  uint64_t v1 = (void *)qword_1000CB598;
  qword_1000CB598 = (uint64_t)&off_1000B0D00;
}

BOOL sub_10004A1C8(id a1, HMService *a2)
{
  id v2 = a2;
  unsigned int v3 = [(HMService *)v2 serviceType];
  unsigned __int8 v4 = [v3 isEqualToString:HMServiceTypeValve];

  if ((v4 & 1) == 0)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(HMService *)v2 localizedDescription];
      int v8 = 136315650;
      uint64_t v9 = "+[HSPCNameZonesViewController applicableServicesForAccessory:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s skipping %@ %@", (uint8_t *)&v8, 0x20u);
    }
  }

  return v4;
}

void sub_10004A680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10004A6A4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned __int8 v7 = [a1[4] sessionQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_10004A7AC;
  v10[3] = &unk_1000AAEB8;
  objc_copyWeak(&v14, a1 + 6);
  id v11 = v6;
  id v12 = a1[5];
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v14);
}

void sub_10004A7AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = *(void *)(a1 + 32);
  unsigned __int8 v4 = HFLogForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100068250(a1 + 32, v5, v6, v7, v8, v9, v10, v11);
    }

    [WeakRetained setOverallSession:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004A9D8;
    block[3] = &unk_1000A8F20;
    id v28 = *(id *)(a1 + 40);
    id v29 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    id v12 = v28;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NFC: Started session", buf, 2u);
    }

    [WeakRetained setNearFieldReaderSession:*(void *)(a1 + 48)];
    id v13 = [WeakRetained nearFieldReaderSession];
    [v13 setDelegate:WeakRetained];

    id v14 = *(void **)(a1 + 48);
    id v25 = 0;
    unsigned __int8 v15 = [v14 startPollingWithError:&v25];
    id v12 = v25;
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = HFLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000681E4((uint64_t)v12, v16, v17, v18, v19, v20, v21, v22);
      }
    }
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10004A9E4;
    v23[3] = &unk_1000A90B0;
    id v24 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v23);
  }
}

id sub_10004A9D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithError:*(void *)(a1 + 40)];
}

id sub_10004A9E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

void sub_10004AC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004AC88(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10004AC98(uint64_t a1)
{
}

intptr_t sub_10004ACA0(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10004ACB4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) overallSession];
  [v2 endSession];

  uint64_t v3 = [*(id *)(a1 + 32) nearFieldReaderSession];
  [v3 endSession];

  [*(id *)(a1 + 32) setOverallSession:0];
  [*(id *)(a1 + 32) setNearFieldReaderSession:0];
  unsigned __int8 v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NFC: Ended session", v7, 2u);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

id sub_10004C25C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateAssociatedServiceType:*(void *)(a1 + 40) completionHandler:a2];
}

id sub_10004C26C(void *a1)
{
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Succesfully set associated type %@ on %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = (void *)a1[6];

  return v5;
}

id sub_10004C338(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100068364(v3, v4);
  }

  id v5 = *(id *)(a1 + 32);
  return v5;
}

id sub_10004CA6C(uint64_t a1)
{
  uint64_t v1 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  id v2 = +[NAFuture futureWithResult:v1];

  return v2;
}

id sub_10004CAD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000683FC(a1, (uint64_t)v3, v4);
  }

  id v5 = +[HFErrorHandler sharedHandler];
  [v5 handleError:v3];

  uint64_t v6 = +[NAFuture futureWithResult:&off_1000B0580];

  return v6;
}

NAFuture *__cdecl sub_10004CD98(id a1, NSNull *a2)
{
  return +[NAFuture futureWithResult:&off_1000B0598];
}

id sub_10004D2FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_alloc((Class)HURestrictedGuestAccessSettingsModule);
  uint64_t v8 = [*(id *)(a1 + 32) addedAccessory];
  id v9 = [v7 initWithItemUpdater:v5 home:v6 accessoryToAdd:v8];

  id v12 = v9;
  uint64_t v10 = +[NSArray arrayWithObjects:&v12 count:1];

  return v10;
}

HUItemModuleController *__cdecl sub_10004D3EC(id a1, HFItemModule *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = v2;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    if (!v6)
    {
      id v7 = +[NSAssertionHandler currentHandler];
      uint64_t v8 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
      [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
    }
  }
  else
  {
    id v6 = 0;
  }

  id v9 = [objc_alloc((Class)HURestrictedGuestAccessSettingsModuleController) initWithModule:v6];

  return (HUItemModuleController *)v9;
}

id *sub_10004D774(id *result, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v2 = result;
    uint64_t v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100068488(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    return (id *)[v2[4] dismissViewControllerAnimated:0 completion:0];
  }
  return result;
}

void sub_10004D8FC(void *a1, uint64_t a2)
{
  uint64_t v4 = +[NSDate now];
  [v4 timeIntervalSinceDate:a1[4]];
  uint64_t v6 = v5;

  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[HSProximityCardHostViewController _refreshHomeGraphWithCompletion:]_block_invoke";
    __int16 v28 = 2048;
    uint64_t v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s refresh took %f", buf, 0x16u);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10004DB38;
  v24[3] = &unk_1000AAFB8;
  uint64_t v8 = (void *)a1[6];
  v24[4] = a1[5];
  id v25 = v8;
  uint64_t v9 = objc_retainBlock(v24);
  if (a2)
  {
    uint64_t v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100068500(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    dispatch_time_t v18 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004DC74;
    block[3] = &unk_1000AAFE0;
    uint64_t v23 = v9;
    dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, block);
    uint64_t v19 = v23;
  }
  else
  {
    uint64_t v19 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v20 = [v19 allHomesFuture];
    id v21 = [v20 addCompletionBlock:v9];
  }
}

void sub_10004DB38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = HFLogForCategory();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = "-[HSProximityCardHostViewController _refreshHomeGraphWithCompletion:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 121;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s : %d fetched all homes after home graph refresh. Homes: %@", (uint8_t *)&v9, 0x1Cu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100068578((uint64_t)v6, v8);
    }

    [*(id *)(a1 + 32) dismissViewControllerAnimated:0 completion:0];
  }
}

void sub_10004DC74(uint64_t a1)
{
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  id v2 = [v4 allHomesFuture];
  id v3 = [v2 addCompletionBlock:*(void *)(a1 + 32)];
}

void sub_10004E040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004E064(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10004E58C;
  v31[3] = &unk_1000AB030;
  v31[4] = WeakRetained;
  id v6 = [v3 na_firstObjectPassingTest:v31];
  uint64_t v26 = [v6 accessories];
  if ([WeakRetained launchReason] != (id)1)
  {
    if ([WeakRetained launchReason] == (id)2)
    {
      uint64_t v11 = [v6 hf_safetyAndSecuritySupportedAccessories];
    }
    else if ([WeakRetained launchReason] == (id)3)
    {
      uint64_t v11 = [v6 hf_siriEndpointCapableAccessoriesToOnboard];
    }
    else
    {
      if ([WeakRetained launchReason] != (id)6)
      {
        if ([WeakRetained launchReason] == (id)4 || objc_msgSend(WeakRetained, "launchReason") == (id)5)
        {
          uint64_t v22 = objc_opt_new();
          uint64_t v23 = [v6 hf_accessoriesSupportingAccessCodes];
          [v22 na_safeAddObjectsFromArray:v23];

          id v24 = [v6 hf_walletKeyAccessories];
          [v22 na_safeAddObjectsFromArray:v24];

          uint64_t v7 = +[HFUtilities sortedLockAccessoryArrayForSetup:v22];
        }
        else
        {
          uint64_t v7 = 0;
        }
        goto LABEL_13;
      }
      uint64_t v11 = [v6 hf_accessoriesSupportingAccessCodes];
    }
    uint64_t v7 = (void *)v11;
    goto LABEL_13;
  }
  uint64_t v7 = [v26 na_filter:&stru_1000AB050];
  if (![v7 count])
  {
    [*(id *)(a1 + 32) objectForKeyedSubscript:HUHomeUIServiceLaunchAccessoryUUIDsArray];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10004E730;
    v29[3] = &unk_1000A9818;
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    id v25 = v30;
    uint64_t v8 = [v26 na_filter:v29];
    int v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v8 hf_prettyDescription];
      *(_DWORD *)buf = 136315394;
      id v33 = "-[HSProximityCardHostViewController configureWithContext:completion:]_block_invoke_2";
      __int16 v34 = 2112;
      CFStringRef v35 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s We received the accessoriesFromPayload but their pendingConfigurationIdentifier are nil. This is most likely due to HomeKit accessoryDidUpdatePendingConfigurationIdentifier: callback delay to Home app. We know it because HomeUIService has the latest home graph. The Home app banner should dismiss in a few seconds. No accessories to resume setup with. %@", buf, 0x16u);
    }
  }
LABEL_13:
  int v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = [v7 count];
    *(_DWORD *)buf = 136316162;
    id v33 = "-[HSProximityCardHostViewController configureWithContext:completion:]_block_invoke";
    __int16 v34 = 2112;
    CFStringRef v35 = v6;
    __int16 v36 = 2112;
    uint64_t v37 = v13;
    __int16 v38 = 2112;
    CFStringRef v39 = v7;
    __int16 v40 = 2048;
    id v41 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(%s) home %@ userInfo %@ accessoriesToResumeSetup %@ count %ld", buf, 0x34u);
  }

  [WeakRetained setAccessoriesToResumeSetup:v7];
  if ([v7 count])
  {
    uint64_t v15 = [HSProxCardCoordinator alloc];
    uint64_t v16 = [WeakRetained accessoriesToResumeSetup];
    uint64_t v17 = [(HSProxCardCoordinator *)v15 initWithHome:v6 accessories:v16 delegate:WeakRetained];
    [WeakRetained setCoordinator:v17];

    dispatch_time_t v18 = [WeakRetained coordinator];
    uint64_t v19 = [v18 nextViewController];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10004E790;
    v27[3] = &unk_1000AB078;
    objc_copyWeak(&v28, v4);
    id v20 = [v19 addSuccessBlock:v27];

    objc_destroyWeak(&v28);
  }
  else
  {
    id v21 = HFLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100068694(a1, v21);
    }

    [WeakRetained dismissViewControllerAnimated:1 completion:0];
  }
}

void sub_10004E570(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_10004E58C(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = [*(id *)(a1 + 32) resumeSetupHomeUUIDString];
  id v6 = [v4 isEqualToString:v5];

  return v6;
}

BOOL sub_10004E600(id a1, HMAccessory *a2)
{
  id v2 = a2;
  id v3 = [(HMAccessory *)v2 name];
  id v4 = [(HMAccessory *)v2 pendingConfigurationIdentifier];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(HMAccessory *)v2 hf_prettyDescription];
    int v9 = 136315906;
    uint64_t v10 = "-[HSProximityCardHostViewController configureWithContext:completion:]_block_invoke_3";
    __int16 v11 = 2112;
    int v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s name %@ pendingConfigurationIdentifier %@ accessory %@", (uint8_t *)&v9, 0x2Au);
  }
  BOOL v7 = [v4 length] != 0;

  return v7;
}

id sub_10004E730(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v5 = [v2 containsObject:v4];

  return v5;
}

void sub_10004E790(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _presentProxCardFlowWithInitialViewController:v3];
}

void sub_10004EE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004EEAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004EF68;
  v5[3] = &unk_1000AB0C8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10004EF68(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained proxNavigationController];
  [v2 pushViewController:*(void *)(a1 + 32) animated:1];
}

void sub_10004F348(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained proxNavigationController];
  id v3 = [*(id *)(a1 + 32) currentViewController];
  [v2 pushViewController:v3 animated:1];
}

void sub_10004F588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004F5B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004F670;
  v5[3] = &unk_1000AB0C8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10004F670(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained proxNavigationController];
  [v2 pushViewController:*(void *)(a1 + 32) animated:1];
}

id sub_10004F72C(id a1, HMHome *a2)
{
  id v2 = a2;
  id v3 = [(HMHome *)v2 name];
  id v4 = [(HMHome *)v2 uuid];

  id v5 = +[NSString stringWithFormat:@"[name %@ uuid %@]", v3, v4];

  return v5;
}

void sub_10004FB00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004FB24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_10004FCC0;
  v10[3] = &unk_1000AB030;
  id v11 = *(id *)(a1 + 32);
  uint64_t v5 = [v3 na_firstObjectPassingTest:v10];
  id v6 = (void *)v5;
  if (!*(void *)(a1 + 32) || v5)
  {
    [WeakRetained _initiateSetupFlow:v5];
  }
  else
  {
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = [WeakRetained _allHomesDescription:v3];
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      __int16 v15 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "We cannot find our home for the given homeUUID. homeUUID %@ not found in homes %@.", buf, 0x16u);
    }
    [WeakRetained dismissViewControllerAnimated:0 completion:0];
  }
}

id sub_10004FCC0(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_100050004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100050030(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained coordinator];
  id v6 = [v5 activeTuple];
  id v7 = [v6 currentStep];

  uint64_t v8 = [*(id *)(a1 + 32) setupAccessoryPayload];

  if (v8)
  {
    if (v7 == (id)5) {
      goto LABEL_16;
    }
    id v9 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:5];
    uint64_t v10 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:v7];
    NSLog(@"currentStep should be %@, but it is %@", v9, v10);

    goto LABEL_15;
  }
  if (![WeakRetained isLaunchedToSetupASpecificAccessory])
  {
    if (v7 != (id)1)
    {
      __int16 v14 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:1];
      __int16 v15 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:v7];
      NSLog(@"currentStep should be %@, but it is %@", v14, v15);
    }
    objc_opt_class();
    id v16 = v3;
    if (objc_opt_isKindOfClass()) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    id v9 = v17;

    [v9 setMode:1];
LABEL_15:

    goto LABEL_16;
  }
  if (v7 != (id)4)
  {
    id v11 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:4];
    int v12 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:v7];
    NSLog(@"currentStep should be %@, but it is %@", v11, v12);
  }
  uint64_t v13 = [*(id *)(a1 + 32) accessoryUUID];

  if (!v13) {
    NSLog(@"Asked to pair with an accessory, but we don't have a UUID in the setup description: %@", *(void *)(a1 + 32));
  }
LABEL_16:
  dispatch_time_t v18 = HFLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = (objc_class *)objc_opt_class();
    id v20 = NSStringFromClass(v19);
    id v21 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:v7];
    *(_DWORD *)buf = 138412802;
    uint64_t v23 = v20;
    __int16 v24 = 2112;
    id v25 = v21;
    __int16 v26 = 2048;
    id v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Launching %@ with initial view controller %@, %ld", buf, 0x20u);
  }
  [WeakRetained _presentProxCardFlowWithInitialViewController:v3];
}

void sub_100050678(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained proxNavigationController];
  [v2 pushViewController:*(void *)(a1 + 32) animated:1];
}

void sub_100050EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100050EEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _cleanup];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

void sub_100051330(uint64_t a1)
{
  [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [(id)objc_claimAutoreleasedReturnValue() invalidate];
  uint64_t v2 = [*(id *)(a1 + 32) sharingFrameworkClient];
  [v2 invalidate];

  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[HSProximityCardHostViewController _cleanup]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: SBUIRemoteAlertHostInterface & SFClient invalidated, will exit(0) the process", (uint8_t *)&v4, 0xCu);
  }

  exit(0);
}

void sub_1000513E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000689EC((uint64_t)v3, a1, v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10005319C(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) identifyButton];
  [v4 setHighlighted:0];

  uint64_t v5 = [*(id *)(a1 + 32) identifyButton];
  [v5 setHidden:0];

  id v6 = [*(id *)(a1 + 32) spinner];
  [v6 stopAnimating];

  id v7 = HFLogForCategory();
  uint64_t v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100068AC0(a1, (uint64_t)v3, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 138412290;
    uint64_t v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Succesfully identified %@", (uint8_t *)&v10, 0xCu);
  }
}

id sub_100053348()
{
  if (qword_1000CB5A0 != -1) {
    dispatch_once(&qword_1000CB5A0, &stru_1000AB158);
  }
  v0 = (void *)qword_1000CB5A8;

  return v0;
}

void sub_10005339C(id a1)
{
  v3[0] = &off_1000B05C8;
  v3[1] = &off_1000B05E0;
  v4[0] = @"CannotDecodeFromString";
  v4[1] = @"NotReady";
  v3[2] = &off_1000B05F8;
  v3[3] = &off_1000B0610;
  v4[2] = @"CameraScan";
  v4[3] = @"DiscoveredAccessories";
  v3[4] = &off_1000B0628;
  v3[5] = &off_1000B0640;
  v4[4] = @"TroubleshootingTips";
  v4[5] = @"EnterSetupCode";
  v3[6] = &off_1000B0658;
  v3[7] = &off_1000B0670;
  v4[6] = @"Detected";
  v4[7] = @"SelectHome";
  v3[8] = &off_1000B0688;
  v3[9] = &off_1000B06A0;
  v4[8] = @"CreateHome";
  v4[9] = @"HomeHubUpgradeRequired";
  v3[10] = &off_1000B06B8;
  v3[11] = &off_1000B06D0;
  v4[10] = @"HomeHubRequired";
  v4[11] = @"Pairing";
  v3[12] = &off_1000B06E8;
  v3[13] = &off_1000B0700;
  v4[12] = @"ThreadRouterWarning";
  v4[13] = @"ResumeSelectAccessory";
  v3[14] = &off_1000B0718;
  v3[15] = &off_1000B0730;
  v4[14] = @"ResumeWelcome";
  v4[15] = @"SelectRoom";
  v3[16] = &off_1000B0748;
  v3[17] = &off_1000B0760;
  uint8_t v4[16] = @"CreateRoom";
  v4[17] = @"NameAccessory";
  v3[18] = &off_1000B0778;
  v3[19] = &off_1000B0790;
  v4[18] = @"LockAccessUpdate";
  v4[19] = @"WalletKey";
  v3[20] = &off_1000B07A8;
  v3[21] = &off_1000B07C0;
  v4[20] = @"WalletKeyUWB";
  v4[21] = @"WalletKeyExpressMode";
  v3[22] = &off_1000B07D8;
  v3[23] = &off_1000B07F0;
  v4[22] = @"PINCode";
  v4[23] = @"PINCodeTextField";
  v3[24] = &off_1000B0808;
  v3[25] = &off_1000B0820;
  v4[24] = @"GuestAccess";
  v4[25] = @"SelectAssociatedType";
  v3[26] = &off_1000B0838;
  v3[27] = &off_1000B0850;
  v4[26] = @"ConfigureCamera";
  v4[27] = @"ConfigureCameraAccess";
  v3[28] = &off_1000B0868;
  v3[29] = &off_1000B0880;
  v4[28] = @"FaceRecognition";
  v4[29] = @"FaceRecognitionPhotoLibraryAccess";
  v3[30] = &off_1000B0898;
  v3[31] = &off_1000B08B0;
  v4[30] = @"Chime";
  v4[31] = @"NameInputSources";
  v3[32] = &off_1000B08C8;
  v3[33] = &off_1000B08E0;
  v4[32] = @"NameShowerHeads";
  v4[33] = @"NameZones";
  v3[34] = &off_1000B08F8;
  v3[35] = &off_1000B0910;
  v4[34] = @"NameServices";
  v4[35] = @"Recommendations";
  v3[36] = &off_1000B0928;
  v3[37] = &off_1000B0940;
  v4[36] = @"RestrictedGuestAccess";
  v4[37] = @"SafetyAndSecurity";
  v3[38] = &off_1000B0958;
  v3[39] = &off_1000B0970;
  v4[38] = @"UseSiri";
  v4[39] = @"UseSiriMultipleAccessory";
  v3[40] = &off_1000B0988;
  v3[41] = &off_1000B09A0;
  v4[40] = @"SiriLanguageSelection";
  v4[41] = @"SiriVoiceSelection";
  v3[42] = &off_1000B09B8;
  v3[43] = &off_1000B09D0;
  v4[42] = @"SiriUpdateRequired";
  v4[43] = @"SiriVoiceRecognition";
  v3[44] = &off_1000B09E8;
  v3[45] = &off_1000B0A00;
  v4[44] = @"SetupSiri";
  v4[45] = @"SiriVoiceTraining";
  v3[46] = &off_1000B0A18;
  v3[47] = &off_1000B0A30;
  v4[46] = @"PersonalRequests";
  v4[47] = @"SiriForEveryone";
  v3[48] = &off_1000B0A48;
  v3[49] = &off_1000B0A60;
  v4[48] = @"UseAirPlay";
  v4[49] = @"BridgeAdded";
  v3[50] = &off_1000B0A78;
  v3[51] = &off_1000B0A90;
  v4[50] = @"SetupBridgedAccessories";
  v4[51] = @"RouterSetup";
  v3[52] = &off_1000B0AA8;
  v3[53] = &off_1000B0AC0;
  v4[52] = @"AccessoryUpdate";
  v4[53] = @"Done";
  v3[54] = &off_1000B0AD8;
  v3[55] = &off_1000B0AF0;
  v4[54] = @"Error";
  v4[55] = @"DismissSetup";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:56];
  uint64_t v2 = (void *)qword_1000CB5A8;
  qword_1000CB5A8 = v1;
}

void sub_100053978(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSMutableDictionary);
  id v3 = [*(id *)(a1 + 32) stepToStringMap];
  id v4 = [v2 initWithCapacity:[v3 count]];

  uint64_t v5 = [*(id *)(a1 + 32) stepToStringMap];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100053A74;
  v9[3] = &unk_1000AB180;
  id v10 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = [v6 copy];
  uint64_t v8 = (void *)qword_1000CB5B0;
  qword_1000CB5B0 = (uint64_t)v7;
}

id sub_100053A74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

id sub_100053C6C()
{
  if (qword_1000CB5C0 != -1) {
    dispatch_once(&qword_1000CB5C0, &stru_1000AB1A0);
  }
  v0 = (void *)qword_1000CB5C8;

  return v0;
}

void sub_100053CC0(id a1)
{
  v3[0] = &off_1000B05F8;
  v4[0] = objc_opt_class();
  v3[1] = &off_1000B0610;
  v4[1] = objc_opt_class();
  v3[2] = &off_1000B0628;
  v4[2] = objc_opt_class();
  v3[3] = &off_1000B0640;
  v4[3] = objc_opt_class();
  v3[4] = &off_1000B0658;
  v4[4] = objc_opt_class();
  v3[5] = &off_1000B0670;
  v4[5] = objc_opt_class();
  v3[6] = &off_1000B0688;
  v4[6] = objc_opt_class();
  v3[7] = &off_1000B06A0;
  v4[7] = objc_opt_class();
  v3[8] = &off_1000B06B8;
  v4[8] = objc_opt_class();
  v3[9] = &off_1000B06E8;
  v4[9] = objc_opt_class();
  v3[10] = &off_1000B06D0;
  v4[10] = objc_opt_class();
  v3[11] = &off_1000B0700;
  v4[11] = objc_opt_class();
  v3[12] = &off_1000B0718;
  v4[12] = objc_opt_class();
  v3[13] = &off_1000B0730;
  v4[13] = objc_opt_class();
  v3[14] = &off_1000B0748;
  v4[14] = objc_opt_class();
  v3[15] = &off_1000B0760;
  v4[15] = objc_opt_class();
  v3[16] = &off_1000B0778;
  uint8_t v4[16] = objc_opt_class();
  v3[17] = &off_1000B0790;
  v4[17] = objc_opt_class();
  v3[18] = &off_1000B07A8;
  v4[18] = objc_opt_class();
  v3[19] = &off_1000B07C0;
  v4[19] = objc_opt_class();
  v3[20] = &off_1000B07D8;
  v4[20] = objc_opt_class();
  v3[21] = &off_1000B07F0;
  v4[21] = objc_opt_class();
  v3[22] = &off_1000B0808;
  v4[22] = objc_opt_class();
  v3[23] = &off_1000B0820;
  v4[23] = objc_opt_class();
  v3[24] = &off_1000B0838;
  v4[24] = objc_opt_class();
  v3[25] = &off_1000B0850;
  v4[25] = objc_opt_class();
  v3[26] = &off_1000B0868;
  v4[26] = objc_opt_class();
  v3[27] = &off_1000B0880;
  v4[27] = objc_opt_class();
  v3[28] = &off_1000B0898;
  v4[28] = objc_opt_class();
  v3[29] = &off_1000B08B0;
  v4[29] = objc_opt_class();
  v3[30] = &off_1000B08C8;
  v4[30] = objc_opt_class();
  v3[31] = &off_1000B08E0;
  v4[31] = objc_opt_class();
  v3[32] = &off_1000B08F8;
  v4[32] = objc_opt_class();
  v3[33] = &off_1000B0910;
  v4[33] = objc_opt_class();
  v3[34] = &off_1000B0928;
  v4[34] = objc_opt_class();
  v3[35] = &off_1000B0940;
  v4[35] = objc_opt_class();
  v3[36] = &off_1000B0958;
  v4[36] = objc_opt_class();
  v3[37] = &off_1000B0970;
  v4[37] = objc_opt_class();
  v3[38] = &off_1000B0988;
  v4[38] = objc_opt_class();
  v3[39] = &off_1000B09A0;
  v4[39] = objc_opt_class();
  v3[40] = &off_1000B09B8;
  v4[40] = objc_opt_class();
  v3[41] = &off_1000B09D0;
  v4[41] = objc_opt_class();
  v3[42] = &off_1000B09E8;
  v4[42] = objc_opt_class();
  v3[43] = &off_1000B0A00;
  v4[43] = objc_opt_class();
  v3[44] = &off_1000B0A18;
  v4[44] = objc_opt_class();
  v3[45] = &off_1000B0A30;
  v4[45] = objc_opt_class();
  v3[46] = &off_1000B0A48;
  v4[46] = objc_opt_class();
  v3[47] = &off_1000B0A60;
  v4[47] = objc_opt_class();
  v3[48] = &off_1000B0AA8;
  v4[48] = objc_opt_class();
  v3[49] = &off_1000B0AC0;
  v4[49] = objc_opt_class();
  v3[50] = &off_1000B0AD8;
  v4[50] = objc_opt_class();
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:51];
  id v2 = (void *)qword_1000CB5C8;
  qword_1000CB5C8 = v1;
}

id sub_100054630(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000546E4;
  v8[3] = &unk_1000AB1C8;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 na_map:v8];

  return v6;
}

id sub_1000546E4(uint64_t a1, void *a2)
{
  return [a2 hf_characteristicOfType:*(void *)(a1 + 32)];
}

NAFuture *__cdecl sub_1000546F0(id a1, HFCharacteristicBatchReadResponse *a2)
{
  return +[NAFuture futureWithNoResult];
}

void sub_100054BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100054BDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained config];
  id v3 = [v2 addedAccessory];

  id v4 = [(id)objc_opt_class() applicableServicesForAccessory:v3];
  id v5 = [WeakRetained _enabledServicesSetFromServices:v4];
  id v6 = [v5 mutableCopy];
  [WeakRetained setEnabledServices:v6];

  id v7 = [WeakRetained _frozenServicesFromServices:v4];
  [WeakRetained setFrozenServices:v7];

  uint64_t v8 = [v4 allObjects];
  id v9 = [WeakRetained serviceComparator];
  id v10 = [v8 sortedArrayUsingComparator:v9];
  [WeakRetained setServices:v10];

  uint64_t v11 = [WeakRetained services];
  int v12 = [WeakRetained suggestedNamesForServices:v11];
  [WeakRetained setServiceNames:v12];

  [WeakRetained _logDetailedServices];
  uint64_t v13 = +[NAFuture futureWithNoResult];

  return v13;
}

id sub_1000550C8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) services];
  id v3 = [*(id *)(a1 + 32) serviceNames];
  id v4 = +[HSSetupStateMachineConfiguration configureServices:v2 withNames:v3];

  return v4;
}

id sub_10005514C(uint64_t a1)
{
  return +[HSSetupStateMachineConfiguration disableServices:*(void *)(a1 + 32)];
}

id sub_100055160(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) enabledServices];
  id v2 = +[HSSetupStateMachineConfiguration enableServices:v1];

  return v2;
}

uint64_t sub_100056294(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 serviceType];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

id sub_10005636C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldServiceStartEnabled:a2];
}

id sub_100056408(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldServiceBeFrozen:a2];
}

id sub_1000564F0(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _givenNameForService:a2];
  id v4 = +[HFUtilities sanitizeAutoGeneratedHomeKitName:v3];
  id v5 = v4;
  if ([*(id *)(a1 + 40) containsObject:v4])
  {
    uint64_t v6 = 2;
    id v7 = v4;
    do
    {
      id v5 = +[NSString stringWithFormat:@"%@ %ld", v4, v6];

      ++v6;
      id v7 = v5;
    }
    while (([*(id *)(a1 + 40) containsObject:v5] & 1) != 0);
  }
  [*(id *)(a1 + 40) addObject:v5];

  return v5;
}

void sub_100057010(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) config];
  id v5 = [v4 home];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000570DC;
  v8[3] = &unk_1000AA3D0;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  [v5 updateAudioAnalysisClassifierOptions:1 completion:v8];
}

void sub_1000570DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100068C00((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }

    [*(id *)(a1 + 32) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Success in setting audio analysis classifier options setting", v16, 2u);
    }

    int v12 = *(void **)(a1 + 32);
    uint64_t v13 = [*(id *)(a1 + 40) config];
    __int16 v14 = [v13 home];
    __int16 v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 audioAnalysisClassifierOptions]);
    [v12 finishWithResult:v15 error:0];
  }
}

void sub_1000571F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_100057290;
  v6[3] = &unk_1000A9C30;
  id v7 = v3;
  id v5 = v3;
  [v4 updateAudioAnalysisUserDropinAccessLevel:2 completionHandler:v6];
}

void sub_100057290(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100068C6C((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }

    [*(id *)(a1 + 32) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Success in setting dropin access level setting", v12, 2u);
    }

    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

void sub_100057558(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) config];
  id v5 = [v4 home];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_100057620;
  v7[3] = &unk_1000A9C30;
  id v8 = v3;
  id v6 = v3;
  [v5 updateDidOnboardAudioAnalysis:1 completion:v7];
}

void sub_100057620(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100068CD8((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }

    [*(id *)(a1 + 32) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Success in setting audio analysis onboarding key", v12, 2u);
    }

    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

NSArray *__cdecl sub_100057894(id a1, HMHome *a2, HFItemUpdating *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [objc_alloc((Class)HUCameraPermissionsSettingsModule) initWithItemUpdater:v4 home:v5 displayStyle:1];

  id v9 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:&v9 count:1];

  return (NSArray *)v7;
}

HUItemModuleController *__cdecl sub_100057964(id a1, HFItemModule *a2)
{
  id v2 = a2;
  id v3 = [objc_alloc((Class)HUCameraSettingsModuleController) initWithModule:v2];

  [v3 setUseProxSetupPresentationStyle:1];

  return (HUItemModuleController *)v3;
}

void sub_100057F20(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "-[HSPCAccessoryUpdateViewController displayAutomaticUpdatesAlert]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Displaying popup to enable automatic software updates for third party accessories", buf, 0xCu);
  }

  id v5 = HULocalizedString();
  id v6 = HULocalizedString();
  uint64_t v7 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  uint64_t v8 = HULocalizedString();
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  id v16[2] = sub_1000581B8;
  v16[3] = &unk_1000A9480;
  void v16[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v17 = v9;
  uint64_t v10 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v16];

  [v7 addAction:v10];
  uint64_t v11 = HULocalizedString();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000582B4;
  void v14[3] = &unk_1000A94A8;
  id v15 = v9;
  id v12 = v9;
  uint64_t v13 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v14];
  [v7 addAction:v13];

  [v7 setPreferredAction:v10];
  [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
}

id sub_1000581B8(uint64_t a1)
{
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[HSPCAccessoryUpdateViewController displayAutomaticUpdatesAlert]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Enabling automatic software updates for third party accessories", (uint8_t *)&v7, 0xCu);
  }

  id v3 = [*(id *)(a1 + 32) config];
  id v4 = [v3 home];
  id v5 = [v4 hf_updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:1];

  return [*(id *)(a1 + 40) finishWithResult:&off_1000B0B50];
}

id sub_1000582B4(uint64_t a1)
{
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[HSPCAccessoryUpdateViewController displayAutomaticUpdatesAlert]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s User declined enabling software updates for third party accessories", (uint8_t *)&v4, 0xCu);
  }

  return [*(id *)(a1 + 32) finishWithResult:&off_1000B0B50];
}

void sub_100058CA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) config];
  id v6 = [v5 onboardingSelections];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100058D70;
  v8[3] = &unk_1000A95D8;
  id v9 = v3;
  id v7 = v3;
  [v4 applyOnboardingSelections:v6 completionHandler:v8];
}

void sub_100058D70(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100065AD8((uint64_t)v3, v4);
    }
  }
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMSiriEndpointOnboardingResultAsString();
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Call succeeded with following result: %@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) finishWithNoResult];
}

void sub_100059C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100059C70(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 copy];

  [WeakRetained setItems:v4];
  [WeakRetained setLoaded:1];
}

id sub_100059FC0(uint64_t a1)
{
  id v2 = [objc_alloc((Class)HFDiscoveredAccessoryItemProvider) initWithAccessoryBrowsingManager:*(void *)(a1 + 32)];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005A0C8;
  v5[3] = &unk_1000AB358;
  id v6 = *(id *)(a1 + 40);
  [v2 setFilter:v5];
  id v7 = v2;
  id v3 = +[NSArray arrayWithObjects:&v7 count:1];

  return v3;
}

uint64_t sub_10005A0C8(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    return (uint64_t)[v2 shouldShowAccessory:a2];
  }
  else {
    return 1;
  }
}

BOOL sub_10005A39C(id a1, HFItem *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    if (!v6)
    {
      id v7 = +[NSAssertionHandler currentHandler];
      uint64_t v8 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
      [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
    }
  }
  else
  {
    id v6 = 0;
  }

  id v9 = [(HFItem *)v6 discoveredAccessory];
  uint64_t v10 = [v9 accessory];
  char v11 = [v10 knownToSystemCommissioner] ^ 1;

  return v11;
}

int64_t sub_10005A4C8(id a1, HFItem *a2, HFItem *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;
    if (!v9)
    {
      uint64_t v10 = +[NSAssertionHandler currentHandler];
      char v11 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
      [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];
    }
  }
  else
  {
    id v9 = 0;
  }

  uint64_t v12 = objc_opt_class();
  uint64_t v13 = v5;
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      __int16 v14 = v13;
    }
    else {
      __int16 v14 = 0;
    }
    id v15 = v14;
    if (!v15)
    {
      id v16 = +[NSAssertionHandler currentHandler];
      id v17 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
      [v16 handleFailureInFunction:v17, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v12, objc_opt_class() file lineNumber description];
    }
  }
  else
  {
    id v15 = 0;
  }

  dispatch_time_t v18 = [(HFItem *)v9 discoveredAccessory];
  uint64_t v19 = [(HFItem *)v15 discoveredAccessory];
  id v20 = [v18 accessory];
  if ([v20 knownToSystemCommissioner])
  {
  }
  else
  {
    id v21 = [v19 accessory];
    unsigned int v22 = [v21 knownToSystemCommissioner];

    if (!v22)
    {
      id v28 = [v18 discoveryDate];
      uint64_t v29 = [v19 discoveryDate];
      int64_t v27 = (int64_t)[v28 compare:v29];

      if (v27) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  uint64_t v23 = [v18 accessory];
  unsigned int v24 = [v23 knownToSystemCommissioner];

  if (!v24)
  {
    int64_t v27 = -1;
    goto LABEL_24;
  }
  id v25 = [v19 accessory];
  unsigned __int8 v26 = [v25 knownToSystemCommissioner];

  if (v26)
  {
LABEL_23:
    id v30 = +[HFItemSection defaultItemComparator];
    int64_t v27 = ((uint64_t (**)(void, HFItem *, HFItem *))v30)[2](v30, v7, v13);

    goto LABEL_24;
  }
  int64_t v27 = 1;
LABEL_24:

  return v27;
}

BOOL sub_10005A8A8(id a1, HFItemProvider *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

NSArray *__cdecl sub_10005AAF0(id a1, HMHome *a2, HFItemUpdating *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [objc_alloc((Class)HUFaceRecognitionUserPhotosLibrarySettingsModule) initWithItemUpdater:v4 home:v5];

  [v6 setShouldUseProxCardPresentationStyle:1];
  id v9 = v6;
  id v7 = +[NSArray arrayWithObjects:&v9 count:1];

  return (NSArray *)v7;
}

id sub_10005ABC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    if (!v7)
    {
      uint64_t v8 = +[NSAssertionHandler currentHandler];
      id v9 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
      [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v4, objc_opt_class() file lineNumber description];
    }
  }
  else
  {
    id v7 = 0;
  }

  id v10 = [objc_alloc((Class)HUFaceRecognitionUserPhotosLibrarySettingsModuleController) initWithModule:v7 host:*(void *)(a1 + 32)];

  return v10;
}

id sub_10005B27C(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) suggestedRoomUUID];
  id v5 = [v3 isEqual:v4];

  return v5;
}

id sub_10005B82C(id a1, HMRoom *a2)
{
  return [(HMRoom *)a2 name];
}

uint64_t sub_10005B834(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

void sub_10005BC04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_10005BC28(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 extensionMessenger];
  [v5 fetchRoomsInHome:*(void *)(a1 + 40) completionHandler:v4];
}

id sub_10005BC98(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [v3 sortedArrayUsingComparator:&stru_1000AB510];
  [WeakRetained setItems:v5];

  [WeakRetained setLoaded:1];
  id v6 = +[NAFuture futureWithResult:v3];

  return v6;
}

int64_t sub_10005BD3C(id a1, MTSDeviceSetupRoom *a2, MTSDeviceSetupRoom *a3)
{
  id v4 = a3;
  id v5 = [(MTSDeviceSetupRoom *)a2 name];
  id v6 = [(MTSDeviceSetupRoom *)v4 name];

  id v7 = [v5 localizedStandardCompare:v6];
  return (int64_t)v7;
}

void sub_10005CA44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 144));
  _Unwind_Resume(a1);
}

void sub_10005CA94(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CB58;
  block[3] = &unk_1000AB538;
  objc_copyWeak(v7, (id *)(a1 + 32));
  id v6 = v3;
  v7[1] = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(v7);
}

void sub_10005CB58(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [*(id *)(a1 + 32) CGImage], 0, *(double *)(a1 + 48));
  [WeakRetained[8] setImage:v2];
}

id sub_10005CBE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [v3 BOOLValue];
    id v7 = [*(id *)(a1 + 32) home];
    uint64_t v8 = [v7 currentUser];
    id v9 = [v8 hf_prettyDescription];
    id v10 = [*(id *)(a1 + 32) home];
    uint64_t v11 = [v10 hf_minimumDescription];
    *(_DWORD *)buf = 136315906;
    unsigned __int8 v26 = "-[HSPCWalletKeyViewController initWithCoordinator:config:]_block_invoke_3";
    __int16 v27 = 1024;
    unsigned int v28 = v6;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    __int16 v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%s) hasWalletKeyNum = %{BOOL}d for current user %@ of home %@", buf, 0x26u);
  }
  unsigned int v12 = [v3 BOOLValue];
  uint64_t v13 = [*(id *)(a1 + 32) home];
  id v20 = [v13 name];
  if (v12) {
    id v21 = @"HSProximityCardWalletKeySubitle_RestrictedGuest";
  }
  else {
    id v21 = @"HSProximityCardWalletKeySubitle";
  }
  unsigned int v22 = sub_100060D80(v21, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v20);
  [WeakRetained setSubtitle:v22];

  uint64_t v23 = +[NAFuture futureWithNoResult];

  return v23;
}

void sub_10005CDF0(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  void v2[2] = sub_10005CE98;
  v2[3] = &unk_1000AB0C8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

  objc_destroyWeak(&v4);
}

void sub_10005CE98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = HUImageNamed();
  [*(id *)(a1 + 32) setImage:v2];

  id v3 = [WeakRetained walletAppIconImageView];
  [v3 setHidden:1];
}

void sub_10005CF20(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] home];
  id v5 = [v4 hf_walletKeyColorToDisplay];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005D048;
  v8[3] = &unk_1000AB5B0;
  objc_copyWeak(&v12, a1 + 7);
  id v6 = v3;
  id v9 = v6;
  id v11 = a1[6];
  id v10 = a1[5];
  id v7 = [v5 addCompletionBlock:v8];

  objc_destroyWeak(&v12);
}

void sub_10005D034(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10005D048(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [v4 integerValue];

  id v7 = objc_alloc((Class)PKSerializedDataAccessor);
  uint64_t v8 = *(void *)(a1 + 32);
  id v18 = 0;
  id v9 = [v7 initWithData:v8 error:&v18];
  id v10 = v18;
  id v11 = +[PKPass createWithValidatedFileDataAccessor:v9];
  id v12 = [v11 paymentPass];

  if (v10 || !v12)
  {
    uint64_t v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100068E10();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [v12 setHomeKeyLiveRenderType:[HFWalletUtilities pkPassHomeKeyLiveRenderTypeForHMHomeWalletKeyColor:v6]];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10005D204;
    void v14[3] = &unk_1000A9560;
    id v15 = v12;
    id v16 = *(id *)(a1 + 40);
    id v17 = WeakRetained;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
  }
}

void sub_10005D204(uint64_t a1)
{
  uint64_t v2 = +[PKPassSnapshotter sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005D2C8;
  v4[3] = &unk_1000AB588;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 snapshotWithPass:v3 completion:v4];
}

void sub_10005D2C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D388;
  block[3] = &unk_1000A9560;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10005D388(uint64_t a1)
{
  [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 48) walletAppIconImageView];
  [v2 setHidden:0];

  id v3 = *(void **)(a1 + 48);

  return [v3 _setupWalletAppIconImageView];
}

id sub_10005D3E0(id *a1, void *a2)
{
  unsigned __int8 v3 = [a2 BOOLValue];
  id v4 = [a1[4] home];
  id v5 = v4;
  if (v3)
  {
    id v6 = [v4 hf_fetchExistingWalletKeyEncodedPKPass];
    uint64_t v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_10005D62C;
    id v17 = &unk_1000AB600;
    id v7 = &v18;
    id v18 = a1[5];
    id v8 = &v19;
    id v19 = a1[6];
    id v9 = &v20;
    id v20 = a1[7];
    id v10 = &v14;
  }
  else
  {
    id v6 = [v4 hf_fetchAvailableWalletKeyEncodedPKPass];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    id v21[2] = sub_10005D594;
    v21[3] = &unk_1000AB600;
    id v7 = &v22;
    id v22 = a1[5];
    id v8 = &v23;
    id v23 = a1[6];
    id v9 = &v24;
    id v24 = a1[7];
    id v10 = (void ***)v21;
  }
  id v11 = [v6 addCompletionBlock:v10, v14, v15, v16, v17];

  id v12 = +[NAFuture futureWithNoResult];

  return v12;
}

void sub_10005D594(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100068E84();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10005D62C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100068EFC();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10005DAE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10005DB2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100069074();
  }

  objc_opt_class();
  id v6 = v3;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (!v8) {
    goto LABEL_12;
  }
  if ([v8 code] == (id)8 && +[HFUtilities isAnIPad](HFUtilities, "isAnIPad"))
  {
    id v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100068FF4();
    }

LABEL_12:
    id v10 = +[NAFuture futureWithResult:&off_1000B0B98];
    goto LABEL_25;
  }
  id v11 = objc_alloc_init((Class)NAFuture);
  id v12 = [WeakRetained config];
  uint64_t v13 = [v12 delegate];
  uint64_t v14 = [WeakRetained config];
  id v15 = [v13 stateMachineConfigurationGetLaunchReason:v14];

  if (v15)
  {
    id v16 = [v8 code];
    if (v16 == (id)8)
    {
      uint64_t v17 = +[HFWalletUtilities walletAppFromAppStoreURL];
    }
    else if (v16 == (id)5)
    {
      uint64_t v17 = +[HFWalletUtilities walletAppURL];
    }
    else
    {
      if (v16 != (id)2)
      {
        id v19 = 0;
        goto LABEL_23;
      }
      uint64_t v17 = +[NSURL hf_openiCloudPreferencesURL];
    }
    id v19 = (void *)v17;
LABEL_23:
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10005DE58;
    v30[3] = &unk_1000A9560;
    id v31 = v19;
    id v32 = WeakRetained;
    id v33 = v11;
    id v20 = v19;
    id v18 = objc_retainBlock(v30);

    goto LABEL_24;
  }
  id v18 = 0;
LABEL_24:
  id v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  __int16 v27 = sub_10005E090;
  unsigned int v28 = &unk_1000A90B0;
  id v21 = v11;
  id v29 = v21;
  id v22 = objc_retainBlock(&v25);
  id v23 = +[HFErrorHandler sharedHandler];
  [v23 handleError:v8 retryBlock:v18 cancelBlock:v22];

  id v10 = v21;
LABEL_25:

  return v10;
}

void sub_10005DE58(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = +[HFOpenURLRouter sharedInstance];
    id v3 = [v2 openURL:*(void *)(a1 + 32)];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10005DF7C;
    v8[3] = &unk_1000AB650;
    int8x16_t v7 = *(int8x16_t *)(a1 + 32);
    id v4 = (id)v7.i64[0];
    int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
    id v10 = *(id *)(a1 + 48);
    id v5 = [v3 addCompletionBlock:v8];
  }
  else
  {
    id v6 = *(void **)(a1 + 48);
    [v6 finishWithResult:&off_1000B0B98];
  }
}

void sub_10005DF7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int8x16_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 138413314;
    uint64_t v11 = v8;
    __int16 v12 = 2080;
    uint64_t v13 = "-[HSPCWalletKeyViewController commitConfiguration]_block_invoke_2";
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "(%@:%s) Retried opening url %@ with result %@ and error %@", (uint8_t *)&v10, 0x34u);
  }

  [*(id *)(a1 + 48) finishWithResult:&off_1000B0B98];
}

id sub_10005E090(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:&off_1000B0B98];
}

id sub_10005E0A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000690E8();
  }

  id v6 = +[NAFuture futureWithResult:&off_1000B0B98];

  return v6;
}

void sub_10005E148(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained config];
  id v3 = [v2 home];
  id v4 = [v3 hf_fetchWalletKeyDeviceStateForCurrentDeviceIfNecessary];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10005E20C;
  v6[3] = &unk_1000AB6A0;
  void v6[4] = WeakRetained;
  id v5 = [v4 addCompletionBlock:v6];
}

void sub_10005E20C(uint64_t a1, void *a2)
{
  if (([a2 canAddWalletKey] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) config];
    id v4 = [v3 home];
    id v5 = [v4 hf_walletKeyDeviceStatesOfCompatiblePairedWatches];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    id v7[2] = sub_10005E2D8;
    v7[3] = &unk_1000AB678;
    void v7[4] = *(void *)(a1 + 32);
    id v6 = [v5 addCompletionBlock:v7];
  }
}

void sub_10005E2D8(uint64_t a1, void *a2)
{
  if ([a2 count])
  {
    id v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) config];
      id v5 = [v4 home];
      int v17 = 136315394;
      __int16 v18 = "-[HSPCWalletKeyViewController commitConfiguration]_block_invoke_3";
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(HSPCWalletKeyViewController:%s) Updating hasOnboarded for Wallet Key for home %@. Current device doesn't support wallet key, but there's at least one paired watch that supports wallet key.", (uint8_t *)&v17, 0x16u);
    }
    id v6 = [*(id *)(a1 + 32) config];
    int8x16_t v7 = [v6 home];
    [v7 hf_setHasOnboardedForWalletKey];

    id v9 = objc_alloc((Class)HFUserItem);
    int v10 = [*(id *)(a1 + 32) config];
    uint64_t v11 = [v10 home];
    __int16 v12 = [*(id *)(a1 + 32) config];
    uint64_t v13 = [v12 home];
    __int16 v14 = [v13 currentUser];
    id v15 = [v9 initWithHome:v11 user:v14 nameStyle:0];

    id v16 = [v15 setDismissWalletKeyExpressModeOnboarding:1 forWalletKeyUUID:0];
  }
}

void sub_10005EFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10005F030(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = +[NSMutableArray array];
  id v3 = sub_100007B38();
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10005F388;
  v33[3] = &unk_1000AB6C8;
  id v4 = v2;
  id v34 = v4;
  id v5 = WeakRetained;
  id v35 = v5;
  id v36 = v3;
  id v6 = v3;
  int8x16_t v7 = objc_retainBlock(v33);
  id v8 = [v5 _shouldStackIcons];
  id v9 = [v5 scanCodeIconView];
  int v10 = [v9 topAnchor];
  uint64_t v11 = [v5 topAnchor];
  __int16 v12 = [v10 constraintEqualToAnchor:v11 constant:20.0];
  [v4 addObject:v12];

  uint64_t v13 = [v5 scanCodeIconView];
  __int16 v14 = [v5 scanCodeTitleLabel];
  id v15 = [v5 scanCodeBodyLabel];
  ((void (*)(void *, void *, void *, void *, id, void))v7[2])(v7, v13, v14, v15, v8, 0);

  if ([v5 _isShowingNFCInstructions])
  {
    id v16 = [v5 nfcIconView];
    int v17 = [v16 topAnchor];
    __int16 v18 = [v5 scanCodeBodyLabel];
    __int16 v19 = [v18 lastBaselineAnchor];
    [v17 constraintEqualToAnchor:v19 constant:30.0];
    id v20 = v32 = v6;
    [v4 addObject:v20];

    id v21 = [v5 nfcIconView];
    id v22 = [v5 nfcTitleLabel];
    id v23 = [v5 nfcBodyLabel];
    id v24 = [v5 scanCodeTitleLabel];
    id v25 = [v24 leadingAnchor];
    ((void (*)(void *, void *, void *, void *, id, void *))v7[2])(v7, v21, v22, v23, v8, v25);

    id v6 = v32;
    [v5 nfcBodyLabel];
  }
  else
  {
    [v5 scanCodeBodyLabel];
  uint64_t v26 = };
  __int16 v27 = [v26 bottomAnchor];
  unsigned int v28 = [v5 bottomAnchor];
  id v29 = [v27 constraintEqualToAnchor:v28 constant:-10.0];
  [v4 addObject:v29];

  id v30 = v4;
  return v30;
}

void sub_10005F388(uint64_t a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  id v52 = a2;
  id v11 = a3;
  id v12 = a6;
  uint64_t v13 = *(void **)(a1 + 32);
  id v14 = a4;
  id v15 = [v52 leadingAnchor];
  id v16 = [*(id *)(a1 + 40) layoutMarginsGuide];
  int v17 = [v16 leadingAnchor];
  __int16 v18 = [v15 constraintEqualToAnchor:v17];
  [v13 addObject:v18];

  __int16 v19 = *(void **)(a1 + 32);
  id v20 = [v11 trailingAnchor];
  id v21 = [*(id *)(a1 + 40) layoutMarginsGuide];
  id v22 = [v21 trailingAnchor];
  id v23 = [v20 constraintEqualToAnchor:v22];
  [v19 addObject:v23];

  id v24 = *(void **)(a1 + 32);
  id v25 = [v11 topAnchor];
  if (a5)
  {
    uint64_t v26 = [v52 bottomAnchor];
    __int16 v27 = [v25 constraintEqualToAnchor:v26 constant:15.0];
    [v24 addObject:v27];

    unsigned int v28 = *(void **)(a1 + 32);
    id v29 = [v11 leadingAnchor];
    id v30 = [*(id *)(a1 + 40) layoutMarginsGuide];
    id v31 = [v30 leadingAnchor];
    id v32 = [v29 constraintEqualToAnchor:v31];
    [v28 addObject:v32];
  }
  else
  {
    id v33 = [v52 topAnchor];
    id v34 = [v25 constraintEqualToAnchor:v33];
    [v24 addObject:v34];

    id v35 = *(void **)(a1 + 32);
    id v36 = [v11 leadingAnchor];
    id v29 = v36;
    if (v12)
    {
      id v30 = [v36 constraintEqualToAnchor:v12];
      [v35 addObject:v30];
      goto LABEL_9;
    }
    id v30 = [v52 trailingAnchor];
    uint64_t v37 = +[UIScreen mainScreen];
    [v37 bounds];
    uint64_t v38 = HUViewSizeSubclassForViewSize();

    double v39 = 20.0;
    if (!v38) {
      double v39 = 18.0;
    }
    id v31 = [v29 constraintEqualToAnchor:v30 constant:v39];
    [v35 addObject:v31];
  }

LABEL_9:
  __int16 v40 = *(void **)(a1 + 32);
  id v41 = [v14 firstBaselineAnchor];
  __int16 v42 = [v11 lastBaselineAnchor];
  [*(id *)(a1 + 48) _scaledValueForValue:20.0];
  CFStringRef v43 = [v41 constraintEqualToAnchor:v42];
  [v40 addObject:v43];

  __int16 v44 = *(void **)(a1 + 32);
  unsigned int v45 = [v14 trailingAnchor];
  __int16 v46 = [v11 trailingAnchor];
  unsigned int v47 = [v45 constraintEqualToAnchor:v46];
  [v44 addObject:v47];

  __int16 v48 = *(void **)(a1 + 32);
  unsigned int v49 = [v14 leadingAnchor];

  __int16 v50 = [v11 leadingAnchor];
  unsigned int v51 = [v49 constraintEqualToAnchor:v50];
  [v48 addObject:v51];
}

void sub_10005F77C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained nfcTitleLabel];
  [v1 setHidden:0];

  uint64_t v2 = [WeakRetained nfcBodyLabel];
  [v2 setHidden:0];

  id v3 = [WeakRetained nfcIconView];
  [v3 setHidden:0];

  [WeakRetained _updateScanCodeIcon];
  id v4 = [WeakRetained constraintSet];
  [v4 invalidate];
}

id sub_10005FAE0()
{
  if (qword_1000CB5D0 != -1) {
    dispatch_once(&qword_1000CB5D0, &stru_1000AB6E8);
  }
  v0 = (void *)qword_1000CB5D8;

  return v0;
}

void sub_10005FB34(id a1)
{
  qword_1000CB5D8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", UIContentSizeCategoryExtraLarge, UIContentSizeCategoryExtraExtraLarge, UIContentSizeCategoryExtraExtraExtraLarge, UIContentSizeCategoryAccessibilityMedium, UIContentSizeCategoryAccessibilityLarge, UIContentSizeCategoryAccessibilityExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraExtraLarge, 0);

  _objc_release_x1();
}

id sub_100060858(uint64_t a1, void *a2)
{
  unsigned __int8 v3 = [a2 BOOLValue];
  id v4 = HFLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Skip step: %@", (uint8_t *)&v10, 0xCu);
    }

    int8x16_t v7 = [*(id *)(a1 + 40) _moveToNextStep];
  }
  else
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Show step: %@", (uint8_t *)&v10, 0xCu);
    }

    int8x16_t v7 = +[NAFuture futureWithResult:&__kCFBooleanFalse];
  }

  return v7;
}

id sub_100060A48()
{
  if (qword_1000CB5E8 != -1) {
    dispatch_once(&qword_1000CB5E8, &stru_1000AB708);
  }
  v0 = (void *)qword_1000CB5E0;

  return v0;
}

void sub_100060A9C(id a1)
{
  qword_1000CB5E0 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

__CFString *sub_100060AF8(void *a1)
{
  id v1 = a1;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = sub_100060E4C();
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v12 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
      uint64_t v8 = sub_100060A48();
      [v8 localizedStringForKey:v1 value:@"_" table:v7];
      id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (![(__CFString *)v9 isEqualToString:@"_"]) {
        break;
      }

      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          goto LABEL_3;
        }
        id v9 = @"_";
        break;
      }
    }
  }
  else
  {
    id v9 = @"_";
  }

  return v9;
}

id sub_100060C64(void *a1)
{
  return sub_100060C70(a1, a1, 1);
}

id sub_100060C70(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = sub_100060A48();
  uint64_t v8 = [v7 localizedStringForKey:v5 value:@"_" table:@"HSLocalizable"];

  if ([@"_" isEqualToString:v8])
  {
    uint64_t v9 = sub_100060AF8(v5);

    uint64_t v8 = (void *)v9;
  }
  unsigned int v10 = [@"_" isEqualToString:v8];
  if (v10) {
    long long v11 = v6;
  }
  else {
    long long v11 = v8;
  }
  if (v10 && a3)
  {
    NSLog(@"Missing localized string key %@ in table %@", v5, @"HSLocalizable");
    long long v11 = v6;
  }
  id v12 = v11;

  return v12;
}

id sub_100060D74(void *a1)
{
  return sub_100060C70(a1, 0, 0);
}

id sub_100060D80(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  long long v11 = sub_100060C70(a1, 0, 1);
  if (v11)
  {
    v16[1] = &a9;
    v16[0] = 0;
    id v12 = [objc_alloc((Class)NSString) initWithValidatedFormat:v11 validFormatSpecifiers:v10 arguments:&a9 error:v16];
    id v13 = v16[0];
    long long v14 = v13;
    if (!v12) {
      NSLog(@"Couldn't localize format string \"%@\". Most likely, the format specifiers don't match. %@", v11, v13);
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

id sub_100060E4C()
{
  if (qword_1000CB5F0 != -1) {
    dispatch_once(&qword_1000CB5F0, &stru_1000AB728);
  }
  v0 = (void *)qword_1000CB5F8;

  return v0;
}

void sub_100060EA0(id a1)
{
  id v1 = (void *)qword_1000CB5F8;
  qword_1000CB5F8 = (uint64_t)&off_1000B0D30;
}

id sub_10006132C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pairingController];
  [v2 startWithHome:*(void *)(a1 + 40)];

  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) pairingController];
    uint64_t v5 = *(void *)(a1 + 40);
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Set up and started accessory pairing controller: %@ with home: %@", (uint8_t *)&v9, 0x16u);
  }
  id v6 = [*(id *)(a1 + 32) promise];
  uint64_t v7 = [v6 future];

  return v7;
}

void sub_100063604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100063630(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained navigationController];
  id v4 = [v3 topViewController];

  if (WeakRetained == v4)
  {
    uint64_t v5 = [WeakRetained coordinator];
    id v6 = [v5 didReceiveSetupCode:*(void *)(a1 + 32) fromViewController:WeakRetained];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006371C;
    v8[3] = &unk_1000AA2E8;
    void v8[4] = WeakRetained;
    id v7 = [v6 addCompletionBlock:v8];
  }
}

void sub_10006371C(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v4 = [v9 domain];
  uint64_t v5 = v4;
  if (v4 == (void *)HFErrorDomain)
  {
    id v6 = [v9 code];

    if (v6 == (id)96)
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = +[NAFuture futureWithResult:&off_1000B0BC8];
      [v7 handleButtonDirectiveFuture:v8];

      goto LABEL_6;
    }
  }
  else
  {
  }
  [*(id *)(a1 + 32) _moveToNextViewController];
LABEL_6:
}

void sub_100063D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100063D30(uint64_t a1)
{
  uint64_t v2 = +[HFHomeKitDispatcher sharedDispatcher];
  id v3 = [v2 homeManager];
  id v4 = [v3 accessorySetupCoordinator];
  uint64_t v5 = *(void *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_100063E38;
  v6[3] = &unk_1000AB778;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  [v4 createSetupAccessoryPayloadWithSetupPayloadURLString:v5 completionHandler:v6];

  objc_destroyWeak(&v8);
}

void sub_100063E24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100063E38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 1024;
    unsigned int v23 = [v5 requiresMatterCustomCommissioningFlow];
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accessorySetupCoordinator createSetupAccessoryPayloadWithSetupPayloadURLString:completionHandler:, setupURLString %@, payload %@, requiresMatterCustomCommissioningFlow %d, error %@.", buf, 0x26u);
  }

  id v10 = [WeakRetained coordinator];
  __int16 v11 = [v10 showCustomCommissioningFlowAlertIfNecessaryForPayload:v5 onViewController:WeakRetained];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  id v16[2] = sub_10006403C;
  v16[3] = &unk_1000AB750;
  void v16[4] = WeakRetained;
  id v17 = v5;
  id v12 = v5;
  id v13 = [v11 addSuccessBlock:v16];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_10006407C;
  v15[3] = &unk_1000A9C30;
  void v15[4] = WeakRetained;
  id v14 = [v13 addFailureBlock:v15];
}

id sub_10006403C(uint64_t a1)
{
  [*(id *)(a1 + 32) _updatePairingErrorWithPayload:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _moveToNextViewController];
}

void sub_10006407C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = +[NAFuture futureWithResult:&off_1000B0BC8];
  [v1 handleButtonDirectiveFuture:v2];
}

void sub_100064720(uint64_t a1)
{
  [*(id *)(a1 + 32) setCameraReaderIsRunning:0];
  id v2 = [*(id *)(a1 + 32) delayedSetupCodeHandler];
  [v2 cancel];

  id v3 = [*(id *)(a1 + 32) coordinator];
  id v4 = [v3 didReceiveSetupCode:0 fromViewController:*(void *)(a1 + 32)];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1000647FC;
  v6[3] = &unk_1000AA2E8;
  void v6[4] = *(void *)(a1 + 32);
  id v5 = [v4 addCompletionBlock:v6];
}

id sub_1000647FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _moveToNextViewController];
}

id sub_100064918(uint64_t a1)
{
  [*(id *)(a1 + 32) setCameraReaderIsRunning:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 _unloadCameraReader];
}

id sub_100064A6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCameraReaderIsRunning:0];
}

void sub_100064BC0(uint64_t a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    uint64_t v6 = CROutputTypeHomeKitCode;
    uint64_t v7 = CROutputTypeQRCode;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 type];
        unsigned int v11 = [v10 isEqual:v6];

        if (v11)
        {
          id v12 = [v9 stringValue];
          if (v12) {
            [*(id *)(a1 + 40) _handleSetupCode:v12];
          }
        }
        else
        {
          id v13 = [v9 type];
          unsigned int v14 = [v13 isEqualToString:v7];

          if (!v14) {
            continue;
          }
          id v12 = [v9 stringValue];
          if (v12) {
            [*(id *)(a1 + 40) _handleSetupURLString:v12 afterDelay:0.5];
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

id sub_100064E3C(uint64_t a1)
{
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "nfcManager:%@ didRecognizePayloadString:%@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 48) _handleSetupURLString:*(void *)(a1 + 40) afterDelay:0.0];
}

uint64_t start(int a1, char **a2)
{
  uint64_t v5 = UIApplicationMain(a1, a2, 0, @"HSAppDelegate");
  return v5;
}

NAFuture *__cdecl sub_100065654(id a1, id a2)
{
  return +[NAFuture futureWithResult:&off_1000B0BF8];
}

NAFuture *__cdecl sub_100065668(id a1, NSError *a2)
{
  if ([(NSError *)a2 na_isCancelledError]) {
    id v2 = &off_1000B0BE0;
  }
  else {
    id v2 = &off_1000B0BF8;
  }
  uint64_t v3 = +[NAFuture futureWithResult:v2];

  return (NAFuture *)v3;
}

uint64_t sub_100065790(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) config];
  uint64_t v3 = [v2 home];
  unsigned int v4 = [v3 hf_hasEnabledResident];

  uint64_t v5 = [*(id *)(a1 + 32) config];
  int v6 = [v5 home];
  unsigned int v7 = [v6 hf_userCanCreateTrigger];

  __int16 v8 = [*(id *)(a1 + 32) itemManager];
  uint64_t v9 = [v8 allDisplayedItems];
  id v10 = [v9 count];

  if (v4)
  {
    if (v10) {
      uint64_t v11 = v7 ^ 1;
    }
    else {
      uint64_t v11 = 1;
    }
  }
  else
  {
    uint64_t v11 = 1;
  }
  if (+[HFUtilities isInternalInstall])
  {
    id v12 = [*(id *)(a1 + 32) itemManager];
    id v13 = [v12 allDisplayedItems];
    unsigned int v14 = [v13 allObjects];
    long long v15 = [v14 na_map:&stru_1000AB820];
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) itemManager];
    id v13 = [v12 allDisplayedItems];
    long long v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(%lu items)", [v13 count]);
  }

  long long v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413570;
    uint64_t v21 = v17;
    __int16 v22 = 2048;
    uint64_t v23 = v18;
    __int16 v24 = 1024;
    int v25 = v11;
    __int16 v26 = 1024;
    unsigned int v27 = v4;
    __int16 v28 = 1024;
    unsigned int v29 = v7;
    __int16 v30 = 2112;
    id v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@:%p shouldSkip=%{BOOL}d, hasEnabledResident=%{BOOL}d, userCanCreateTrigger=%{BOOL}d, displayedItems=%@", buf, 0x32u);
  }

  return v11;
}

id sub_1000659D4(id a1, HFItem *a2)
{
  return [(HFItem *)a2 description];
}

void sub_100065AD8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to apply onboarding selections with error %@", (uint8_t *)&v2, 0xCu);
}

void sub_100065B50(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Got failure trying to validate PIN Code. Continue to next prox card without setting PIN Code. %@", (uint8_t *)&v3, 0xCu);
}

void sub_100065BCC(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() description];
  int v3 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:*(void *)(a1 + 48)];
  uint64_t v4 = [*(id *)(a1 + 40) addedAccessory];
  uint64_t v5 = [v4 hf_minimumDescription];
  sub_100011118();
  sub_1000110F4();
  sub_10001114C((void *)&_mh_execute_header, v6, v7, "(%@:%s) Skipping %@ prox card because error %@ occurred for hf_fetchWalletKeyDeviceStateForCurrentDevice for accessory %@", v8, v9, v10, v11, v12);
}

void sub_100065CBC(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() description];
  int v3 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:*(void *)(a1 + 48)];
  uint64_t v4 = [*(id *)(a1 + 40) addedAccessory];
  uint64_t v5 = [v4 hf_minimumDescription];
  sub_100011118();
  sub_1000110F4();
  sub_10001114C((void *)&_mh_execute_header, v6, v7, "(%@:%s) Skipping %@ prox card because error %@ occurred for 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 for accessory %@", v8, v9, v10, v11, v12);
}

void sub_100065DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = [*(id *)(a2 + 32) addedAccessory];
  sub_10001112C((void *)&_mh_execute_header, v2, v3, "(HSSetupstateMachine:%s) Skipping express mode prox card because error %@ occurred for hf_fetchWalletKeyDeviceStateForCurrentDevice for accessory %@", v4, v5, v6, v7, 2u);
}

void sub_100065E60(void *a1)
{
  id v1 = [a1 description];
  objc_opt_class();
  sub_10001112C((void *)&_mh_execute_header, v2, v3, "(%@:%s) Skipping guest access because error %@ occurred when fetching guest pin codes", v4, v5, v6, v7, 2u);
}

void sub_100065F18(const char *a1, NSObject *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", (uint8_t *)&v4, 0xCu);
}

void sub_100065FB0(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[HSPCFaceRecognitionViewController initWithCoordinator:config:]_block_invoke_2";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v2, 0x16u);
}

void sub_10006603C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Footer link pressed w/ url intention but no url found", v1, 2u);
}

void sub_100066080()
{
  sub_100015E58();
  sub_100015E3C((void *)&_mh_execute_header, v0, v1, "Failed to fetch available Siri languages from HomeKit error %@. Applying default Onboarding selections with fallback values.", v2, v3, v4, v5, v6);
}

void sub_1000660E8(const char *a1, NSObject *a2)
{
  uint64_t v3 = NSStringFromSelector(a1);
  sub_100015E58();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", v4, 0xCu);
}

void sub_10006617C()
{
  sub_100015E58();
  sub_100015E3C((void *)&_mh_execute_header, v0, v1, "Failed to apply onboarding selections with error %@", v2, v3, v4, v5, v6);
}

void sub_1000661E4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to start extension manager: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006625C(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 containingAppBundleURL];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to create app record from containing app bundle URL %@: %@", (uint8_t *)&v6, 0x16u);
}

void sub_10006630C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 setupPayloadURL];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Detected an accessory that is representing itself as already paired.  URL: %@", (uint8_t *)&v4, 0xCu);
}

void sub_1000663A4()
{
  sub_100020FE8();
  sub_100020FFC((void *)&_mh_execute_header, v0, v1, "%s Failed to find ecosystem for containing app bundle URL: %@", v2, v3, v4, v5, 2u);
}

void sub_100066418(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100066490()
{
  sub_100020FE8();
  sub_100020FFC((void *)&_mh_execute_header, v0, v1, "%s Failed to stage CHIP accessory: %@", v2, v3, v4, v5, 2u);
}

void sub_100066504(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006657C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000665F4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100066670(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to cancel staging.  id: %@, error: %@.", (uint8_t *)&v4, 0x16u);
}

void sub_1000666FC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  uint64_t v5 = "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveDeviceCredential:forStagingRequestUUID:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s Rejecting device credential: %@ error: %@", (uint8_t *)&v4, 0x20u);
}

void sub_100066798()
{
  sub_100020FE8();
  sub_100020FFC((void *)&_mh_execute_header, v0, v1, "%s Failed to select Thread network from scan results: %@", v2, v3, v4, v5, 2u);
}

void sub_10006680C()
{
  sub_100020FE8();
  sub_100020FFC((void *)&_mh_execute_header, v0, v1, "%s Failed to select WiFi network from scan results: %@", v2, v3, v4, v5, 2u);
}

void sub_100066880(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000668EC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Accessory not found fatal timeout timer fired", v1, 2u);
}

void sub_100066930(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 40));
  sub_100022214();
  sub_10001112C((void *)&_mh_execute_header, v2, v3, "%@:%@ Failed to fetch Siri Voice Profile with error %@", v4, v5, v6, v7, v8);
}

void sub_1000669C4(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 48));
  sub_100022214();
  sub_10001112C((void *)&_mh_execute_header, v2, v3, "%@:%@ Failed to fetch Siri Voice Profile with error %@", v4, v5, v6, v7, v8);
}

void sub_100066A5C(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 138412802;
  uint64_t v5 = v3;
  __int16 v6 = 2080;
  uint64_t v7 = "-[HSPCWalletKeyExpressModeViewController initWithCoordinator:config:]_block_invoke";
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "(%@:%s) canEvaluatePolicy is NO. error:%@", (uint8_t *)&v4, 0x20u);
}

void sub_100066AFC(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 textFieldText];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Invalid setup code or user canceled custom commissioning flow alert. setupCode %@, error %@", (uint8_t *)&v6, 0x16u);
}

void sub_100066BAC(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  sub_10002B944((void *)&_mh_execute_header, a2, a3, "Invalid name. Tried %@, conflicts with %@", (uint8_t *)&v5);
}

void sub_100066C2C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  sub_10002B944((void *)&_mh_execute_header, a3, (uint64_t)a3, "Error applying room: %@ | %@", (uint8_t *)&v4);
}

void sub_100066CB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100066CE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100066D20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100066D58()
{
  sub_10002B8E8();
  sub_10002B908((void *)&_mh_execute_header, v0, v1, "Unable to apply accessory level name: %@ to accessory %@ | %@");
}

void sub_100066DC4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error naming Television primary service: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100066E3C()
{
  sub_10002B8E8();
  sub_10002B908((void *)&_mh_execute_header, v0, v1, "Unable to apply primary service level name: %@ to accessory %@ | %@");
}

void sub_100066EA8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  sub_10002B944((void *)&_mh_execute_header, a3, (uint64_t)a3, "Updating date added failed with %@ for %@", (uint8_t *)&v4);
}

void sub_100066F2C(void *a1, void *a2, NSObject *a3)
{
  int v5 = 136315650;
  __int16 v6 = "+[HSSetupStateMachineConfiguration(Helpers) configureServices:withNames:]";
  __int16 v7 = 2048;
  id v8 = [a1 count];
  __int16 v9 = 2048;
  id v10 = [a2 count];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s passed different count services [%ld] and names [%ld]", (uint8_t *)&v5, 0x20u);
}

void sub_100066FEC(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 136315394;
  int v4 = "+[HSSetupStateMachineConfiguration(Helpers) writeVisibilityState:toInputSourceService:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  sub_10002B944((void *)&_mh_execute_header, a2, a3, "%s: currentVisibilityCharacteristic is nil on service: %@.  skipping write", (uint8_t *)&v3);
}

void sub_100067070()
{
  sub_10002B8E8();
  sub_10002B908((void *)&_mh_execute_header, v0, v1, "Error writing targetVisibilityState: %@ to service: %@ error: %@");
}

void sub_1000670DC(uint64_t a1, NSObject *a2)
{
  int v3 = [*(id *)(a1 + 32) hf_prettyDescription];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Identify succeeded for accessory %@", (uint8_t *)&v4, 0xCu);
}

void sub_100067178(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) hf_prettyDescription];
  sub_10002DD3C((void *)&_mh_execute_header, v2, v3, "Identify failed for accessory %@ with error %@", v4, v5, v6, v7, 2u);
}

void sub_10006721C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100067254()
{
  int v1 = 136315394;
  uint64_t v2 = "-[PRXCardContentViewController(HSAdditions) handleButtonDirectiveFuture:target:]_block_invoke";
  sub_10002DD5C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: %@", (uint8_t *)&v1, 0x16u);
}

void sub_1000672D8(int a1, SEL aSelector)
{
  uint64_t v2 = NSStringFromSelector(aSelector);
  sub_10002DD5C();
  sub_10002DD3C((void *)&_mh_execute_header, v3, v4, "Did not receive a future.  target (%@) action %@", v5, v6, v7, v8, 2u);
}

void sub_100067374(int a1, SEL aSelector)
{
  uint64_t v2 = NSStringFromSelector(aSelector);
  sub_10002DD5C();
  sub_10002DD3C((void *)&_mh_execute_header, v3, v4, "target (%@) does not respond to selector (%@)", v5, v6, v7, v8, 2u);
}

void sub_100067410(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10002B928((void *)&_mh_execute_header, a1, a3, "Action returned a non valid object.  It should return NSNumber wrapping HSSetupButtonActionDirective", a5, a6, a7, a8, 0);
}

void sub_100067448(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100067480(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to resolve linked application", v1, 2u);
}

void sub_1000674C4(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) itemDictionary];
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to launch App Store for AirportUtility (error: %@): lookup returned %@", (uint8_t *)&v5, 0x16u);
}

void sub_100067574(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *SiriUICoreLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"HSPCSiriSetupViewController.m" lineNumber:29 description:@"%s" *a1];

  __break(1u);
}

void sub_1000675F4()
{
  os_log_t v0 = +[NSAssertionHandler currentHandler];
  int v1 = +[NSString stringWithUTF8String:"Class getSUICOrbViewClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"HSPCSiriSetupViewController.m" lineNumber:30 description:@"Unable to find class %s" "SUICOrbView"];

  __break(1u);
}

void sub_100067670(uint64_t a1, void *a2, NSObject *a3)
{
  int v5 = [a2 config];
  uint64_t v6 = [v5 home];
  int v7 = 136315650;
  uint64_t v8 = "-[HSPCWalletKeyUWBViewController _updateHasOnboardedForWalletKey:]_block_invoke";
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint8_t v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Received error %@ when trying to set dismissedWalletKeyUWBUnlockOnboarding flag for home %@", (uint8_t *)&v7, 0x20u);
}

void sub_100067744(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[HSProxCardCoordinator updateAccessoriesPendingConfiguration:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Expecting at least 1 accessory in function %s", (uint8_t *)&v1, 0xCu);
}

void sub_1000677C8(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[HSProxCardCoordinator updateAccessoriesPendingConfiguration:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid mode to access function %s", (uint8_t *)&v1, 0xCu);
}

void sub_10006784C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  int v5 = "-[HSProxCardCoordinator _generateNextStepWithActiveTuple:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s clearing pendingConfigurationIdentifier with updatePendingConfigurationIdentifier for accessory %@ failed: %@", (uint8_t *)&v4, 0x20u);
}

void sub_1000678E8(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[HSProxCardCoordinator nextViewControllerWithTarget:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s Unable to determine the next view controller: %@", (uint8_t *)&v2, 0x16u);
}

void sub_100067974(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  int v6 = 136316162;
  uint64_t v7 = "-[HSProxCardCoordinator dismissProxCardFlowAfterExecuting:]_block_invoke";
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  __int16 v10 = 2112;
  uint64_t v11 = v4;
  __int16 v12 = 2112;
  uint64_t v13 = v5;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s updatePendingConfigurationIdentifier for accessory %@ with identifier {from: %@, to: %@} failed: %@", (uint8_t *)&v6, 0x34u);
}

void sub_100067A24(void *a1, uint64_t a2, NSObject *a3)
{
  int v6 = [a1 activeTuple];
  uint64_t v7 = [a1 setupAccessoryDescription];
  __int16 v8 = [a1 setupCode];
  int v9 = 136316418;
  __int16 v10 = "-[HSProxCardCoordinator resetForRetry]";
  __int16 v11 = 2112;
  __int16 v12 = v6;
  __int16 v13 = 2112;
  __int16 v14 = v7;
  __int16 v15 = 2112;
  long long v16 = v8;
  __int16 v17 = 2048;
  id v18 = [a1 accessoryCommunicationProtocol];
  __int16 v19 = 2112;
  uint64_t v20 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%s tuple %@, setupAccessoryDescription %@, setupCode %@, accessoryCommunicationProtocol %ld, stateMachine %@", (uint8_t *)&v9, 0x3Eu);
}

void sub_100067B3C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Ignoring 'HomeUIService resigned active' error (HMErrorCodeOperationCancelled) because homed handles it for us by failing the pairing operation.", v1, 2u);
}

void sub_100067B80(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@ error retrieving setup string %@", (uint8_t *)&v6, 0x16u);
}

void sub_100067C34(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) setupAccessoryDescription];
  uint64_t v3 = [*(id *)(a1 + 32) discoveredAccessory];
  sub_100040CB8();
  sub_10001114C((void *)&_mh_execute_header, v4, v5, "%s Matter - Got no payload - [ setupAccessoryDescription:%@, discoveredAccessory:%@, setupCode:%@, result:%@]", v6, v7, v8, v9, 2u);
}

void sub_100067CF8(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) setupAccessoryDescription];
  uint64_t v3 = [*(id *)(a1 + 32) discoveredAccessory];
  sub_100040CB8();
  sub_10001114C((void *)&_mh_execute_header, v4, v5, "%s Invalid Setup Code - [ setupAccessoryDescription:%@, discoveredAccessory:%@, setupCode:%@, error:%@ ]", v6, v7, v8, v9, 2u);
}

void sub_100067DBC(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[HUPRXItemModuleTableViewController itemManagerDidFinishUpdate:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s invalid parent view controller", (uint8_t *)&v1, 0xCu);
}

void sub_100067E40(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "HomeUIService backgroundTask expired!", v1, 2u);
}

void sub_100067E84()
{
  v1[0] = 136315394;
  sub_100020FE8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s failed to get bluetooth powerState: %@", (uint8_t *)v1, 0x16u);
}

void sub_100067F04()
{
  v1[0] = 136315394;
  sub_100020FE8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s failed to set bluetooth powerState: %@", (uint8_t *)v1, 0x16u);
}

void sub_100067F84()
{
  int v2 = 136315650;
  sub_100047444();
  sub_100047468((void *)&_mh_execute_header, v0, v1, "%s failed to toggle wifi in control center (autoJoin - [%d]) : %@", v2);
}

void sub_100067FF8()
{
  int v2 = 136315650;
  sub_100047444();
  sub_100047468((void *)&_mh_execute_header, v0, v1, "%s failed to set wifi powerState (powerState - [%d]) : %@", v2);
}

void sub_10006806C(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[HSSetupStateMachineCHIPPartnerEcosystem stepFollowingStep:withConfiguration:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s Failed to find an index for the previous step in our sequence. Will progress to Error State", (uint8_t *)&v1, 0xCu);
}

void sub_1000680F0(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[HSSetupStateMachineCHIPPartnerEcosystem stepFollowingStep:withConfiguration:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s Failed to find the next step for setup flow", (uint8_t *)&v1, 0xCu);
}

void sub_100068174(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000681AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000681E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100068250(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000682C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000682F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100068364(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error setting associated type: %@.  Continuing regardless", (uint8_t *)&v4, 0xCu);
}

void sub_1000683FC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@ error %@", (uint8_t *)&v4, 0x16u);
}

void sub_100068488(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100068500(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100068578(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[HSProximityCardHostViewController _refreshHomeGraphWithCompletion:]_block_invoke";
  __int16 v4 = 1024;
  int v5 = 116;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s : %d unable to fetch all homes. Error: %@", (uint8_t *)&v2, 0x1Cu);
}

void sub_100068614()
{
  v1[0] = 136315394;
  sub_100020FE8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s failed to initialize setup accessory description from user info: %@", (uint8_t *)v1, 0x16u);
}

void sub_100068694(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136315394;
  __int16 v4 = "-[HSProximityCardHostViewController configureWithContext:completion:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "(%s) Aborting because there are no accessories. userInfo %@", (uint8_t *)&v3, 0x16u);
}

void sub_100068724(void *a1)
{
  int v1 = [a1 setupAccessoryDescription];
  sub_100020FE8();
  sub_10001112C((void *)&_mh_execute_header, v2, v3, "%s called to set up a new accessory but we already have an HMSetupAccessoryDescription.  Treating this as a duplicate call from homed and ignoring.  Previous description: %@, new description: %@", v4, v5, v6, v7, 2u);
}

void sub_1000687CC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 resumeSetupHomeUUIDString];
  v4[0] = 136315394;
  sub_100020FE8();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s called to set up a new accessory but we have a resume setup UUID %@, ignoring", (uint8_t *)v4, 0x16u);
}

void sub_100068870(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000688E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100068960(uint64_t a1, void *a2)
{
  [a2 popupType];
  sub_1000516E8();
  sub_10001112C((void *)&_mh_execute_header, v2, v3, "Unhandled popupType - [%@ pairingPopupDidFinish:%@ pairingPopup.popupType %lu]", v4, v5, v6, v7, v8);
}

void sub_1000689EC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [*(id *)(a2 + 32) setupAccessoryDescription];
  int v6 = 136315906;
  uint64_t v7 = "-[HSProximityCardHostViewController _cleanup]_block_invoke";
  __int16 v8 = 1024;
  int v9 = 715;
  __int16 v10 = 2112;
  uint64_t v11 = a1;
  __int16 v12 = 2112;
  __int16 v13 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s : %d error: %@, setupAccessoryDescription %@", (uint8_t *)&v6, 0x26u);
}

void sub_100068AC0(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to identify %@ : %@", (uint8_t *)&v4, 0x16u);
}

void sub_100068B4C(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 serviceNames];
  int v6 = 134218240;
  uint64_t v7 = a2;
  __int16 v8 = 2048;
  id v9 = [v5 count];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Well this isn't right, textfield is tagged with an invalid row tag: %ld, totalRows: %ld", (uint8_t *)&v6, 0x16u);
}

void sub_100068C00(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100068C6C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100068CD8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100068D44(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "HSCHIPPartnerHomeProvider asked for Homes, but no matter device setup request exists", v1, 2u);
}

void sub_100068D88(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Attempting to load rooms for a nil home", v1, 2u);
}

void sub_100068DCC(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Attempting to load rooms for a nil ecosystem", v1, 2u);
}

void sub_100068E10()
{
  sub_10005E5B0();
  sub_10005E59C();
  sub_10002B908((void *)&_mh_execute_header, v0, v1, "(%@:%s) Error %@ occurred when creating PKSerializedDataAccessor");
}

void sub_100068E84()
{
  sub_10005E5C4();
  sub_10005E59C();
  sub_10002B908((void *)&_mh_execute_header, v0, v1, "(%@:%s) Error %@ occurred when fetching available wallet key encoded pass data");
}

void sub_100068EFC()
{
  sub_10005E5C4();
  sub_10005E59C();
  sub_10002B908((void *)&_mh_execute_header, v0, v1, "(%@:%s) Error %@ occurred when fetching existing wallet key encoded pass data");
}

void sub_100068F74()
{
  sub_10005E5B0();
  uint64_t v2 = "-[HSPCWalletKeyViewController _setupWalletAppIconImageView]";
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "(%@:%s) Should not set up wallet app icon image view when card image view hasn't been populated yet.", v1, 0x16u);
}

void sub_100068FF4()
{
  sub_10005E5B0();
  uint64_t v2 = "-[HSPCWalletKeyViewController commitConfiguration]_block_invoke";
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "(%@:%s) Continuing to next step for iPad even though error is HMHomeAddWalletKeyErrorCodeWalletAppDeleted", v1, 0x16u);
}

void sub_100069074()
{
  sub_10005E5B0();
  sub_10005E59C();
  sub_10002B908((void *)&_mh_execute_header, v0, v1, "(%@:%s) Fetched %@ for add wallet key error for current device");
}

void sub_1000690E8()
{
  sub_10005E5B0();
  sub_10005E59C();
  sub_10002B908((void *)&_mh_execute_header, v0, v1, "(%@:%s) Error occurred when user tapped Continue button: %@");
}

void sub_10006915C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[HSAccessoryPairingFuture initWithPairingContext:discoveredAccessory:accessoryAlreadyStaged:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s immediately erroring out due to parsed error: %@", (uint8_t *)&v2, 0x16u);
}

void sub_1000691E8(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 pairingController];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Cancelling the pairing controller (%@) due to the external unrecoverable error %@.", (uint8_t *)&v6, 0x16u);
}

void sub_100069298(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 error];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Either unable to parse the HMSetupAccessororyPayload or parsed an error from it: %@.  Immediately showing error screen", (uint8_t *)&v4, 0xCu);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

uint64_t HFForceCameraLegacyCodeURLString()
{
  return _HFForceCameraLegacyCodeURLString();
}

uint64_t HFForceCameraQRCodeURLString()
{
  return _HFForceCameraQRCodeURLString();
}

uint64_t HFForceNFCURLString()
{
  return _HFForceNFCURLString();
}

uint64_t HFLocalizedCategoryOrPrimaryServiceTypeString()
{
  return _HFLocalizedCategoryOrPrimaryServiceTypeString();
}

uint64_t HFLocalizedString()
{
  return _HFLocalizedString();
}

uint64_t HFLocalizedStringWithFormat()
{
  return _HFLocalizedStringWithFormat();
}

uint64_t HFLocalizedWiFiStringKeyForKey()
{
  return _HFLocalizedWiFiStringKeyForKey();
}

uint64_t HFLogForCategory()
{
  return _HFLogForCategory();
}

uint64_t HMHomeAddWalletKeyOptionsDescription()
{
  return _HMHomeAddWalletKeyOptionsDescription();
}

uint64_t HMSetupAccessoryProgressAsString()
{
  return _HMSetupAccessoryProgressAsString();
}

uint64_t HMSiriEndpointOnboardingResultAsString()
{
  return _HMSiriEndpointOnboardingResultAsString();
}

uint64_t HUDefaultSizeForIconSize()
{
  return _HUDefaultSizeForIconSize();
}

uint64_t HUImageNamed()
{
  return _HUImageNamed();
}

uint64_t HULocalizedBiometryString()
{
  return _HULocalizedBiometryString();
}

uint64_t HULocalizedCategoryOrPrimaryServiceTypeStringWithFormat()
{
  return _HULocalizedCategoryOrPrimaryServiceTypeStringWithFormat();
}

uint64_t HULocalizedSiriTriggerPhrase()
{
  return _HULocalizedSiriTriggerPhrase();
}

uint64_t HULocalizedString()
{
  return _HULocalizedString();
}

uint64_t HULocalizedStringWithDefaultValue()
{
  return _HULocalizedStringWithDefaultValue();
}

uint64_t HULocalizedStringWithFormat()
{
  return _HULocalizedStringWithFormat();
}

uint64_t HULocalizedWiFiString()
{
  return _HULocalizedWiFiString();
}

uint64_t HURoundToScreenScale()
{
  return _HURoundToScreenScale();
}

uint64_t HUSiriLocalizedString()
{
  return _HUSiriLocalizedString();
}

uint64_t HUViewSizeSubclassForViewSize()
{
  return _HUViewSizeSubclassForViewSize();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NACGFloatGreaterThanFloat()
{
  return _NACGFloatGreaterThanFloat();
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSStringFromBOOL()
{
  return _NSStringFromBOOL();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
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

{
}

{
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return _sel_isEqual(lhs, rhs);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_PINCodeLengthMax(void *a1, const char *a2, ...)
{
  return [a1 PINCodeLengthMax];
}

id objc_msgSend_PINCodeLengthMin(void *a1, const char *a2, ...)
{
  return [a1 PINCodeLengthMin];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__addInterruptionLabel(void *a1, const char *a2, ...)
{
  return [a1 _addInterruptionLabel];
}

id objc_msgSend__addWalletKeyWithExpressMode(void *a1, const char *a2, ...)
{
  return [a1 _addWalletKeyWithExpressMode];
}

id objc_msgSend__addWalletKeyWithUWB(void *a1, const char *a2, ...)
{
  return [a1 _addWalletKeyWithUWB];
}

id objc_msgSend__addWalletKeyWithoutExpressMode(void *a1, const char *a2, ...)
{
  return [a1 _addWalletKeyWithoutExpressMode];
}

id objc_msgSend__addWalletKeyWithoutUWB(void *a1, const char *a2, ...)
{
  return [a1 _addWalletKeyWithoutUWB];
}

id objc_msgSend__applyOnboardingSelections(void *a1, const char *a2, ...)
{
  return [a1 _applyOnboardingSelections];
}

id objc_msgSend__bridgedConfigurationOrdinalityString(void *a1, const char *a2, ...)
{
  return [a1 _bridgedConfigurationOrdinalityString];
}

id objc_msgSend__checkForiCloudSiriEnabledAndEnableVoiceRecognition(void *a1, const char *a2, ...)
{
  return [a1 _checkForiCloudSiriEnabledAndEnableVoiceRecognition];
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return [a1 _cleanup];
}

id objc_msgSend__computeDenylistedAccessoryCategories(void *a1, const char *a2, ...)
{
  return [a1 _computeDenylistedAccessoryCategories];
}

id objc_msgSend__continueSetup(void *a1, const char *a2, ...)
{
  return [a1 _continueSetup];
}

id objc_msgSend__deviceIsOnAMultiUserLanguage(void *a1, const char *a2, ...)
{
  return [a1 _deviceIsOnAMultiUserLanguage];
}

id objc_msgSend__didPRXActuallyDismiss(void *a1, const char *a2, ...)
{
  return [a1 _didPRXActuallyDismiss];
}

id objc_msgSend__disableSiri(void *a1, const char *a2, ...)
{
  return [a1 _disableSiri];
}

id objc_msgSend__disableVoiceRecognition(void *a1, const char *a2, ...)
{
  return [a1 _disableVoiceRecognition];
}

id objc_msgSend__discoveredAccessoryItemComparator(void *a1, const char *a2, ...)
{
  return [a1 _discoveredAccessoryItemComparator];
}

id objc_msgSend__dismissSetup(void *a1, const char *a2, ...)
{
  return [a1 _dismissSetup];
}

id objc_msgSend__enableExpressModeButtonTapped(void *a1, const char *a2, ...)
{
  return [a1 _enableExpressModeButtonTapped];
}

id objc_msgSend__enableVoiceRecognition(void *a1, const char *a2, ...)
{
  return [a1 _enableVoiceRecognition];
}

id objc_msgSend__enableVoiceRecognitionAndCommitConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _enableVoiceRecognitionAndCommitConfiguration];
}

id objc_msgSend__externalSystemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 _externalSystemGrayColor];
}

id objc_msgSend__generateNextStep(void *a1, const char *a2, ...)
{
  return [a1 _generateNextStep];
}

id objc_msgSend__getBundleIDForWalletAppIcon(void *a1, const char *a2, ...)
{
  return [a1 _getBundleIDForWalletAppIcon];
}

id objc_msgSend__handleOverrideSetupCodeIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _handleOverrideSetupCodeIfNeeded];
}

id objc_msgSend__isShowingNFCInstructions(void *a1, const char *a2, ...)
{
  return [a1 _isShowingNFCInstructions];
}

id objc_msgSend__isUserListEmpty(void *a1, const char *a2, ...)
{
  return [a1 _isUserListEmpty];
}

id objc_msgSend__isVoiceRecognitionEnabled(void *a1, const char *a2, ...)
{
  return [a1 _isVoiceRecognitionEnabled];
}

id objc_msgSend__launchSiriPrivacySheet(void *a1, const char *a2, ...)
{
  return [a1 _launchSiriPrivacySheet];
}

id objc_msgSend__loadCameraReader(void *a1, const char *a2, ...)
{
  return [a1 _loadCameraReader];
}

id objc_msgSend__logDetailedServices(void *a1, const char *a2, ...)
{
  return [a1 _logDetailedServices];
}

id objc_msgSend__lookUpSoftwareAndUpdateUI(void *a1, const char *a2, ...)
{
  return [a1 _lookUpSoftwareAndUpdateUI];
}

id objc_msgSend__moveToNextStep(void *a1, const char *a2, ...)
{
  return [a1 _moveToNextStep];
}

id objc_msgSend__moveToNextViewController(void *a1, const char *a2, ...)
{
  return [a1 _moveToNextViewController];
}

id objc_msgSend__nfcCodeImageAssetForCurrentTraitEnvironment(void *a1, const char *a2, ...)
{
  return [a1 _nfcCodeImageAssetForCurrentTraitEnvironment];
}

id objc_msgSend__notifyRemoteReadyToDisplayIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _notifyRemoteReadyToDisplayIfNeeded];
}

id objc_msgSend__presentSoftwareUpdateAlertForAirportExpress(void *a1, const char *a2, ...)
{
  return [a1 _presentSoftwareUpdateAlertForAirportExpress];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__reuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _reuseIdentifier];
}

id objc_msgSend__scanCodeImageAssetForCurrentTraitEnvironment(void *a1, const char *a2, ...)
{
  return [a1 _scanCodeImageAssetForCurrentTraitEnvironment];
}

id objc_msgSend__setupConstraints(void *a1, const char *a2, ...)
{
  return [a1 _setupConstraints];
}

id objc_msgSend__setupFontsForCurrentTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 _setupFontsForCurrentTraitCollection];
}

id objc_msgSend__shouldEnableShareSiriAnalytics(void *a1, const char *a2, ...)
{
  return [a1 _shouldEnableShareSiriAnalytics];
}

id objc_msgSend__shouldIncludeTapToUnlock(void *a1, const char *a2, ...)
{
  return [a1 _shouldIncludeTapToUnlock];
}

id objc_msgSend__shouldShowSingleContinueButton(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowSingleContinueButton];
}

id objc_msgSend__shouldStackIcons(void *a1, const char *a2, ...)
{
  return [a1 _shouldStackIcons];
}

id objc_msgSend__siriEnabledOnCurrentDevice(void *a1, const char *a2, ...)
{
  return [a1 _siriEnabledOnCurrentDevice];
}

id objc_msgSend__startReaders(void *a1, const char *a2, ...)
{
  return [a1 _startReaders];
}

id objc_msgSend__stopReaders(void *a1, const char *a2, ...)
{
  return [a1 _stopReaders];
}

id objc_msgSend__tips(void *a1, const char *a2, ...)
{
  return [a1 _tips];
}

id objc_msgSend__turnOnUnlockOnApproach(void *a1, const char *a2, ...)
{
  return [a1 _turnOnUnlockOnApproach];
}

id objc_msgSend__unloadCameraReader(void *a1, const char *a2, ...)
{
  return [a1 _unloadCameraReader];
}

id objc_msgSend__updateOnboardingFlags(void *a1, const char *a2, ...)
{
  return [a1 _updateOnboardingFlags];
}

id objc_msgSend__updatePINCodesForAllUsers(void *a1, const char *a2, ...)
{
  return [a1 _updatePINCodesForAllUsers];
}

id objc_msgSend__updatePasscodeEntryView(void *a1, const char *a2, ...)
{
  return [a1 _updatePasscodeEntryView];
}

id objc_msgSend__updateScanCodeIcon(void *a1, const char *a2, ...)
{
  return [a1 _updateScanCodeIcon];
}

id objc_msgSend__updateScrollingAttributes(void *a1, const char *a2, ...)
{
  return [a1 _updateScrollingAttributes];
}

id objc_msgSend__updateSubtitle(void *a1, const char *a2, ...)
{
  return [a1 _updateSubtitle];
}

id objc_msgSend__updateUseSiriButtonEnabledState(void *a1, const char *a2, ...)
{
  return [a1 _updateUseSiriButtonEnabledState];
}

id objc_msgSend__updateViewControllers(void *a1, const char *a2, ...)
{
  return [a1 _updateViewControllers];
}

id objc_msgSend__updateWells(void *a1, const char *a2, ...)
{
  return [a1 _updateWells];
}

id objc_msgSend__voiceProfileCheckFuture(void *a1, const char *a2, ...)
{
  return [a1 _voiceProfileCheckFuture];
}

id objc_msgSend__wiFiInterfaceStatus(void *a1, const char *a2, ...)
{
  return [a1 _wiFiInterfaceStatus];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accessories(void *a1, const char *a2, ...)
{
  return [a1 accessories];
}

id objc_msgSend_accessoriesPendingConfiguration(void *a1, const char *a2, ...)
{
  return [a1 accessoriesPendingConfiguration];
}

id objc_msgSend_accessoriesToResumeSetup(void *a1, const char *a2, ...)
{
  return [a1 accessoriesToResumeSetup];
}

id objc_msgSend_accessory(void *a1, const char *a2, ...)
{
  return [a1 accessory];
}

id objc_msgSend_accessoryAlreadyAdded(void *a1, const char *a2, ...)
{
  return [a1 accessoryAlreadyAdded];
}

id objc_msgSend_accessoryBrowser(void *a1, const char *a2, ...)
{
  return [a1 accessoryBrowser];
}

id objc_msgSend_accessoryBrowsingManager(void *a1, const char *a2, ...)
{
  return [a1 accessoryBrowsingManager];
}

id objc_msgSend_accessoryCategoryOrPrimaryServiceType(void *a1, const char *a2, ...)
{
  return [a1 accessoryCategoryOrPrimaryServiceType];
}

id objc_msgSend_accessoryCommunicationProtocol(void *a1, const char *a2, ...)
{
  return [a1 accessoryCommunicationProtocol];
}

id objc_msgSend_accessoryDiscoveryFatalTimeout(void *a1, const char *a2, ...)
{
  return [a1 accessoryDiscoveryFatalTimeout];
}

id objc_msgSend_accessoryDiscoverySoftTimeout(void *a1, const char *a2, ...)
{
  return [a1 accessoryDiscoverySoftTimeout];
}

id objc_msgSend_accessoryName(void *a1, const char *a2, ...)
{
  return [a1 accessoryName];
}

id objc_msgSend_accessoryNotFoundFatalTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 accessoryNotFoundFatalTimeoutTimer];
}

id objc_msgSend_accessoryNotFoundSoftTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 accessoryNotFoundSoftTimeoutTimer];
}

id objc_msgSend_accessoryPairingEventLoggerTimeHistogramBins(void *a1, const char *a2, ...)
{
  return [a1 accessoryPairingEventLoggerTimeHistogramBins];
}

id objc_msgSend_accessoryProtectionGroups(void *a1, const char *a2, ...)
{
  return [a1 accessoryProtectionGroups];
}

id objc_msgSend_accessorySettingsDataSource(void *a1, const char *a2, ...)
{
  return [a1 accessorySettingsDataSource];
}

id objc_msgSend_accessorySetupCoordinator(void *a1, const char *a2, ...)
{
  return [a1 accessorySetupCoordinator];
}

id objc_msgSend_accessoryUUID(void *a1, const char *a2, ...)
{
  return [a1 accessoryUUID];
}

id objc_msgSend_accessoryView(void *a1, const char *a2, ...)
{
  return [a1 accessoryView];
}

id objc_msgSend_actionButtons(void *a1, const char *a2, ...)
{
  return [a1 actionButtons];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activateIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 activateIfNeeded];
}

id objc_msgSend_activeTuple(void *a1, const char *a2, ...)
{
  return [a1 activeTuple];
}

id objc_msgSend_addedAccessory(void *a1, const char *a2, ...)
{
  return [a1 addedAccessory];
}

id objc_msgSend_addedAccessoryItem(void *a1, const char *a2, ...)
{
  return [a1 addedAccessoryItem];
}

id objc_msgSend_airplayIconView(void *a1, const char *a2, ...)
{
  return [a1 airplayIconView];
}

id objc_msgSend_airplayImageBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 airplayImageBackgroundView];
}

id objc_msgSend_airplayImageView(void *a1, const char *a2, ...)
{
  return [a1 airplayImageView];
}

id objc_msgSend_alertHostViewController(void *a1, const char *a2, ...)
{
  return [a1 alertHostViewController];
}

id objc_msgSend_allAccessories(void *a1, const char *a2, ...)
{
  return [a1 allAccessories];
}

id objc_msgSend_allAccessoryTuples(void *a1, const char *a2, ...)
{
  return [a1 allAccessoryTuples];
}

id objc_msgSend_allDisplayedItems(void *a1, const char *a2, ...)
{
  return [a1 allDisplayedItems];
}

id objc_msgSend_allHomesFuture(void *a1, const char *a2, ...)
{
  return [a1 allHomesFuture];
}

id objc_msgSend_allItems(void *a1, const char *a2, ...)
{
  return [a1 allItems];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allowHeySiri(void *a1, const char *a2, ...)
{
  return [a1 allowHeySiri];
}

id objc_msgSend_allowsRandomVoiceSelection(void *a1, const char *a2, ...)
{
  return [a1 allowsRandomVoiceSelection];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appBundleIdentifier];
}

id objc_msgSend_appBundleURL(void *a1, const char *a2, ...)
{
  return [a1 appBundleURL];
}

id objc_msgSend_appIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appIdentifier];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_applicationRecord(void *a1, const char *a2, ...)
{
  return [a1 applicationRecord];
}

id objc_msgSend_areAllServicesFrozen(void *a1, const char *a2, ...)
{
  return [a1 areAllServicesFrozen];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_artistName(void *a1, const char *a2, ...)
{
  return [a1 artistName];
}

id objc_msgSend_assistantIsEnabled(void *a1, const char *a2, ...)
{
  return [a1 assistantIsEnabled];
}

id objc_msgSend_attributedSubtitle(void *a1, const char *a2, ...)
{
  return [a1 attributedSubtitle];
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return [a1 attributedText];
}

id objc_msgSend_audioAnalysisClassifierOptions(void *a1, const char *a2, ...)
{
  return [a1 audioAnalysisClassifierOptions];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentLocale];
}

id objc_msgSend_availableSiriLanguageValues(void *a1, const char *a2, ...)
{
  return [a1 availableSiriLanguageValues];
}

id objc_msgSend_backgroundTaskIdentifier(void *a1, const char *a2, ...)
{
  return [a1 backgroundTaskIdentifier];
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return [a1 backgroundView];
}

id objc_msgSend_bagSubProfile(void *a1, const char *a2, ...)
{
  return [a1 bagSubProfile];
}

id objc_msgSend_bagSubProfileVersion(void *a1, const char *a2, ...)
{
  return [a1 bagSubProfileVersion];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_beginningOfDocument(void *a1, const char *a2, ...)
{
  return [a1 beginningOfDocument];
}

id objc_msgSend_bluetoothController(void *a1, const char *a2, ...)
{
  return [a1 bluetoothController];
}

id objc_msgSend_bluetoothInterfaceStatus(void *a1, const char *a2, ...)
{
  return [a1 bluetoothInterfaceStatus];
}

id objc_msgSend_bodyTextView(void *a1, const char *a2, ...)
{
  return [a1 bodyTextView];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bridgedAccessories(void *a1, const char *a2, ...)
{
  return [a1 bridgedAccessories];
}

id objc_msgSend_bridgedAccessoryCategoryToArrayMap(void *a1, const char *a2, ...)
{
  return [a1 bridgedAccessoryCategoryToArrayMap];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return [a1 build];
}

id objc_msgSend_builder(void *a1, const char *a2, ...)
{
  return [a1 builder];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cameraContainerView(void *a1, const char *a2, ...)
{
  return [a1 cameraContainerView];
}

id objc_msgSend_cameraProfile(void *a1, const char *a2, ...)
{
  return [a1 cameraProfile];
}

id objc_msgSend_cameraProfiles(void *a1, const char *a2, ...)
{
  return [a1 cameraProfiles];
}

id objc_msgSend_cameraReader(void *a1, const char *a2, ...)
{
  return [a1 cameraReader];
}

id objc_msgSend_cameraReaderIsRunning(void *a1, const char *a2, ...)
{
  return [a1 cameraReaderIsRunning];
}

id objc_msgSend_canAddWalletKey(void *a1, const char *a2, ...)
{
  return [a1 canAddWalletKey];
}

id objc_msgSend_canContinue(void *a1, const char *a2, ...)
{
  return [a1 canContinue];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelPairing(void *a1, const char *a2, ...)
{
  return [a1 cancelPairing];
}

id objc_msgSend_cancelStagingForCHIPPairing(void *a1, const char *a2, ...)
{
  return [a1 cancelStagingForCHIPPairing];
}

id objc_msgSend_cardImageView(void *a1, const char *a2, ...)
{
  return [a1 cardImageView];
}

id objc_msgSend_cardTime(void *a1, const char *a2, ...)
{
  return [a1 cardTime];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_categoryType(void *a1, const char *a2, ...)
{
  return [a1 categoryType];
}

id objc_msgSend_cellConfiguration(void *a1, const char *a2, ...)
{
  return [a1 cellConfiguration];
}

id objc_msgSend_cellContentViewBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 cellContentViewBackgroundColor];
}

id objc_msgSend_cellSizeSubclass(void *a1, const char *a2, ...)
{
  return [a1 cellSizeSubclass];
}

id objc_msgSend_centerContentView(void *a1, const char *a2, ...)
{
  return [a1 centerContentView];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_characteristicTypesToPreload(void *a1, const char *a2, ...)
{
  return [a1 characteristicTypesToPreload];
}

id objc_msgSend_chipDevicePairingUUID(void *a1, const char *a2, ...)
{
  return [a1 chipDevicePairingUUID];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_codeInputMethod(void *a1, const char *a2, ...)
{
  return [a1 codeInputMethod];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return [a1 collectionView];
}

id objc_msgSend_commissioningID(void *a1, const char *a2, ...)
{
  return [a1 commissioningID];
}

id objc_msgSend_commitConfiguration(void *a1, const char *a2, ...)
{
  return [a1 commitConfiguration];
}

id objc_msgSend_commitInProgress(void *a1, const char *a2, ...)
{
  return [a1 commitInProgress];
}

id objc_msgSend_commitItem(void *a1, const char *a2, ...)
{
  return [a1 commitItem];
}

id objc_msgSend_commitSelectedItems(void *a1, const char *a2, ...)
{
  return [a1 commitSelectedItems];
}

id objc_msgSend_communicationProtocol(void *a1, const char *a2, ...)
{
  return [a1 communicationProtocol];
}

id objc_msgSend_completedInfo(void *a1, const char *a2, ...)
{
  return [a1 completedInfo];
}

id objc_msgSend_completionHandlerAdapter(void *a1, const char *a2, ...)
{
  return [a1 completionHandlerAdapter];
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return [a1 config];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configurationObjectClass(void *a1, const char *a2, ...)
{
  return [a1 configurationObjectClass];
}

id objc_msgSend_configurationState(void *a1, const char *a2, ...)
{
  return [a1 configurationState];
}

id objc_msgSend_configurators(void *a1, const char *a2, ...)
{
  return [a1 configurators];
}

id objc_msgSend_configureAccessoryDateAdded(void *a1, const char *a2, ...)
{
  return [a1 configureAccessoryDateAdded];
}

id objc_msgSend_configureAccessoryName(void *a1, const char *a2, ...)
{
  return [a1 configureAccessoryName];
}

id objc_msgSend_configureCard(void *a1, const char *a2, ...)
{
  return [a1 configureCard];
}

id objc_msgSend_configureRoom(void *a1, const char *a2, ...)
{
  return [a1 configureRoom];
}

id objc_msgSend_configuredName(void *a1, const char *a2, ...)
{
  return [a1 configuredName];
}

id objc_msgSend_constraintSet(void *a1, const char *a2, ...)
{
  return [a1 constraintSet];
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return [a1 constraints];
}

id objc_msgSend_constraintsSet(void *a1, const char *a2, ...)
{
  return [a1 constraintsSet];
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return [a1 containerView];
}

id objc_msgSend_containingAppBundleURL(void *a1, const char *a2, ...)
{
  return [a1 containingAppBundleURL];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_contentVC(void *a1, const char *a2, ...)
{
  return [a1 contentVC];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_continueAction(void *a1, const char *a2, ...)
{
  return [a1 continueAction];
}

id objc_msgSend_coordinator(void *a1, const char *a2, ...)
{
  return [a1 coordinator];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentAssistant(void *a1, const char *a2, ...)
{
  return [a1 currentAssistant];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentPairing(void *a1, const char *a2, ...)
{
  return [a1 currentPairing];
}

id objc_msgSend_currentStep(void *a1, const char *a2, ...)
{
  return [a1 currentStep];
}

id objc_msgSend_currentStepStartTime(void *a1, const char *a2, ...)
{
  return [a1 currentStepStartTime];
}

id objc_msgSend_currentTitle(void *a1, const char *a2, ...)
{
  return [a1 currentTitle];
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 currentTraitCollection];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return [a1 currentUser];
}

id objc_msgSend_currentUserPinCode(void *a1, const char *a2, ...)
{
  return [a1 currentUserPinCode];
}

id objc_msgSend_currentViewController(void *a1, const char *a2, ...)
{
  return [a1 currentViewController];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 decimalDigitCharacterSet];
}

id objc_msgSend_decode(void *a1, const char *a2, ...)
{
  return [a1 decode];
}

id objc_msgSend_defaultAssociatedServiceType(void *a1, const char *a2, ...)
{
  return [a1 defaultAssociatedServiceType];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultConfiguration];
}

id objc_msgSend_defaultItemComparator(void *a1, const char *a2, ...)
{
  return [a1 defaultItemComparator];
}

id objc_msgSend_defaultName(void *a1, const char *a2, ...)
{
  return [a1 defaultName];
}

id objc_msgSend_defaultPrivateConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultPrivateConfiguration];
}

id objc_msgSend_defaultTextColor(void *a1, const char *a2, ...)
{
  return [a1 defaultTextColor];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delayedSetupCodeHandler(void *a1, const char *a2, ...)
{
  return [a1 delayedSetupCodeHandler];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_denylistedAccessoryCategories(void *a1, const char *a2, ...)
{
  return [a1 denylistedAccessoryCategories];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceActionType(void *a1, const char *a2, ...)
{
  return [a1 deviceActionType];
}

id objc_msgSend_deviceClassCode(void *a1, const char *a2, ...)
{
  return [a1 deviceClassCode];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didNotifyFinishLoading(void *a1, const char *a2, ...)
{
  return [a1 didNotifyFinishLoading];
}

id objc_msgSend_didShowCustomCommissioningFlowAlertIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 didShowCustomCommissioningFlowAlertIfNecessary];
}

id objc_msgSend_discoveredAccessory(void *a1, const char *a2, ...)
{
  return [a1 discoveredAccessory];
}

id objc_msgSend_discoveredAccessoryPickerViewControllerDelegate(void *a1, const char *a2, ...)
{
  return [a1 discoveredAccessoryPickerViewControllerDelegate];
}

id objc_msgSend_discoveredAccessoryToPair(void *a1, const char *a2, ...)
{
  return [a1 discoveredAccessoryToPair];
}

id objc_msgSend_discoveryDate(void *a1, const char *a2, ...)
{
  return [a1 discoveryDate];
}

id objc_msgSend_dismissButtonAction(void *a1, const char *a2, ...)
{
  return [a1 dismissButtonAction];
}

id objc_msgSend_dismissButtonBlock(void *a1, const char *a2, ...)
{
  return [a1 dismissButtonBlock];
}

id objc_msgSend_dismissFuture(void *a1, const char *a2, ...)
{
  return [a1 dismissFuture];
}

id objc_msgSend_dismissalType(void *a1, const char *a2, ...)
{
  return [a1 dismissalType];
}

id objc_msgSend_displayAutomaticUpdatesAlert(void *a1, const char *a2, ...)
{
  return [a1 displayAutomaticUpdatesAlert];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_ecosystemName(void *a1, const char *a2, ...)
{
  return [a1 ecosystemName];
}

id objc_msgSend_editButtonItem(void *a1, const char *a2, ...)
{
  return [a1 editButtonItem];
}

id objc_msgSend_enableBluetoothAndWiFiAlertController(void *a1, const char *a2, ...)
{
  return [a1 enableBluetoothAndWiFiAlertController];
}

id objc_msgSend_enabledServices(void *a1, const char *a2, ...)
{
  return [a1 enabledServices];
}

id objc_msgSend_enablementConfiguration(void *a1, const char *a2, ...)
{
  return [a1 enablementConfiguration];
}

id objc_msgSend_enablementFlowConfigurationProvider(void *a1, const char *a2, ...)
{
  return [a1 enablementFlowConfigurationProvider];
}

id objc_msgSend_endEditing(void *a1, const char *a2, ...)
{
  return [a1 endEditing];
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return [a1 endSession];
}

id objc_msgSend_engineOptions(void *a1, const char *a2, ...)
{
  return [a1 engineOptions];
}

id objc_msgSend_entitlementContext(void *a1, const char *a2, ...)
{
  return [a1 entitlementContext];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_existingRooms(void *a1, const char *a2, ...)
{
  return [a1 existingRooms];
}

id objc_msgSend_exitCardString(void *a1, const char *a2, ...)
{
  return [a1 exitCardString];
}

id objc_msgSend_expressEnablementConflictingPassDescription(void *a1, const char *a2, ...)
{
  return [a1 expressEnablementConflictingPassDescription];
}

id objc_msgSend_extensionMessenger(void *a1, const char *a2, ...)
{
  return [a1 extensionMessenger];
}

id objc_msgSend_externalizedContext(void *a1, const char *a2, ...)
{
  return [a1 externalizedContext];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return [a1 features];
}

id objc_msgSend_fetchFromAccessoryCache(void *a1, const char *a2, ...)
{
  return [a1 fetchFromAccessoryCache];
}

id objc_msgSend_fetchSupportedVoiceRecognitionLanguages(void *a1, const char *a2, ...)
{
  return [a1 fetchSupportedVoiceRecognitionLanguages];
}

id objc_msgSend_filter(void *a1, const char *a2, ...)
{
  return [a1 filter];
}

id objc_msgSend_finishWithNoResult(void *a1, const char *a2, ...)
{
  return [a1 finishWithNoResult];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_footnoteLabel(void *a1, const char *a2, ...)
{
  return [a1 footnoteLabel];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_frozenServices(void *a1, const char *a2, ...)
{
  return [a1 frozenServices];
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return [a1 future];
}

id objc_msgSend_futureWithNoResult(void *a1, const char *a2, ...)
{
  return [a1 futureWithNoResult];
}

id objc_msgSend_globalAsyncScheduler(void *a1, const char *a2, ...)
{
  return [a1 globalAsyncScheduler];
}

id objc_msgSend_gridBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 gridBackgroundView];
}

id objc_msgSend_gridHeightConstraint(void *a1, const char *a2, ...)
{
  return [a1 gridHeightConstraint];
}

id objc_msgSend_gridViewController(void *a1, const char *a2, ...)
{
  return [a1 gridViewController];
}

id objc_msgSend_guestPinCodes(void *a1, const char *a2, ...)
{
  return [a1 guestPinCodes];
}

id objc_msgSend_guestsTableVC(void *a1, const char *a2, ...)
{
  return [a1 guestsTableVC];
}

id objc_msgSend_hasCompletedSiriSetup(void *a1, const char *a2, ...)
{
  return [a1 hasCompletedSiriSetup];
}

id objc_msgSend_hasOnboardedForAccessCode(void *a1, const char *a2, ...)
{
  return [a1 hasOnboardedForAccessCode];
}

id objc_msgSend_hasOnboardedForWalletKey(void *a1, const char *a2, ...)
{
  return [a1 hasOnboardedForWalletKey];
}

id objc_msgSend_hasOptedToHH2(void *a1, const char *a2, ...)
{
  return [a1 hasOptedToHH2];
}

id objc_msgSend_hasValidConstraints(void *a1, const char *a2, ...)
{
  return [a1 hasValidConstraints];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_hideActivityIndicator(void *a1, const char *a2, ...)
{
  return [a1 hideActivityIndicator];
}

id objc_msgSend_hmfUnspecifiedError(void *a1, const char *a2, ...)
{
  return [a1 hmfUnspecifiedError];
}

id objc_msgSend_home(void *a1, const char *a2, ...)
{
  return [a1 home];
}

id objc_msgSend_homeAppSuggestionVendor(void *a1, const char *a2, ...)
{
  return [a1 homeAppSuggestionVendor];
}

id objc_msgSend_homeHub2OnboardingURL(void *a1, const char *a2, ...)
{
  return [a1 homeHub2OnboardingURL];
}

id objc_msgSend_homeManager(void *a1, const char *a2, ...)
{
  return [a1 homeManager];
}

id objc_msgSend_homePodChimeFeature(void *a1, const char *a2, ...)
{
  return [a1 homePodChimeFeature];
}

id objc_msgSend_homeProvider(void *a1, const char *a2, ...)
{
  return [a1 homeProvider];
}

id objc_msgSend_homeUUID(void *a1, const char *a2, ...)
{
  return [a1 homeUUID];
}

id objc_msgSend_homes(void *a1, const char *a2, ...)
{
  return [a1 homes];
}

id objc_msgSend_horizontalLeadingMargin(void *a1, const char *a2, ...)
{
  return [a1 horizontalLeadingMargin];
}

id objc_msgSend_horizontalSpacing(void *a1, const char *a2, ...)
{
  return [a1 horizontalSpacing];
}

id objc_msgSend_horizontalTrailingMargin(void *a1, const char *a2, ...)
{
  return [a1 horizontalTrailingMargin];
}

id objc_msgSend_huisDismissDate(void *a1, const char *a2, ...)
{
  return [a1 huisDismissDate];
}

id objc_msgSend_huisLaunchDate(void *a1, const char *a2, ...)
{
  return [a1 huisLaunchDate];
}

id objc_msgSend_huisLaunchReason(void *a1, const char *a2, ...)
{
  return [a1 huisLaunchReason];
}

id objc_msgSend_huisLaunchType(void *a1, const char *a2, ...)
{
  return [a1 huisLaunchType];
}

id objc_msgSend_huisUserType(void *a1, const char *a2, ...)
{
  return [a1 huisUserType];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return [a1 iTunesMetadata];
}

id objc_msgSend_iconDescriptor(void *a1, const char *a2, ...)
{
  return [a1 iconDescriptor];
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return [a1 iconView];
}

id objc_msgSend_identify(void *a1, const char *a2, ...)
{
  return [a1 identify];
}

id objc_msgSend_identifyButton(void *a1, const char *a2, ...)
{
  return [a1 identifyButton];
}

id objc_msgSend_identifyPeopleFeature(void *a1, const char *a2, ...)
{
  return [a1 identifyPeopleFeature];
}

id objc_msgSend_idleTimerAssertion(void *a1, const char *a2, ...)
{
  return [a1 idleTimerAssertion];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageProperties(void *a1, const char *a2, ...)
{
  return [a1 imageProperties];
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return [a1 indexPathForSelectedRow];
}

id objc_msgSend_indexPathOfFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 indexPathOfFirstResponder];
}

id objc_msgSend_indexPathsForSelectedRows(void *a1, const char *a2, ...)
{
  return [a1 indexPathsForSelectedRows];
}

id objc_msgSend_initialHomePodChimeState(void *a1, const char *a2, ...)
{
  return [a1 initialHomePodChimeState];
}

id objc_msgSend_initialRowIndex(void *a1, const char *a2, ...)
{
  return [a1 initialRowIndex];
}

id objc_msgSend_inputLanguageCode(void *a1, const char *a2, ...)
{
  return [a1 inputLanguageCode];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interruptionLabel(void *a1, const char *a2, ...)
{
  return [a1 interruptionLabel];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_invitations(void *a1, const char *a2, ...)
{
  return [a1 invitations];
}

id objc_msgSend_isAnIPad(void *a1, const char *a2, ...)
{
  return [a1 isAnIPad];
}

id objc_msgSend_isAnIPhone(void *a1, const char *a2, ...)
{
  return [a1 isAnIPhone];
}

id objc_msgSend_isBridged(void *a1, const char *a2, ...)
{
  return [a1 isBridged];
}

id objc_msgSend_isCleaningUp(void *a1, const char *a2, ...)
{
  return [a1 isCleaningUp];
}

id objc_msgSend_isConfiguringLastAccessoryOfSameCategory(void *a1, const char *a2, ...)
{
  return [a1 isConfiguringLastAccessoryOfSameCategory];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_isEntitledForAll3rdPartyAccessoryTypes(void *a1, const char *a2, ...)
{
  return [a1 isEntitledForAll3rdPartyAccessoryTypes];
}

id objc_msgSend_isEntitledForHomeKitSPI(void *a1, const char *a2, ...)
{
  return [a1 isEntitledForHomeKitSPI];
}

id objc_msgSend_isEntitledForThirdPartyMatterSetupPayload(void *a1, const char *a2, ...)
{
  return [a1 isEntitledForThirdPartyMatterSetupPayload];
}

id objc_msgSend_isEntitledForThirdPartySetupAccessoryPayload(void *a1, const char *a2, ...)
{
  return [a1 isEntitledForThirdPartySetupAccessoryPayload];
}

id objc_msgSend_isExplicitContentAllowed(void *a1, const char *a2, ...)
{
  return [a1 isExplicitContentAllowed];
}

id objc_msgSend_isExpressEnabled(void *a1, const char *a2, ...)
{
  return [a1 isExpressEnabled];
}

id objc_msgSend_isFaceClassificationEnabled(void *a1, const char *a2, ...)
{
  return [a1 isFaceClassificationEnabled];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isFirstDetectedCard(void *a1, const char *a2, ...)
{
  return [a1 isFirstDetectedCard];
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 isFirstResponder];
}

id objc_msgSend_isHUISLaunchedByFirstParty(void *a1, const char *a2, ...)
{
  return [a1 isHUISLaunchedByFirstParty];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isHomePodChimeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isHomePodChimeEnabled];
}

id objc_msgSend_isIdentifyVoiceEnabled(void *a1, const char *a2, ...)
{
  return [a1 isIdentifyVoiceEnabled];
}

id objc_msgSend_isInSetupContext(void *a1, const char *a2, ...)
{
  return [a1 isInSetupContext];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_isInternalTest(void *a1, const char *a2, ...)
{
  return [a1 isInternalTest];
}

id objc_msgSend_isLaunchedToSetupASpecificAccessory(void *a1, const char *a2, ...)
{
  return [a1 isLaunchedToSetupASpecificAccessory];
}

id objc_msgSend_isMultiUserEnabled(void *a1, const char *a2, ...)
{
  return [a1 isMultiUserEnabled];
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return [a1 isOn];
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return [a1 isPaired];
}

id objc_msgSend_isPlaybackInfluencesForYouEnabled(void *a1, const char *a2, ...)
{
  return [a1 isPlaybackInfluencesForYouEnabled];
}

id objc_msgSend_isPreloaded(void *a1, const char *a2, ...)
{
  return [a1 isPreloaded];
}

id objc_msgSend_isReachable(void *a1, const char *a2, ...)
{
  return [a1 isReachable];
}

id objc_msgSend_isSetupComplete(void *a1, const char *a2, ...)
{
  return [a1 isSetupComplete];
}

id objc_msgSend_isSetupInitiatedByOtherMatterEcosystem(void *a1, const char *a2, ...)
{
  return [a1 isSetupInitiatedByOtherMatterEcosystem];
}

id objc_msgSend_isShareSiriAnalyticsEnabled(void *a1, const char *a2, ...)
{
  return [a1 isShareSiriAnalyticsEnabled];
}

id objc_msgSend_isSiriAssistant(void *a1, const char *a2, ...)
{
  return [a1 isSiriAssistant];
}

id objc_msgSend_isSiriEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSiriEnabled];
}

id objc_msgSend_isTraditionalChimeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isTraditionalChimeEnabled];
}

id objc_msgSend_isUWBUnlockEnabled(void *a1, const char *a2, ...)
{
  return [a1 isUWBUnlockEnabled];
}

id objc_msgSend_isUnknownGuest(void *a1, const char *a2, ...)
{
  return [a1 isUnknownGuest];
}

id objc_msgSend_isUserInteractionEnabled(void *a1, const char *a2, ...)
{
  return [a1 isUserInteractionEnabled];
}

id objc_msgSend_isUsingCHIPCommunicationProtocol(void *a1, const char *a2, ...)
{
  return [a1 isUsingCHIPCommunicationProtocol];
}

id objc_msgSend_isUsingHAPCommunicationProtocol(void *a1, const char *a2, ...)
{
  return [a1 isUsingHAPCommunicationProtocol];
}

id objc_msgSend_isUsingiCloud(void *a1, const char *a2, ...)
{
  return [a1 isUsingiCloud];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_itemDictionary(void *a1, const char *a2, ...)
{
  return [a1 itemDictionary];
}

id objc_msgSend_itemManager(void *a1, const char *a2, ...)
{
  return [a1 itemManager];
}

id objc_msgSend_itemProviders(void *a1, const char *a2, ...)
{
  return [a1 itemProviders];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_keyPath(void *a1, const char *a2, ...)
{
  return [a1 keyPath];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return [a1 keyWindow];
}

id objc_msgSend_knownToSystemCommissioner(void *a1, const char *a2, ...)
{
  return [a1 knownToSystemCommissioner];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_languageValue(void *a1, const char *a2, ...)
{
  return [a1 languageValue];
}

id objc_msgSend_largeContentSizeCategories(void *a1, const char *a2, ...)
{
  return [a1 largeContentSizeCategories];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineAnchor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_latestResults(void *a1, const char *a2, ...)
{
  return [a1 latestResults];
}

id objc_msgSend_launchReason(void *a1, const char *a2, ...)
{
  return [a1 launchReason];
}

id objc_msgSend_launchType(void *a1, const char *a2, ...)
{
  return [a1 launchType];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return [a1 layoutMargins];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leadingKeylineLayer(void *a1, const char *a2, ...)
{
  return [a1 leadingKeylineLayer];
}

id objc_msgSend_leadingSeparatorMargin(void *a1, const char *a2, ...)
{
  return [a1 leadingSeparatorMargin];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 leftBarButtonItem];
}

id objc_msgSend_leftImageSize(void *a1, const char *a2, ...)
{
  return [a1 leftImageSize];
}

id objc_msgSend_leftView(void *a1, const char *a2, ...)
{
  return [a1 leftView];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return [a1 lightGrayColor];
}

id objc_msgSend_linkedApplicationItem(void *a1, const char *a2, ...)
{
  return [a1 linkedApplicationItem];
}

id objc_msgSend_listOfVoices(void *a1, const char *a2, ...)
{
  return [a1 listOfVoices];
}

id objc_msgSend_loadData(void *a1, const char *a2, ...)
{
  return [a1 loadData];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedLanguageToLanguageCodeMap(void *a1, const char *a2, ...)
{
  return [a1 localizedLanguageToLanguageCodeMap];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_lockAccessUpdateViewController(void *a1, const char *a2, ...)
{
  return [a1 lockAccessUpdateViewController];
}

id objc_msgSend_logHUISDismiss(void *a1, const char *a2, ...)
{
  return [a1 logHUISDismiss];
}

id objc_msgSend_logPairingBegin(void *a1, const char *a2, ...)
{
  return [a1 logPairingBegin];
}

id objc_msgSend_logPairingComplete(void *a1, const char *a2, ...)
{
  return [a1 logPairingComplete];
}

id objc_msgSend_mainContentGuide(void *a1, const char *a2, ...)
{
  return [a1 mainContentGuide];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return [a1 mainThreadScheduler];
}

id objc_msgSend_manualEntryCode(void *a1, const char *a2, ...)
{
  return [a1 manualEntryCode];
}

id objc_msgSend_manufacturer(void *a1, const char *a2, ...)
{
  return [a1 manufacturer];
}

id objc_msgSend_margin(void *a1, const char *a2, ...)
{
  return [a1 margin];
}

id objc_msgSend_matchedLibraryItems(void *a1, const char *a2, ...)
{
  return [a1 matchedLibraryItems];
}

id objc_msgSend_matchedStoreItems(void *a1, const char *a2, ...)
{
  return [a1 matchedStoreItems];
}

id objc_msgSend_matterDeviceSetupRequest(void *a1, const char *a2, ...)
{
  return [a1 matterDeviceSetupRequest];
}

id objc_msgSend_matterSetupPairingWindowReadyFuture(void *a1, const char *a2, ...)
{
  return [a1 matterSetupPairingWindowReadyFuture];
}

id objc_msgSend_mediaProfile(void *a1, const char *a2, ...)
{
  return [a1 mediaProfile];
}

id objc_msgSend_mediaSourceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 mediaSourceIdentifier];
}

id objc_msgSend_modalPresentationStyle(void *a1, const char *a2, ...)
{
  return [a1 modalPresentationStyle];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_moveToNextStep(void *a1, const char *a2, ...)
{
  return [a1 moveToNextStep];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_mvvmController(void *a1, const char *a2, ...)
{
  return [a1 mvvmController];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_nearFieldReaderSession(void *a1, const char *a2, ...)
{
  return [a1 nearFieldReaderSession];
}

id objc_msgSend_networkInterfaceManager(void *a1, const char *a2, ...)
{
  return [a1 networkInterfaceManager];
}

id objc_msgSend_networkRouterSupportDisableReason(void *a1, const char *a2, ...)
{
  return [a1 networkRouterSupportDisableReason];
}

id objc_msgSend_nextUnconfiguredBridgedAccessory(void *a1, const char *a2, ...)
{
  return [a1 nextUnconfiguredBridgedAccessory];
}

id objc_msgSend_nextViewController(void *a1, const char *a2, ...)
{
  return [a1 nextViewController];
}

id objc_msgSend_nfcAvailableFuture(void *a1, const char *a2, ...)
{
  return [a1 nfcAvailableFuture];
}

id objc_msgSend_nfcBodyLabel(void *a1, const char *a2, ...)
{
  return [a1 nfcBodyLabel];
}

id objc_msgSend_nfcIconView(void *a1, const char *a2, ...)
{
  return [a1 nfcIconView];
}

id objc_msgSend_nfcManager(void *a1, const char *a2, ...)
{
  return [a1 nfcManager];
}

id objc_msgSend_nfcTitleLabel(void *a1, const char *a2, ...)
{
  return [a1 nfcTitleLabel];
}

id objc_msgSend_nodeID(void *a1, const char *a2, ...)
{
  return [a1 nodeID];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_numCards(void *a1, const char *a2, ...)
{
  return [a1 numCards];
}

id objc_msgSend_numPairedAccessories(void *a1, const char *a2, ...)
{
  return [a1 numPairedAccessories];
}

id objc_msgSend_numberOfAccessoriesInSameCategory(void *a1, const char *a2, ...)
{
  return [a1 numberOfAccessoriesInSameCategory];
}

id objc_msgSend_numberOfDigits(void *a1, const char *a2, ...)
{
  return [a1 numberOfDigits];
}

id objc_msgSend_onboardingSelections(void *a1, const char *a2, ...)
{
  return [a1 onboardingSelections];
}

id objc_msgSend_optionalAction(void *a1, const char *a2, ...)
{
  return [a1 optionalAction];
}

id objc_msgSend_outputVoice(void *a1, const char *a2, ...)
{
  return [a1 outputVoice];
}

id objc_msgSend_outputVoiceGenderCode(void *a1, const char *a2, ...)
{
  return [a1 outputVoiceGenderCode];
}

id objc_msgSend_outputVoiceLanguageCode(void *a1, const char *a2, ...)
{
  return [a1 outputVoiceLanguageCode];
}

id objc_msgSend_overallSession(void *a1, const char *a2, ...)
{
  return [a1 overallSession];
}

id objc_msgSend_overrideHome(void *a1, const char *a2, ...)
{
  return [a1 overrideHome];
}

id objc_msgSend_page(void *a1, const char *a2, ...)
{
  return [a1 page];
}

id objc_msgSend_pairAccessory(void *a1, const char *a2, ...)
{
  return [a1 pairAccessory];
}

id objc_msgSend_pairStagedCHIPAccessoryToPartnerAppHome(void *a1, const char *a2, ...)
{
  return [a1 pairStagedCHIPAccessoryToPartnerAppHome];
}

id objc_msgSend_pairedAccessories(void *a1, const char *a2, ...)
{
  return [a1 pairedAccessories];
}

id objc_msgSend_pairingBeginDate(void *a1, const char *a2, ...)
{
  return [a1 pairingBeginDate];
}

id objc_msgSend_pairingCompleteDate(void *a1, const char *a2, ...)
{
  return [a1 pairingCompleteDate];
}

id objc_msgSend_pairingContext(void *a1, const char *a2, ...)
{
  return [a1 pairingContext];
}

id objc_msgSend_pairingController(void *a1, const char *a2, ...)
{
  return [a1 pairingController];
}

id objc_msgSend_pairingError(void *a1, const char *a2, ...)
{
  return [a1 pairingError];
}

id objc_msgSend_pairingFuture(void *a1, const char *a2, ...)
{
  return [a1 pairingFuture];
}

id objc_msgSend_pairingManager(void *a1, const char *a2, ...)
{
  return [a1 pairingManager];
}

id objc_msgSend_pairingObserver(void *a1, const char *a2, ...)
{
  return [a1 pairingObserver];
}

id objc_msgSend_pairingObservers(void *a1, const char *a2, ...)
{
  return [a1 pairingObservers];
}

id objc_msgSend_pairingState(void *a1, const char *a2, ...)
{
  return [a1 pairingState];
}

id objc_msgSend_pairingStatusDescription(void *a1, const char *a2, ...)
{
  return [a1 pairingStatusDescription];
}

id objc_msgSend_pairingStatusTitle(void *a1, const char *a2, ...)
{
  return [a1 pairingStatusTitle];
}

id objc_msgSend_pairingSuccess(void *a1, const char *a2, ...)
{
  return [a1 pairingSuccess];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_paymentPass(void *a1, const char *a2, ...)
{
  return [a1 paymentPass];
}

id objc_msgSend_pendingConfigurationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 pendingConfigurationIdentifier];
}

id objc_msgSend_performPRXLayoutPass(void *a1, const char *a2, ...)
{
  return [a1 performPRXLayoutPass];
}

id objc_msgSend_personManagerSettings(void *a1, const char *a2, ...)
{
  return [a1 personManagerSettings];
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return [a1 phase];
}

id objc_msgSend_phaseStartDate(void *a1, const char *a2, ...)
{
  return [a1 phaseStartDate];
}

id objc_msgSend_pickerView(void *a1, const char *a2, ...)
{
  return [a1 pickerView];
}

id objc_msgSend_pinCodeManager(void *a1, const char *a2, ...)
{
  return [a1 pinCodeManager];
}

id objc_msgSend_pinCodeValue(void *a1, const char *a2, ...)
{
  return [a1 pinCodeValue];
}

id objc_msgSend_pinSides(void *a1, const char *a2, ...)
{
  return [a1 pinSides];
}

id objc_msgSend_placeholder(void *a1, const char *a2, ...)
{
  return [a1 placeholder];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_popupDelegate(void *a1, const char *a2, ...)
{
  return [a1 popupDelegate];
}

id objc_msgSend_popupType(void *a1, const char *a2, ...)
{
  return [a1 popupType];
}

id objc_msgSend_possibleAssociatedServiceTypes(void *a1, const char *a2, ...)
{
  return [a1 possibleAssociatedServiceTypes];
}

id objc_msgSend_powerOn(void *a1, const char *a2, ...)
{
  return [a1 powerOn];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSize];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_priorityComparator(void *a1, const char *a2, ...)
{
  return [a1 priorityComparator];
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return [a1 productID];
}

id objc_msgSend_productPageURL(void *a1, const char *a2, ...)
{
  return [a1 productPageURL];
}

id objc_msgSend_prominentButtonLocalizedTitle(void *a1, const char *a2, ...)
{
  return [a1 prominentButtonLocalizedTitle];
}

id objc_msgSend_promise(void *a1, const char *a2, ...)
{
  return [a1 promise];
}

id objc_msgSend_proxNavigationController(void *a1, const char *a2, ...)
{
  return [a1 proxNavigationController];
}

id objc_msgSend_rawSetupPayloadString(void *a1, const char *a2, ...)
{
  return [a1 rawSetupPayloadString];
}

id objc_msgSend_readableContentGuide(void *a1, const char *a2, ...)
{
  return [a1 readableContentGuide];
}

id objc_msgSend_recognitionLanguage(void *a1, const char *a2, ...)
{
  return [a1 recognitionLanguage];
}

id objc_msgSend_recognitionLanguages(void *a1, const char *a2, ...)
{
  return [a1 recognitionLanguages];
}

id objc_msgSend_recommendationModule(void *a1, const char *a2, ...)
{
  return [a1 recommendationModule];
}

id objc_msgSend_recommendationModuleController(void *a1, const char *a2, ...)
{
  return [a1 recommendationModuleController];
}

id objc_msgSend_records(void *a1, const char *a2, ...)
{
  return [a1 records];
}

id objc_msgSend_recoverIgnoringError(void *a1, const char *a2, ...)
{
  return [a1 recoverIgnoringError];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
}

id objc_msgSend_releaseIdleTimerAssertion(void *a1, const char *a2, ...)
{
  return [a1 releaseIdleTimerAssertion];
}

id objc_msgSend_reloadAllComponents(void *a1, const char *a2, ...)
{
  return [a1 reloadAllComponents];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_requiresDismissalConfirmation(void *a1, const char *a2, ...)
{
  return [a1 requiresDismissalConfirmation];
}

id objc_msgSend_requiresIdentifyButton(void *a1, const char *a2, ...)
{
  return [a1 requiresIdentifyButton];
}

id objc_msgSend_requiresMatterCustomCommissioningFlow(void *a1, const char *a2, ...)
{
  return [a1 requiresMatterCustomCommissioningFlow];
}

id objc_msgSend_requiresOwnerToPair(void *a1, const char *a2, ...)
{
  return [a1 requiresOwnerToPair];
}

id objc_msgSend_requiresSetupCode(void *a1, const char *a2, ...)
{
  return [a1 requiresSetupCode];
}

id objc_msgSend_requiresSoftwareUpdate(void *a1, const char *a2, ...)
{
  return [a1 requiresSoftwareUpdate];
}

id objc_msgSend_requiresThreadRouter(void *a1, const char *a2, ...)
{
  return [a1 requiresThreadRouter];
}

id objc_msgSend_resetForRetry(void *a1, const char *a2, ...)
{
  return [a1 resetForRetry];
}

id objc_msgSend_resetItemProvidersAndModules(void *a1, const char *a2, ...)
{
  return [a1 resetItemProvidersAndModules];
}

id objc_msgSend_residentDevices(void *a1, const char *a2, ...)
{
  return [a1 residentDevices];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_resumeSetupHomeUUIDString(void *a1, const char *a2, ...)
{
  return [a1 resumeSetupHomeUUIDString];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_room(void *a1, const char *a2, ...)
{
  return [a1 room];
}

id objc_msgSend_roomBuilder(void *a1, const char *a2, ...)
{
  return [a1 roomBuilder];
}

id objc_msgSend_roomBuilderItem(void *a1, const char *a2, ...)
{
  return [a1 roomBuilderItem];
}

id objc_msgSend_roomForEntireHome(void *a1, const char *a2, ...)
{
  return [a1 roomForEntireHome];
}

id objc_msgSend_roomName(void *a1, const char *a2, ...)
{
  return [a1 roomName];
}

id objc_msgSend_roomProvider(void *a1, const char *a2, ...)
{
  return [a1 roomProvider];
}

id objc_msgSend_roomSuggestions(void *a1, const char *a2, ...)
{
  return [a1 roomSuggestions];
}

id objc_msgSend_rooms(void *a1, const char *a2, ...)
{
  return [a1 rooms];
}

id objc_msgSend_rootPublicKey(void *a1, const char *a2, ...)
{
  return [a1 rootPublicKey];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scanCodeBodyLabel(void *a1, const char *a2, ...)
{
  return [a1 scanCodeBodyLabel];
}

id objc_msgSend_scanCodeIconView(void *a1, const char *a2, ...)
{
  return [a1 scanCodeIconView];
}

id objc_msgSend_scanCodeTitleLabel(void *a1, const char *a2, ...)
{
  return [a1 scanCodeTitleLabel];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_scrollDirection(void *a1, const char *a2, ...)
{
  return [a1 scrollDirection];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemBackgroundColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_selectedAccessories(void *a1, const char *a2, ...)
{
  return [a1 selectedAccessories];
}

id objc_msgSend_selectedPartnerHome(void *a1, const char *a2, ...)
{
  return [a1 selectedPartnerHome];
}

id objc_msgSend_selectedPartnerRoom(void *a1, const char *a2, ...)
{
  return [a1 selectedPartnerRoom];
}

id objc_msgSend_selectedSiriRecognitionLanguage(void *a1, const char *a2, ...)
{
  return [a1 selectedSiriRecognitionLanguage];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceCellOptions(void *a1, const char *a2, ...)
{
  return [a1 serviceCellOptions];
}

id objc_msgSend_serviceComparator(void *a1, const char *a2, ...)
{
  return [a1 serviceComparator];
}

id objc_msgSend_serviceLikeBuilder(void *a1, const char *a2, ...)
{
  return [a1 serviceLikeBuilder];
}

id objc_msgSend_serviceLikeItems(void *a1, const char *a2, ...)
{
  return [a1 serviceLikeItems];
}

id objc_msgSend_serviceNames(void *a1, const char *a2, ...)
{
  return [a1 serviceNames];
}

id objc_msgSend_serviceTextView(void *a1, const char *a2, ...)
{
  return [a1 serviceTextView];
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return [a1 serviceType];
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return [a1 services];
}

id objc_msgSend_servicesToPreload(void *a1, const char *a2, ...)
{
  return [a1 servicesToPreload];
}

id objc_msgSend_sessionQueue(void *a1, const char *a2, ...)
{
  return [a1 sessionQueue];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_setupAccessoryDescription(void *a1, const char *a2, ...)
{
  return [a1 setupAccessoryDescription];
}

id objc_msgSend_setupAccessoryPayload(void *a1, const char *a2, ...)
{
  return [a1 setupAccessoryPayload];
}

id objc_msgSend_setupCode(void *a1, const char *a2, ...)
{
  return [a1 setupCode];
}

id objc_msgSend_setupDescription(void *a1, const char *a2, ...)
{
  return [a1 setupDescription];
}

id objc_msgSend_setupPayload(void *a1, const char *a2, ...)
{
  return [a1 setupPayload];
}

id objc_msgSend_setupPayloadURL(void *a1, const char *a2, ...)
{
  return [a1 setupPayloadURL];
}

id objc_msgSend_setupResult(void *a1, const char *a2, ...)
{
  return [a1 setupResult];
}

id objc_msgSend_setupSpecificAccessory(void *a1, const char *a2, ...)
{
  return [a1 setupSpecificAccessory];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedDispatcher(void *a1, const char *a2, ...)
{
  return [a1 sharedDispatcher];
}

id objc_msgSend_sharedHandler(void *a1, const char *a2, ...)
{
  return [a1 sharedHandler];
}

id objc_msgSend_sharedHardwareManager(void *a1, const char *a2, ...)
{
  return [a1 sharedHardwareManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedLogger(void *a1, const char *a2, ...)
{
  return [a1 sharedLogger];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_sharingDevice(void *a1, const char *a2, ...)
{
  return [a1 sharingDevice];
}

id objc_msgSend_sharingFrameworkClient(void *a1, const char *a2, ...)
{
  return [a1 sharingFrameworkClient];
}

id objc_msgSend_shouldIgnoreFutureAccessorySelection(void *a1, const char *a2, ...)
{
  return [a1 shouldIgnoreFutureAccessorySelection];
}

id objc_msgSend_shouldScanNetworks(void *a1, const char *a2, ...)
{
  return [a1 shouldScanNetworks];
}

id objc_msgSend_shouldShowButtonLinkToHomeApp(void *a1, const char *a2, ...)
{
  return [a1 shouldShowButtonLinkToHomeApp];
}

id objc_msgSend_shouldShowSiriRecognitionLanguageSetup(void *a1, const char *a2, ...)
{
  return [a1 shouldShowSiriRecognitionLanguageSetup];
}

id objc_msgSend_shouldShowVoiceSelectionSetup(void *a1, const char *a2, ...)
{
  return [a1 shouldShowVoiceSelectionSetup];
}

id objc_msgSend_shouldSkip(void *a1, const char *a2, ...)
{
  return [a1 shouldSkip];
}

id objc_msgSend_shouldSkipVoiceProfileSetup(void *a1, const char *a2, ...)
{
  return [a1 shouldSkipVoiceProfileSetup];
}

id objc_msgSend_siriDataSharingOptInStatus(void *a1, const char *a2, ...)
{
  return [a1 siriDataSharingOptInStatus];
}

id objc_msgSend_siriEnabledAccessories(void *a1, const char *a2, ...)
{
  return [a1 siriEnabledAccessories];
}

id objc_msgSend_siriEndpointAccessories(void *a1, const char *a2, ...)
{
  return [a1 siriEndpointAccessories];
}

id objc_msgSend_siriIconImageView(void *a1, const char *a2, ...)
{
  return [a1 siriIconImageView];
}

id objc_msgSend_siriOrbView(void *a1, const char *a2, ...)
{
  return [a1 siriOrbView];
}

id objc_msgSend_siriPhraseOptions(void *a1, const char *a2, ...)
{
  return [a1 siriPhraseOptions];
}

id objc_msgSend_siriPrivacyURL(void *a1, const char *a2, ...)
{
  return [a1 siriPrivacyURL];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_speakerIconImageView(void *a1, const char *a2, ...)
{
  return [a1 speakerIconImageView];
}

id objc_msgSend_spinner(void *a1, const char *a2, ...)
{
  return [a1 spinner];
}

id objc_msgSend_spinnerView(void *a1, const char *a2, ...)
{
  return [a1 spinnerView];
}

id objc_msgSend_stageCHIPAccessory(void *a1, const char *a2, ...)
{
  return [a1 stageCHIPAccessory];
}

id objc_msgSend_stagedCHIPPairingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 stagedCHIPPairingIdentifier];
}

id objc_msgSend_stagingRequestUUID(void *a1, const char *a2, ...)
{
  return [a1 stagingRequestUUID];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startSearchingForNewAccessories(void *a1, const char *a2, ...)
{
  return [a1 startSearchingForNewAccessories];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateMachine(void *a1, const char *a2, ...)
{
  return [a1 stateMachine];
}

id objc_msgSend_stateMachineConfigurationActiveTupleIsTopTuple(void *a1, const char *a2, ...)
{
  return [a1 stateMachineConfigurationActiveTupleIsTopTuple];
}

id objc_msgSend_staticViewControllers(void *a1, const char *a2, ...)
{
  return [a1 staticViewControllers];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusDescription(void *a1, const char *a2, ...)
{
  return [a1 statusDescription];
}

id objc_msgSend_statusTitle(void *a1, const char *a2, ...)
{
  return [a1 statusTitle];
}

id objc_msgSend_stepToStringMap(void *a1, const char *a2, ...)
{
  return [a1 stepToStringMap];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_storeID(void *a1, const char *a2, ...)
{
  return [a1 storeID];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringToStepMap(void *a1, const char *a2, ...)
{
  return [a1 stringToStepMap];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return [a1 subtitleLabel];
}

id objc_msgSend_suggestedAccessoryName(void *a1, const char *a2, ...)
{
  return [a1 suggestedAccessoryName];
}

id objc_msgSend_suggestedRoom(void *a1, const char *a2, ...)
{
  return [a1 suggestedRoom];
}

id objc_msgSend_suggestedRoomUUID(void *a1, const char *a2, ...)
{
  return [a1 suggestedRoomUUID];
}

id objc_msgSend_suggestedRoomUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 suggestedRoomUniqueIdentifier];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_supportedFeatures(void *a1, const char *a2, ...)
{
  return [a1 supportedFeatures];
}

id objc_msgSend_supportsAccessCodes(void *a1, const char *a2, ...)
{
  return [a1 supportsAccessCodes];
}

id objc_msgSend_supportsBTLE(void *a1, const char *a2, ...)
{
  return [a1 supportsBTLE];
}

id objc_msgSend_supportsCHIP(void *a1, const char *a2, ...)
{
  return [a1 supportsCHIP];
}

id objc_msgSend_supportsIP(void *a1, const char *a2, ...)
{
  return [a1 supportsIP];
}

id objc_msgSend_supportsOnboarding(void *a1, const char *a2, ...)
{
  return [a1 supportsOnboarding];
}

id objc_msgSend_supportsRichConfiguration(void *a1, const char *a2, ...)
{
  return [a1 supportsRichConfiguration];
}

id objc_msgSend_supportsThread(void *a1, const char *a2, ...)
{
  return [a1 supportsThread];
}

id objc_msgSend_supportsUWBUnlock(void *a1, const char *a2, ...)
{
  return [a1 supportsUWBUnlock];
}

id objc_msgSend_supportsWAC(void *a1, const char *a2, ...)
{
  return [a1 supportsWAC];
}

id objc_msgSend_supportsWalletKey(void *a1, const char *a2, ...)
{
  return [a1 supportsWalletKey];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGray2Color(void *a1, const char *a2, ...)
{
  return [a1 systemGray2Color];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemGroupedBackgroundColor];
}

id objc_msgSend_systemIndigoColor(void *a1, const char *a2, ...)
{
  return [a1 systemIndigoColor];
}

id objc_msgSend_systemLightMidGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemLightMidGrayColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 systemWhiteColor];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemYellowColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_tableViewManager(void *a1, const char *a2, ...)
{
  return [a1 tableViewManager];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_targetEcosystem(void *a1, const char *a2, ...)
{
  return [a1 targetEcosystem];
}

id objc_msgSend_teamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 teamIdentifier];
}

id objc_msgSend_televisionProfiles(void *a1, const char *a2, ...)
{
  return [a1 televisionProfiles];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return [a1 textColor];
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return [a1 textContainer];
}

id objc_msgSend_textField(void *a1, const char *a2, ...)
{
  return [a1 textField];
}

id objc_msgSend_textFieldMinimumHeight(void *a1, const char *a2, ...)
{
  return [a1 textFieldMinimumHeight];
}

id objc_msgSend_textFieldText(void *a1, const char *a2, ...)
{
  return [a1 textFieldText];
}

id objc_msgSend_threadIdentifier(void *a1, const char *a2, ...)
{
  return [a1 threadIdentifier];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleForAccessory(void *a1, const char *a2, ...)
{
  return [a1 titleForAccessory];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_toggleCamera(void *a1, const char *a2, ...)
{
  return [a1 toggleCamera];
}

id objc_msgSend_topAccessoryTuple(void *a1, const char *a2, ...)
{
  return [a1 topAccessoryTuple];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_topology(void *a1, const char *a2, ...)
{
  return [a1 topology];
}

id objc_msgSend_traditionalChimeFeature(void *a1, const char *a2, ...)
{
  return [a1 traditionalChimeFeature];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_trailingKeylineLayer(void *a1, const char *a2, ...)
{
  return [a1 trailingKeylineLayer];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_useSiriAction(void *a1, const char *a2, ...)
{
  return [a1 useSiriAction];
}

id objc_msgSend_useWLANInsteadOfWiFi(void *a1, const char *a2, ...)
{
  return [a1 useWLANInsteadOfWiFi];
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return [a1 user];
}

id objc_msgSend_userAutoJoinDisabled(void *a1, const char *a2, ...)
{
  return [a1 userAutoJoinDisabled];
}

id objc_msgSend_userDidSelectAccessories(void *a1, const char *a2, ...)
{
  return [a1 userDidSelectAccessories];
}

id objc_msgSend_userFriendlyAccessoryLocalizedCapitalizedDescription(void *a1, const char *a2, ...)
{
  return [a1 userFriendlyAccessoryLocalizedCapitalizedDescription];
}

id objc_msgSend_userGivenAccessoryName(void *a1, const char *a2, ...)
{
  return [a1 userGivenAccessoryName];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_userLabel(void *a1, const char *a2, ...)
{
  return [a1 userLabel];
}

id objc_msgSend_userManagementDidLoad(void *a1, const char *a2, ...)
{
  return [a1 userManagementDidLoad];
}

id objc_msgSend_userSettings(void *a1, const char *a2, ...)
{
  return [a1 userSettings];
}

id objc_msgSend_users(void *a1, const char *a2, ...)
{
  return [a1 users];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return [a1 vendorID];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return [a1 visibleCells];
}

id objc_msgSend_voiceName(void *a1, const char *a2, ...)
{
  return [a1 voiceName];
}

id objc_msgSend_voiceSelectionAllowsRandomSelection(void *a1, const char *a2, ...)
{
  return [a1 voiceSelectionAllowsRandomSelection];
}

id objc_msgSend_walletAppFromAppStoreURL(void *a1, const char *a2, ...)
{
  return [a1 walletAppFromAppStoreURL];
}

id objc_msgSend_walletAppIconImageView(void *a1, const char *a2, ...)
{
  return [a1 walletAppIconImageView];
}

id objc_msgSend_walletAppURL(void *a1, const char *a2, ...)
{
  return [a1 walletAppURL];
}

id objc_msgSend_walletKey(void *a1, const char *a2, ...)
{
  return [a1 walletKey];
}

id objc_msgSend_walletKeyDeviceState(void *a1, const char *a2, ...)
{
  return [a1 walletKeyDeviceState];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_wifiInterface(void *a1, const char *a2, ...)
{
  return [a1 wifiInterface];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_writeVisibilityState_toInputSourceService_(void *a1, const char *a2, ...)
{
  return [a1 writeVisibilityState:toInputSourceService:];
}