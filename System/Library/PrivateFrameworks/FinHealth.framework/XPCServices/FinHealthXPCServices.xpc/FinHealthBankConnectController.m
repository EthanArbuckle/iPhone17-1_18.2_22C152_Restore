@interface FinHealthBankConnectController
- (FHDatabaseManager)dbMgr;
- (FinHealthBankConnectController)initWithDatabaseManager:(id)a3;
- (void)_parityCheckBetweenWalletSourceTransaction:(id)a3 andFinanceSourceTransaction:(id)a4;
- (void)fetchAccountsWithCompletion:(id)a3;
- (void)setDbMgr:(id)a3;
- (void)updateTransactionsWithCompletion:(id)a3;
@end

@implementation FinHealthBankConnectController

- (FinHealthBankConnectController)initWithDatabaseManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FinHealthBankConnectController;
  v6 = [(FinHealthBankConnectController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dbMgr, a3);
  }

  return v7;
}

- (void)updateTransactionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(_TtC20FinHealthXPCServices19FinanceKitDataStore);
  v6 = [(FinHealthBankConnectController *)self dbMgr];
  v7 = [v6 processingDataForFeature:FHProcessingHistoryBankConnectTransactionsIdentifier];

  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000F2A8;
  v13[3] = &unk_100031810;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000FA70;
  v11[3] = &unk_100031838;
  objc_copyWeak(&v12, &location);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000FC84;
  v9[3] = &unk_100031860;
  id v8 = v4;
  id v10 = v8;
  [(FinanceKitDataStore *)v5 streamTransactionsSince:v7 transactionHandler:v13 accountHandler:v11 completionHandler:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)fetchAccountsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(_TtC20FinHealthXPCServices19FinanceKitDataStore);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000FE6C;
  v6[3] = &unk_100031318;
  id v7 = v3;
  id v5 = v3;
  [(FinanceKitDataStore *)v4 fetchAccountsWithCompletionHandler:v6];
}

- (void)_parityCheckBetweenWalletSourceTransaction:(id)a3 andFinanceSourceTransaction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 amount];
  id v8 = [v6 amount];
  unsigned __int8 v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    if ([v5 transactionType] != (id)3) {
      goto LABEL_4;
    }
    id v10 = [v5 amount];
    v11 = +[NSDecimalNumber abs:v10];
    id v12 = [v6 amount];
    v13 = +[NSDecimalNumber abs:v12];
    id v14 = [v11 compare:v13];

    if (v14)
    {
LABEL_4:
      v11 = FinHealthLogObject();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_7:

        goto LABEL_8;
      }
      v15 = [v5 identifier];
      uint64_t v16 = FHTransactionAmountKey;
      v17 = [v5 amount];
      v18 = [v6 amount];
      *(_DWORD *)v97 = 138413058;
      *(void *)&v97[4] = v15;
      *(_WORD *)&v97[12] = 2112;
      *(void *)&v97[14] = v16;
      *(_WORD *)&v97[22] = 2112;
      id v98 = v17;
      *(_WORD *)v99 = 2112;
      *(void *)&v99[2] = v18;
      v19 = "parity check for transaction %@ - %@ not match: [Wallet source] %@,  [FK source] %@";
      v20 = v11;
      uint32_t v21 = 42;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v19, v97, v21);

      goto LABEL_7;
    }
    id v92 = [v5 peerPaymentType];
    if (v92 == (id)2)
    {
      v11 = [v6 amount];
      v13 = +[NSDecimalNumber zero];
      if ([v11 compare:v13] == (id)-1)
      {

        goto LABEL_7;
      }
      if ([v5 peerPaymentType] != (id)1)
      {

LABEL_45:
        v11 = FinHealthLogObject();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_7;
        }
        v15 = [v5 identifier];
        uint64_t v96 = FHTransactionAmountKey;
        v17 = [v5 amount];
        v18 = [v6 amount];
        *(_DWORD *)v97 = 138413314;
        *(void *)&v97[4] = v15;
        *(_WORD *)&v97[12] = 2112;
        *(void *)&v97[14] = v96;
        *(_WORD *)&v97[22] = 2112;
        id v98 = v17;
        *(_WORD *)v99 = 2112;
        *(void *)&v99[2] = v18;
        *(_WORD *)&v99[10] = 2048;
        *(void *)&v99[12] = [v5 peerPaymentType];
        v19 = "parity check for transaction %@ - %@ not match: [Wallet source] %@,  [FK source] %@, peerPaymentType: %lu";
        v20 = v11;
        uint32_t v21 = 52;
        goto LABEL_6;
      }
    }
    else if ([v5 peerPaymentType] != (id)1)
    {
      goto LABEL_45;
    }
    v93 = [v6 amount];
    v94 = +[NSDecimalNumber zero];
    id v95 = [v93 compare:v94];

    if (v92 == (id)2)
    {
    }
    if (v95 != (id)1) {
      goto LABEL_45;
    }
  }
LABEL_8:
  v22 = objc_msgSend(v5, "currencyCode", *(_OWORD *)v97, *(void *)&v97[16], v98, *(_OWORD *)v99, *(void *)&v99[16]);
  v23 = [v6 currencyCode];
  unsigned __int8 v24 = [v22 isEqualToString:v23];

  if ((v24 & 1) == 0)
  {
    v25 = FinHealthLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = [v5 identifier];
      uint64_t v27 = FHTransactionCurrencyCodeKey;
      v28 = [v5 currencyCode];
      v29 = [v6 currencyCode];
      *(_DWORD *)v97 = 138413058;
      *(void *)&v97[4] = v26;
      *(_WORD *)&v97[12] = 2112;
      *(void *)&v97[14] = v27;
      *(_WORD *)&v97[22] = 2112;
      id v98 = v28;
      *(_WORD *)v99 = 2112;
      *(void *)&v99[2] = v29;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "parity check for transaction %@ - %@ not match: [Wallet source] %@,  [FK source] %@", v97, 0x2Au);
    }
  }
  v30 = [v5 transactionDate];
  [v30 timeIntervalSinceReferenceDate];
  double v32 = v31;
  v33 = [v6 transactionDate];
  [v33 timeIntervalSinceReferenceDate];
  double v35 = (double)v34;

  if (v32 != v35)
  {
    v36 = FinHealthLogObject();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = [v5 identifier];
      uint64_t v38 = FHTransactionDateKey;
      v39 = [v5 transactionDate];
      v40 = [v5 transactionDate];
      [v40 timeIntervalSinceReferenceDate];
      uint64_t v42 = v41;
      v43 = [v6 transactionDate];
      v44 = [v6 transactionDate];
      [v44 timeIntervalSinceReferenceDate];
      *(_DWORD *)v97 = 138413570;
      *(void *)&v97[4] = v37;
      *(_WORD *)&v97[12] = 2112;
      *(void *)&v97[14] = v38;
      *(_WORD *)&v97[22] = 2112;
      id v98 = v39;
      *(_WORD *)v99 = 2048;
      *(void *)&v99[2] = v42;
      *(_WORD *)&v99[10] = 2112;
      *(void *)&v99[12] = v43;
      *(_WORD *)&v99[20] = 2048;
      *(void *)&v99[22] = v45;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "parity check for transaction %@ - %@ not match: [Wallet source] %@ timestamp: %f,  [FK source] %@ timestamp: %f", v97, 0x3Eu);
    }
  }
  v46 = [v5 transactionStatusChangedDate];
  [v46 timeIntervalSinceReferenceDate];
  double v48 = v47;
  v49 = [v6 transactionStatusChangedDate];
  [v49 timeIntervalSinceReferenceDate];
  double v51 = (double)v50;

  if (v48 != v51)
  {
    v52 = FinHealthLogObject();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = [v5 identifier];
      uint64_t v54 = FHTransactionStatusChangedDateKey;
      v55 = [v5 transactionStatusChangedDate];
      v56 = [v5 transactionStatusChangedDate];
      [v56 timeIntervalSinceReferenceDate];
      uint64_t v58 = v57;
      v59 = [v6 transactionStatusChangedDate];
      v60 = [v6 transactionStatusChangedDate];
      [v60 timeIntervalSinceReferenceDate];
      *(_DWORD *)v97 = 138413570;
      *(void *)&v97[4] = v53;
      *(_WORD *)&v97[12] = 2112;
      *(void *)&v97[14] = v54;
      *(_WORD *)&v97[22] = 2112;
      id v98 = v55;
      *(_WORD *)v99 = 2048;
      *(void *)&v99[2] = v58;
      *(_WORD *)&v99[10] = 2112;
      *(void *)&v99[12] = v59;
      *(_WORD *)&v99[20] = 2048;
      *(void *)&v99[22] = v61;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "parity check for transaction %@ - %@ not match: [Wallet source] %@ timestamp: %f,  [FK source] %@ timestamp: %f", v97, 0x3Eu);
    }
  }
  v62 = [v5 name];
  v63 = [v6 name];
  char v64 = FHEqualStrings();

  if ((v64 & 1) == 0)
  {
    v65 = FinHealthLogObject();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = [v5 identifier];
      uint64_t v67 = FHMerchantNameKey;
      v68 = [v5 name];
      v69 = [v6 name];
      *(_DWORD *)v97 = 138413058;
      *(void *)&v97[4] = v66;
      *(_WORD *)&v97[12] = 2112;
      *(void *)&v97[14] = v67;
      *(_WORD *)&v97[22] = 2112;
      id v98 = v68;
      *(_WORD *)v99 = 2112;
      *(void *)&v99[2] = v69;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "parity check for transaction %@ - %@ not match: [Wallet source] %@,  [FK source] %@", v97, 0x2Au);
    }
  }
  v70 = [v5 displayName];
  v71 = [v6 displayName];
  char v72 = FHEqualStrings();

  if ((v72 & 1) == 0)
  {
    v73 = FinHealthLogObject();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      v74 = [v5 identifier];
      uint64_t v75 = FHMerchantDisplayNameKey;
      v76 = [v5 displayName];
      v77 = [v6 displayName];
      *(_DWORD *)v97 = 138413058;
      *(void *)&v97[4] = v74;
      *(_WORD *)&v97[12] = 2112;
      *(void *)&v97[14] = v75;
      *(_WORD *)&v97[22] = 2112;
      id v98 = v76;
      *(_WORD *)v99 = 2112;
      *(void *)&v99[2] = v77;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "parity check for transaction %@ - %@ not match: [Wallet source] %@,  [FK source] %@", v97, 0x2Au);
    }
  }
  v78 = [v5 location];
  v79 = [v6 location];
  char v80 = FHEqualObjects();

  if ((v80 & 1) == 0)
  {
    v81 = FinHealthLogObject();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      v82 = [v5 identifier];
      uint64_t v83 = FHTransactionLocationKey;
      v84 = [v5 location];
      v85 = [v6 location];
      *(_DWORD *)v97 = 138413058;
      *(void *)&v97[4] = v82;
      *(_WORD *)&v97[12] = 2112;
      *(void *)&v97[14] = v83;
      *(_WORD *)&v97[22] = 2112;
      id v98 = v84;
      *(_WORD *)v99 = 2112;
      *(void *)&v99[2] = v85;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "parity check for transaction %@ - %@ not match: [Wallet source] %@,  [FK source] %@", v97, 0x2Au);
    }
  }
  id v86 = [v5 transactionStatus];
  if (v86 != [v6 transactionStatus])
  {
    v87 = FinHealthLogObject();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      v88 = [v5 identifier];
      uint64_t v89 = FHTransactionStatusKey;
      id v90 = [v5 transactionStatus];
      id v91 = [v6 transactionStatus];
      *(_DWORD *)v97 = 138413058;
      *(void *)&v97[4] = v88;
      *(_WORD *)&v97[12] = 2112;
      *(void *)&v97[14] = v89;
      *(_WORD *)&v97[22] = 2048;
      id v98 = v90;
      *(_WORD *)v99 = 2048;
      *(void *)&v99[2] = v91;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "parity check for transaction %@ - %@ not match: [Wallet source] %ld,  [FK source] %ld", v97, 0x2Au);
    }
  }
}

- (FHDatabaseManager)dbMgr
{
  return self->_dbMgr;
}

- (void)setDbMgr:(id)a3
{
}

- (void).cxx_destruct
{
}

@end