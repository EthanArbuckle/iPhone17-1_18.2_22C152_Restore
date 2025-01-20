@interface InAppTransactionTask
- (AppleIDAuthorizationRequestInfo)siwaAuthorizationInfo;
- (BOOL)excludeReceiptFromRequest;
- (BOOL)forceAuthentication;
- (BOOL)hideConfirmation;
- (BOOL)isProcessingInterruptedBuy;
- (BOOL)isStoreKitViewInitiated;
- (BOOL)isStoreOriginated;
- (BOOL)privacyAcknowledgementRequired;
- (BOOL)shouldInstallParentAppWithBuyParams:(id)a3;
- (BOOL)simulateAskToBuy;
- (DialogProtocol)dialogContext;
- (InAppTransactionTask)initWithBuyParams:(id)a3 client:(id)a4 apiVersion:(int64_t)a5;
- (InAppTransactionTask)initWithProductIdentifier:(id)a3 quantity:(unint64_t)a4 client:(id)a5 apiVersion:(int64_t)a6;
- (NSData)requestData;
- (NSDictionary)additionalBuyParams;
- (NSDictionary)customBuyParams;
- (NSDictionary)response;
- (NSDictionary)transaction;
- (NSNumber)discountTimestamp;
- (NSString)appAccountToken;
- (NSString)applicationUsername;
- (NSString)discountIdentifier;
- (NSString)discountKeyIdentifier;
- (NSString)discountNonceString;
- (NSString)discountSignature;
- (NSString)logKey;
- (NSString)partnerIdentifier;
- (NSString)partnerTransactionIdentifier;
- (NSString)presentingSceneID;
- (NSString)productIdentifier;
- (NSString)productKind;
- (NSString)serverCorrelationIdentifier;
- (NSString)subscriptionPeriod;
- (NSString)winbackOfferIdentifier;
- (NSURL)receiptInstallURL;
- (SKPaymentDelegateProtocol)paymentDelegate;
- (_TtC9storekitd6Client)client;
- (id)_authenticateWithAccountInfo:(id)a3 error:(id *)a4;
- (id)_processPurchaseResult:(id)a3 authorizationResult:(id)a4;
- (int64_t)apiVersion;
- (unint64_t)quantity;
- (void)_cacheLegacyTransaction;
- (void)_latestTransactionWithCompletion:(id)a3;
- (void)_performWithBuyParams:(id)a3;
- (void)buyParams:(BOOL)a3 completionHandler:(id)a4;
- (void)clearTransactionCache;
- (void)main;
- (void)purchase:(AMSPurchase *)a3 handleAuthenticateRequest:(AMSAuthenticateRequest *)a4 completion:(id)a5;
- (void)purchase:(AMSPurchase *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5;
- (void)purchase:(AMSPurchase *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5;
- (void)purchaseIntakeWithMetrics:(id)a3;
- (void)setAdditionalBuyParams:(id)a3;
- (void)setAppAccountToken:(id)a3;
- (void)setApplicationUsername:(id)a3;
- (void)setCustomBuyParams:(id)a3;
- (void)setDialogContext:(id)a3;
- (void)setDiscountIdentifier:(id)a3;
- (void)setDiscountKeyIdentifier:(id)a3;
- (void)setDiscountNonceString:(id)a3;
- (void)setDiscountSignature:(id)a3;
- (void)setDiscountTimestamp:(id)a3;
- (void)setExcludeReceiptFromRequest:(BOOL)a3;
- (void)setForceAuthentication:(BOOL)a3;
- (void)setHideConfirmation:(BOOL)a3;
- (void)setIsProcessingInterruptedBuy:(BOOL)a3;
- (void)setPartnerIdentifier:(id)a3;
- (void)setPartnerTransactionIdentifier:(id)a3;
- (void)setPaymentDelegate:(id)a3;
- (void)setPresentingSceneID:(id)a3;
- (void)setPrivacyAcknowledgementRequired:(BOOL)a3;
- (void)setProductKind:(id)a3;
- (void)setReceiptInstallURL:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setResponse:(id)a3;
- (void)setSimulateAskToBuy:(BOOL)a3;
- (void)setSiwaAuthorizationInfo:(id)a3;
- (void)setStoreOriginated:(BOOL)a3;
- (void)setStorekitViewInitiated:(BOOL)a3;
- (void)setSubscriptionPeriod:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setWinbackOfferIdentifier:(id)a3;
@end

@implementation InAppTransactionTask

- (InAppTransactionTask)initWithBuyParams:(id)a3 client:(id)a4 apiVersion:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 parameterForKey:@"offerName"];
  v11 = [v8 parameterForKey:@"quantity"];
  id v12 = [v11 integerValue];

  v13 = [(InAppTransactionTask *)self initWithProductIdentifier:v10 quantity:v12 client:v9 apiVersion:a5];
  if (v13)
  {
    uint64_t v14 = [v8 dictionary];
    v15 = *(void **)((char *)&v13->_quantity + 2);
    *(unint64_t *)((char *)&v13->_quantity + 2) = v14;

    *(&v13->super._finished + 1) = 0;
  }

  return v13;
}

- (InAppTransactionTask)initWithProductIdentifier:(id)a3 quantity:(unint64_t)a4 client:(id)a5 apiVersion:(int64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)InAppTransactionTask;
  v13 = [(Task *)&v18 init];
  uint64_t v14 = v13;
  if (v13)
  {
    *(void *)(v13 + 66) = a6;
    objc_storeStrong((id *)(v13 + 74), a5);
    uint64_t v15 = +[NSUUID lib_shortLogKeyWithAPIVersion:a6];
    v16 = *(void **)(v14 + 82);
    *(void *)(v14 + 82) = v15;

    v14[62] = 1;
    objc_storeStrong((id *)(v14 + 90), a3);
    *(void *)(v14 + 98) = a4;
    v14[65] = 0;
    v14[58] = 0;
    v14[42] = 1;
  }

  return (InAppTransactionTask *)v14;
}

- (void)main
{
  if (qword_10039F828 != -1) {
    dispatch_once(&qword_10039F828, &stru_100357F00);
  }
  v3 = (void *)qword_10039F7F8;
  if (os_log_type_enabled((os_log_t)qword_10039F7F8, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(InAppTransactionTask *)self logKey];
    *(_DWORD *)buf = 138543618;
    v10 = v5;
    __int16 v11 = 2114;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@]: Started task", buf, 0x16u);
  }
  uint64_t v7 = *((unsigned __int8 *)&self->super._finished + 1);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003900C;
  v8[3] = &unk_100357DC8;
  v8[4] = self;
  [(InAppTransactionTask *)self buyParams:v7 completionHandler:v8];
}

- (void)_performWithBuyParams:(id)a3
{
  id v135 = a3;
  v139 = self;
  v4 = [(InAppTransactionTask *)self client];
  v131 = [v4 bag];

  v5 = [(InAppTransactionTask *)v139 client];
  v137 = [v5 account];

  if (v137)
  {
    v132 = objc_msgSend(v137, "ams_storefront");
    id v6 = 0;
  }
  else
  {
    __int16 v11 = +[ACAccountStore ams_sharedAccountStore];
    id v12 = [(InAppTransactionTask *)v139 client];
    v13 = [v12 accountMediaType];
    uint64_t v14 = objc_msgSend(v11, "ams_localiTunesAccountForAccountMediaType:", v13);
    uint64_t v15 = [v14 resultWithError:0];

    if (v15)
    {
      v132 = objc_msgSend(v15, "ams_storefront");
    }
    else
    {
      v132 = 0;
    }

    v16 = [(InAppTransactionTask *)v139 client];
    unsigned int v17 = [v16 isBeta];

    if (v17)
    {
      if (qword_10039F828 != -1) {
        dispatch_once(&qword_10039F828, &stru_100357F00);
      }
      objc_super v18 = (id)qword_10039F7F8;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [(InAppTransactionTask *)v139 logKey];
        *(_DWORD *)buf = 138543362;
        v158 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] TF account not detected.", buf, 0xCu);
      }
      id v20 = AMSAccountMediaTypeProduction;
      v21 = +[ACAccountStore ams_sharedAccountStoreForMediaType:v20];
      v22 = objc_msgSend(v21, "ams_activeiTunesAccount");

      if (v22)
      {
        if (qword_10039F828 != -1) {
          dispatch_once(&qword_10039F828, &stru_100357F00);
        }
        v23 = (id)qword_10039F7F8;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = [(InAppTransactionTask *)v139 logKey];
          *(_DWORD *)buf = 138543362;
          v158 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting to use existing account.", buf, 0xCu);
        }
        id v155 = 0;
        v137 = [(InAppTransactionTask *)v139 _authenticateWithAccountInfo:v22 error:&v155];
        id v6 = v155;
        if (v137)
        {
          [v135 setParameter:&__kCFBooleanTrue forKey:AMSBuyParamPropertyHasBeenAuthedForBuy];

          goto LABEL_3;
        }
      }
      else
      {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
    v25 = [(InAppTransactionTask *)v139 client];
    BOOL v26 = objc_msgSend(v25, "objc_clientType") == 3;

    if (v26)
    {
      v137 = 0;
      goto LABEL_27;
    }
    id v154 = v6;
    v137 = [(InAppTransactionTask *)v139 _authenticateWithAccountInfo:0 error:&v154];
    id v27 = v154;

    [v135 setParameter:&__kCFBooleanTrue forKey:AMSBuyParamPropertyHasBeenAuthedForBuy];
    if (!v137)
    {
      v137 = 0;
      id v6 = v27;
      if (!v27) {
        goto LABEL_32;
      }
LABEL_28:
      v129 = 0;
      v130 = 0;
      goto LABEL_69;
    }
    id v6 = v27;
  }
LABEL_3:
  if (![(InAppTransactionTask *)v139 privacyAcknowledgementRequired]
    || ([(InAppTransactionTask *)v139 client],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = objc_msgSend(v7, "objc_clientType") == 1,
        v7,
        !v8))
  {
LABEL_27:
    if (!v6) {
      goto LABEL_32;
    }
    goto LABEL_28;
  }
  id v9 = [[AcknowledgePrivacyTask alloc] initWithAccount:v137];
  id v153 = v6;
  [(Task *)v139 runSubTask:v9 returningError:&v153];
  id v10 = v153;

  id v6 = v10;
  if (v10) {
    goto LABEL_28;
  }
LABEL_32:
  *(void *)v169 = 0;
  *(void *)&v169[8] = v169;
  *(void *)&v169[16] = 0x2020000000;
  char v170 = 1;
  if (!v132 || !*(void *)(&v139->_generateBuyParams + 2)) {
    goto LABEL_44;
  }
  v28 = objc_msgSend(v137, "ams_storefront");
  if (v28 && ([v132 isEqualToString:v28] & 1) == 0)
  {
    dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
    v30 = *(void **)(&v139->_generateBuyParams + 2);
    v150[0] = _NSConcreteStackBlock;
    v150[1] = 3221225472;
    v150[2] = sub_10003A7F0;
    v150[3] = &unk_100357DF0;
    v152 = v169;
    v31 = v29;
    v151 = v31;
    [v30 shouldContinueTransactionWithNewStorefront:v132 replyBlock:v150];
    dispatch_time_t v32 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v31, v32) >= 1)
    {
      if (qword_10039F828 != -1) {
        dispatch_once(&qword_10039F828, &stru_100357F00);
      }
      v33 = (id)qword_10039F7F8;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v123 = [(InAppTransactionTask *)v139 logKey];
        v124 = [(InAppTransactionTask *)v139 client];
        v125 = [v124 requestBundleID];
        *(_DWORD *)buf = 138543618;
        v158 = v123;
        __int16 v159 = 2114;
        v160 = v125;
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "[%{public}@] shouldContinueTransaction timed out for bundle ID: %{public}@. Not continuing transaction.", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)&v169[8] + 24) = 0;
    }
  }
  if (!*(unsigned char *)(*(void *)&v169[8] + 24))
  {
    ASDErrorWithDescription();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v129 = 0;
    v130 = 0;
  }
  else
  {
LABEL_44:
    v34 = [(InAppTransactionTask *)v139 siwaAuthorizationInfo];
    BOOL v35 = v34 == 0;

    if (v35)
    {
      id v43 = [objc_alloc((Class)AMSPurchase) initWithPurchaseType:3 buyParams:v135];
    }
    else
    {
      id v36 = [objc_alloc((Class)AMSPurchaseSIWA) initWithPurchaseType:3 buyParams:v135];
      v37 = [(InAppTransactionTask *)v139 siwaAuthorizationInfo];
      v38 = [v37 teamID];
      [v36 setTeamID:v38];

      v39 = [(InAppTransactionTask *)v139 siwaAuthorizationInfo];
      v40 = [v39 clientID];
      [v36 setBundleID:v40];

      v41 = [(InAppTransactionTask *)v139 siwaAuthorizationInfo];
      v42 = [v41 serviceID];
      [v36 setServiceID:v42];

      id v43 = v36;
    }
    [v43 setAccount:v137];
    v44 = [(InAppTransactionTask *)v139 client];
    v45 = [v44 processInfo];
    [v43 setClientInfo:v45];

    [v43 setUserInitiated:1];
    [v43 setSendBlindedData:1];
    v46 = [(InAppTransactionTask *)v139 logKey];
    [v43 setLogUUID:v46];

    v47 = [(InAppTransactionTask *)v139 presentingSceneID];

    if (v47)
    {
      v48 = [(InAppTransactionTask *)v139 presentingSceneID];
      [v43 setPresentingSceneIdentifier:v48];
    }
    uint64_t v49 = *(void *)&v139->_forceAuthentication;
    if (v49 != 1)
    {
      CFStringRef v167 = @"X-Apple-Client-StoreKit-Version";
      v50 = sub_100047628(v49);
      v168 = v50;
      v51 = +[NSDictionary dictionaryWithObjects:&v168 forKeys:&v167 count:1];
      [v43 setAdditionalHeaders:v51];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v52 = [objc_alloc((Class)AMSPurchaseSIWATask) initWithPurchaseSIWA:v43 bag:v131];
      [v52 setDelegate:v139];
      if (qword_10039F828 != -1) {
        dispatch_once(&qword_10039F828, &stru_100357F00);
      }
      v53 = (id)qword_10039F7F8;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = [(InAppTransactionTask *)v139 logKey];
        v140 = [(InAppTransactionTask *)v139 productIdentifier];
        v55 = [(InAppTransactionTask *)v139 siwaAuthorizationInfo];
        v56 = [v55 teamID];
        v57 = [(InAppTransactionTask *)v139 siwaAuthorizationInfo];
        v58 = [v57 clientID];
        v59 = [(InAppTransactionTask *)v139 siwaAuthorizationInfo];
        v60 = [v59 serviceID];
        *(_DWORD *)buf = 138544386;
        v158 = v54;
        __int16 v159 = 2114;
        v160 = v140;
        __int16 v161 = 2114;
        v162 = v56;
        __int16 v163 = 2114;
        v164 = v58;
        __int16 v165 = 2114;
        v166 = v60;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "[%{public}@] Running auth payment for %{public}@ with teamID: %{public}@ clientID: %{public}@ serviceID: %{public}@", buf, 0x34u);
      }
      v61 = [v52 performPurchaseSIWA];
      id v149 = 0;
      id v62 = [v61 resultWithError:&v149];
      id v6 = v149;

      v130 = [v62 authorizationResult];
      v129 = [v62 purchaseResult];
      if (!v130)
      {
        if (qword_10039F828 != -1) {
          dispatch_once(&qword_10039F828, &stru_100357F00);
        }
        v63 = (id)qword_10039F7F8;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v64 = [(InAppTransactionTask *)v139 logKey];
          v65 = [(InAppTransactionTask *)v139 productIdentifier];
          sub_1002C1838(v64, v65, (uint64_t)buf, v63);
        }
      }
    }
    else
    {
      id v62 = [objc_alloc((Class)AMSPurchaseTask) initWithPurchase:v43 bag:v131];
      [v62 setDelegate:v139];
      if (qword_10039F828 != -1) {
        dispatch_once(&qword_10039F828, &stru_100357F00);
      }
      v66 = (id)qword_10039F7F8;
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        v67 = [(InAppTransactionTask *)v139 logKey];
        v68 = [(InAppTransactionTask *)v139 productIdentifier];
        *(_DWORD *)buf = 138543618;
        v158 = v67;
        __int16 v159 = 2112;
        v160 = v68;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "[%{public}@] Running payment for %@", buf, 0x16u);
      }
      id v52 = [v62 performPurchase];
      id v148 = 0;
      v129 = [v52 resultWithError:&v148];
      id v6 = v148;
      v130 = 0;
    }
  }
  _Block_object_dispose(v169, 8);
  if (!v6)
  {
    if (qword_10039F828 != -1) {
      dispatch_once(&qword_10039F828, &stru_100357F00);
    }
    v79 = (void *)qword_10039F7F8;
    if (os_log_type_enabled((os_log_t)qword_10039F7F8, OS_LOG_TYPE_DEFAULT))
    {
      v80 = v79;
      v81 = [(InAppTransactionTask *)v139 logKey];
      *(_DWORD *)v169 = 138543362;
      *(void *)&v169[4] = v81;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "[%{public}@] Payment complete", v169, 0xCu);
    }
    v138 = [(InAppTransactionTask *)v139 _processPurchaseResult:v129 authorizationResult:v130];
    goto LABEL_164;
  }
LABEL_69:
  if (qword_10039F828 != -1) {
    dispatch_once(&qword_10039F828, &stru_100357F00);
  }
  v138 = v6;
  v69 = (id)qword_10039F7F8;
  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
    sub_1002C178C(v139, (uint64_t)v6, v69);
  }

  v70 = [v6 domain];
  uint64_t v128 = AMSErrorDomain;
  if (!objc_msgSend(v70, "isEqualToString:"))
  {

LABEL_77:
    [(InAppTransactionTask *)v139 clearTransactionCache];
    goto LABEL_78;
  }
  if ([v6 code] == (id)6)
  {

    goto LABEL_78;
  }
  BOOL v78 = [v6 code] == (id)508;

  if (!v78) {
    goto LABEL_77;
  }
LABEL_78:
  v71 = [v6 userInfo];
  v133 = objc_msgSend(v71, "tcr_numberForKey:", AMSErrorUserInfoKeyServerErrorCode);

  if (v133) {
    uint64_t v134 = (uint64_t)[v133 integerValue];
  }
  else {
    uint64_t v134 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v72 = [v6 userInfo];
  v136 = objc_msgSend(v72, "tcr_dictionaryForKey:", AMSErrorUserInfoKeyServerPayload);

  if (!v136) {
    goto LABEL_156;
  }
  if (objc_msgSend(v136, "tcr_BOOLForKey:", @"trigger-download"))
  {
    if (qword_10039F828 != -1) {
      dispatch_once(&qword_10039F828, &stru_100357F00);
    }
    v73 = (id)qword_10039F7F8;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = [(InAppTransactionTask *)v139 logKey];
      *(_DWORD *)v169 = 138543362;
      *(void *)&v169[4] = v74;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed payment had a trigger queue check.", v169, 0xCu);
    }
    v75 = +[ASDPurchaseManager sharedManager];
    [v75 checkPendingQueue];
  }
  if (v134 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v76 = objc_msgSend(v136, "tcr_stringForKey:", @"failureType");
    v77 = v76;
    if (v76) {
      uint64_t v134 = (uint64_t)[v76 integerValue];
    }
    else {
      uint64_t v134 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  v82 = [v6 domain];
  if (![v82 isEqualToString:v128])
  {

LABEL_104:
    v84 = [(InAppTransactionTask *)v139 client];
    BOOL v85 = objc_msgSend(v84, "objc_clientType") == 3;

    if (v85)
    {
      if (v134 == 3705)
      {
        if (qword_10039F828 != -1) {
          dispatch_once(&qword_10039F828, &stru_100357F00);
        }
        v111 = (id)qword_10039F7F8;
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          v112 = [(InAppTransactionTask *)v139 logKey];
          *(_DWORD *)v169 = 138543618;
          *(void *)&v169[4] = v112;
          *(_WORD *)&v169[12] = 2114;
          *(void *)&v169[14] = v6;
          _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mapping Xcode error to ask to buy: %{public}@", v169, 0x16u);
        }
        uint64_t v88 = ASDErrorWithUnderlyingErrorAndDescription();
        uint64_t v89 = 3705;
      }
      else
      {
        if (v134 != 3038)
        {
          if (qword_10039F828 != -1) {
            dispatch_once(&qword_10039F828, &stru_100357F00);
          }
          v113 = (id)qword_10039F7F8;
          if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
          {
            v114 = [(InAppTransactionTask *)v139 logKey];
            *(_DWORD *)v169 = 138543618;
            *(void *)&v169[4] = v114;
            *(_WORD *)&v169[12] = 2114;
            *(void *)&v169[14] = v6;
            _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mapping Xcode error to StoreKit error: %{public}@", v169, 0x16u);
          }
          uint64_t v88 = ASDErrorWithUnderlyingErrorAndDescription();
          goto LABEL_143;
        }
        if (qword_10039F828 != -1) {
          dispatch_once(&qword_10039F828, &stru_100357F00);
        }
        v86 = (id)qword_10039F7F8;
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          v87 = [(InAppTransactionTask *)v139 logKey];
          *(_DWORD *)v169 = 138543618;
          *(void *)&v169[4] = v87;
          *(_WORD *)&v169[12] = 2114;
          *(void *)&v169[14] = v6;
          _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mapping Xcode error to interrupted: %{public}@", v169, 0x16u);
        }
        uint64_t v88 = ASDErrorWithUnderlyingErrorAndDescription();
        uint64_t v89 = 3038;
      }
      uint64_t v134 = v89;
LABEL_143:
      v90 = v6;
      v138 = (void *)v88;
      goto LABEL_155;
    }
    v127 = objc_msgSend(v136, "tcr_urlForKeyPath:", @"dialog.okButtonAction.url");
    v90 = v127;
    if (!v127)
    {
LABEL_155:

      goto LABEL_156;
    }
    v91 = +[NSURLComponents componentsWithURL:v127 resolvingAgainstBaseURL:0];
    id v126 = v91;
    if (!v91)
    {
LABEL_154:

      v90 = v127;
      goto LABEL_155;
    }
    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    v92 = [v91 queryItems];
    id v93 = [v92 countByEnumeratingWithState:&v144 objects:v156 count:16];
    if (!v93) {
      goto LABEL_152;
    }
    int v94 = 0;
    int v141 = 0;
    int v95 = 0;
    uint64_t v96 = *(void *)v145;
    do
    {
      for (i = 0; i != v93; i = (char *)i + 1)
      {
        if (*(void *)v145 != v96) {
          objc_enumerationMutation(v92);
        }
        v98 = *(void **)(*((void *)&v144 + 1) + 8 * i);
        v99 = [v98 name];
        unsigned __int8 v100 = [v99 isEqualToString:@"offerName"];

        if (v100)
        {
          int v94 = 1;
        }
        else
        {
          v101 = [v98 name];
          unsigned __int8 v102 = [v101 isEqualToString:@"pricingParameters"];

          if (v102)
          {
            int v141 = 1;
          }
          else
          {
            v103 = [v98 name];
            unsigned int v104 = [v103 isEqualToString:@"productType"];

            v95 |= v104;
          }
        }
      }
      id v93 = [v92 countByEnumeratingWithState:&v144 objects:v156 count:16];
    }
    while (v93);

    if ((v94 & v141 & v95 & 1) == 0) {
      goto LABEL_153;
    }
    v105 = [v138 domain];
    if ([v105 isEqualToString:v128])
    {
      BOOL v106 = [v138 code] == (id)6;

      if (v106)
      {
        v107 = sub_100038FB8();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          v108 = [(InAppTransactionTask *)v139 logKey];
          v109 = [v127 absoluteString];
          *(_DWORD *)v169 = 138543618;
          *(void *)&v169[4] = v108;
          *(_WORD *)&v169[12] = 2114;
          *(void *)&v169[14] = v109;
          _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "[%{public}@] The request was cancelled for URL: %{public}@", v169, 0x16u);
        }
        uint64_t v110 = ASDErrorWithUnderlyingErrorAndInfo();
LABEL_151:
        v92 = v138;
        v138 = (void *)v110;
LABEL_152:

LABEL_153:
        v91 = v126;
        goto LABEL_154;
      }
    }
    else
    {
    }
    if (qword_10039F828 != -1) {
      dispatch_once(&qword_10039F828, &stru_100357F00);
    }
    v115 = (id)qword_10039F7F8;
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      v116 = [(InAppTransactionTask *)v139 logKey];
      *(_DWORD *)v169 = 138543618;
      *(void *)&v169[4] = v116;
      *(_WORD *)&v169[12] = 2114;
      *(void *)&v169[14] = v138;
      _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mapping error to interrupted: %{public}@", v169, 0x16u);
    }
    uint64_t v110 = ASDErrorWithUnderlyingErrorAndDescription();
    goto LABEL_151;
  }
  BOOL v83 = [v6 code] == (id)511;

  if (!v83) {
    goto LABEL_104;
  }
LABEL_156:
  if ((id)[(InAppTransactionTask *)v139 apiVersion] != (id)1 && v134 == 3532)
  {
    if (qword_10039F828 != -1) {
      dispatch_once(&qword_10039F828, &stru_100357F00);
    }
    v117 = (id)qword_10039F7F8;
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
    {
      v118 = [(InAppTransactionTask *)v139 logKey];
      *(_DWORD *)v169 = 138543618;
      *(void *)&v169[4] = v118;
      *(_WORD *)&v169[12] = 2114;
      *(void *)&v169[14] = v138;
      _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "[%{public}@] Purchased already subscribed subscription: %{public}@", v169, 0x16u);
    }
    v142[0] = _NSConcreteStackBlock;
    v142[1] = 3221225472;
    v142[2] = sub_10003A804;
    v142[3] = &unk_100357E18;
    v142[4] = v139;
    id v119 = v138;
    id v143 = v119;
    [(InAppTransactionTask *)v139 _latestTransactionWithCompletion:v142];

    goto LABEL_173;
  }

LABEL_164:
  if (v138)
  {
    -[AsyncTask completeWithError:](v139, "completeWithError:");
  }
  else
  {
    if ([(InAppTransactionTask *)v139 shouldInstallParentAppWithBuyParams:v135])
    {
      if (qword_10039F828 != -1) {
        dispatch_once(&qword_10039F828, &stru_100357F00);
      }
      v120 = (id)qword_10039F7F8;
      if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
      {
        v121 = [(InAppTransactionTask *)v139 logKey];
        *(_DWORD *)v169 = 138543362;
        *(void *)&v169[4] = v121;
        _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "[%{public}@] Pinging AppStoreDaemon to start parent app install", v169, 0xCu);
      }
      v122 = +[ASDPurchaseManager sharedManager];
      [v122 checkPendingQueue];
    }
    [(AsyncTask *)v139 completeWithSuccess];
  }
LABEL_173:
}

- (void)clearTransactionCache
{
  id v2 = +[ReceiptManager managerForClient:*(int64_t *)((char *)&self->_apiVersion + 2)];
  [v2 invalidateLegacyTransactionCache];
}

- (id)_authenticateWithAccountInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = sub_10003AEC8;
  v48 = sub_10003AED8;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_10003AEC8;
  v42 = sub_10003AED8;
  id v43 = 0;
  uint64_t v7 = [(InAppTransactionTask *)self dialogContext];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    if (qword_10039F828 != -1) {
      dispatch_once(&qword_10039F828, &stru_100357F00);
    }
    v24 = (id)qword_10039F7F8;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [(InAppTransactionTask *)self logKey];
      *(_DWORD *)buf = 138543362;
      v51 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] No client available to handle authentication request", buf, 0xCu);
    }
    uint64_t v26 = ASDErrorWithDescription();
    id v12 = (id)v45[5];
    v45[5] = v26;
  }
  else
  {
    if (qword_10039F828 != -1) {
      dispatch_once(&qword_10039F828, &stru_100357F00);
    }
    id v9 = (id)qword_10039F7F8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(InAppTransactionTask *)self logKey];
      __int16 v11 = [(InAppTransactionTask *)self productIdentifier];
      *(_DWORD *)buf = 138543618;
      v51 = v10;
      __int16 v52 = 2114;
      v53 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending authentication request for %{public}@", buf, 0x16u);
    }
    id v12 = objc_alloc_init((Class)AMSAuthenticateOptions);
    v13 = [(InAppTransactionTask *)self client];
    uint64_t v14 = [v13 processInfo];
    [v12 setClientInfo:v14];

    [v12 setDebugReason:@"In App"];
    if (v6) {
      [v12 setAuthenticationType:0];
    }
    id v15 = objc_alloc((Class)AMSAuthenticateRequest);
    v16 = objc_msgSend(v6, "ams_DSID");
    unsigned int v17 = objc_msgSend(v6, "ams_altDSID");
    objc_super v18 = [v6 username];
    id v19 = [v15 initWithDSID:v16 altDSID:v17 username:v18 options:v12];

    id v20 = [(InAppTransactionTask *)self logKey];
    [v19 setLogKey:v20];

    dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
    v22 = [(InAppTransactionTask *)self dialogContext];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10003AEE0;
    v34[3] = &unk_100357E40;
    id v36 = &v38;
    v37 = &v44;
    v23 = v21;
    BOOL v35 = v23;
    [v22 handleAuthenticateRequest:v19 completionHandler:v34];

    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  }

  id v27 = [(id)v39[5] account];

  if (v27)
  {
    v28 = [(id)v39[5] account];
  }
  else
  {
    if (qword_10039F828 != -1) {
      dispatch_once(&qword_10039F828, &stru_100357F00);
    }
    dispatch_semaphore_t v29 = (id)qword_10039F7F8;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v31 = [(InAppTransactionTask *)self logKey];
      dispatch_time_t v32 = [(InAppTransactionTask *)self productIdentifier];
      uint64_t v33 = v45[5];
      *(_DWORD *)buf = 138543874;
      v51 = v31;
      __int16 v52 = 2114;
      v53 = v32;
      __int16 v54 = 2114;
      uint64_t v55 = v33;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[%{public}@] No account for %{public}@: %{public}@", buf, 0x20u);
    }
    v28 = 0;
    if (a4) {
      *a4 = (id) v45[5];
    }
  }
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);

  return v28;
}

- (id)_processPurchaseResult:(id)a3 authorizationResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 responseDictionary];
  id v9 = *(NSDictionary **)((char *)&self->_transaction + 2);
  *(NSDictionary **)((char *)&self->_transaction + 2) = v8;

  id v10 = [v6 correlationID];
  __int16 v11 = *(NSDictionary **)((char *)&self->_response + 2);
  *(NSDictionary **)((char *)&self->_response + 2) = v10;

  id v12 = [v6 error];

  if (v12)
  {
    if (qword_10039F828 != -1) {
      dispatch_once(&qword_10039F828, &stru_100357F00);
    }
    v13 = (void *)qword_10039F7F8;
    if (os_log_type_enabled((os_log_t)qword_10039F7F8, OS_LOG_TYPE_ERROR)) {
      sub_1002C1D44(v13, self);
    }
    uint64_t v14 = [v6 error];
    goto LABEL_7;
  }
  if (v7)
  {
    v16 = [v7 error];

    if (v16)
    {
      if (qword_10039F828 != -1) {
        dispatch_once(&qword_10039F828, &stru_100357F00);
      }
      unsigned int v17 = (void *)qword_10039F7F8;
      if (os_log_type_enabled((os_log_t)qword_10039F7F8, OS_LOG_TYPE_ERROR)) {
        sub_1002C1C90(v17, self);
      }
      objc_super v18 = [v7 error];
      id v19 = [v18 domain];
      if ([v19 isEqualToString:AKAppleIDAuthenticationErrorDomain])
      {
        id v20 = [v7 error];
        id v21 = [v20 code];

        if (v21 == (id)-7003)
        {
          uint64_t v14 = ASDErrorWithDescription();
LABEL_7:
          id v15 = (void *)v14;
          goto LABEL_68;
        }
      }
      else
      {
      }
    }
  }
  v22 = [v6 responseDictionary];
  v23 = [(InAppTransactionTask *)self client];
  v24 = [(InAppTransactionTask *)self receiptInstallURL];
  uint64_t v25 = [(InAppTransactionTask *)self apiVersion];
  uint64_t v26 = [(InAppTransactionTask *)self logKey];
  id v27 = sub_100046630(v22, v23, v24, v25, v26, 1, self->_excludeReceiptFromRequest);

  if (![v27 count])
  {
    if (qword_10039F828 != -1) {
      dispatch_once(&qword_10039F828, &stru_100357F00);
    }
    uint64_t v40 = (void *)qword_10039F7F8;
    if (os_log_type_enabled((os_log_t)qword_10039F7F8, OS_LOG_TYPE_ERROR)) {
      sub_1002C18A0(v40);
    }
    id v15 = ASDErrorWithDescription();
    goto LABEL_67;
  }
  if ((unint64_t)[v27 count] >= 2)
  {
    if (qword_10039F828 != -1) {
      dispatch_once(&qword_10039F828, &stru_100357F00);
    }
    v28 = (void *)qword_10039F7F8;
    if (os_log_type_enabled((os_log_t)qword_10039F7F8, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_semaphore_t v29 = v28;
      v30 = [(InAppTransactionTask *)self logKey];
      *(_DWORD *)buf = 138543618;
      v63 = v30;
      __int16 v64 = 2112;
      v65 = v27;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Payment received more than one transaction: %@ Using only the first.", buf, 0x16u);
    }
  }
  if (v7)
  {
    if (qword_10039F828 != -1) {
      dispatch_once(&qword_10039F828, &stru_100357F00);
    }
    v31 = (void *)qword_10039F7F8;
    if (os_log_type_enabled((os_log_t)qword_10039F7F8, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v32 = v31;
      uint64_t v33 = [(InAppTransactionTask *)self logKey];
      *(_DWORD *)buf = 138543618;
      v63 = self;
      __int16 v64 = 2114;
      v65 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Processing auth result.", buf, 0x16u);
    }
    id v34 = objc_alloc((Class)NSMutableDictionary);
    BOOL v35 = [v27 firstObject];
    id v36 = [v34 initWithDictionary:v35];

    v37 = [v7 error];

    if (v37)
    {
      uint64_t v38 = [v7 error];
      v39 = ASDErrorWithSafeUserInfo();
      [v36 setObject:v39 forKeyedSubscript:off_1003992E0[0]];

LABEL_57:
      v53 = (NSURL *)[v36 copy];
      __int16 v54 = *(NSURL **)((char *)&self->_receiptInstallURL + 2);
      *(NSURL **)((char *)&self->_receiptInstallURL + 2) = v53;

      goto LABEL_58;
    }
    uint64_t v44 = [v7 authorizationCredential];

    if (v44)
    {
      v45 = [v7 authorizationCredential];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v38 = [v7 authorizationCredential];
        id v61 = 0;
        v47 = +[NSKeyedArchiver archivedDataWithRootObject:v38 requiringSecureCoding:1 error:&v61];
        id v48 = v61;
        id v49 = sub_100038FB8();
        v50 = v49;
        if (v48 || !v47)
        {
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            sub_1002C1B3C(self, (uint64_t)v48, v50);
          }

          v59 = ASDErrorWithSafeUserInfo();
          [v36 setObject:v59 forKeyedSubscript:off_1003992E0[0]];
        }
        else
        {
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            v60 = [(InAppTransactionTask *)self logKey];
            *(_DWORD *)buf = 138543618;
            v63 = self;
            __int16 v64 = 2114;
            v65 = v60;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Received credential", buf, 0x16u);
          }
          [v36 setObject:v47 forKeyedSubscript:off_1003992E0[0]];
        }

        goto LABEL_57;
      }
      __int16 v52 = sub_100038FB8();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        sub_1002C1BF0(self, v52);
      }
    }
    else
    {
      __int16 v52 = sub_100038FB8();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        sub_1002C1A9C(self, v52);
      }
    }

LABEL_56:
    uint64_t v38 = ASDErrorWithTitleAndMessage();
    [v36 setObject:v38 forKeyedSubscript:off_1003992E0[0]];
    goto LABEL_57;
  }
  if (*(DialogProtocol **)((char *)&self->_dialogContext + 2))
  {
    if (qword_10039F828 != -1) {
      dispatch_once(&qword_10039F828, &stru_100357F00);
    }
    v41 = (void *)qword_10039F7F8;
    if (os_log_type_enabled((os_log_t)qword_10039F7F8, OS_LOG_TYPE_ERROR)) {
      sub_1002C19F4((uint64_t)self, v41);
    }
    id v42 = objc_alloc((Class)NSMutableDictionary);
    id v43 = [v27 firstObject];
    id v36 = [v42 initWithDictionary:v43];

    goto LABEL_56;
  }
  v51 = [v27 firstObject];
  id v36 = *(NSURL **)((char *)&self->_receiptInstallURL + 2);
  *(NSURL **)((char *)&self->_receiptInstallURL + 2) = v51;
LABEL_58:

  uint64_t v55 = [(InAppTransactionTask *)self transaction];

  if (v55)
  {
    v56 = [v22 objectForKeyedSubscript:@"metrics"];
    if (v56)
    {
      [(InAppTransactionTask *)self purchaseIntakeWithMetrics:v56];
    }
    else
    {
      if (qword_10039F828 != -1) {
        dispatch_once(&qword_10039F828, &stru_100357F00);
      }
      v57 = (void *)qword_10039F7F8;
      if (os_log_type_enabled((os_log_t)qword_10039F7F8, OS_LOG_TYPE_FAULT)) {
        sub_1002C1944((uint64_t)self, v57);
      }
    }
    [(InAppTransactionTask *)self _cacheLegacyTransaction];
  }
  id v15 = 0;
LABEL_67:

LABEL_68:

  return v15;
}

- (void)_cacheLegacyTransaction
{
  v3 = [InAppReceiptDatabaseStore alloc];
  v4 = +[Environment sharedInstance];
  v5 = [v4 userDatabase];
  id v6 = [(SQLiteDatabaseStore *)v3 initWithDatabase:v5];

  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10003AEC8;
  v16 = sub_10003AED8;
  id v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003BA58;
  v11[3] = &unk_100357970;
  v11[4] = self;
  v11[5] = &v12;
  [(SQLiteDatabaseStore *)v6 readUsingSession:v11];
  id v7 = (void *)v13[5];
  BOOL v8 = [(InAppTransactionTask *)self client];
  id v9 = [v8 currentAccountToken];
  LODWORD(v7) = [v7 isEqualToString:v9];

  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003BAF4;
    v10[3] = &unk_1003577E0;
    v10[4] = self;
    [(SQLiteDatabaseStore *)v6 modifyUsingTransaction:v10];
  }
  _Block_object_dispose(&v12, 8);
}

- (void)_latestTransactionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(InAppTransactionTask *)self client];
  id v6 = +[ReceiptManager managerForClient:v5];

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_10003AEC8;
  v16[4] = sub_10003AED8;
  id v17 = 0;
  id v7 = [(InAppTransactionTask *)self productIdentifier];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003BDB0;
  v15[3] = &unk_100357E68;
  v15[4] = v16;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003BDE8;
  v10[3] = &unk_100357EE0;
  uint64_t v14 = v16;
  id v8 = v4;
  id v13 = v8;
  id v9 = v6;
  id v11 = v9;
  uint64_t v12 = self;
  [v9 enumerateReceiptsForProductID:v7 usingBlock:v15 completionHandler:v10];

  _Block_object_dispose(v16, 8);
}

- (int64_t)apiVersion
{
  return *(void *)&self->_forceAuthentication;
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)((char *)&self->_apiVersion + 2);
}

- (NSString)logKey
{
  return *(NSString **)((char *)&self->_client + 2);
}

- (NSString)productIdentifier
{
  return *(NSString **)((char *)&self->_logKey + 2);
}

- (unint64_t)quantity
{
  return *(unint64_t *)((char *)&self->_productIdentifier + 2);
}

- (NSDictionary)additionalBuyParams
{
  return *(NSDictionary **)((char *)&self->_quantity + 2);
}

- (void)setAdditionalBuyParams:(id)a3
{
}

- (NSString)appAccountToken
{
  return *(NSString **)((char *)&self->_additionalBuyParams + 2);
}

- (void)setAppAccountToken:(id)a3
{
}

- (NSString)applicationUsername
{
  return *(NSString **)((char *)&self->_appAccountToken + 2);
}

- (void)setApplicationUsername:(id)a3
{
}

- (DialogProtocol)dialogContext
{
  return *(DialogProtocol **)((char *)&self->_applicationUsername + 2);
}

- (void)setDialogContext:(id)a3
{
}

- (SKPaymentDelegateProtocol)paymentDelegate
{
  return *(SKPaymentDelegateProtocol **)(&self->_generateBuyParams + 2);
}

- (void)setPaymentDelegate:(id)a3
{
}

- (AppleIDAuthorizationRequestInfo)siwaAuthorizationInfo
{
  return *(AppleIDAuthorizationRequestInfo **)((char *)&self->_dialogContext + 2);
}

- (void)setSiwaAuthorizationInfo:(id)a3
{
}

- (NSString)presentingSceneID
{
  return *(NSString **)((char *)&self->_siwaAuthorizationInfo + 2);
}

- (void)setPresentingSceneID:(id)a3
{
}

- (BOOL)isStoreKitViewInitiated
{
  return BYTE2(self->_paymentDelegate);
}

- (void)setStorekitViewInitiated:(BOOL)a3
{
  BYTE2(self->_paymentDelegate) = a3;
}

- (NSDictionary)customBuyParams
{
  return *(NSDictionary **)((char *)&self->_presentingSceneID + 2);
}

- (void)setCustomBuyParams:(id)a3
{
}

- (NSString)discountIdentifier
{
  return *(NSString **)((char *)&self->_customBuyParams + 2);
}

- (void)setDiscountIdentifier:(id)a3
{
}

- (NSString)discountKeyIdentifier
{
  return *(NSString **)((char *)&self->_discountIdentifier + 2);
}

- (void)setDiscountKeyIdentifier:(id)a3
{
}

- (NSString)discountNonceString
{
  return *(NSString **)((char *)&self->_discountKeyIdentifier + 2);
}

- (void)setDiscountNonceString:(id)a3
{
}

- (NSString)discountSignature
{
  return *(NSString **)((char *)&self->_discountNonceString + 2);
}

- (void)setDiscountSignature:(id)a3
{
}

- (NSNumber)discountTimestamp
{
  return *(NSNumber **)((char *)&self->_discountSignature + 2);
}

- (void)setDiscountTimestamp:(id)a3
{
}

- (NSString)partnerIdentifier
{
  return *(NSString **)((char *)&self->_discountTimestamp + 2);
}

- (void)setPartnerIdentifier:(id)a3
{
}

- (NSString)partnerTransactionIdentifier
{
  return *(NSString **)((char *)&self->_partnerIdentifier + 2);
}

- (void)setPartnerTransactionIdentifier:(id)a3
{
}

- (NSString)productKind
{
  return *(NSString **)((char *)&self->_partnerTransactionIdentifier + 2);
}

- (void)setProductKind:(id)a3
{
}

- (NSData)requestData
{
  return *(NSData **)((char *)&self->_productKind + 2);
}

- (void)setRequestData:(id)a3
{
}

- (NSString)subscriptionPeriod
{
  return *(NSString **)((char *)&self->_requestData + 2);
}

- (void)setSubscriptionPeriod:(id)a3
{
}

- (NSString)winbackOfferIdentifier
{
  return *(NSString **)((char *)&self->_subscriptionPeriod + 2);
}

- (void)setWinbackOfferIdentifier:(id)a3
{
}

- (BOOL)excludeReceiptFromRequest
{
  return BYTE3(self->_paymentDelegate);
}

- (void)setExcludeReceiptFromRequest:(BOOL)a3
{
  BYTE3(self->_paymentDelegate) = a3;
}

- (BOOL)forceAuthentication
{
  return BYTE4(self->_paymentDelegate);
}

- (void)setForceAuthentication:(BOOL)a3
{
  BYTE4(self->_paymentDelegate) = a3;
}

- (BOOL)hideConfirmation
{
  return BYTE5(self->_paymentDelegate);
}

- (void)setHideConfirmation:(BOOL)a3
{
  BYTE5(self->_paymentDelegate) = a3;
}

- (BOOL)privacyAcknowledgementRequired
{
  return BYTE6(self->_paymentDelegate);
}

- (void)setPrivacyAcknowledgementRequired:(BOOL)a3
{
  BYTE6(self->_paymentDelegate) = a3;
}

- (BOOL)isStoreOriginated
{
  return HIBYTE(self->_paymentDelegate);
}

- (void)setStoreOriginated:(BOOL)a3
{
  HIBYTE(self->_paymentDelegate) = a3;
}

- (BOOL)simulateAskToBuy
{
  return self->_storekitViewInitiated;
}

- (void)setSimulateAskToBuy:(BOOL)a3
{
  self->_storekitViewInitiated = a3;
}

- (NSURL)receiptInstallURL
{
  return *(NSURL **)((char *)&self->_winbackOfferIdentifier + 2);
}

- (void)setReceiptInstallURL:(id)a3
{
}

- (BOOL)isProcessingInterruptedBuy
{
  return self->_excludeReceiptFromRequest;
}

- (void)setIsProcessingInterruptedBuy:(BOOL)a3
{
  self->_excludeReceiptFromRequest = a3;
}

- (NSDictionary)transaction
{
  return *(NSDictionary **)((char *)&self->_receiptInstallURL + 2);
}

- (void)setTransaction:(id)a3
{
}

- (NSDictionary)response
{
  return *(NSDictionary **)((char *)&self->_transaction + 2);
}

- (void)setResponse:(id)a3
{
}

- (NSString)serverCorrelationIdentifier
{
  return *(NSString **)((char *)&self->_response + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_response + 2), 0);
  objc_storeStrong((id *)((char *)&self->_transaction + 2), 0);
  objc_storeStrong((id *)((char *)&self->_receiptInstallURL + 2), 0);
  objc_storeStrong((id *)((char *)&self->_winbackOfferIdentifier + 2), 0);
  objc_storeStrong((id *)((char *)&self->_subscriptionPeriod + 2), 0);
  objc_storeStrong((id *)((char *)&self->_requestData + 2), 0);
  objc_storeStrong((id *)((char *)&self->_productKind + 2), 0);
  objc_storeStrong((id *)((char *)&self->_partnerTransactionIdentifier + 2), 0);
  objc_storeStrong((id *)((char *)&self->_partnerIdentifier + 2), 0);
  objc_storeStrong((id *)((char *)&self->_discountTimestamp + 2), 0);
  objc_storeStrong((id *)((char *)&self->_discountSignature + 2), 0);
  objc_storeStrong((id *)((char *)&self->_discountNonceString + 2), 0);
  objc_storeStrong((id *)((char *)&self->_discountKeyIdentifier + 2), 0);
  objc_storeStrong((id *)((char *)&self->_discountIdentifier + 2), 0);
  objc_storeStrong((id *)((char *)&self->_customBuyParams + 2), 0);
  objc_storeStrong((id *)((char *)&self->_presentingSceneID + 2), 0);
  objc_storeStrong((id *)((char *)&self->_siwaAuthorizationInfo + 2), 0);
  objc_storeStrong((id *)((char *)&self->_dialogContext + 2), 0);
  objc_storeStrong((id *)((char *)&self->_applicationUsername + 2), 0);
  objc_storeStrong((id *)((char *)&self->_appAccountToken + 2), 0);
  objc_storeStrong((id *)((char *)&self->_additionalBuyParams + 2), 0);
  objc_storeStrong((id *)((char *)&self->_quantity + 2), 0);
  objc_storeStrong((id *)((char *)&self->_logKey + 2), 0);
  objc_storeStrong((id *)((char *)&self->_client + 2), 0);
  objc_storeStrong((id *)((char *)&self->_apiVersion + 2), 0);

  objc_storeStrong((id *)(&self->_generateBuyParams + 2), 0);
}

- (BOOL)shouldInstallParentAppWithBuyParams:(id)a3
{
  id v4 = a3;
  v5 = self;
  char v6 = sub_1000CA5C0(v4);

  return v6 & 1;
}

- (void)buyParams:(BOOL)a3 completionHandler:(id)a4
{
  char v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(unsigned char *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = v6;
  *(void *)(v7 + 32) = self;
  id v8 = self;

  sub_100175CA0((uint64_t)&unk_10039B830, v7);
}

- (void)purchaseIntakeWithMetrics:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_1000D03C4(v4);

  swift_bridgeObjectRelease();
}

- (void)purchase:(AMSPurchase *)a3 handleAuthenticateRequest:(AMSAuthenticateRequest *)a4 completion:(id)a5
{
}

- (void)purchase:(AMSPurchase *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5
{
}

- (void)purchase:(AMSPurchase *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5
{
}

@end