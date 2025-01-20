@interface PKSendPaymentIntentHandler
- (INSendPaymentIntentResponse)preDeterminedIntentResponse;
- (INSendPaymentPayeeResolutionResult)preDeterminedPayeeResolutionResult;
- (PKPeerPaymentQuote)pendingQuote;
- (PKPeerPaymentRecipient)resolvedRecipient;
- (id)_intentResponseForGenericFailure;
- (id)_intentResponseFromWebServiceError:(id)a3;
- (id)_paymentRecordFromQuote:(id)a3 payee:(id)a4 note:(id)a5 status:(int64_t)a6;
- (id)_peerPaymentMessageForAuthorizedPaymentWithQuote:(id)a3 performResponse:(id)a4 recipientHandle:(id)a5 senderHandle:(id)a6 memo:(id)a7;
- (id)_responseForInvalidAccountResolution:(unint64_t)a3;
- (id)_responseForInvalidRegistrationStatus:(unint64_t)a3;
- (void)_queue_fetchQuoteForIntent:(id)a3 peerPaymentController:(id)a4 completion:(id)a5;
- (void)_queue_identifyRecipientWithIntent:(id)a3 peerPaymentController:(id)a4 completion:(id)a5;
- (void)_queue_performOperationsIfNecessary:(unint64_t)a3 intent:(id)a4 completion:(id)a5;
- (void)_queue_performQuoteForIntent:(id)a3 peerPaymentController:(id)a4 completion:(id)a5;
- (void)confirmSendPayment:(id)a3 completion:(id)a4;
- (void)handleSendPayment:(id)a3 completion:(id)a4;
- (void)resolveCurrencyAmountForSendPayment:(id)a3 completion:(id)a4;
- (void)resolveNoteForSendPayment:(id)a3 withCompletion:(id)a4;
- (void)resolvePayeeForSendPayment:(id)a3 completion:(id)a4;
- (void)setPendingQuote:(id)a3;
- (void)setPreDeterminedIntentResponse:(id)a3;
- (void)setPreDeterminedPayeeResolutionResult:(id)a3;
- (void)setResolvedRecipient:(id)a3;
@end

@implementation PKSendPaymentIntentHandler

- (void)confirmSendPayment:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received call to %{public}@ with intent %@", buf, 0x16u);
  }
  kdebug_trace();
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100005D20;
  v20[3] = &unk_100014738;
  id v21 = v8;
  id v11 = v8;
  v12 = objc_retainBlock(v20);
  v13 = [(PKPeerPaymentIntentHandler *)self intentQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005D94;
  block[3] = &unk_100014648;
  id v18 = v12;
  SEL v19 = a2;
  block[4] = self;
  id v17 = v7;
  id v14 = v7;
  v15 = v12;
  dispatch_async(v13, block);
}

- (void)handleSendPayment:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received call to %{public}@ with intent %@", buf, 0x16u);
  }
  kdebug_trace();
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100006484;
  v20[3] = &unk_100014738;
  id v21 = v8;
  id v11 = v8;
  v12 = objc_retainBlock(v20);
  v13 = [(PKPeerPaymentIntentHandler *)self intentQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000064F8;
  block[3] = &unk_100014648;
  id v18 = v12;
  SEL v19 = a2;
  block[4] = self;
  id v17 = v7;
  id v14 = v7;
  v15 = v12;
  dispatch_async(v13, block);
}

- (void)resolveNoteForSendPayment:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received call to %{public}@ with intent %@", buf, 0x16u);
  }
  kdebug_trace();
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100006BE8;
  v20[3] = &unk_100014670;
  id v21 = v8;
  id v11 = v8;
  v12 = objc_retainBlock(v20);
  v13 = [(PKPeerPaymentIntentHandler *)self intentQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006C5C;
  block[3] = &unk_100014648;
  id v18 = v12;
  SEL v19 = a2;
  block[4] = self;
  id v17 = v7;
  id v14 = v7;
  v15 = v12;
  dispatch_async(v13, block);
}

- (void)resolvePayeeForSendPayment:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received call to %{public}@ with intent %@", buf, 0x16u);
  }
  kdebug_trace();
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000731C;
  v20[3] = &unk_1000147B0;
  id v21 = v8;
  id v11 = v8;
  v12 = objc_retainBlock(v20);
  v13 = [(PKPeerPaymentIntentHandler *)self intentQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007390;
  block[3] = &unk_100014648;
  id v18 = v12;
  SEL v19 = a2;
  block[4] = self;
  id v17 = v7;
  id v14 = v7;
  v15 = v12;
  dispatch_async(v13, block);
}

- (void)resolveCurrencyAmountForSendPayment:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received call to %{public}@ with intent %@", buf, 0x16u);
  }
  kdebug_trace();
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100007A40;
  v20[3] = &unk_1000147D8;
  id v21 = v8;
  id v11 = v8;
  v12 = objc_retainBlock(v20);
  v13 = [(PKPeerPaymentIntentHandler *)self intentQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007AB4;
  block[3] = &unk_100014648;
  id v18 = v12;
  SEL v19 = a2;
  block[4] = self;
  id v17 = v7;
  id v14 = v7;
  v15 = v12;
  dispatch_async(v13, block);
}

- (void)_queue_performOperationsIfNecessary:(unint64_t)a3 intent:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = v8;
      id v11 = objc_alloc_init((Class)NSMutableArray);
      if (a3)
      {
        int v12 = 1;
        unint64_t v13 = 1;
        do
        {
          if ((v13 & a3) != 0)
          {
            switch(v13)
            {
              case 1uLL:
                CFStringRef v14 = @"RecipientLookUp";
                goto LABEL_12;
              case 4uLL:
                CFStringRef v14 = @"PerformQuote";
                goto LABEL_12;
              case 2uLL:
                CFStringRef v14 = @"Quote";
LABEL_12:
                objc_msgSend(v11, "addObject:", v14, v27);
                break;
            }
          }
          unint64_t v13 = 1 << v12++;
        }
        while (v13 <= a3);
      }
      objc_msgSend(v11, "description", v27);
      v15 = id v8 = v28;

      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Performing send payment intent operations %@", (uint8_t *)&buf, 0xCu);
    }
    v16 = [(PKPeerPaymentIntentHandler *)self peerPaymentController];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v49 = 0x3032000000;
    v50 = sub_1000087E8;
    v51 = sub_1000087F8;
    id v52 = 0;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100008800;
    v42[3] = &unk_100014850;
    unint64_t v47 = a3;
    v42[4] = self;
    id v17 = v8;
    id v43 = v17;
    id v18 = v16;
    id v44 = v18;
    id v19 = v9;
    id v45 = v19;
    p_long long buf = &buf;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000089C4;
    v35[3] = &unk_1000148A0;
    unint64_t v41 = a3;
    v35[4] = self;
    v20 = objc_retainBlock(v42);
    id v38 = v20;
    id v21 = v17;
    id v36 = v21;
    id v22 = v18;
    id v37 = v22;
    v40 = &buf;
    id v23 = v19;
    id v39 = v23;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100008BF0;
    v29[3] = &unk_1000148F0;
    unint64_t v34 = a3;
    v29[4] = self;
    __int16 v24 = objc_retainBlock(v35);
    id v32 = v24;
    id v30 = v21;
    id v25 = v22;
    id v31 = v25;
    id v33 = v23;
    v26 = objc_retainBlock(v29);
    ((void (*)(void))v26[2])();

    _Block_object_dispose(&buf, 8);
  }
}

- (void)_queue_performQuoteForIntent:(id)a3 peerPaymentController:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    int v12 = self->_pendingQuote;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100008EDC;
    v14[3] = &unk_100014940;
    id v15 = v9;
    id v16 = v10;
    id v17 = self;
    id v18 = v12;
    SEL v20 = a2;
    id v19 = v11;
    unint64_t v13 = v12;
    [v16 performQuote:v13 completion:v14];
  }
}

- (void)_queue_fetchQuoteForIntent:(id)a3 peerPaymentController:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    id v11 = a4;
    int v12 = [v9 currencyAmount];
    unint64_t v13 = [(PKPeerPaymentIntentHandler *)self pkCurrencyAmountFromIntentAmount:v12];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100009418;
    v14[3] = &unk_100014990;
    void v14[4] = self;
    id v15 = v9;
    SEL v17 = a2;
    id v16 = v10;
    [v11 quoteWithAmount:v13 source:2 completion:v14];
  }
}

- (void)_queue_identifyRecipientWithIntent:(id)a3 peerPaymentController:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = [a3 payee];
    int v12 = [(PKPeerPaymentIntentHandler *)self resolveSiriMatchesForPerson:v11];
    unint64_t v13 = [v12 personResolutionResult];
    CFStringRef v14 = [v13 resolvedValue];
    id v15 = v14;
    if (v14)
    {
      id v27 = v11;
      id v16 = [v14 personHandle];
      id v17 = [v16 value];

      id v18 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v34 = v17;
        __int16 v35 = 2112;
        id v36 = v15;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Resolved handle: %@ for person: %@", buf, 0x16u);
      }

      id v19 = PKPeerPaymentSenderAddressForRecipientAddress();
      if (v19)
      {
        [v9 reset];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100009C8C;
        v28[3] = &unk_1000149E0;
        v28[4] = self;
        id v29 = v15;
        id v30 = v9;
        SEL v32 = a2;
        id v31 = v10;
        [v30 identifyRecipientWithAddress:v17 senderAddress:v19 completion:v28];
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Do not have a sending address to use for identifyRecipient, fast forwarding to return continue in app intent response.", buf, 2u);
        }

        id v23 = (INSendPaymentIntentResponse *)[objc_alloc((Class)INSendPaymentIntentResponse) initWithCode:5 userActivity:0];
        preDeterminedIntentResponse = self->_preDeterminedIntentResponse;
        self->_preDeterminedIntentResponse = v23;

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = NSStringFromSelector(a2);
          *(_DWORD *)long long buf = 138543362;
          id v34 = v25;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling %{public}@ completion with not required response", buf, 0xCu);
        }
        v26 = +[INSendPaymentPayeeResolutionResult notRequired];
        (*((void (**)(id, void *))v10 + 2))(v10, v26);
      }
      id v11 = v27;
      goto LABEL_22;
    }
    if ([v12 isPersonWithNoHandle])
    {
      id v17 = +[INSendPaymentPayeeResolutionResult unsupportedForReason:4];
      SEL v20 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
LABEL_21:

        (*((void (**)(id, id))v10 + 2))(v10, v17);
LABEL_22:

        goto LABEL_23;
      }
      id v21 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138543618;
      id v34 = v21;
      __int16 v35 = 2112;
      id v36 = v17;
      id v22 = "Calling %{public}@ completion with no handle result %@";
    }
    else
    {
      SEL v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Not checking payee elibility status for result that does not include a single resolved person.", buf, 2u);
      }

      id v17 = [objc_alloc((Class)INSendPaymentPayeeResolutionResult) initWithPersonResolutionResult:v13];
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      id v21 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138543618;
      id v34 = v21;
      __int16 v35 = 2112;
      id v36 = v17;
      id v22 = "Calling %{public}@ completion with result %@";
    }
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v22, buf, 0x16u);

    goto LABEL_21;
  }
LABEL_23:
}

- (id)_intentResponseFromWebServiceError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  v5 = [v3 domain];
  unsigned int v6 = [v5 isEqualToString:PKDisplayableErrorDomain];

  if (v6)
  {
    id v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

    v4 = (void *)v8;
    if (!v8) {
      goto LABEL_8;
    }
  }
  id v9 = [v4 domain];
  unsigned int v10 = [v9 isEqualToString:PKPeerPaymentWebServiceErrorDomain];

  if (v10)
  {
    uint64_t v11 = (uint64_t)[v4 code];
    uint64_t v12 = 4;
    if (v11 <= 40300)
    {
      uint64_t v15 = 13;
      if (v11 != 5) {
        uint64_t v15 = 4;
      }
      if (v11 == 1) {
        uint64_t v12 = 6;
      }
      else {
        uint64_t v12 = v15;
      }
    }
    else
    {
      switch(v11)
      {
        case 40301:
          goto LABEL_20;
        case 40302:
          uint64_t v12 = 7;
          break;
        case 40303:
          uint64_t v12 = 8;
          break;
        case 40304:
        case 40305:
        case 40306:
        case 40307:
          break;
        case 40308:
          goto LABEL_19;
        default:
          if (v11 == 40316)
          {
LABEL_20:
            uint64_t v12 = 10;
          }
          else if (v11 == 40319)
          {
LABEL_19:
            uint64_t v12 = 12;
          }
          break;
      }
    }
  }
  else
  {
LABEL_8:
    uint64_t v12 = 4;
  }
  id v13 = [objc_alloc((Class)INSendPaymentIntentResponse) initWithCode:v12 userActivity:0];

  return v13;
}

- (id)_intentResponseForGenericFailure
{
  id v2 = [objc_alloc((Class)INSendPaymentIntentResponse) initWithCode:4 userActivity:0];

  return v2;
}

- (id)_responseForInvalidRegistrationStatus:(unint64_t)a3
{
  if (a3 - 2 > 2) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = qword_10000FFA8[a3 - 2];
  }
  id v4 = [objc_alloc((Class)INSendPaymentIntentResponse) initWithCode:v3 userActivity:0];

  return v4;
}

- (id)_responseForInvalidAccountResolution:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = qword_10000FFC0[a3 - 1];
  }
  id v4 = [objc_alloc((Class)INSendPaymentIntentResponse) initWithCode:v3 userActivity:0];

  return v4;
}

- (id)_peerPaymentMessageForAuthorizedPaymentWithQuote:(id)a3 performResponse:(id)a4 recipientHandle:(id)a5 senderHandle:(id)a6 memo:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  id v16 = [v15 totalReceiveAmountCurrency];
  id v17 = [v15 totalReceiveAmount];

  id v18 = PKLogFacilityTypeGetObject();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v11 && v12 && v16 && v17)
  {
    if (v19)
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Constructing PKPeerPaymentMessage", (uint8_t *)&v22, 2u);
    }

    id v20 = [objc_alloc((Class)PKPeerPaymentMessage) initWithType:1];
    [v20 setAmount:v17];
    [v20 setCurrency:v16];
    [v20 setSenderAddress:v13];
    [v20 setRecipientAddress:v12];
    [v20 setMemo:v14];
    [v20 updateWithPeerPaymentPerformResponse:v11];
    id v18 = [objc_alloc((Class)PKPeerPaymentMessageLocalProperties) initWithSource:3];
    [v20 setLocalProperties:v18];
  }
  else
  {
    if (v19)
    {
      int v22 = 138413058;
      id v23 = v12;
      __int16 v24 = 2112;
      id v25 = v16;
      __int16 v26 = 2112;
      id v27 = v17;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Could not construct peer payment message. Recipient: %@, currency: %@, amount: %@, performResponse: %@", (uint8_t *)&v22, 0x2Au);
    }
    id v20 = 0;
  }

  return v20;
}

- (id)_paymentRecordFromQuote:(id)a3 payee:(id)a4 note:(id)a5 status:(int64_t)a6
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 totalReceiveAmount];
  id v12 = [v10 totalReceiveAmountCurrency];
  id v13 = [objc_alloc((Class)INCurrencyAmount) initWithAmount:v11 currencyCode:v12];
  id v14 = [v10 totalFees];
  id v15 = [v10 totalFeesCurrency];

  id v16 = 0;
  if (v14 && v15) {
    id v16 = [objc_alloc((Class)INCurrencyAmount) initWithAmount:v14 currencyCode:v15];
  }
  id v17 = objc_alloc((Class)INPaymentRecord);
  id v18 = +[INPaymentMethod applePayPaymentMethod];
  id v19 = [v17 initWithPayee:v9 payer:0 currencyAmount:v13 paymentMethod:v18 note:v8 status:a6 feeAmount:v16];

  return v19;
}

- (PKPeerPaymentRecipient)resolvedRecipient
{
  return self->_resolvedRecipient;
}

- (void)setResolvedRecipient:(id)a3
{
}

- (PKPeerPaymentQuote)pendingQuote
{
  return self->_pendingQuote;
}

- (void)setPendingQuote:(id)a3
{
}

- (INSendPaymentPayeeResolutionResult)preDeterminedPayeeResolutionResult
{
  return self->_preDeterminedPayeeResolutionResult;
}

- (void)setPreDeterminedPayeeResolutionResult:(id)a3
{
}

- (INSendPaymentIntentResponse)preDeterminedIntentResponse
{
  return self->_preDeterminedIntentResponse;
}

- (void)setPreDeterminedIntentResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preDeterminedIntentResponse, 0);
  objc_storeStrong((id *)&self->_preDeterminedPayeeResolutionResult, 0);
  objc_storeStrong((id *)&self->_pendingQuote, 0);

  objc_storeStrong((id *)&self->_resolvedRecipient, 0);
}

@end