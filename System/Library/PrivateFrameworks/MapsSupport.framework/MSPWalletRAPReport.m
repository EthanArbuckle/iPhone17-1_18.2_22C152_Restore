@interface MSPWalletRAPReport
- (BOOL)isAppleCard;
- (GEORPFeedbackRequestParameters)requestParameters;
- (NSString)correlationId;
- (NSString)merchantAdamId;
- (NSString)reportersComment;
- (id)initForMerchantIssue:(unint64_t)a3 merchantIndustryCode:(int64_t)a4 mapsIdentifier:(unint64_t)a5 merchantName:(id)a6 merchantRawName:(id)a7 merchantIndustryCategory:(id)a8 merchantURL:(id)a9 merchantFormattedAddress:(id)a10 transactionTime:(double)a11 transactionType:(id)a12 transactionLocation:(id)a13 bankTransactionInformation:(id)a14;
- (unint64_t)lookupTransactionType;
- (void)setCorrelationId:(id)a3;
- (void)setIsAppleCard:(BOOL)a3;
- (void)setLookupTransactionType:(unint64_t)a3;
- (void)setMerchantAdamId:(id)a3;
- (void)setReportersComment:(id)a3;
@end

@implementation MSPWalletRAPReport

- (id)initForMerchantIssue:(unint64_t)a3 merchantIndustryCode:(int64_t)a4 mapsIdentifier:(unint64_t)a5 merchantName:(id)a6 merchantRawName:(id)a7 merchantIndustryCategory:(id)a8 merchantURL:(id)a9 merchantFormattedAddress:(id)a10 transactionTime:(double)a11 transactionType:(id)a12 transactionLocation:(id)a13 bankTransactionInformation:(id)a14
{
  double var1 = a13.var1;
  double var0 = a13.var0;
  char v46 = a3;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a12;
  id v27 = a14;
  v47.receiver = self;
  v47.super_class = (Class)MSPWalletRAPReport;
  v28 = [(MSPWalletRAPReport *)&v47 init];
  if (v28)
  {
    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F647C8]) initWithMSPWalletBankTransactionInformation:v27 rawMerchantCode:v22 industryCategory:v23];
    id v30 = objc_alloc(MEMORY[0x1E4F648A8]);
    v42 = (void *)v29;
    id v43 = v26;
    unint64_t v31 = a5;
    id v45 = v24;
    uint64_t v32 = objc_msgSend(v30, "initWithMerchantIndustryCode:mapsIdentifier:merchantName:merchantRawName:merchantIndustryCategory:merchantURL:merchantFormattedAddress:transactionTime:transactionType:transactionLocation:merchantBankTransactionInfo:", a4, v31, v21, v22, v23, v24, a11, var0, var1, v25, v26, v29);
    requestParameters = v28->_requestParameters;
    v28->_requestParameters = (GEORPFeedbackRequestParameters *)v32;

    id v34 = objc_alloc_init(MEMORY[0x1E4F648C0]);
    v35 = v34;
    id v36 = v21;
    id v37 = v22;
    if ((v46 & 2) != 0)
    {
      [v34 setIsMerchantIncorrect:1];
      if ((v46 & 1) == 0)
      {
LABEL_4:
        if ((v46 & 4) == 0)
        {
LABEL_6:
          v38 = [(GEORPFeedbackRequestParameters *)v28->_requestParameters submissionParameters];
          v39 = [v38 details];
          v40 = [v39 merchantLookupFeedback];
          [v40 setCorrections:v35];

          id v21 = v36;
          id v22 = v37;
          id v26 = v43;
          id v24 = v45;
          goto LABEL_7;
        }
LABEL_5:
        [v35 setIsOtherIssue:1];
        goto LABEL_6;
      }
    }
    else if ((v46 & 1) == 0)
    {
      goto LABEL_4;
    }
    [v35 setIsCategoryIncorrect:1];
    if ((v46 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_7:

  return v28;
}

- (void)setMerchantAdamId:(id)a3
{
  id v8 = (id)[a3 copy];
  v4 = [(GEORPFeedbackRequestParameters *)self->_requestParameters submissionParameters];
  v5 = [v4 details];
  v6 = [v5 merchantLookupFeedback];
  v7 = [v6 context];
  [v7 setMerchantAdamId:v8];
}

- (NSString)merchantAdamId
{
  v2 = [(GEORPFeedbackRequestParameters *)self->_requestParameters submissionParameters];
  v3 = [v2 details];
  v4 = [v3 merchantLookupFeedback];
  v5 = [v4 context];
  v6 = [v5 merchantAdamId];

  return (NSString *)v6;
}

- (void)setReportersComment:(id)a3
{
  id v11 = a3;
  v4 = [(GEORPFeedbackRequestParameters *)self->_requestParameters submissionParameters];
  v5 = [v4 commonCorrections];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F64898]);
    v7 = [(GEORPFeedbackRequestParameters *)self->_requestParameters submissionParameters];
    [v7 setCommonCorrections:v6];
  }
  id v8 = (void *)[v11 copy];
  v9 = [(GEORPFeedbackRequestParameters *)self->_requestParameters submissionParameters];
  v10 = [v9 commonCorrections];
  [v10 setComments:v8];
}

- (NSString)reportersComment
{
  v2 = [(GEORPFeedbackRequestParameters *)self->_requestParameters submissionParameters];
  v3 = [v2 commonCorrections];
  v4 = [v3 comments];

  return (NSString *)v4;
}

- (void)setCorrelationId:(id)a3
{
  id v8 = (id)[a3 copy];
  v4 = [(GEORPFeedbackRequestParameters *)self->_requestParameters submissionParameters];
  v5 = [v4 details];
  id v6 = [v5 merchantLookupFeedback];
  v7 = [v6 context];
  [v7 setCorrelationId:v8];
}

- (NSString)correlationId
{
  v2 = [(GEORPFeedbackRequestParameters *)self->_requestParameters submissionParameters];
  v3 = [v2 details];
  v4 = [v3 merchantLookupFeedback];
  v5 = [v4 context];
  id v6 = [v5 correlationId];

  return (NSString *)v6;
}

- (BOOL)isAppleCard
{
  v2 = [(GEORPFeedbackRequestParameters *)self->_requestParameters submissionParameters];
  v3 = [v2 details];
  v4 = [v3 merchantLookupFeedback];
  v5 = [v4 context];
  char v6 = [v5 isAppleCard];

  return v6;
}

- (void)setIsAppleCard:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(GEORPFeedbackRequestParameters *)self->_requestParameters submissionParameters];
  v4 = [v7 details];
  v5 = [v4 merchantLookupFeedback];
  char v6 = [v5 context];
  [v6 setIsAppleCard:v3];
}

- (unint64_t)lookupTransactionType
{
  v2 = [(GEORPFeedbackRequestParameters *)self->_requestParameters submissionParameters];
  BOOL v3 = [v2 details];
  v4 = [v3 merchantLookupFeedback];
  v5 = [v4 context];
  unint64_t v6 = (int)[v5 requestTransactionType];

  return v6;
}

- (void)setLookupTransactionType:(unint64_t)a3
{
  id v7 = [(GEORPFeedbackRequestParameters *)self->_requestParameters submissionParameters];
  v4 = [v7 details];
  v5 = [v4 merchantLookupFeedback];
  unint64_t v6 = [v5 context];
  [v6 setRequestTransactionType:a3];
}

- (GEORPFeedbackRequestParameters)requestParameters
{
  return self->_requestParameters;
}

- (void).cxx_destruct
{
}

@end