@interface _mkMapServiceWalletMerchantTicket
- (_mkMapServiceWalletMerchantTicket)initWithRequest:(id)a3 traits:(id)a4;
- (void)cancel;
- (void)submitWithCompletionQueue:(id)a3 handler:(id)a4;
@end

@implementation _mkMapServiceWalletMerchantTicket

- (_mkMapServiceWalletMerchantTicket)initWithRequest:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v71.receiver = self;
  v71.super_class = (Class)_mkMapServiceWalletMerchantTicket;
  v8 = [(_mkMapServiceWalletMerchantTicket *)&v71 init];
  v9 = v8;
  if (v8)
  {
    v31 = v8;
    id v70 = v7;
    v10 = [v6 bankMerchantInfo];

    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F647D8]);
      v12 = [v6 bankMerchantInfo];
      v69 = (void *)[v11 initWithMKMerchantInfo:v12];
    }
    else
    {
      v69 = 0;
    }
    v66 = [MEMORY[0x1E4F64710] sharedService];
    v68 = [v6 merchantCode];
    v67 = [v6 rawMerchantCode];
    v63 = [v6 relyingPartyIdentifier];
    v65 = [v6 industryCategory];
    v64 = [v6 industryCode];
    v62 = [v6 paymentNetwork];
    v60 = [v6 transactionDate];
    v61 = [v6 location];
    v58 = [v6 terminalId];
    v59 = [v6 transactionCurrencyCode];
    int v30 = [v6 transactionType];
    v56 = [v6 transactionId];
    v57 = [v6 warsawMerchantDomain];
    v54 = [v6 warsawMerchantName];
    v55 = [v6 warsawMerchantId];
    v52 = [v6 adamId];
    v53 = [v6 merchantId];
    v50 = [v6 merchantDoingBizAsName];
    v51 = [v6 merchantEnhancedName];
    v48 = [v6 merchantCity];
    v49 = [v6 merchantRawCity];
    v46 = [v6 merchantState];
    v47 = [v6 merchantRawAddress];
    v44 = [v6 merchantZip];
    v45 = [v6 merchantAddress];
    v43 = [v6 merchantRawAddress];
    v42 = [v6 merchantCountryCode];
    v41 = [v6 merchantType];
    v29 = [v6 merchantCleanConfidenceLevel];
    v40 = [v6 merchantAdditionalData];
    v39 = [v6 merchantCanl];
    v38 = [v6 fuzzyMatched];
    v37 = [v6 coarseLocationUsed];
    unsigned int v28 = [v6 bankTransactionType];
    unsigned int v27 = [v6 bankMerchantStatus];
    v36 = [v6 bankAnonymisedUserId];
    v35 = [v6 otherBankTransactionLocations];
    v34 = [v6 bankTransactionDescription];
    v33 = [v6 bankTransactionTimestamp];
    v32 = [v6 bankRawMerchantCode];
    v26 = [v6 bankIndustryCategory];
    v13 = [v6 bankIndustryCode];
    v25 = [v6 bankTransactionCurrencyCode];
    v14 = [v6 baaCerts];
    v15 = [v6 baaSignature];
    v24 = [v6 bankEnableBrandMUIDFallback];
    v16 = [v6 bankIdentifier];
    v17 = [v6 bankTransactionDescriptionClean];
    v18 = [v6 piiRedactionOccurred];
    v23 = [v6 rotationPeriodsSinceEpoch];
    LODWORD(v22) = v30;
    objc_msgSend(v66, "ticketForMerchantCode:rawMerchantCode:relyingPartyIdentifier:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:terminalId:transactionCurrencyCode:transactionType:transactionId:warsawMerchantDomain:warsawMerchantName:warsawMerchantId:adamId:merchantId:merchantDoingBizAsName:merchantEnhancedName:merchantCity:merchantRawCity:merchantState:merchantRawState:merchantZip:merchantAddress:merchantRawAddress:merchantCountryCode:merchantType:merchantCleanConfidenceLevel:merchantAdditionalData:merchantCanl:fuzzyMatched:coarseLocationUsed:bankTransactionType:bankTransactionStatus:bankAnonymisedUserId:otherBankTransactionLocations:bankTransactionDescription:bankTransactionTimestamp:bankRawMerchantCode:bankIndustryCategory:bankIndustryCode:bankTransactionCurrencyCode:bankMerchantInfo:baaCerts:baaSignature:bankBrandMUIDFallbackEnabled:bankIdentifier:bankTransactionDescriptionClean:bankPIIRedactionIsApplied:bankRotationPeriodsSinceEpoch:traits:", v68, v67, v63, v65, v64, v62, v60, v61, v58,
      v59,
      v22,
      v56,
      v57,
      v54,
      v55,
      v52,
      v53,
      v50,
      v51,
      v48,
      v49,
      v46,
      v47,
      v44,
      v45,
      v43,
      v42,
      v41,
      v29,
      v40,
      v39,
      v38,
      v37,
      __PAIR64__(v27, v28),
      v36,
      v35,
      v34,
      v33,
      v32,
      v26,
      v13,
      v25,
      v69,
      v14,
      v15,
      v24,
      v16,
      v17,
      v18,
      v23,
    uint64_t v19 = v70);
    v9 = v31;
    ticket = v31->_ticket;
    v31->_ticket = (GEOMapServiceTicket *)v19;

    id v7 = v70;
  }

  return v9;
}

- (void)submitWithCompletionQueue:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ticket = self->_ticket;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71___mkMapServiceWalletMerchantTicket_submitWithCompletionQueue_handler___block_invoke;
  v11[3] = &unk_1E54BAF48;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(GEOMapServiceTicket *)ticket submitWithHandler:v11 networkActivity:0];
}

- (void)cancel
{
  [(GEOMapServiceTicket *)self->_ticket cancel];
  ticket = self->_ticket;
  self->_ticket = 0;
}

- (void).cxx_destruct
{
}

@end