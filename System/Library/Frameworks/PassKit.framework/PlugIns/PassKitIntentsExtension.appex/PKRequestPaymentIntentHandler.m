@interface PKRequestPaymentIntentHandler
- (INRequestPaymentIntentResponse)preDeterminedIntentResponse;
- (PKPeerPaymentRecipient)resolvedRecipient;
- (id)_intentResponseForGenericFailure;
- (id)_intentResponseFromWebServiceError:(id)a3;
- (id)_peerPaymentMessageForRequestWithCurrencyAmount:(id)a3 requestToken:(id)a4 recipientHandle:(id)a5 senderHandle:(id)a6 memo:(id)a7;
- (id)_responseForInvalidAccountResolution:(unint64_t)a3;
- (id)_responseForInvalidRegistrationStatus:(unint64_t)a3;
- (void)_queue_fetchRequestTokenForIntent:(id)a3 peerPaymentController:(id)a4 completion:(id)a5;
- (void)_queue_identifyRecipientWithIntent:(id)a3 peerPaymentController:(id)a4 completion:(id)a5;
- (void)confirmRequestPayment:(id)a3 completion:(id)a4;
- (void)handleRequestPayment:(id)a3 completion:(id)a4;
- (void)resolveCurrencyAmountForRequestPayment:(id)a3 completion:(id)a4;
- (void)resolveNoteForRequestPayment:(id)a3 withCompletion:(id)a4;
- (void)resolvePayerForRequestPayment:(id)a3 completion:(id)a4;
- (void)setPreDeterminedIntentResponse:(id)a3;
- (void)setResolvedRecipient:(id)a3;
@end

@implementation PKRequestPaymentIntentHandler

- (void)handleRequestPayment:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v22 = v10;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received call to %{public}@ with intent %@", buf, 0x16u);
  }
  kdebug_trace();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100003080;
  v19[3] = &unk_1000144B8;
  id v20 = v8;
  id v11 = v8;
  v12 = objc_retainBlock(v19);
  v13 = [(PKPeerPaymentIntentHandler *)self intentQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000030F4;
  v16[3] = &unk_100014530;
  id v17 = v7;
  id v18 = v12;
  v16[4] = self;
  id v14 = v7;
  v15 = v12;
  dispatch_async(v13, v16);
}

- (void)confirmRequestPayment:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v21 = v10;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received call to %@ with intent %@", buf, 0x16u);
  }
  kdebug_trace();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000373C;
  v18[3] = &unk_1000144B8;
  id v11 = v8;
  id v19 = v11;
  v12 = objc_retainBlock(v18);
  v13 = v12;
  if (self->_preDeterminedIntentResponse)
  {
    ((void (*)(void *))v12[2])(v12);
    preDeterminedIntentResponse = self->_preDeterminedIntentResponse;
    self->_preDeterminedIntentResponse = 0;
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000037B0;
    v15[3] = &unk_100014580;
    id v17 = v12;
    v15[4] = self;
    id v16 = v7;
    [(PKPeerPaymentIntentHandler *)self peerPaymentRegistrationStatusWithCompletion:v15];

    preDeterminedIntentResponse = v17;
  }
}

- (void)resolvePayerForRequestPayment:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    __int16 v22 = v10;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received call to %{public}@ with intent %@", buf, 0x16u);
  }
  kdebug_trace();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100003D48;
  v19[3] = &unk_1000145A8;
  id v20 = v8;
  id v11 = v8;
  v12 = objc_retainBlock(v19);
  v13 = [(PKPeerPaymentIntentHandler *)self intentQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100003DBC;
  v16[3] = &unk_100014530;
  id v17 = v7;
  id v18 = v12;
  v16[4] = self;
  id v14 = v7;
  v15 = v12;
  dispatch_async(v13, v16);
}

- (void)resolveCurrencyAmountForRequestPayment:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    __int16 v23 = v10;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received call to %{public}@ with intent %@", buf, 0x16u);
  }
  kdebug_trace();
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100004210;
  v20[3] = &unk_1000145D0;
  id v21 = v8;
  id v11 = v8;
  v12 = objc_retainBlock(v20);
  v13 = [(PKPeerPaymentIntentHandler *)self intentQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004284;
  block[3] = &unk_100014648;
  block[4] = self;
  id v17 = v7;
  id v18 = v12;
  SEL v19 = a2;
  id v14 = v7;
  v15 = v12;
  dispatch_async(v13, block);
}

- (void)resolveNoteForRequestPayment:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    __int16 v22 = v10;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received call to %{public}@ with intent %@", buf, 0x16u);
  }
  kdebug_trace();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100004A10;
  v19[3] = &unk_100014670;
  id v20 = v8;
  id v11 = v8;
  v12 = objc_retainBlock(v19);
  v13 = [(PKPeerPaymentIntentHandler *)self intentQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100004A84;
  v16[3] = &unk_100014530;
  id v17 = v7;
  id v18 = v12;
  v16[4] = self;
  id v14 = v7;
  v15 = v12;
  dispatch_async(v13, v16);
}

- (id)_responseForInvalidRegistrationStatus:(unint64_t)a3
{
  if (a3 - 2 > 2) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = qword_10000FF80[a3 - 2];
  }
  id v4 = [objc_alloc((Class)INRequestPaymentIntentResponse) initWithCode:v3 userActivity:0];

  return v4;
}

- (id)_responseForInvalidAccountResolution:(unint64_t)a3
{
  uint64_t v3 = 4;
  if (a3 == 2) {
    uint64_t v3 = 6;
  }
  if (a3 == 1) {
    uint64_t v4 = 10;
  }
  else {
    uint64_t v4 = v3;
  }
  id v5 = [objc_alloc((Class)INRequestPaymentIntentResponse) initWithCode:v4 userActivity:0];

  return v5;
}

- (void)_queue_identifyRecipientWithIntent:(id)a3 peerPaymentController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v25 = [v8 payer];
    id v11 = -[PKPeerPaymentIntentHandler resolveSiriMatchesForPerson:](self, "resolveSiriMatchesForPerson:");
    v12 = [v11 personResolutionResult];
    v13 = [v12 resolvedValue];
    id v14 = v13;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = sub_1000050CC;
    v32[4] = sub_1000050DC;
    id v33 = 0;
    if (v13)
    {
      v15 = [v13 personHandle];
      id v16 = [v15 value];

      uint64_t v23 = PKPeerPaymentSenderAddressForRecipientAddress();
      if (v23)
      {
        id v17 = objc_msgSend(v14, "personHandle", v23);
        id v18 = [v17 value];

        SEL v19 = PKPeerPaymentSenderAddressForRecipientAddress();
        [v9 reset];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1000050E4;
        v27[3] = &unk_1000146C0;
        v27[4] = self;
        v31 = v32;
        id v28 = v14;
        id v29 = v9;
        id v30 = v10;
        [v29 identifyRecipientWithAddress:v18 senderAddress:v19 completion:v27];
      }
      else
      {
        id v20 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Do not have a sending address to use for identifyRecipient, fast forwarding to return continue in app intent response.", buf, 2u);
        }

        id v21 = (INRequestPaymentIntentResponse *)objc_msgSend(objc_alloc((Class)INRequestPaymentIntentResponse), "initWithCode:userActivity:", 5, 0, 0);
        preDeterminedIntentResponse = self->_preDeterminedIntentResponse;
        self->_preDeterminedIntentResponse = v21;

        id v18 = +[INRequestPaymentPayerResolutionResult notRequired];
        (*((void (**)(id, void *))v10 + 2))(v10, v18);
      }
    }
    else
    {
      if ([v11 isPersonWithNoHandle])
      {
        id v16 = +[INRequestPaymentPayerResolutionResult unsupportedForReason:3];
      }
      else
      {
        id v16 = [objc_alloc((Class)INRequestPaymentPayerResolutionResult) initWithPersonResolutionResult:v12];
      }
      (*((void (**)(id, id))v10 + 2))(v10, v16);
    }

    _Block_object_dispose(v32, 8);
  }
}

- (void)_queue_fetchRequestTokenForIntent:(id)a3 peerPaymentController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = [v8 currencyAmount];
    v12 = [(PKPeerPaymentIntentHandler *)self pkCurrencyAmountFromIntentAmount:v11];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005444;
    v14[3] = &unk_100014710;
    id v15 = v8;
    id v16 = v9;
    id v17 = self;
    id v18 = v12;
    id v19 = v10;
    id v13 = v12;
    [v16 formalRequestTokenForAmount:v13 source:3 completion:v14];
  }
}

- (id)_intentResponseFromWebServiceError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_13;
  }
  id v5 = [v3 domain];
  unsigned int v6 = [v5 isEqualToString:PKDisplayableErrorDomain];

  if (v6)
  {
    id v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

    uint64_t v4 = (void *)v8;
    if (!v8) {
      goto LABEL_13;
    }
  }
  id v9 = [v4 domain];
  unsigned int v10 = [v9 isEqualToString:PKPeerPaymentWebServiceErrorDomain];

  if (v10)
  {
    uint64_t v11 = (uint64_t)[v4 code];
    uint64_t v12 = 4;
    if (v11 > 40302)
    {
      if (v11 == 40303)
      {
        uint64_t v12 = 8;
      }
      else if (v11 == 40308 || v11 == 40319)
      {
        uint64_t v12 = 11;
      }
    }
    else
    {
      uint64_t v13 = 12;
      uint64_t v14 = 7;
      if (v11 != 40302) {
        uint64_t v14 = 4;
      }
      if (v11 != 5) {
        uint64_t v13 = v14;
      }
      if (v11 == 1) {
        uint64_t v12 = 6;
      }
      else {
        uint64_t v12 = v13;
      }
    }
  }
  else
  {
LABEL_13:
    uint64_t v12 = 4;
  }
  id v15 = [objc_alloc((Class)INRequestPaymentIntentResponse) initWithCode:v12 userActivity:0];

  return v15;
}

- (id)_intentResponseForGenericFailure
{
  id v2 = [objc_alloc((Class)INRequestPaymentIntentResponse) initWithCode:4 userActivity:0];

  return v2;
}

- (id)_peerPaymentMessageForRequestWithCurrencyAmount:(id)a3 requestToken:(id)a4 recipientHandle:(id)a5 senderHandle:(id)a6 memo:(id)a7
{
  id v7 = 0;
  if (a3 && a5)
  {
    id v12 = a7;
    id v13 = a6;
    id v14 = a5;
    id v15 = a4;
    id v16 = a3;
    id v7 = [objc_alloc((Class)PKPeerPaymentMessage) initWithType:2];
    id v17 = [v16 amount];
    [v7 setAmount:v17];

    id v18 = [v16 currency];

    [v7 setCurrency:v18];
    [v7 setSenderAddress:v13];

    [v7 setRecipientAddress:v14];
    [v7 setRequestToken:v15];

    [v7 setMemo:v12];
    id v19 = [objc_alloc((Class)PKPeerPaymentMessageLocalProperties) initWithSource:3];
    [v7 setLocalProperties:v19];
  }

  return v7;
}

- (PKPeerPaymentRecipient)resolvedRecipient
{
  return self->_resolvedRecipient;
}

- (void)setResolvedRecipient:(id)a3
{
}

- (INRequestPaymentIntentResponse)preDeterminedIntentResponse
{
  return self->_preDeterminedIntentResponse;
}

- (void)setPreDeterminedIntentResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preDeterminedIntentResponse, 0);

  objc_storeStrong((id *)&self->_resolvedRecipient, 0);
}

@end