void sub_100003080(uint64_t a1, void *a2)
{
  id v3;
  uint64_t vars8;

  v3 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000030F4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[10])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 80);
    *(void *)(v3 + 80) = 0;
  }
  else
  {
    v5 = [v2 peerPaymentController];
    v6 = *(void **)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003218;
    v11[3] = &unk_100014508;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    id v14 = v7;
    v11[4] = v8;
    id v12 = v9;
    id v13 = v5;
    id v10 = v5;
    [v6 peerPaymentRegistrationStatusWithCompletion:v11];
  }
}

void sub_100003218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 1)
  {
    if (!a3 || a3 == 5)
    {
      v4 = *(void **)(a1 + 32);
      v5 = *(void **)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      if (v4[9])
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1000033E0;
        v15[3] = &unk_1000144B8;
        id v16 = *(id *)(a1 + 56);
        objc_msgSend(v4, "_queue_fetchRequestTokenForIntent:peerPaymentController:completion:", v5, v6, v15);
        id v7 = v16;
      }
      else
      {
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1000033F0;
        v11[3] = &unk_1000144E0;
        v11[4] = v4;
        id v12 = v5;
        id v13 = *(id *)(a1 + 48);
        id v14 = *(id *)(a1 + 56);
        objc_msgSend(v4, "_queue_identifyRecipientWithIntent:peerPaymentController:completion:", v12, v6, v11);

        id v7 = v12;
      }

      return;
    }
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "_responseForInvalidAccountResolution:");
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = [*(id *)(a1 + 32) _responseForInvalidRegistrationStatus:a2];
  }
  id v10 = (id)v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v9);
}

uint64_t sub_1000033E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000033F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4[9])
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100003510;
    v10[3] = &unk_1000144B8;
    id v11 = *(id *)(a1 + 56);
    objc_msgSend(v4, "_queue_fetchRequestTokenForIntent:peerPaymentController:completion:", v5, v6, v10);
    id v7 = v11;
  }
  else
  {
    uint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000DD78(v8);
    }

    uint64_t v9 = *(void *)(a1 + 56);
    id v7 = [*(id *)(a1 + 32) _intentResponseForGenericFailure];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v7);
  }
}

uint64_t sub_100003510(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000373C(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000037B0(id *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 1)
  {
    if (!a3 || a3 == 5)
    {
      v4 = [a1[5] currencyAmount];
      uint64_t v5 = [a1[4] pkCurrencyAmountFromIntentAmount:v4];
      id v6 = a1[4];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000038F4;
      v10[3] = &unk_100014558;
      id v11 = a1[6];
      [v6 validateCurrencyAmount:v5 completion:v10];

      return;
    }
    id v7 = (void (**)(id, uint64_t))a1[6];
    uint64_t v8 = objc_msgSend(a1[4], "_responseForInvalidAccountResolution:");
  }
  else
  {
    id v7 = (void (**)(id, uint64_t))a1[6];
    uint64_t v8 = [a1[4] _responseForInvalidRegistrationStatus:a2];
  }
  id v9 = (id)v8;
  v7[2](v7, v8);
}

void sub_1000038F4(uint64_t a1, int a2, int a3, int a4, int a5)
{
  id v10 = objc_alloc((Class)INRequestPaymentIntentResponse);
  if (a2)
  {
    id v11 = [v10 initWithCode:9 userActivity:0];
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v11;
      id v13 = "Returning currency unsupported response %@";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 0xCu);
    }
  }
  else if (a3)
  {
    id v11 = [v10 initWithCode:7 userActivity:0];
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v11;
      id v13 = "Returning amount below minimum response %@";
      goto LABEL_15;
    }
  }
  else if (a4)
  {
    id v11 = [v10 initWithCode:8 userActivity:0];
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v11;
      id v13 = "Returning amount above maximum response %@";
      goto LABEL_15;
    }
  }
  else if (a5)
  {
    id v11 = [v10 initWithCode:4 userActivity:0];
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v11;
      id v13 = "Returning failure response for generic unsupported amount. Response: %@";
      goto LABEL_15;
    }
  }
  else
  {
    id v11 = [v10 initWithCode:1 userActivity:0];
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v11;
      id v13 = "Intent confirmation successful. Returning ready response: %@";
      goto LABEL_15;
    }
  }

  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v11);
}

void sub_100003D48(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003DBC(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[10])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v10 = +[INRequestPaymentPayerResolutionResult notRequired];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v10);
  }
  else
  {
    v4 = [v2 peerPaymentController];
    uint64_t v5 = *(void **)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003EF4;
    v11[3] = &unk_100014508;
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    id v14 = v6;
    v11[4] = v7;
    id v12 = v8;
    id v13 = v4;
    id v9 = v4;
    [v5 peerPaymentRegistrationStatusWithCompletion:v11];
  }
}

void sub_100003EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 1 && (!a3 || a3 == 5))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100003FF8;
    v8[3] = &unk_1000145A8;
    uint64_t v5 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    objc_msgSend(v3, "_queue_identifyRecipientWithIntent:peerPaymentController:completion:", v4, v5, v8);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    id v7 = +[INRequestPaymentPayerResolutionResult notRequired];
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

uint64_t sub_100003FF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004210(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004284(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[10])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v6 = +[INRequestPaymentCurrencyAmountResolutionResult notRequired];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100004394;
    v7[3] = &unk_100014620;
    id v10 = *(id *)(a1 + 48);
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = v4;
    uint64_t v9 = v5;
    uint64_t v11 = *(void *)(a1 + 56);
    [v2 peerPaymentRegistrationStatusWithCompletion:v7];
  }
}

void sub_100004394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 1 && (!a3 || a3 == 5))
  {
    id v4 = [*(id *)(a1 + 32) currencyAmount];
    uint64_t v5 = [*(id *)(a1 + 40) pkCurrencyAmountFromIntentAmount:v4];
    if (v5)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100004760;
      v27[3] = &unk_1000145F8;
      id v6 = *(void **)(a1 + 40);
      id v29 = *(id *)(a1 + 48);
      id v28 = v4;
      [v6 validateCurrencyAmount:v5 completion:v27];
    }
    else
    {
      uint64_t v8 = [v4 amount];
      if (v8
        && (uint64_t v9 = (void *)v8,
            [v4 currencyCode],
            id v10 = objc_claimAutoreleasedReturnValue(),
            v10,
            v9,
            !v10))
      {
        id v13 = [*(id *)(a1 + 40) peerPaymentService];
        id v14 = [v13 account];
        id v15 = [v14 currentBalance];
        id v12 = [v15 currency];

        if ([v12 length])
        {
          id v16 = objc_alloc((Class)INCurrencyAmount);
          v17 = [v4 amount];
          id v18 = [v16 initWithAmount:v17 currencyCode:v12];

          v19 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = NSStringFromSelector(*(SEL *)(a1 + 56));
            *(_DWORD *)buf = 138543618;
            v31 = v20;
            __int16 v32 = 2112;
            id v33 = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with confirmation of inferred amount currency, %@.", buf, 0x16u);
          }
          uint64_t v21 = *(void *)(a1 + 48);
          v22 = +[INRequestPaymentCurrencyAmountResolutionResult confirmationRequiredWithCurrencyAmountToConfirm:v18];
          (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
        }
        else
        {
          v23 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = NSStringFromSelector(*(SEL *)(a1 + 56));
            *(_DWORD *)buf = 138543362;
            v31 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with needs value because we could not infer currency.", buf, 0xCu);
          }
          uint64_t v25 = *(void *)(a1 + 48);
          id v18 = +[INRequestPaymentCurrencyAmountResolutionResult needsValue];
          (*(void (**)(uint64_t, id))(v25 + 16))(v25, v18);
        }
      }
      else
      {
        uint64_t v11 = *(void *)(a1 + 48);
        id v12 = +[INRequestPaymentCurrencyAmountResolutionResult needsValue];
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
      }
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v26 = +[INRequestPaymentCurrencyAmountResolutionResult notRequired];
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
}

void sub_100004760(uint64_t a1, int a2, int a3, int a4, int a5)
{
  uint64_t v5 = *(void *)(a1 + 40);
  if (a2)
  {
    uint64_t v6 = 3;
  }
  else if (a3)
  {
    uint64_t v6 = 1;
  }
  else
  {
    if (!a4)
    {
      if (a5) {
        +[INRequestPaymentCurrencyAmountResolutionResult unsupported];
      }
      else {
      uint64_t v7 = +[INRequestPaymentCurrencyAmountResolutionResult successWithResolvedCurrencyAmount:*(void *)(a1 + 32)];
      }
      goto LABEL_8;
    }
    uint64_t v6 = 2;
  }
  uint64_t v7 = +[INRequestPaymentCurrencyAmountResolutionResult unsupportedForReason:v6];
LABEL_8:
  id v8 = (id)v7;
  (*(void (**)(uint64_t))(v5 + 16))(v5);
}

void sub_100004A10(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004A84(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[10])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v6 = +[INStringResolutionResult notRequired];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100004B8C;
    v7[3] = &unk_100014580;
    id v10 = *(id *)(a1 + 48);
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = v4;
    uint64_t v9 = v5;
    [v2 peerPaymentRegistrationStatusWithCompletion:v7];
  }
}

void sub_100004B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 1 && (!a3 || a3 == 5))
  {
    id v8 = [*(id *)(a1 + 32) note];
    if ([v8 length])
    {
      id v4 = [*(id *)(a1 + 40) siriLocale];
      uint64_t v5 = objc_msgSend(v8, "pk_uppercaseFirstStringForLocale:", v4);
      id v6 = +[INStringResolutionResult successWithResolvedString:v5];
    }
    else
    {
      id v6 = +[INStringResolutionResult notRequired];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = +[INStringResolutionResult notRequired];
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

void sub_1000050A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000050CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000050DC(uint64_t a1)
{
}

void sub_1000050E4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) intentQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000520C;
  v14[3] = &unk_100014698;
  uint64_t v21 = *(void *)(a1 + 64);
  uint64_t v22 = a2;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v15 = v10;
  uint64_t v16 = v11;
  id v17 = v7;
  id v18 = *(id *)(a1 + 48);
  id v19 = v8;
  id v20 = *(id *)(a1 + 56);
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v9, v14);
}

uint64_t sub_10000520C(uint64_t a1)
{
  if (*(void *)(a1 + 88) == 1)
  {
    uint64_t v2 = +[INRequestPaymentPayerResolutionResult successWithResolvedPerson:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 80) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    objc_storeStrong((id *)(*(void *)(a1 + 40) + 72), *(id *)(a1 + 48));
    [*(id *)(a1 + 56) selectMode:3];
  }
  else
  {
    if (*(void *)(a1 + 64))
    {
      uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "_intentResponseFromWebServiceError:");
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = *(void **)(v6 + 80);
      *(void *)(v6 + 80) = v5;

      +[INRequestPaymentPayerResolutionResult notRequired];
    }
    else
    {
      +[INRequestPaymentPayerResolutionResult unsupportedWithReason:2];
    uint64_t v8 = };
    uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  uint64_t v11 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);

  return v11();
}

void sub_100005444(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100005560;
  v14[3] = &unk_1000146E8;
  char v22 = a2;
  id v15 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void **)(a1 + 56);
  id v16 = v9;
  uint64_t v17 = v10;
  id v18 = v11;
  id v19 = v7;
  id v20 = v8;
  id v21 = *(id *)(a1 + 64);
  id v12 = v8;
  id v13 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
}

void sub_100005560(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88))
  {
    PKAnalyticsSendEvent();
    uint64_t v2 = [*(id *)(a1 + 32) payer];
    uint64_t v3 = [*(id *)(a1 + 32) note];
    id v4 = v3;
    if (v3) {
      [v3 length];
    }
    PKAnalyticsSendEvent();
    uint64_t v5 = [v2 personHandle];
    uint64_t v6 = [v5 value];

    id v7 = [*(id *)(a1 + 40) senderPhoneOrEmail];
    id v8 = [*(id *)(a1 + 48) _peerPaymentMessageForRequestWithCurrencyAmount:*(void *)(a1 + 56) requestToken:*(void *)(a1 + 64) recipientHandle:v6 senderHandle:v7 memo:v4];
    id v9 = [v8 localProperties];
    [v8 setLocalProperties:0];
    [*(id *)(a1 + 48) sendMessage:v8 toRecipient:v6];
    [v8 reportMessageSentWithLocalProperties:v9];
    uint64_t v10 = [*(id *)(a1 + 48) inCurrencyAmountFromPKAmount:*(void *)(a1 + 56)];
    id v11 = objc_alloc((Class)INPaymentRecord);
    id v12 = +[INPaymentMethod applePayPaymentMethod];
    id v13 = [v11 initWithPayee:0 payer:v2 currencyAmount:v10 paymentMethod:v12 note:v4 status:5 feeAmount:0];

    id v14 = [objc_alloc((Class)INRequestPaymentIntentResponse) initWithCode:3 userActivity:0];
    [v14 setPaymentRecord:v13];
  }
  else
  {
    id v14 = [*(id *)(a1 + 48) _intentResponseFromWebServiceError:*(void *)(a1 + 72)];
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

void sub_100005D20(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005D94(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[12])
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 96);
      *(_DWORD *)buf = 138543618;
      id v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with preDeterminedIntentResponse %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 96);
    *(void *)(v6 + 96) = 0;

    id v8 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(v8, "pk_didFinishInteractionForIntent:", *(void *)(a1 + 40));
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100005F50;
    v11[3] = &unk_100014788;
    v11[4] = v2;
    long long v10 = *(_OWORD *)(a1 + 48);
    id v9 = (id)v10;
    long long v13 = v10;
    id v12 = *(id *)(a1 + 40);
    [v2 peerPaymentRegistrationStatusWithCompletion:v11];
  }
}

void sub_100005F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 1)
  {
    id v4 = *(void **)(a1 + 32);
    if (!a3)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100006160;
      v13[3] = &unk_100014760;
      long long v12 = *(_OWORD *)(a1 + 48);
      id v11 = (id)v12;
      long long v14 = v12;
      objc_msgSend(v4, "_queue_performOperationsIfNecessary:intent:completion:", 3, v10, v13);
      uint64_t v5 = (void *)v14;
      goto LABEL_9;
    }
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_responseForInvalidAccountResolution:");
    uint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v7;
      __int16 v17 = 2112;
      id v18 = v5;
      id v8 = "Calling %{public}@ completion with invalid account resolution result %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 0x16u);
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) _responseForInvalidRegistrationStatus:a2];
    uint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v7;
      __int16 v17 = 2112;
      id v18 = v5;
      id v8 = "Calling %{public}@ completion with invalid registration status result %@";
      goto LABEL_7;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v9 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v9, "pk_didFinishInteractionForIntent:", *(void *)(a1 + 40));

LABEL_9:
}

void sub_100006160(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    CFStringRef v8 = @"NO";
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    if (a2) {
      CFStringRef v8 = @"YES";
    }
    CFStringRef v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with success %@, intentResponse %@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5);
}

void sub_100006484(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000064F8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[12])
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 96);
      *(_DWORD *)buf = 138543618;
      id v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with preDeterminedIntentResponse %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 96);
    *(void *)(v6 + 96) = 0;

    CFStringRef v8 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(v8, "pk_didFinishInteractionForIntent:", *(void *)(a1 + 40));
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000066B4;
    v11[3] = &unk_100014788;
    v11[4] = v2;
    long long v10 = *(_OWORD *)(a1 + 48);
    id v9 = (id)v10;
    long long v13 = v10;
    id v12 = *(id *)(a1 + 40);
    [v2 peerPaymentRegistrationStatusWithCompletion:v11];
  }
}

void sub_1000066B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 1)
  {
    id v4 = *(void **)(a1 + 32);
    if (!a3)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000068C4;
      v13[3] = &unk_100014760;
      long long v12 = *(_OWORD *)(a1 + 48);
      id v11 = (id)v12;
      long long v14 = v12;
      objc_msgSend(v4, "_queue_performOperationsIfNecessary:intent:completion:", 7, v10, v13);
      uint64_t v5 = (void *)v14;
      goto LABEL_9;
    }
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_responseForInvalidAccountResolution:");
    uint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v7;
      __int16 v17 = 2112;
      id v18 = v5;
      CFStringRef v8 = "Calling %{public}@ completion with invalid account resolution result %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 0x16u);
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) _responseForInvalidRegistrationStatus:a2];
    uint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v7;
      __int16 v17 = 2112;
      id v18 = v5;
      CFStringRef v8 = "Calling %{public}@ completion with invalid registration status result %@";
      goto LABEL_7;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v9 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v9, "pk_didFinishInteractionForIntent:", *(void *)(a1 + 40));

LABEL_9:
}

void sub_1000068C4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    CFStringRef v8 = @"NO";
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    if (a2) {
      CFStringRef v8 = @"YES";
    }
    CFStringRef v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with success %@, intentResponse %@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5);
}

void sub_100006BE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006C5C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[12])
  {
    id v3 = +[INStringResolutionResult notRequired];
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138543618;
      id v15 = v5;
      __int16 v16 = 2112;
      __int16 v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with fast forward response %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100006DF4;
    v10[3] = &unk_100014620;
    long long v9 = *(_OWORD *)(a1 + 48);
    id v6 = (id)v9;
    long long v13 = v9;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = v7;
    uint64_t v12 = v8;
    [v2 peerPaymentRegistrationStatusWithCompletion:v10];

    id v3 = (void *)v13;
  }
}

void sub_100006DF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != 1)
  {
    id v4 = +[INStringResolutionResult notRequired];
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v14 = 138543618;
      id v15 = v6;
      __int16 v16 = 2112;
      __int16 v17 = v4;
      id v7 = "Calling %{public}@ completion with not required result %@ due to registration status";
      goto LABEL_7;
    }
LABEL_8:

    (*(void (**)(void, void *, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v4, v8);
    goto LABEL_9;
  }
  if (a3)
  {
    id v4 = +[INStringResolutionResult notRequired];
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v14 = 138543618;
      id v15 = v6;
      __int16 v16 = 2112;
      __int16 v17 = v4;
      id v7 = "Calling %{public}@ completion with not required result %@ due to account resolution status";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v4 = [*(id *)(a1 + 32) note];
  if ([v4 length])
  {
    long long v9 = [*(id *)(a1 + 40) siriLocale];
    uint64_t v10 = objc_msgSend(v4, "pk_uppercaseFirstStringForLocale:", v9);
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v4;
      __int16 v16 = 2112;
      __int16 v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Intent included note \"%@\", which was capitalized to \"%@\".", (uint8_t *)&v14, 0x16u);
    }

    uint64_t v12 = +[INStringResolutionResult successWithResolvedString:v10];
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Intent does not include a note.", (uint8_t *)&v14, 2u);
    }

    uint64_t v12 = +[INStringResolutionResult notRequired];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v14 = 138543618;
    id v15 = v13;
    __int16 v16 = 2112;
    __int16 v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with result %@", (uint8_t *)&v14, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_9:
}

void sub_10000731C(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007390(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[12])
  {
    id v3 = +[INSendPaymentPayeeResolutionResult notRequired];
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138543618;
      long long v13 = v5;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with fast forward response %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007528;
    v9[3] = &unk_100014620;
    long long v8 = *(_OWORD *)(a1 + 48);
    id v6 = (id)v8;
    long long v11 = v8;
    id v7 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    [v2 peerPaymentRegistrationStatusWithCompletion:v9];

    id v3 = (void *)v11;
  }
}

void sub_100007528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 1)
  {
    if (!a3)
    {
      long long v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000771C;
      v12[3] = &unk_100014760;
      long long v11 = *(_OWORD *)(a1 + 48);
      id v10 = (id)v11;
      long long v13 = v11;
      objc_msgSend(v8, "_queue_performOperationsIfNecessary:intent:completion:", 1, v9, v12);
      id v4 = (void *)v13;
      goto LABEL_9;
    }
    id v4 = +[INSendPaymentPayeeResolutionResult notRequired];
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138543618;
      id v15 = v6;
      __int16 v16 = 2112;
      __int16 v17 = v4;
      id v7 = "Calling %{public}@ completion with not required result %@ due to account resolution status";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0x16u);
    }
  }
  else
  {
    id v4 = +[INSendPaymentPayeeResolutionResult notRequired];
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138543618;
      id v15 = v6;
      __int16 v16 = 2112;
      __int16 v17 = v4;
      id v7 = "Calling %{public}@ completion with not required result %@ due to registration status";
      goto LABEL_7;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_9:
}

void sub_10000771C(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    long long v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    CFStringRef v9 = @"NO";
    int v10 = 138543874;
    long long v11 = v8;
    __int16 v12 = 2112;
    if (a2) {
      CFStringRef v9 = @"YES";
    }
    CFStringRef v13 = v9;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with success %@, payeeResolutionResult %@", (uint8_t *)&v10, 0x20u);
  }
  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6);
}

void sub_100007A40(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007AB4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[12])
  {
    id v3 = +[INSendPaymentCurrencyAmountResolutionResult notRequired];
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138543618;
      id v15 = v5;
      __int16 v16 = 2112;
      __int16 v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with fast forward response %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100007C4C;
    v10[3] = &unk_100014620;
    long long v9 = *(_OWORD *)(a1 + 48);
    id v6 = (id)v9;
    long long v13 = v9;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = v7;
    uint64_t v12 = v8;
    [v2 peerPaymentRegistrationStatusWithCompletion:v10];

    id v3 = (void *)v13;
  }
}

void sub_100007C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != 1)
  {
    id v4 = +[INSendPaymentCurrencyAmountResolutionResult notRequired];
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138543618;
      v36 = v6;
      __int16 v37 = 2112;
      id v38 = v4;
      id v7 = "Calling %{public}@ completion with not required result %@ due to registration status";
      goto LABEL_7;
    }
LABEL_8:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_9;
  }
  if (a3)
  {
    id v4 = +[INSendPaymentCurrencyAmountResolutionResult notRequired];
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138543618;
      v36 = v6;
      __int16 v37 = 2112;
      id v38 = v4;
      id v7 = "Calling %{public}@ completion with not required result %@ due to account resolution status";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v4 = [*(id *)(a1 + 32) currencyAmount];
  uint64_t v8 = [*(id *)(a1 + 40) pkCurrencyAmountFromIntentAmount:v4];
  if (v8)
  {
    long long v9 = *(void **)(a1 + 40);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100008120;
    v32[3] = &unk_100014800;
    long long v31 = *(_OWORD *)(a1 + 48);
    id v10 = (id)v31;
    long long v34 = v31;
    id v33 = v4;
    [v9 validateCurrencyAmount:v8 completion:v32];

    id v11 = (void *)v34;
  }
  else
  {
    uint64_t v12 = [v4 amount];
    if (v12
      && (long long v13 = (void *)v12,
          [v4 currencyCode],
          __int16 v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          !v14))
    {
      id v18 = [*(id *)(a1 + 40) peerPaymentService];
      id v19 = [v18 account];
      id v20 = [v19 currentBalance];
      id v11 = [v20 currency];

      if ([v11 length])
      {
        id v21 = objc_alloc((Class)INCurrencyAmount);
        char v22 = [v4 amount];
        id v23 = [v21 initWithAmount:v22 currencyCode:v11];

        v24 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = NSStringFromSelector(*(SEL *)(a1 + 56));
          *(_DWORD *)buf = 138543618;
          v36 = v25;
          __int16 v37 = 2112;
          id v38 = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with confirmation of inferred amount currency, %@.", buf, 0x16u);
        }
        uint64_t v26 = *(void *)(a1 + 48);
        v27 = +[INSendPaymentCurrencyAmountResolutionResult confirmationRequiredWithCurrencyAmountToConfirm:v23];
        (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);
      }
      else
      {
        id v28 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = NSStringFromSelector(*(SEL *)(a1 + 56));
          *(_DWORD *)buf = 138543362;
          v36 = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with needs value because we could not infer currency.", buf, 0xCu);
        }
        uint64_t v30 = *(void *)(a1 + 48);
        id v23 = +[INSendPaymentCurrencyAmountResolutionResult needsValue];
        (*(void (**)(uint64_t, id))(v30 + 16))(v30, v23);
      }
    }
    else
    {
      id v15 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = NSStringFromSelector(*(SEL *)(a1 + 56));
        *(_DWORD *)buf = 138543362;
        v36 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with needs value.", buf, 0xCu);
      }
      uint64_t v17 = *(void *)(a1 + 48);
      id v11 = +[INSendPaymentCurrencyAmountResolutionResult needsValue];
      (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v11);
    }
  }

LABEL_9:
}

void sub_100008120(uint64_t a1, int a2, int a3, int a4, int a5)
{
  id v10 = PKLogFacilityTypeGetObject();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v11)
    {
      uint64_t v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v22 = 138543362;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with currency unsupported response", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = 3;
LABEL_13:
    uint64_t v17 = +[INSendPaymentCurrencyAmountResolutionResult unsupportedForReason:v14];
    goto LABEL_14;
  }
  if (a3)
  {
    if (v11)
    {
      id v15 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v22 = 138543362;
      id v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with amount below minimum response", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = 1;
    goto LABEL_13;
  }
  if (a4)
  {
    if (v11)
    {
      __int16 v16 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v22 = 138543362;
      id v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with amount above maximum response", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = 2;
    goto LABEL_13;
  }
  if (a5)
  {
    if (v11)
    {
      id v19 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v22 = 138543362;
      id v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with generic unsupported response", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v17 = +[INSendPaymentCurrencyAmountResolutionResult unsupported];
  }
  else
  {
    if (v11)
    {
      id v20 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v21 = *(void *)(a1 + 32);
      int v22 = 138543618;
      id v23 = v20;
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with success for currency amount: %@", (uint8_t *)&v22, 0x16u);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v17 = +[INSendPaymentCurrencyAmountResolutionResult successWithResolvedCurrencyAmount:*(void *)(a1 + 32)];
  }
LABEL_14:
  id v18 = (void *)v17;
  (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, v17);
}

void sub_1000087C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000087E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000087F8(uint64_t a1)
{
}

void sub_100008800(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 72) & 4) != 0)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3[10])
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000089A4;
      v19[3] = &unk_100014828;
      id v6 = *(id *)(a1 + 56);
      v19[4] = *(void *)(a1 + 32);
      id v20 = v6;
      objc_msgSend(v3, "_queue_performQuoteForIntent:peerPaymentController:completion:", v4, v5, v19);
    }
    else
    {
      id v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000DDBC(v7, v8, v9, v10, v11, v12, v13, v14);
      }

      id v15 = [*(id *)(a1 + 32) delegate];
      objc_msgSend(v15, "pk_didFinishInteractionForIntent:", *(void *)(a1 + 40));

      uint64_t v16 = [*(id *)(a1 + 32) _intentResponseForGenericFailure];
      uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
      id v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
}

uint64_t sub_1000089A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, *(void *)(*(void *)(a1 + 32) + 88));
}

void sub_1000089C4(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 80) & 2) != 0 && (uint64_t v2 = *(void **)(a1 + 32), !v2[10]))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100008AE4;
    v7[3] = &unk_100014878;
    uint64_t v6 = *(void *)(a1 + 72);
    void v7[4] = v2;
    uint64_t v11 = v6;
    id v9 = *(id *)(a1 + 56);
    id v8 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 64);
    objc_msgSend(v2, "_queue_fetchQuoteForIntent:peerPaymentController:completion:", v4, v5, v7);
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

void sub_100008AE4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (*(void *)(*(void *)(a1 + 32) + 80))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000DDF4(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    uint64_t v16 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(v16, "pk_didFinishInteractionForIntent:", *(void *)(a1 + 40));

    uint64_t v17 = [*(id *)(a1 + 32) _intentResponseForGenericFailure];
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_100008BF0(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 72) & 1) != 0 && (uint64_t v2 = *(void **)(a1 + 32), !v2[9]))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100008CF4;
    v6[3] = &unk_1000148C8;
    v6[4] = v2;
    id v7 = *(id *)(a1 + 56);
    id v8 = *(id *)(a1 + 64);
    objc_msgSend(v2, "_queue_identifyRecipientWithIntent:peerPaymentController:completion:", v4, v5, v6);
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

void sub_100008CF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(*(void *)(a1 + 32) + 72))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000DE2C(v4, v5, v6, v7, v8, v9, v10, v11);
    }

    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = [*(id *)(a1 + 32) _intentResponseForGenericFailure];
    (*(void (**)(uint64_t, void, void *, id))(v12 + 16))(v12, 0, v13, v3);
  }
}

void sub_100008EDC(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009004;
  block[3] = &unk_100014918;
  char v24 = a2;
  id v17 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void **)(a1 + 56);
  id v18 = v9;
  uint64_t v19 = v10;
  id v20 = v11;
  id v21 = v7;
  id v22 = v8;
  long long v15 = *(_OWORD *)(a1 + 64);
  id v12 = (id)v15;
  long long v23 = v15;
  id v13 = v8;
  id v14 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100009004(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 96);
  id v3 = PKLogFacilityTypeGetObject();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received successful response from performQuote, sending payment message", (uint8_t *)&v17, 2u);
    }

    PKAnalyticsSendEvent();
    uint64_t v5 = [*(id *)(a1 + 32) payee];
    uint64_t v6 = [*(id *)(a1 + 32) note];
    id v7 = v6;
    if (v6) {
      [v6 length];
    }
    PKAnalyticsSendEvent();
    id v8 = [v5 personHandle];
    id v9 = [v8 value];

    uint64_t v10 = [*(id *)(a1 + 40) senderPhoneOrEmail];
    uint64_t v11 = [*(id *)(a1 + 48) _peerPaymentMessageForAuthorizedPaymentWithQuote:*(void *)(a1 + 56) performResponse:*(void *)(a1 + 64) recipientHandle:v9 senderHandle:v10 memo:v7];
    id v12 = [v11 localProperties];
    [v11 setLocalProperties:0];
    [*(id *)(a1 + 48) sendMessage:v11 toRecipient:v9];
    [v11 reportMessageSentWithLocalProperties:v12];
    id v13 = [objc_alloc((Class)INSendPaymentIntentResponse) initWithCode:3 userActivity:0];
    id v14 = [*(id *)(a1 + 48) _paymentRecordFromQuote:*(void *)(a1 + 56) payee:v5 note:v7 status:2];
    [v13 setPaymentRecord:v14];
  }
  else
  {
    if (v4)
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received failure response from performQuote, returning error intent response", (uint8_t *)&v17, 2u);
    }

    id v13 = [*(id *)(a1 + 48) _intentResponseFromWebServiceError:*(void *)(a1 + 72)];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = NSStringFromSelector(*(SEL *)(a1 + 88));
    int v17 = 138543618;
    id v18 = v15;
    __int16 v19 = 2112;
    id v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with result %@", (uint8_t *)&v17, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  uint64_t v16 = [*(id *)(a1 + 48) delegate];
  objc_msgSend(v16, "pk_didFinishInteractionForIntent:", *(void *)(a1 + 32));
}

void sub_100009418(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) intentQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009534;
  block[3] = &unk_100014968;
  char v22 = a2;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v17 = v10;
  uint64_t v18 = v11;
  id v19 = v7;
  id v20 = v8;
  long long v15 = *(_OWORD *)(a1 + 48);
  id v12 = (id)v15;
  long long v21 = v15;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v9, block);
}

void sub_100009534(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80))
  {
    int v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received successful quote response.", (uint8_t *)&v11, 2u);
    }

    id v3 = [*(id *)(a1 + 32) payee];
    BOOL v4 = [*(id *)(a1 + 32) note];
    uint64_t v5 = [*(id *)(a1 + 40) _paymentRecordFromQuote:*(void *)(a1 + 48) payee:v3 note:v4 status:1];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void **)(a1 + 48);
      int v11 = 138412546;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Created payment record %@ from quote %@", (uint8_t *)&v11, 0x16u);
    }

    id v7 = [objc_alloc((Class)INSendPaymentIntentResponse) initWithCode:1 userActivity:0];
    [v7 setPaymentRecord:v5];
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 80), *(id *)(a1 + 48));

LABEL_11:
    goto LABEL_12;
  }
  id v8 = *(void **)(a1 + 56);
  if (v8)
  {
    int v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Quote was not succesful, creating intent response from errror: %@", (uint8_t *)&v11, 0xCu);
    }

    id v7 = [*(id *)(a1 + 40) _intentResponseFromWebServiceError:*(void *)(a1 + 56)];
    id v3 = [*(id *)(a1 + 40) delegate];
    objc_msgSend(v3, "pk_didFinishInteractionForIntent:", *(void *)(a1 + 32));
    goto LABEL_11;
  }
  id v7 = [*(id *)(a1 + 40) _intentResponseForGenericFailure];
  id v10 = [*(id *)(a1 + 40) delegate];
  objc_msgSend(v10, "pk_didFinishInteractionForIntent:", *(void *)(a1 + 32));

  int v2 = PKLogFacilityTypeGetObject();
LABEL_12:
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 72));
    int v11 = 138543618;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with result %@", (uint8_t *)&v11, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_100009C8C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) intentQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100009DB4;
  v15[3] = &unk_1000149B8;
  uint64_t v22 = a2;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v16 = v10;
  uint64_t v17 = v11;
  id v18 = v7;
  id v19 = *(id *)(a1 + 48);
  id v20 = v8;
  id v12 = *(void **)(a1 + 56);
  uint64_t v23 = *(void *)(a1 + 64);
  id v21 = v12;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v9, v15);
}

void sub_100009DB4(uint64_t a1)
{
  if (*(void *)(a1 + 80) == 1)
  {
    int v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Recipient has a valid registration status.", (uint8_t *)&v17, 2u);
    }

    id v3 = +[INSendPaymentPayeeResolutionResult successWithResolvedPerson:*(void *)(a1 + 32)];
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 72), *(id *)(a1 + 48));
    [*(id *)(a1 + 56) selectMode:1];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    int v2 = PKLogFacilityTypeGetObject();
    BOOL v5 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v5)
      {
        uint64_t v6 = PKPeerPaymentRecipientStatusToString();
        id v7 = *(void **)(a1 + 64);
        int v17 = 138412546;
        id v18 = v6;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Recipient lookup returned status: %@ error: %@", (uint8_t *)&v17, 0x16u);
      }
      uint64_t v8 = [*(id *)(a1 + 40) _intentResponseFromWebServiceError:*(void *)(a1 + 64)];
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = *(void **)(v9 + 96);
      *(void *)(v9 + 96) = v8;

      uint64_t v11 = +[INSendPaymentPayeeResolutionResult notRequired];
    }
    else
    {
      if (v5)
      {
        id v12 = PKPeerPaymentRecipientStatusToString();
        int v17 = 138412290;
        id v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Recipient lookup returned status: %@ but no error", (uint8_t *)&v17, 0xCu);
      }
      uint64_t v11 = +[INSendPaymentPayeeResolutionResult unsupportedForReason:3];
    }
    id v3 = (void *)v11;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = NSStringFromSelector(*(SEL *)(a1 + 88));
    int v17 = 138543618;
    id v18 = v13;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with result %@", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v14 = *(void *)(a1 + 40);
  long long v15 = *(void **)(v14 + 88);
  *(void *)(v14 + 88) = v3;
  id v16 = v3;

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void sub_10000A7B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000AA68(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  id v4 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v4, "pk_didFinishInteractionForIntent:", *(void *)(a1 + 40));
}

void sub_10000AAF8(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) peerPaymentController];
  id v3 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000ABB8;
  v5[3] = &unk_100014A30;
  v5[4] = v3;
  id v6 = v2;
  id v7 = *(id *)(a1 + 40);
  id v4 = v2;
  [v3 peerPaymentRegistrationStatusWithCompletion:v5];
}

void sub_10000ABB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != 1)
  {
    id v12 = [*(id *)(a1 + 32) _responseForInvalidRegistrationStatus:a2];
    BOOL v5 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412290;
    char v24 = v12;
    __int16 v19 = "Calling handleSearchForAccounts: completion with invalid registration status result %@";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
    goto LABEL_18;
  }
  if (a3 && a3 != 5)
  {
    id v12 = objc_msgSend(*(id *)(a1 + 32), "_responseForInvalidAccountResolution:");
    BOOL v5 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412290;
    char v24 = v12;
    __int16 v19 = "Calling handleSearchForAccounts: completion with invalid account resolution result %@";
    goto LABEL_17;
  }
  id v4 = [*(id *)(a1 + 40) account];
  BOOL v5 = [v4 currentBalance];

  id v6 = [v5 amount];
  id v7 = [v5 currency];
  if (v6
    && (+[NSDecimalNumber notANumber],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v6 isEqual:v8],
        v8,
        (v9 & 1) == 0)
    && v7)
  {
    id v10 = objc_alloc((Class)INSearchForAccountsIntentResponse);
    uint64_t v11 = [*(id *)(a1 + 32) _openPeerPaymentPassActivity];
    id v12 = [v10 initWithCode:3 userActivity:v11];

    id v13 = objc_alloc((Class)INPaymentAccount);
    id v14 = [objc_alloc((Class)INSpeakableString) initWithSpokenPhrase:&stru_100014BF0];
    id v15 = [objc_alloc((Class)INBalanceAmount) initWithAmount:v6 currencyCode:v7];
    id v16 = [v13 initWithNickname:v14 number:0 accountType:0 organizationName:0 balance:v15 secondaryBalance:0];

    uint64_t v22 = v16;
    int v17 = +[NSArray arrayWithObjects:&v22 count:1];
    [v12 setAccounts:v17];

    id v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling handleSearchForAccounts: completion with success", buf, 2u);
    }
  }
  else
  {
    id v20 = objc_alloc((Class)INSearchForAccountsIntentResponse);
    id v21 = [*(id *)(a1 + 32) _openPeerPaymentPassActivity];
    id v12 = [v20 initWithCode:4 userActivity:v21];

    id v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      char v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Calling handleSearchForAccounts: completion with failure for invalid PKCurrencyAmount %@", buf, 0xCu);
    }
  }

LABEL_18:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000B18C(id a1)
{
  uint64_t v1 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Connecting to IMDaemonController", buf, 2u);
  }

  int v2 = +[IMDaemonController sharedInstance];
  [v2 addListenerID:@"PassKitIntentExtension" capabilities:(kFZListenerCapMessageHistory | kFZListenerCapChats) | kFZListenerCapFileTransfers];

  id v3 = +[IMDaemonController sharedInstance];
  [v3 blockUntilConnected];

  id v4 = +[IMDaemonController sharedInstance];
  [v4 _setBlocksConnectionAtResume:1];

  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Connected to IMDaemonController", v5, 2u);
  }
}

void sub_10000B3E4(id a1)
{
  uint64_t v1 = +[IMSystemMonitor sharedInstance];
  [v1 _forceSuspended];

  id v2 = +[IMSystemMonitor sharedInstance];
  [v2 _forceResumed];
}

void sub_10000D0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D170;
  v7[3] = &unk_100014AE0;
  void v7[4] = v3;
  uint64_t v9 = a2;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v10 = v6;
  dispatch_async(v4, v7);
}

uint64_t sub_10000D170(void *a1)
{
  *(void *)(a1[4] + 56) = a1[6];
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[7]);
}

void sub_10000D5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_10000D62C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000D63C(uint64_t a1)
{
}

uint64_t sub_10000D644(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = IMDMessageRecordCopyMostRecentUseageOfAddresses();

  return _objc_release_x1();
}

void sub_10000DD78(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Received handleRequestPayment: for an intent without a stored peer payment request recipient", v1, 2u);
}

void sub_10000DDBC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DDF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DE2C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DE64(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No handler for intent of type %{public}@", (uint8_t *)&v5, 0xCu);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CKMakeHandlesFromRecipients()
{
  return _CKMakeHandlesFromRecipients();
}

uint64_t IMCanonicalizeFormattedString()
{
  return _IMCanonicalizeFormattedString();
}

uint64_t IMDMessageRecordCopyMostRecentUseageOfAddresses()
{
  return _IMDMessageRecordCopyMostRecentUseageOfAddresses();
}

uint64_t IMDPersistencePerformBlock()
{
  return _IMDPersistencePerformBlock();
}

uint64_t IMNormalizeFormattedString()
{
  return _IMNormalizeFormattedString();
}

uint64_t IMNormalizedPhoneNumberForCFPhoneNumberRef()
{
  return _IMNormalizedPhoneNumberForCFPhoneNumberRef();
}

uint64_t IMPhoneNumberRefCopyForPhoneNumber()
{
  return _IMPhoneNumberRefCopyForPhoneNumber();
}

uint64_t INPersonHandleLabelForCNLabeledValue()
{
  return _INPersonHandleLabelForCNLabeledValue();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PKAnalyticsSendEvent()
{
  return _PKAnalyticsSendEvent();
}

uint64_t PKLogFacilityTypeGetObject()
{
  return _PKLogFacilityTypeGetObject();
}

uint64_t PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass()
{
  return _PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass();
}

uint64_t PKPeerPaymentExistingiMessageChatForRecipientAddress()
{
  return _PKPeerPaymentExistingiMessageChatForRecipientAddress();
}

uint64_t PKPeerPaymentRecipientStatusToString()
{
  return _PKPeerPaymentRecipientStatusToString();
}

uint64_t PKPeerPaymentSenderAddressForRecipientAddress()
{
  return _PKPeerPaymentSenderAddressForRecipientAddress();
}

uint64_t PKUseMockSURFServer()
{
  return _PKUseMockSURFServer();
}

void _Block_object_dispose(const void *a1, const int a2)
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

id objc_msgSend__appearsToBeEmail(void *a1, const char *a2, ...)
{
  return [a1 _appearsToBeEmail];
}

id objc_msgSend__appearsToBePhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 _appearsToBePhoneNumber];
}

id objc_msgSend__forceResumed(void *a1, const char *a2, ...)
{
  return [a1 _forceResumed];
}

id objc_msgSend__forceSuspended(void *a1, const char *a2, ...)
{
  return [a1 _forceSuspended];
}

id objc_msgSend__intentResponseForGenericFailure(void *a1, const char *a2, ...)
{
  return [a1 _intentResponseForGenericFailure];
}

id objc_msgSend__openPeerPaymentPassActivity(void *a1, const char *a2, ...)
{
  return [a1 _openPeerPaymentPassActivity];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_amount(void *a1, const char *a2, ...)
{
  return [a1 amount];
}

id objc_msgSend_applePayPaymentMethod(void *a1, const char *a2, ...)
{
  return [a1 applePayPaymentMethod];
}

id objc_msgSend_associatedPassUniqueID(void *a1, const char *a2, ...)
{
  return [a1 associatedPassUniqueID];
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return [a1 blockUntilConnected];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connectToIMDaemonController(void *a1, const char *a2, ...)
{
  return [a1 connectToIMDaemonController];
}

id objc_msgSend_contactIdentifier(void *a1, const char *a2, ...)
{
  return [a1 contactIdentifier];
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

id objc_msgSend_currencyCode(void *a1, const char *a2, ...)
{
  return [a1 currencyCode];
}

id objc_msgSend_currentBalance(void *a1, const char *a2, ...)
{
  return [a1 currentBalance];
}

id objc_msgSend_customIdentifier(void *a1, const char *a2, ...)
{
  return [a1 customIdentifier];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_iMessageService(void *a1, const char *a2, ...)
{
  return [a1 iMessageService];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intentQueue(void *a1, const char *a2, ...)
{
  return [a1 intentQueue];
}

id objc_msgSend_isPersonWithNoHandle(void *a1, const char *a2, ...)
{
  return [a1 isPersonWithNoHandle];
}

id objc_msgSend_join(void *a1, const char *a2, ...)
{
  return [a1 join];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localProperties(void *a1, const char *a2, ...)
{
  return [a1 localProperties];
}

id objc_msgSend_maximumAmount(void *a1, const char *a2, ...)
{
  return [a1 maximumAmount];
}

id objc_msgSend_memo(void *a1, const char *a2, ...)
{
  return [a1 memo];
}

id objc_msgSend_minimumAmount(void *a1, const char *a2, ...)
{
  return [a1 minimumAmount];
}

id objc_msgSend_nameComponents(void *a1, const char *a2, ...)
{
  return [a1 nameComponents];
}

id objc_msgSend_needsValue(void *a1, const char *a2, ...)
{
  return [a1 needsValue];
}

id objc_msgSend_notANumber(void *a1, const char *a2, ...)
{
  return [a1 notANumber];
}

id objc_msgSend_notRequired(void *a1, const char *a2, ...)
{
  return [a1 notRequired];
}

id objc_msgSend_note(void *a1, const char *a2, ...)
{
  return [a1 note];
}

id objc_msgSend_organizationName(void *a1, const char *a2, ...)
{
  return [a1 organizationName];
}

id objc_msgSend_payee(void *a1, const char *a2, ...)
{
  return [a1 payee];
}

id objc_msgSend_payer(void *a1, const char *a2, ...)
{
  return [a1 payer];
}

id objc_msgSend_peerPaymentController(void *a1, const char *a2, ...)
{
  return [a1 peerPaymentController];
}

id objc_msgSend_peerPaymentPass(void *a1, const char *a2, ...)
{
  return [a1 peerPaymentPass];
}

id objc_msgSend_peerPaymentService(void *a1, const char *a2, ...)
{
  return [a1 peerPaymentService];
}

id objc_msgSend_personHandle(void *a1, const char *a2, ...)
{
  return [a1 personHandle];
}

id objc_msgSend_personResolutionResult(void *a1, const char *a2, ...)
{
  return [a1 personResolutionResult];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return [a1 phoneNumbers];
}

id objc_msgSend_pkFullyQualifiedName(void *a1, const char *a2, ...)
{
  return [a1 pkFullyQualifiedName];
}

id objc_msgSend_refreshServiceForSending(void *a1, const char *a2, ...)
{
  return [a1 refreshServiceForSending];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resolvedValue(void *a1, const char *a2, ...)
{
  return [a1 resolvedValue];
}

id objc_msgSend_sendToUserFeatureDescriptor(void *a1, const char *a2, ...)
{
  return [a1 sendToUserFeatureDescriptor];
}

id objc_msgSend_senderPhoneOrEmail(void *a1, const char *a2, ...)
{
  return [a1 senderPhoneOrEmail];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_sharedRegistry(void *a1, const char *a2, ...)
{
  return [a1 sharedRegistry];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_siriLocale(void *a1, const char *a2, ...)
{
  return [a1 siriLocale];
}

id objc_msgSend_siriMatches(void *a1, const char *a2, ...)
{
  return [a1 siriMatches];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_totalFees(void *a1, const char *a2, ...)
{
  return [a1 totalFees];
}

id objc_msgSend_totalFeesCurrency(void *a1, const char *a2, ...)
{
  return [a1 totalFeesCurrency];
}

id objc_msgSend_totalReceiveAmount(void *a1, const char *a2, ...)
{
  return [a1 totalReceiveAmount];
}

id objc_msgSend_totalReceiveAmountCurrency(void *a1, const char *a2, ...)
{
  return [a1 totalReceiveAmountCurrency];
}

id objc_msgSend_underlyingMessage(void *a1, const char *a2, ...)
{
  return [a1 underlyingMessage];
}

id objc_msgSend_unsupported(void *a1, const char *a2, ...)
{
  return [a1 unsupported];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}