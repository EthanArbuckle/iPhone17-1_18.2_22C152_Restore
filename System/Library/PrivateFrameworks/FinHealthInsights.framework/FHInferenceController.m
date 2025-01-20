@interface FHInferenceController
- (FHDatabaseEntity)accountEntities;
- (FHDatabaseEntity)transactionAndFeauturesEntities;
- (FHDatabaseEntity)transactionsEntities;
- (FHInferenceController)initWithACDawTicket:(id)a3;
- (NSArray)selectFieldsForTransactionsAndFeatures;
- (NSDateFormatter)dateFormatter;
- (NSDateFormatter)monthOnlyDateFormatter;
- (NSNumberFormatter)numberFormatter;
- (NSString)acDawTicket;
- (id)_formattedAppleCashTransactionsWithStartDate:(id)a3 endDate:(id)a4;
- (id)_getAccountsByAccountType:(int64_t)a3;
- (id)_monthlyHighlightsWithModelId:(unint64_t)a3;
- (id)_monthlyStatementsWithAccountType:(int64_t)a3 sourceIdentifier:(id)a4;
- (id)_yearlyHighlights;
- (void)_streamBankConnectTransactionsWithSingleQuery:(id)a3 modelId:(unint64_t)a4 temperature:(double)a5 delegate:(id)a6;
- (void)_streamCardTransactionsWithSingleQuery:(id)a3 modelId:(unint64_t)a4 temperature:(double)a5 delegate:(id)a6;
- (void)_streamCashTransactionsWithSingleQuery:(id)a3 modelId:(int64_t)a4 temperature:(float)a5 delegate:(id)a6 error:(id *)a7;
- (void)_summarizationAndStreamWithSingleQuery:(id)a3 modelId:(unint64_t)a4 temperature:(double)a5 delegate:(id)a6;
- (void)queryWithAlternatingRoles:(id)a3 modelId:(int64_t)a4 temperature:(float)a5 completion:(id)a6;
- (void)setAcDawTicket:(id)a3;
- (void)setAccountEntities:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setMonthOnlyDateFormatter:(id)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setSelectFieldsForTransactionsAndFeatures:(id)a3;
- (void)setTransactionAndFeauturesEntities:(id)a3;
- (void)setTransactionsEntities:(id)a3;
- (void)streamingBillPaymentInferenceSuggestionWithQuery:(id)a3 accountSummary:(id)a4 modelId:(int64_t)a5 temperature:(float)a6 delegate:(id)a7;
- (void)streamingHighlightsInferenceResponseWithFollowupQuery:(id)a3 previousResponse:(id)a4 modelId:(int64_t)a5 temperature:(float)a6 delegate:(id)a7;
- (void)streamingInsightsInferenceResponseWithQuery:(id)a3 modelId:(int64_t)a4 temperature:(float)a5 delegate:(id)a6 error:(id *)a7;
- (void)streamingMerchantProductsAndServicesWithModelId:(int64_t)a3 temperature:(float)a4 delegate:(id)a5;
- (void)streamingQueryWithAlternatingRoles:(id)a3 modelId:(int64_t)a4 temperature:(float)a5 delegate:(id)a6;
@end

@implementation FHInferenceController

- (FHInferenceController)initWithACDawTicket:(id)a3
{
  v30[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)FHInferenceController;
  v6 = [(FHInferenceController *)&v29 init];
  if (v6)
  {
    v7 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    numberFormatter = v6->_numberFormatter;
    v6->_numberFormatter = v7;

    [(NSNumberFormatter *)v6->_numberFormatter setPositiveFormat:@"0.##"];
    id v9 = objc_alloc(MEMORY[0x263F3C878]);
    uint64_t v10 = *MEMORY[0x263F3C828];
    uint64_t v12 = *MEMORY[0x263F3C820];
    v30[0] = *MEMORY[0x263F3C838];
    uint64_t v11 = v30[0];
    v30[1] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
    uint64_t v14 = [v9 initWithLeftJoinKey:v10 entities:v13];
    transactionAndFeauturesEntities = v6->_transactionAndFeauturesEntities;
    v6->_transactionAndFeauturesEntities = (FHDatabaseEntity *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x263F3C878]) initWithEntity:v11];
    transactionsEntities = v6->_transactionsEntities;
    v6->_transactionsEntities = (FHDatabaseEntity *)v16;

    id v18 = objc_alloc(MEMORY[0x263F3C878]);
    uint64_t v19 = [v18 initWithEntity:*MEMORY[0x263F3C720]];
    accountEntities = v6->_accountEntities;
    v6->_accountEntities = (FHDatabaseEntity *)v19;

    selectFieldsForTransactionsAndFeatures = v6->_selectFieldsForTransactionsAndFeatures;
    v6->_selectFieldsForTransactionsAndFeatures = (NSArray *)&unk_27002A3D8;

    objc_storeStrong((id *)&v6->_acDawTicket, a3);
    v22 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatter = v6->_dateFormatter;
    v6->_dateFormatter = v22;

    [(NSDateFormatter *)v6->_dateFormatter setDateFormat:@"MM/dd/yyyy"];
    v24 = v6->_dateFormatter;
    v25 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
    [(NSDateFormatter *)v24 setTimeZone:v25];

    v26 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    monthOnlyDateFormatter = v6->_monthOnlyDateFormatter;
    v6->_monthOnlyDateFormatter = v26;

    [(NSDateFormatter *)v6->_monthOnlyDateFormatter setDateFormat:@"MMMM yyyy"];
  }

  return v6;
}

- (void)streamingBillPaymentInferenceSuggestionWithQuery:(id)a3 accountSummary:(id)a4 modelId:(int64_t)a5 temperature:(float)a6 delegate:(id)a7
{
  v22[2] = *MEMORY[0x263EF8340];
  uint64_t v12 = NSString;
  id v13 = a7;
  uint64_t v14 = [v12 stringWithFormat:@"%@\n\n\nAppleCard account: <%@>", a3, a4];
  v15 = (void *)v14;
  if (v14)
  {
    v21[0] = @"role";
    v21[1] = @"content";
    v22[0] = @"ROLE_USER";
    v22[1] = v14;
    id v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  }
  else
  {
    id v16 = objc_alloc_init(NSDictionary);
  }
  v17 = v16;
  id v20 = v16;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  *(float *)&double v19 = a6;
  [(FHInferenceController *)self streamingQueryWithAlternatingRoles:v18 modelId:a5 temperature:v13 delegate:v19];
}

- (void)streamingInsightsInferenceResponseWithQuery:(id)a3 modelId:(int64_t)a4 temperature:(float)a5 delegate:(id)a6 error:(id *)a7
{
  v41[10] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = dispatch_group_create();
  id v13 = [(FHInferenceController *)self _getAccountsByAccountType:4];
  v41[0] = @"Your task is the following:";
  v41[2] = @"- Extract the intent of the question, and assign a category. The intent rules are as follows:";
  v41[3] = @"  - If the question contains AppleCard reference, general spending habits, purchases, spending or general finances or about products/restaurants/services/merchants, then the category is AppleCard";
  v41[4] = @"  - If the question is about cash or money sent, received or requested, the category is AppleCash";
  uint64_t v14 = [v13 count];
  v15 = @"  - If the question is about Discover card, the category is BankConnect";
  if (!v14) {
    v15 = &stru_2700281B0;
  }
  v41[5] = v15;
  uint64_t v16 = [v13 count];
  v17 = @"  - If the question is about Debit card, the category is BankConnect";
  if (!v16) {
    v17 = &stru_2700281B0;
  }
  v41[6] = v17;
  v41[7] = @"  - If the question cannot be assigned to either card or cash category, then the category is Unknown";
  id v18 = v41[8] = @"- Make sure response is limited to one sentence.";
  v41[9] = v18;
  double v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:10];

  v39[0] = @"role";
  v39[1] = @"content";
  v40[0] = @"ROLE_USER";
  id v20 = [v19 componentsJoinedByString:@"\n"];
  v40[1] = v20;
  v21 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  dispatch_group_enter(v12);
  v38 = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __104__FHInferenceController_streamingInsightsInferenceResponseWithQuery_modelId_temperature_delegate_error___block_invoke;
  v34[3] = &unk_265317D50;
  v36 = v37;
  v23 = v12;
  v35 = v23;
  *(float *)&double v24 = a5;
  [(FHInferenceController *)self queryWithAlternatingRoles:v22 modelId:a4 temperature:v34 completion:v24];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__FHInferenceController_streamingInsightsInferenceResponseWithQuery_modelId_temperature_delegate_error___block_invoke_167;
  block[3] = &unk_265317D78;
  block[4] = self;
  id v29 = v10;
  v31 = v37;
  int64_t v32 = a4;
  float v33 = a5;
  id v30 = v11;
  id v25 = v11;
  id v26 = v10;
  dispatch_group_notify(v23, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v37, 8);
}

void __104__FHInferenceController_streamingInsightsInferenceResponseWithQuery_modelId_temperature_delegate_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = FinHealthLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_24E070000, v4, OS_LOG_TYPE_DEBUG, "response: %@", (uint8_t *)&v6, 0xCu);
  }

  if (v3)
  {
    if ([v3 containsString:@"AppleCard"])
    {
      uint64_t v5 = 1;
LABEL_10:
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
      goto LABEL_11;
    }
    if ([v3 containsString:@"AppleCash"])
    {
      uint64_t v5 = 2;
      goto LABEL_10;
    }
    if ([v3 containsString:@"BankConnect"])
    {
      uint64_t v5 = 3;
      goto LABEL_10;
    }
  }
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __104__FHInferenceController_streamingInsightsInferenceResponseWithQuery_modelId_temperature_delegate_error___block_invoke_167(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  switch(v2)
  {
    case 3:
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 64);
      double v11 = *(float *)(a1 + 72);
      uint64_t v12 = *(void *)(a1 + 48);
      id v13 = *(void **)(a1 + 32);
      return [v13 _streamBankConnectTransactionsWithSingleQuery:v9 modelId:v10 temperature:v12 delegate:v11];
    case 2:
      v15 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 64);
      LODWORD(a2) = *(_DWORD *)(a1 + 72);
      uint64_t v17 = *(void *)(a1 + 48);
      uint64_t v21 = 0;
      return [v15 _streamCashTransactionsWithSingleQuery:v14 modelId:v16 temperature:v17 delegate:&v21 error:a2];
    case 1:
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 64);
      double v5 = *(float *)(a1 + 72);
      uint64_t v6 = *(void *)(a1 + 48);
      id v7 = *(void **)(a1 + 32);
      return [v7 _streamCardTransactionsWithSingleQuery:v3 modelId:v4 temperature:v6 delegate:v5];
    default:
      uint64_t v18 = *(void *)(a1 + 64);
      LODWORD(a2) = *(_DWORD *)(a1 + 72);
      uint64_t v19 = *(void *)(a1 + 48);
      id v20 = *(void **)(a1 + 32);
      return [v20 streamingQueryWithAlternatingRoles:0 modelId:v18 temperature:v19 delegate:a2];
  }
}

- (void)_streamCashTransactionsWithSingleQuery:(id)a3 modelId:(int64_t)a4 temperature:(float)a5 delegate:(id)a6 error:(id *)a7
{
  v29[5] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  uint64_t v14 = [(FHInferenceController *)self _formattedAppleCashTransactionsWithStartDate:0 endDate:0];
  if (v14)
  {
    v29[1] = @"- Analyze the statement.";
    v15 = [NSString stringWithFormat:@"- Answer the question: \"%@\".", v12];
    v29[2] = v15;
    uint64_t v16 = v29[3] = @"Make sure the answer is 1 paragraph without formatting, unless the user asks for formatting.";
    v29[4] = v16;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:5];

    uint64_t v18 = FinHealthLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138412290;
      v28 = v19;
      _os_log_impl(&dword_24E070000, v18, OS_LOG_TYPE_DEBUG, "userMessageContents: %@", buf, 0xCu);
    }
    v25[0] = @"role";
    v25[1] = @"content";
    v26[0] = @"ROLE_USER";
    id v20 = [v17 componentsJoinedByString:@"\n"];
    v26[1] = v20;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

    double v24 = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
    *(float *)&double v23 = a5;
    [(FHInferenceController *)self streamingQueryWithAlternatingRoles:v22 modelId:a4 temperature:v13 delegate:v23];
  }
  else if (a7)
  {
    *a7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3C758] code:10015 userInfo:0];
  }
}

- (void)streamingHighlightsInferenceResponseWithFollowupQuery:(id)a3 previousResponse:(id)a4 modelId:(int64_t)a5 temperature:(float)a6 delegate:(id)a7
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  unint64_t v12 = (unint64_t)a3;
  unint64_t v13 = (unint64_t)a4;
  id v14 = a7;
  v15 = [(FHInferenceController *)self _monthlyHighlightsWithModelId:a5];
  if (v15)
  {
    uint64_t v17 = 250;
    if (a5 == 2) {
    uint64_t v18 = v17 = 150;
    }
    uint64_t v19 = FinHealthLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v18;
      _os_log_impl(&dword_24E070000, v19, OS_LOG_TYPE_DEBUG, "highlightsContent: %@", buf, 0xCu);
    }

    if (v12 | v13)
    {
      v32[0] = @"role";
      v32[1] = @"content";
      v33[0] = @"ROLE_USER";
      v33[1] = v18;
      id v26 = v18;
      id v20 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
      v30[0] = @"role";
      v30[1] = @"content";
      v31[0] = @"ROLE_ASSISTANT";
      v31[1] = v13;
      uint64_t v21 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
      v28[0] = @"role";
      v28[1] = @"content";
      v29[0] = @"ROLE_USER";
      v29[1] = v12;
      v22 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
      v27[0] = v20;
      v27[1] = v21;
      v27[2] = v22;
      double v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
      *(float *)&double v24 = a6;
      [(FHInferenceController *)self streamingQueryWithAlternatingRoles:v23 modelId:a5 temperature:v14 delegate:v24];

      uint64_t v18 = v26;
    }
    else
    {
      v35[0] = @"role";
      v35[1] = @"content";
      v36[0] = @"ROLE_USER";
      v36[1] = v18;
      id v20 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
      v34 = v20;
      uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
      *(float *)&double v25 = a6;
      [(FHInferenceController *)self streamingQueryWithAlternatingRoles:v21 modelId:a5 temperature:v14 delegate:v25];
    }
  }
  else
  {
    *(float *)&double v16 = a6;
    [(FHInferenceController *)self streamingQueryWithAlternatingRoles:0 modelId:a5 temperature:v14 delegate:v16];
  }
}

- (void)streamingMerchantProductsAndServicesWithModelId:(int64_t)a3 temperature:(float)a4 delegate:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v38 = a5;
  v36 = self;
  v40 = [(FHInferenceController *)self _monthlyStatementsWithAccountType:2 sourceIdentifier:0];
  id v7 = [v40 allKeys];
  uint64_t v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_1];

  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if ([v8 count])
  {
    unint64_t v10 = 0;
    uint64_t v39 = v8;
    do
    {
      unint64_t v42 = v10;
      v41 = objc_msgSend(v8, "objectAtIndex:");
      double v11 = objc_msgSend(v40, "objectForKey:");
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v53 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v44 != v14) {
              objc_enumerationMutation(v11);
            }
            double v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            uint64_t v17 = [v16 objectAtIndex:4];
            if ([v17 isEqualToString:@"n/a"])
            {
              uint64_t v18 = NSString;
              uint64_t v19 = [v16 objectAtIndex:0];
              id v20 = [v18 stringWithFormat:@"- %@", v19];

              [v9 addObject:v20];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v53 count:16];
        }
        while (v13);
      }

      uint64_t v8 = v39;
      unint64_t v21 = [v39 count];
      if (v42 > 4) {
        break;
      }
      unint64_t v10 = v42 + 1;
    }
    while (v42 + 1 < v21);
  }
  if ([v9 count])
  {
    double v23 = FinHealthLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      double v24 = [v9 allObjects];
      double v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138412290;
      v52 = v25;
      _os_log_impl(&dword_24E070000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    v50[1] = @"Your task is the following:";
    v50[2] = @"- Find at least 3 products sold or services offered.";
    v50[3] = @"- Exclude harmful products or services such as alcohol, tobacco and firearms.";
    v50[4] = @"- The score range is [0.0 - 0.99999].";
    v50[5] = @"- The output must be human readable and must follow the format: ||merchant name:product1;score1|product2;score2||\n###. Therefore your response must not contain any kind of code in any programming language.";
    id v26 = NSString;
    v27 = [v9 allObjects];
    id v29 = v28 = [v27 componentsJoinedByString:@"\n"];
    v50[6] = v29;
    id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:7];

    v48[0] = @"role";
    v48[1] = @"content";
    v49[0] = @"ROLE_USER";
    v31 = [v30 componentsJoinedByString:@"\n"];
    v49[1] = v31;
    int64_t v32 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];

    v47 = v32;
    float v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
    *(float *)&double v34 = a4;
    v35 = v38;
    [(FHInferenceController *)v36 streamingQueryWithAlternatingRoles:v33 modelId:a3 temperature:v38 delegate:v34];
  }
  else
  {
    *(float *)&double v22 = a4;
    v35 = v38;
    [(FHInferenceController *)v36 streamingQueryWithAlternatingRoles:0 modelId:a3 temperature:v38 delegate:v22];
  }
}

uint64_t __94__FHInferenceController_streamingMerchantProductsAndServicesWithModelId_temperature_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (void)streamingQueryWithAlternatingRoles:(id)a3 modelId:(int64_t)a4 temperature:(float)a5 delegate:(id)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = FinHealthLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 134218240;
    int64_t v16 = a4;
    __int16 v17 = 2048;
    double v18 = a5;
    _os_log_impl(&dword_24E070000, v12, OS_LOG_TYPE_DEBUG, "modelId: %lu, temperature: %f", (uint8_t *)&v15, 0x16u);
  }

  uint64_t v13 = [[FHInferenceFMAPIClient alloc] initWithDelegate:v10 acDawTicket:self->_acDawTicket];
  *(float *)&double v14 = a5;
  [(FHInferenceFMAPIClient *)v13 sendPromptWithAlternatingRoles:v11 modelId:a4 temperature:v14];
}

- (void)queryWithAlternatingRoles:(id)a3 modelId:(int64_t)a4 temperature:(float)a5 completion:(id)a6
{
  v36[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = FinHealthLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = a4;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a5;
    _os_log_impl(&dword_24E070000, v12, OS_LOG_TYPE_DEBUG, "modelId: %lu, temperature: %f", buf, 0x16u);
  }

  uint64_t v13 = (void *)MEMORY[0x263F08BF8];
  double v14 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  int v15 = [v13 sessionWithConfiguration:v14];

  if ((unint64_t)a4 > 2) {
    int64_t v16 = (id *)MEMORY[0x263F3C7D0];
  }
  else {
    int64_t v16 = (id *)qword_265317EC8[a4];
  }
  id v17 = *v16;
  double v18 = v17;
  if (v10 && v17 && [v10 count])
  {
    v35 = @"temperature";
    *(float *)&double v19 = a5;
    id v20 = [NSNumber numberWithFloat:v19];
    v36[0] = v20;
    unint64_t v21 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];

    double v22 = [NSString stringWithFormat:@"acack=%@", self->_acDawTicket];
    id v23 = objc_alloc_init(MEMORY[0x263F089E0]);
    [v23 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [v23 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [v23 setHTTPMethod:@"POST"];
    [v23 setValue:v22 forHTTPHeaderField:@"Cookie"];
    id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v24 setObject:v18 forKey:@"model"];
    [v24 setObject:v10 forKey:@"messages"];
    [v24 setObject:v21 forKey:@"options"];
    [v24 setObject:MEMORY[0x263EFFA80] forKey:@"enable_logging"];
    double v25 = [NSURL URLWithString:*MEMORY[0x263F3C7C0]];
    [v23 setURL:v25];

    id v26 = [MEMORY[0x263F08900] dataWithJSONObject:v24 options:0 error:0];
    [v23 setHTTPBody:v26];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    int64_t v32 = __Block_byref_object_copy__1;
    float v33 = __Block_byref_object_dispose__1;
    id v34 = 0;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    void v28[2] = __82__FHInferenceController_queryWithAlternatingRoles_modelId_temperature_completion___block_invoke;
    v28[3] = &unk_265317DA0;
    id v30 = buf;
    id v29 = v11;
    v27 = [v15 dataTaskWithRequest:v23 completionHandler:v28];
    [v27 resume];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
}

void __82__FHInferenceController_queryWithAlternatingRoles_modelId_temperature_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = [a3 statusCode];
  if (v9 == 200)
  {
    id v21 = 0;
    id v10 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:4 error:&v21];
    id v11 = v21;
    uint64_t v12 = [v10 objectForKey:@"messages"];
    uint64_t v13 = v12;
    if (v12)
    {
      double v14 = [v12 firstObject];
      int v15 = v14;
      if (v14)
      {
        uint64_t v16 = [v14 objectForKey:@"content"];
        uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
        double v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;
      }
    }
  }
  else
  {
    uint64_t v19 = v9;
    id v10 = (void *)[[NSString alloc] initWithData:v7 encoding:1];
    uint64_t v13 = FinHealthLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v20 = [v8 localizedDescription];
      *(_DWORD *)buf = 134218498;
      uint64_t v23 = v19;
      __int16 v24 = 2112;
      double v25 = v10;
      __int16 v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_24E070000, v13, OS_LOG_TYPE_DEBUG, "Failed with code: %lu, errorContent: %@, error: %@", buf, 0x20u);
    }
    id v11 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_streamCardTransactionsWithSingleQuery:(id)a3 modelId:(unint64_t)a4 temperature:(double)a5 delegate:(id)a6
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v64 = a3;
  id v10 = a6;
  id v11 = [MEMORY[0x263EFF910] distantFuture];
  uint64_t v12 = [MEMORY[0x263EFF910] distantPast];
  v76 = self;
  v66 = [(FHInferenceController *)self _monthlyStatementsWithAccountType:2 sourceIdentifier:0];
  uint64_t v13 = [v66 allKeys];
  double v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_261];

  id v75 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v63 = a4;
  uint64_t v15 = 150;
  if (a4 == 2) {
    uint64_t v15 = 70;
  }
  unint64_t v70 = v15;
  v65 = v14;
  id v62 = v10;
  if ([v14 count])
  {
    unint64_t v16 = 0;
    unint64_t v17 = 0;
    do
    {
      double v18 = [v14 objectAtIndex:v17];
      uint64_t v19 = [v66 objectForKey:v18];
      v83[0] = MEMORY[0x263EF8330];
      v83[1] = 3221225472;
      v83[2] = __93__FHInferenceController__streamCardTransactionsWithSingleQuery_modelId_temperature_delegate___block_invoke_2;
      v83[3] = &unk_265317DC8;
      v83[4] = v76;
      id v20 = [v19 sortedArrayUsingComparator:v83];
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id obj = v20;
      uint64_t v21 = [obj countByEnumeratingWithState:&v79 objects:v88 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        v67 = v19;
        v68 = v18;
        unint64_t v69 = v17;
        uint64_t v77 = *(void *)v80;
        while (2)
        {
          uint64_t v23 = 0;
          unint64_t v71 = v16;
          if (v70 >= v16) {
            unint64_t v24 = v70 - v16;
          }
          else {
            unint64_t v24 = 0;
          }
          do
          {
            if (*(void *)v80 != v77) {
              objc_enumerationMutation(obj);
            }
            if (v24 == v23)
            {
              unint64_t v16 = v71 + v23;
              goto LABEL_21;
            }
            double v25 = *(void **)(*((void *)&v79 + 1) + 8 * v23);
            __int16 v26 = [v25 objectAtIndex:0];
            v27 = [v25 objectAtIndex:1];
            uint64_t v28 = [v25 objectAtIndex:2];
            id v29 = [v25 objectAtIndex:3];
            id v30 = [NSString stringWithFormat:@"%@,%@,%@,%@", v26, v27, v28, v29];
            [v75 addObject:v30];

            v31 = [(NSDateFormatter *)v76->_dateFormatter dateFromString:v28];
            if ([v11 compare:v31] == 1)
            {
              id v32 = v31;
              float v33 = v11;
              id v11 = v32;
            }
            if ([v12 compare:v31] == -1)
            {
              id v34 = v31;
              v35 = v12;
              id v36 = v11;
              id v37 = v34;

              id v38 = v37;
              id v11 = v36;
              uint64_t v12 = v38;
            }

            ++v23;
          }
          while (v22 != v23);
          uint64_t v22 = [obj countByEnumeratingWithState:&v79 objects:v88 count:16];
          unint64_t v16 = v71 + v23;
          if (v22) {
            continue;
          }
          break;
        }
LABEL_21:
        double v14 = v65;
        double v18 = v68;
        unint64_t v17 = v69;
        uint64_t v19 = v67;
      }

      unint64_t v39 = [v14 count];
      if (v17 > 0xE) {
        break;
      }
      if (++v17 >= v39) {
        break;
      }
    }
    while (v16 < v70);
  }
  if (v63 == 2) {
    uint64_t v40 = 150;
  }
  else {
    uint64_t v40 = 250;
  }
  v41 = NSString;
  v78 = [(NSDateFormatter *)v76->_dateFormatter stringFromDate:v11];
  v72 = id obja = [(NSDateFormatter *)v76->_dateFormatter stringFromDate:v12];
  v87[0] = v72;
  v87[1] = @"Your task is the following:";
  v87[2] = @"- Analyze the transactions.";
  unint64_t v42 = [NSString stringWithFormat:@"- Answer the following question asked by the user: \"%@\".", v64];
  v87[3] = v42;
  long long v43 = objc_msgSend(NSString, "stringWithFormat:", @"- Limit your answer to %lu words.", v40);
  v87[4] = v43;
  long long v44 = NSString;
  long long v45 = [(NSDateFormatter *)v76->_dateFormatter stringFromDate:v11];
  long long v46 = [(NSDateFormatter *)v76->_dateFormatter stringFromDate:v12];
  v47 = [v44 stringWithFormat:@"Ensure the user knows that the dates covered are between %@ and %@ due to the current model limitations.", v45, v46];
  v87[5] = v47;
  v48 = [NSString stringWithFormat:@"- Do not add comments, and only allow bulleted list formatting"];
  v87[6] = v48;
  v87[7] = @"- Minimize mathematical operations such as sums or totals, and inform the user that the model has limited support for mathematical operations since it's still in the beta phase.";
  v49 = [v75 componentsJoinedByString:@"\n"];
  v87[9] = v49;
  v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:11];

  v51 = [MEMORY[0x263EFF910] distantFuture];
  v52 = v11;
  if (![v11 compare:v51])
  {
    uint64_t v54 = v12;

    v57 = v62;
    goto LABEL_32;
  }
  v53 = [MEMORY[0x263EFF910] distantPast];
  uint64_t v54 = v12;
  uint64_t v55 = [v12 compare:v53];

  v57 = v62;
  if (!v55)
  {
LABEL_32:
    *(float *)&double v56 = a5;
    [(FHInferenceController *)v76 streamingQueryWithAlternatingRoles:0 modelId:v63 temperature:v57 delegate:v56];
    goto LABEL_33;
  }
  v85[0] = @"role";
  v85[1] = @"content";
  v86[0] = @"ROLE_USER";
  v58 = [v50 componentsJoinedByString:@"\n"];
  v86[1] = v58;
  v59 = [NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:2];

  v84 = v59;
  v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v84 count:1];
  *(float *)&double v61 = a5;
  [(FHInferenceController *)v76 streamingQueryWithAlternatingRoles:v60 modelId:v63 temperature:v62 delegate:v61];

LABEL_33:
}

uint64_t __93__FHInferenceController__streamCardTransactionsWithSingleQuery_modelId_temperature_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

BOOL __93__FHInferenceController__streamCardTransactionsWithSingleQuery_modelId_temperature_delegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  double v5 = *(void **)(*(void *)(a1 + 32) + 56);
  id v6 = a3;
  id v7 = [a2 objectAtIndex:2];
  id v8 = [v5 dateFromString:v7];

  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 56);
  id v10 = [v6 objectAtIndex:2];

  id v11 = [v9 dateFromString:v10];

  BOOL v12 = [v8 compare:v11] == -1;
  return v12;
}

- (void)_summarizationAndStreamWithSingleQuery:(id)a3 modelId:(unint64_t)a4 temperature:(double)a5 delegate:(id)a6
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v36 = a6;
  group = dispatch_group_create();
  id v37 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__1;
  v68[4] = __Block_byref_object_dispose__1;
  id v69 = [MEMORY[0x263EFF910] distantFuture];
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__1;
  v66[4] = __Block_byref_object_dispose__1;
  id v67 = [MEMORY[0x263EFF910] distantPast];
  uint64_t v40 = [(FHInferenceController *)self _monthlyStatementsWithAccountType:2 sourceIdentifier:0];
  id v8 = [v40 allKeys];
  long long v43 = [v8 sortedArrayUsingComparator:&__block_literal_global_295];

  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v10 = [v43 count];
    if (i > 0xF || i >= v10) {
      break;
    }
    uint64_t v11 = objc_msgSend(v43, "objectAtIndex:");
    BOOL v12 = [v40 objectForKey:v11];
    long long v44 = (void *)v11;
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"merchant name,amount,transaction date,merchant category"];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v62 objects:v74 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v63 != v16) {
            objc_enumerationMutation(v14);
          }
          double v18 = *(void **)(*((void *)&v62 + 1) + 8 * j);
          [v13 appendString:@"\n"];
          uint64_t v19 = [v18 objectAtIndex:0];
          id v20 = [v18 objectAtIndex:1];
          uint64_t v21 = [v18 objectAtIndex:2];
          uint64_t v22 = [v18 objectAtIndex:3];
          [v13 appendFormat:@"%@,%@,%@,%@", v19, v20, v21, v22];
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v62 objects:v74 count:16];
      }
      while (v15);
    }

    uint64_t v23 = (void *)MEMORY[0x263EFF910];
    [v44 doubleValue];
    unint64_t v24 = objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
    v73[0] = @"Your task is the following:";
    v73[1] = @"- Analyze the transactions";
    double v25 = [NSString stringWithFormat:@"- Answer the following question asked by the user: \"%@\"", v39];
    v73[2] = v25;
    v73[3] = @"Do not add comments.";
    __int16 v26 = (void *)[v13 copy];
    v73[5] = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:7];

    if (v13)
    {
      v71[0] = @"role";
      v71[1] = @"content";
      v72[0] = @"ROLE_USER";
      uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
      v72[1] = v28;
      id v29 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
    }
    else
    {
      id v29 = objc_alloc_init(NSDictionary);
    }
    dispatch_group_enter(group);
    id v70 = v29;
    id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v70 count:1];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __93__FHInferenceController__summarizationAndStreamWithSingleQuery_modelId_temperature_delegate___block_invoke_2;
    v54[3] = &unk_265317DF0;
    id v31 = v29;
    id v55 = v31;
    double v56 = self;
    id v32 = v24;
    id v57 = v32;
    id v58 = v37;
    v60 = v68;
    double v61 = v66;
    v59 = group;
    float v9 = a5;
    *(float *)&double v33 = v9;
    [(FHInferenceController *)self queryWithAlternatingRoles:v30 modelId:a4 temperature:v54 completion:v33];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__FHInferenceController__summarizationAndStreamWithSingleQuery_modelId_temperature_delegate___block_invoke_306;
  block[3] = &unk_265317E18;
  id v47 = v37;
  v48 = self;
  v50 = v68;
  v51 = v66;
  unint64_t v52 = a4;
  double v53 = a5;
  id v49 = v36;
  id v34 = v36;
  id v35 = v37;
  dispatch_group_notify(group, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v68, 8);
}

uint64_t __93__FHInferenceController__summarizationAndStreamWithSingleQuery_modelId_temperature_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

void __93__FHInferenceController__summarizationAndStreamWithSingleQuery_modelId_temperature_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = FinHealthLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      double v5 = [*(id *)(a1 + 32) description];
      int v7 = 138412546;
      id v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_24E070000, v4, OS_LOG_TYPE_DEBUG, "userMessage: %@, response: %@", (uint8_t *)&v7, 0x16u);
    }
    id v6 = [*(id *)(*(void *)(a1 + 40) + 64) stringFromDate:*(void *)(a1 + 48)];
    [*(id *)(a1 + 56) setObject:v3 forKey:v6];
    if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) compare:*(void *)(a1 + 48)] == 1) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 48));
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) compare:*(void *)(a1 + 48)] == -1) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(id *)(a1 + 48));
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __93__FHInferenceController__summarizationAndStreamWithSingleQuery_modelId_temperature_delegate___block_invoke_306(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v3 = a1;
  id obj = [*(id *)(a1 + 32) allKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        __int16 v9 = [*(id *)(v3 + 32) objectForKey:v8];
        id v10 = [MEMORY[0x263F08708] newlineCharacterSet];
        uint64_t v11 = [v9 componentsSeparatedByCharactersInSet:v10];
        BOOL v12 = [v11 componentsJoinedByString:@"\\n"];

        [v2 appendFormat:@"\n\n######## %@###########\n\n: %@\\n\\n\\n", v8, v12];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v5);
  }

  uint64_t v13 = NSString;
  uint64_t v14 = v3;
  uint64_t v15 = [*(id *)(*(void *)(v3 + 40) + 64) stringFromDate:*(void *)(*(void *)(*(void *)(v3 + 56) + 8) + 40)];
  v17 = uint64_t v16 = [*(id *)(*(void *)(v3 + 40) + 64) stringFromDate:*(void *)(*(void *)(*(void *)(v3 + 64) + 8) + 40)];
  v36[0] = v17;
  v36[1] = @"If the results span more than one month, display the results in chronological order.";
  void v36[2] = @"Do not display irrelevant responses or responses that have no significant results.";
  void v36[3] = @"If some responses are similar or look like duplicated, combine them into one.";
  double v18 = NSString;
  uint64_t v19 = v2;
  v21 = id v20 = (void *)[v2 copy];
  v36[4] = v21;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:5];

  v34[0] = @"role";
  v34[1] = @"content";
  v35[0] = @"ROLE_USER";
  uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
  v35[1] = v23;
  unint64_t v24 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];

  double v25 = *(void **)(v14 + 40);
  double v33 = v24;
  __int16 v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
  double v27 = *(double *)(v14 + 80);
  *(float *)&double v27 = v27;
  [v25 streamingQueryWithAlternatingRoles:v26 modelId:*(void *)(v14 + 72) temperature:*(void *)(v14 + 48) delegate:v27];
}

- (id)_monthlyHighlightsWithModelId:(unint64_t)a3
{
  v58[1] = *MEMORY[0x263EF8340];
  if (a3 == 2) {
    unint64_t v4 = 18;
  }
  else {
    unint64_t v4 = 30;
  }
  id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v36 = +[FHInsightsFetcher sharedInstance];
  uint64_t v6 = [MEMORY[0x263EFF910] now];
  int v7 = FHDateStartOfMonth();

  uint64_t v8 = [MEMORY[0x263EFF910] now];
  uint64_t v40 = v5;
  [v5 appendString:@"current period,previous period,amount spent,delta,merchant category\n"];
  __int16 v9 = 0;
  unint64_t v10 = 0;
  unint64_t v38 = v4;
  id v39 = self;
  do
  {
    unint64_t v37 = v10;
    v58[0] = @"FHInsightTypeCategorySpend";
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:1];
    v48 = (void *)v8;
    BOOL v12 = [v36 retrieveSpendInsightsWithStartDate:v7 endDate:v8 insightTypeItems:v11 trendWindow:2];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = v12;
    uint64_t v50 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v50)
    {
      uint64_t v49 = *(void *)v52;
      v41 = v7;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v52 != v49) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if ([v14 direction])
          {
            if ((unint64_t)v9 >= v4) {
              goto LABEL_20;
            }
            uint64_t v15 = [v14 type];
            uint64_t v16 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v7];
            uint64_t v17 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v48];
            if ([v15 isEqualToString:@"FHInsightTypeCategorySpend"])
            {
              long long v45 = v15;
              id v47 = v9;
              id v18 = v14;
              [v18 merchantCategory];
              uint64_t v19 = FHMerchantCategoryToString();
              uint64_t v20 = FHDateStartOfLastMonth();
              uint64_t v21 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v20];
              long long v43 = (void *)v20;
              long long v44 = FHDateEndOfMonth();
              uint64_t v22 = -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:");
              uint64_t v23 = NSString;
              unint64_t v24 = [v18 spendAmount];
              double v25 = [v18 spendingInsightAmount];
              long long v46 = (void *)v19;
              uint64_t v35 = v19;
              uint64_t v34 = v17;
              __int16 v26 = (void *)v17;
              double v27 = (void *)v16;
              uint64_t v28 = [v23 stringWithFormat:@"%@ - %@,%@ - %@,%@,%@,%@\n", v16, v34, v21, v22, v24, v25, v35];

              long long v29 = FinHealthLogObject();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                double v56 = v28;
                _os_log_impl(&dword_24E070000, v29, OS_LOG_TYPE_DEBUG, "monthlyHighlight: %@", buf, 0xCu);
              }
              long long v30 = v47 + 1;

              [v40 appendString:v28];
              unint64_t v4 = v38;
              self = v39;
              int v7 = v41;
              uint64_t v15 = v45;
            }
            else
            {
              long long v30 = v9;
              __int16 v26 = (void *)v17;
              double v27 = (void *)v16;
            }

            __int16 v9 = v30;
          }
        }
        uint64_t v50 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v50);
    }
LABEL_20:

    long long v31 = FHDateStartOfLastMonth();

    long long v32 = FHDateEndOfMonth();

    if (v37 > 0xE) {
      break;
    }
    unint64_t v10 = v37 + 1;
    int v7 = v31;
    uint64_t v8 = (uint64_t)v32;
  }
  while ((unint64_t)v9 < v4);
  if (v9) {
    __int16 v9 = (char *)[v40 copy];
  }

  return v9;
}

- (id)_yearlyHighlights
{
  v47[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v28 = +[FHInsightsFetcher sharedInstance];
  uint64_t v3 = [MEMORY[0x263EFF910] now];
  unint64_t v4 = FHStartOfYear();

  uint64_t v5 = [MEMORY[0x263EFF910] now];
  [v2 appendString:@"current period,previous period,amount spent,delta,merchant category\n"];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  long long v31 = v2;
  do
  {
    uint64_t v30 = v7;
    v47[0] = @"FHInsightTypeCategorySpend";
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:1];
    __int16 v9 = [v28 retrieveSpendInsightsWithStartDate:v4 endDate:v5 insightTypeItems:v8 trendWindow:3];

    id v36 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v4];
    long long v29 = (void *)v5;
    uint64_t v35 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v5];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v41;
      uint64_t v32 = *(void *)v41;
      double v33 = v4;
      do
      {
        uint64_t v13 = 0;
        uint64_t v37 = v11;
        do
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v40 + 1) + 8 * v13);
          if ([v14 direction])
          {
            uint64_t v15 = [v14 type];
            if ([v15 isEqualToString:@"FHInsightTypeCategorySpend"])
            {
              id v39 = v6;
              id v16 = v14;
              [v16 merchantCategory];
              uint64_t v17 = FHMerchantCategoryToString();
              id v18 = FHStartOfLastYear();
              uint64_t v19 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v18];
              uint64_t v20 = NSString;
              uint64_t v21 = [v16 spendAmount];
              uint64_t v22 = [v16 spendingInsightAmount];
              uint64_t v23 = [v20 stringWithFormat:@"%@ - %@,%@ - %@,%@,%@,%@\n", v36, v35, v19, v36, v21, v22, v17];

              unint64_t v24 = FinHealthLogObject();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                long long v45 = v23;
                _os_log_impl(&dword_24E070000, v24, OS_LOG_TYPE_DEBUG, "yearlyHighlight: %@", buf, 0xCu);
              }
              uint64_t v6 = v39 + 1;

              id v2 = v31;
              [v31 appendString:v23];

              uint64_t v12 = v32;
              unint64_t v4 = v33;
              uint64_t v11 = v37;
            }
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v11);
    }

    double v25 = FHDateFromNumberOfDays();

    __int16 v26 = FHStartOfLastYear();

    uint64_t v7 = v30 + 1;
    unint64_t v4 = v26;
    uint64_t v5 = (uint64_t)v25;
  }
  while (v30 != 2);
  if (v6) {
    uint64_t v6 = (char *)[v2 copy];
  }

  return v6;
}

- (id)_monthlyStatementsWithAccountType:(int64_t)a3 sourceIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v8 = (void *)MEMORY[0x263F3C870];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __76__FHInferenceController__monthlyStatementsWithAccountType_sourceIdentifier___block_invoke;
  void v27[3] = &unk_265317E40;
  int64_t v29 = a3;
  id v9 = v6;
  id v28 = v9;
  uint64_t v10 = [v8 initWithBuilder:v27];
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_initWeak(&location, self);
  transactionAndFeauturesEntities = self->_transactionAndFeauturesEntities;
  uint64_t v13 = *MEMORY[0x263F3C7D8];
  selectFieldsForTransactionsAndFeatures = self->_selectFieldsForTransactionsAndFeatures;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __76__FHInferenceController__monthlyStatementsWithAccountType_sourceIdentifier___block_invoke_2;
  uint64_t v22 = &unk_265317E68;
  objc_copyWeak(&v25, &location);
  id v15 = v7;
  id v23 = v15;
  id v16 = v11;
  id v24 = v16;
  [(FHDatabaseEntity *)transactionAndFeauturesEntities queryDataWithBlock:v10 logicalOperator:v13 selectFields:selectFieldsForTransactionsAndFeatures usingBlock:&v19];
  uint64_t v17 = objc_msgSend(v16, "copy", v19, v20, v21, v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v17;
}

void __76__FHInferenceController__monthlyStatementsWithAccountType_sourceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *MEMORY[0x263F3C730];
  [v4 addIntegerClause:*MEMORY[0x263F3C730] fieldName:@"transactions.t_type" expression:0];
  [v4 addIntegerClause:v3 fieldName:@"transactions.t_status" expression:1];
  [v4 addIntegerClause:v3 fieldName:@"transactions.a_type" expression:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 40) == 4) {
    [v4 addStringClause:v3 fieldName:@"transactions.t_source_identifier" expression:*(void *)(a1 + 32)];
  }
}

void __76__FHInferenceController__monthlyStatementsWithAccountType_sourceIdentifier___block_invoke_2(id *a1, void *a2, uint64_t a3, char a4)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  id v8 = a1[4];
  id v9 = [MEMORY[0x263EFF910] now];
  uint64_t v10 = [v8 components:28 fromDate:v9];

  objc_msgSend(v10, "setDay:", objc_msgSend(v10, "day") - 365);
  id v11 = [a1[4] dateFromComponents:v10];
  if (WeakRetained && (a4 & 1) == 0)
  {
    uint64_t v12 = [v6 objectAtIndex:1];
    [v12 doubleValue];
    double v14 = v13;

    id v15 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v14];
    id v16 = [a1[4] components:12 fromDate:v15];
    uint64_t v17 = [WeakRetained[7] stringFromDate:v15];
    if ([v15 compare:v11] == 1)
    {
      id v58 = [v6 objectAtIndex:4];
      id v18 = [v6 objectAtIndex:5];
      id v55 = [v18 stringValue];

      uint64_t v19 = [v6 objectAtIndex:0];
      [v19 doubleValue];
      double v21 = v20;

      uint64_t v22 = (void *)MEMORY[0x263F087B0];
      id v23 = [NSString stringWithFormat:@"%.2f", v21 / 100.0];
      long long v54 = [v22 decimalNumberWithString:v23];

      if (v21 == 11796.0)
      {
        id v24 = FinHealthLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v61 = v6;
          _os_log_impl(&dword_24E070000, v24, OS_LOG_TYPE_DEBUG, "Transaction entry : %@", buf, 0xCu);
        }
      }
      id v25 = [v6 objectAtIndex:3];
      [v25 unsignedIntegerValue];

      __int16 v26 = FHMerchantCategoryToString();
      id v57 = [v26 lowercaseString];

      double v27 = [v6 objectAtIndex:7];
      uint64_t v28 = [v27 stringValue];

      double v56 = v11;
      long long v53 = (void *)v28;
      uint64_t v50 = v16;
      if (v28)
      {
        int64_t v29 = [MEMORY[0x263F3C908] reconstructCompoundFeatures:v28];
        uint64_t v30 = [v29 objectForKey:*MEMORY[0x263F3C810]];
        long long v31 = v30;
        if (v30)
        {
          uint64_t v49 = v29;
          long long v51 = v17;
          uint64_t v32 = [v30 valueForKey:@"featureLabel"];
          double v33 = [MEMORY[0x263F08A98] predicateWithFormat:@"NOT (SELF CONTAINS[cd] %@)", v57];
          uint64_t v34 = [v32 filteredArrayUsingPredicate:v33];

          uint64_t v35 = [MEMORY[0x263EFFA08] setWithArray:v34];
          id v36 = [v35 allObjects];

          if ((unint64_t)[v36 count] < 2)
          {
            if ([v36 count] == 1)
            {
              long long v40 = [v36 firstObject];
            }
            else
            {
              long long v40 = @"n/a";
            }
          }
          else
          {
            v48 = NSString;
            uint64_t v37 = [v36 firstObject];
            unint64_t v38 = [v36 lastObject];
            uint64_t v39 = [v48 stringWithFormat:@"%@;%@", v37, v38];

            long long v40 = (__CFString *)v39;
          }
          int64_t v29 = v49;

          uint64_t v17 = v51;
        }
        else
        {
          long long v40 = @"n/a";
        }
      }
      else
      {
        long long v40 = @"n/a";
      }
      long long v52 = v40;
      v59[0] = v58;
      long long v41 = [v54 stringValue];
      v59[1] = v41;
      v59[2] = v17;
      v59[3] = v57;
      long long v42 = [(__CFString *)v40 lowercaseString];
      v59[4] = v42;
      v59[5] = v55;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:6];
      v44 = long long v43 = v17;

      id v45 = objc_alloc(MEMORY[0x263F087B0]);
      long long v46 = [a1[4] dateFromComponents:v50];
      [v46 timeIntervalSinceReferenceDate];
      id v47 = objc_msgSend(v45, "initWithDouble:");

      [a1[5] safelyAddObjectToArrayCollection:v44 forKey:v47];
      uint64_t v17 = v43;
      id v16 = v50;

      id v11 = v56;
    }
  }
}

- (id)_formattedAppleCashTransactionsWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v9 = (void *)MEMORY[0x263F3C870];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  void v35[2] = __78__FHInferenceController__formattedAppleCashTransactionsWithStartDate_endDate___block_invoke;
  v35[3] = &unk_265317CB0;
  id v10 = v6;
  id v36 = v10;
  id v11 = v7;
  id v37 = v11;
  uint64_t v12 = [v9 initWithBuilder:v35];
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_initWeak(&location, self);
  transactionsEntities = self->_transactionsEntities;
  uint64_t v15 = *MEMORY[0x263F3C7D8];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  void v30[2] = __78__FHInferenceController__formattedAppleCashTransactionsWithStartDate_endDate___block_invoke_2;
  void v30[3] = &unk_265317E68;
  objc_copyWeak(&v33, &location);
  id v16 = v8;
  id v31 = v16;
  id v17 = v13;
  id v32 = v17;
  [(FHDatabaseEntity *)transactionsEntities queryDataWithBlock:v12 logicalOperator:v15 selectFields:&unk_27002A3F0 usingBlock:v30];
  double v27 = (void *)v12;
  uint64_t v28 = v11;
  int64_t v29 = v10;
  id v18 = [v17 allKeys];
  uint64_t v19 = [v18 sortedArrayUsingComparator:&__block_literal_global_399];

  double v20 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"date(mm/dd/yyyy),amount,sent/received/requested,phone number\n"];
  for (unint64_t i = 0; i < [v19 count]; ++i)
  {
    uint64_t v22 = [v19 objectAtIndex:i];
    id v23 = [v17 objectForKey:v22];
    id v24 = [v23 componentsJoinedByString:@"\n"];

    [v20 appendString:v24];
    [v20 appendString:@"\n"];
  }
  id v25 = (void *)[v20 copy];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return v25;
}

void __78__FHInferenceController__formattedAppleCashTransactionsWithStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v5, "addDateClause:fieldName:expression:", *MEMORY[0x263F3C738], @"transactions.t_date");
    uint64_t v3 = *MEMORY[0x263F3C740];
    if (*(void *)(a1 + 40))
    {
      objc_msgSend(v5, "addDateClause:fieldName:expression:", *MEMORY[0x263F3C740], @"transactions.t_date");
    }
    else
    {
      id v4 = [MEMORY[0x263EFF910] now];
      [v5 addDateClause:v3 fieldName:@"transactions.t_date" expression:v4];
    }
  }
  [v5 addIntegerClause:*MEMORY[0x263F3C730] fieldName:@"transactions.t_type" expression:3];
}

void __78__FHInferenceController__formattedAppleCashTransactionsWithStartDate_endDate___block_invoke_2(id *a1, void *a2, uint64_t a3, char a4)
{
  id v33 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  id v7 = a1[4];
  id v8 = [MEMORY[0x263EFF910] now];
  id v9 = [v7 components:28 fromDate:v8];

  objc_msgSend(v9, "setDay:", objc_msgSend(v9, "day") - 365);
  id v10 = [a1[4] dateFromComponents:v9];
  if (WeakRetained && (a4 & 1) == 0)
  {
    id v11 = [v33 objectAtIndex:1];
    [v11 doubleValue];
    double v13 = v12;

    double v14 = [v33 objectAtIndex:2];
    [v14 doubleValue];
    double v16 = v15;

    id v32 = [v33 objectAtIndex:3];
    id v17 = [v33 objectAtIndex:4];
    uint64_t v18 = [v17 integerValue];

    if ((unint64_t)(v18 - 1) > 2) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = off_265317EB0[v18 - 1];
    }
    double v20 = (void *)MEMORY[0x263F087B0];
    double v21 = [NSString stringWithFormat:@"%.2f", v13 / 100.0];
    uint64_t v22 = [v20 decimalNumberWithString:v21];

    id v23 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v16];
    id v24 = [a1[4] components:12 fromDate:v23];
    id v25 = [WeakRetained[7] stringFromDate:v23];
    if ([v23 compare:v10] == 1)
    {
      id v31 = [NSString stringWithFormat:@"%@,%@%@,%@,%@", v25, @"$", v22, v19, v32];
      id v26 = objc_alloc(MEMORY[0x263F087B0]);
      [a1[4] dateFromComponents:v24];
      double v27 = v10;
      int64_t v29 = v28 = v22;
      [v29 timeIntervalSinceReferenceDate];
      uint64_t v30 = objc_msgSend(v26, "initWithDouble:");

      uint64_t v22 = v28;
      id v10 = v27;
      [a1[5] safelyAddObjectToArrayCollection:v31 forKey:v30];
    }
  }
}

uint64_t __78__FHInferenceController__formattedAppleCashTransactionsWithStartDate_endDate___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (id)_getAccountsByAccountType:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  accountEntities = self->_accountEntities;
  uint64_t v7 = *MEMORY[0x263F3C7D8];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  double v13 = __51__FHInferenceController__getAccountsByAccountType___block_invoke;
  double v14 = &unk_265317E90;
  id v15 = v5;
  int64_t v16 = a3;
  id v8 = v5;
  [(FHDatabaseEntity *)accountEntities queryDataWithBlock:0 logicalOperator:v7 selectFields:&unk_27002A408 usingBlock:&v11];
  id v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14);

  return v9;
}

void __51__FHInferenceController__getAccountsByAccountType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F3C858];
  id v4 = a2;
  id v8 = objc_alloc_init(v3);
  id v5 = [v4 objectAtIndex:0];
  [v8 setAccountID:v5];

  objc_msgSend(v8, "setAccountType:", (int)objc_msgSend(v4, "intAtIndex:", 1));
  id v6 = [v4 objectAtIndex:2];
  [v8 setAccountDescription:v6];

  uint64_t v7 = [v4 objectAtIndex:3];

  [v8 setInstitutionName:v7];
  if ([v8 accountType] == *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v8];
  }
}

- (void)_streamBankConnectTransactionsWithSingleQuery:(id)a3 modelId:(unint64_t)a4 temperature:(double)a5 delegate:(id)a6
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v65 = a3;
  id v63 = a6;
  uint64_t v10 = [MEMORY[0x263EFF910] distantFuture];
  uint64_t v11 = [MEMORY[0x263EFF910] distantPast];
  id v80 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v64 = a4;
  uint64_t v12 = 150;
  if (a4 == 2) {
    uint64_t v12 = 70;
  }
  unint64_t v77 = v12;
  id v68 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v81 = self;
  [(FHInferenceController *)self _getAccountsByAccountType:4];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v69 = [obj countByEnumeratingWithState:&v91 objects:v100 count:16];
  v85 = (void *)v10;
  if (v69)
  {
    unint64_t v13 = 0;
    uint64_t v67 = *(void *)v92;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v92 != v67) {
          objc_enumerationMutation(obj);
        }
        id v70 = *(void **)(*((void *)&v91 + 1) + 8 * v14);
        id v15 = [v70 accountID];
        int64_t v16 = [(FHInferenceController *)v81 _monthlyStatementsWithAccountType:4 sourceIdentifier:v15];

        v72 = v16;
        id v17 = [v16 allKeys];
        uint64_t v18 = [v17 sortedArrayUsingComparator:&__block_literal_global_420];

        v76 = v18;
        if ([v18 count]) {
          BOOL v19 = v13 >= v77;
        }
        else {
          BOOL v19 = 1;
        }
        uint64_t v71 = v14;
        if (!v19)
        {
          unint64_t v20 = 0;
          do
          {
            unint64_t v75 = v20;
            v74 = objc_msgSend(v76, "objectAtIndex:");
            double v21 = objc_msgSend(v72, "objectForKey:");
            v90[0] = MEMORY[0x263EF8330];
            v90[1] = 3221225472;
            v90[2] = __100__FHInferenceController__streamBankConnectTransactionsWithSingleQuery_modelId_temperature_delegate___block_invoke_2;
            v90[3] = &unk_265317DC8;
            v90[4] = v81;
            v73 = v21;
            uint64_t v22 = [v21 sortedArrayUsingComparator:v90];
            long long v86 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            id v79 = v22;
            uint64_t v83 = [v79 countByEnumeratingWithState:&v86 objects:v99 count:16];
            if (v83)
            {
              uint64_t v82 = *(void *)v87;
              while (2)
              {
                unint64_t v23 = v13;
                uint64_t v24 = 0;
                unint64_t v78 = v23;
                unint64_t v25 = v77 - v23;
                if (v77 < v23) {
                  unint64_t v25 = 0;
                }
                unint64_t v84 = v25;
                do
                {
                  if (*(void *)v87 != v82) {
                    objc_enumerationMutation(v79);
                  }
                  if (v84 == v24)
                  {
                    unint64_t v13 = v78 + v24;
                    goto LABEL_29;
                  }
                  id v26 = *(void **)(*((void *)&v86 + 1) + 8 * v24);
                  double v27 = [v26 objectAtIndex:0];
                  uint64_t v28 = [v26 objectAtIndex:1];
                  int64_t v29 = [v26 objectAtIndex:2];
                  uint64_t v30 = [v26 objectAtIndex:3];
                  id v31 = [v26 objectAtIndex:5];
                  id v32 = [MEMORY[0x263F08708] newlineCharacterSet];
                  id v33 = [v31 componentsSeparatedByCharactersInSet:v32];
                  uint64_t v34 = [v33 componentsJoinedByString:@" "];

                  uint64_t v35 = [NSString stringWithFormat:@"%@,%@,%@,%@,%@", v27, v34, v28, v29, v30];
                  [v80 addObject:v35];

                  id v36 = [(NSDateFormatter *)v81->_dateFormatter dateFromString:v29];
                  if ([v85 compare:v36] == 1)
                  {
                    id v37 = v36;

                    v85 = v37;
                  }
                  if ([v11 compare:v36] == -1)
                  {
                    id v38 = v36;

                    uint64_t v11 = v38;
                  }

                  ++v24;
                }
                while (v83 != v24);
                unint64_t v13 = v78 + v24;
                uint64_t v83 = [v79 countByEnumeratingWithState:&v86 objects:v99 count:16];
                if (v83) {
                  continue;
                }
                break;
              }
            }
LABEL_29:

            unint64_t v39 = [v76 count];
            if (v75 > 0xE) {
              break;
            }
            unint64_t v20 = v75 + 1;
            if (v75 + 1 >= v39) {
              break;
            }
          }
          while (v13 < v77);
        }
        long long v40 = NSString;
        long long v41 = [v70 institutionName];
        long long v42 = [(NSDateFormatter *)v81->_dateFormatter stringFromDate:v85];
        [(NSDateFormatter *)v81->_dateFormatter stringFromDate:v11];
        v44 = unint64_t v43 = v13;
        v46 = id v45 = [v80 componentsJoinedByString:@"\n"];

        unint64_t v13 = v43;
        [v68 addObject:v46];

        uint64_t v14 = v71 + 1;
      }
      while (v71 + 1 != v69);
      uint64_t v69 = [obj countByEnumeratingWithState:&v91 objects:v100 count:16];
    }
    while (v69);
  }
  if (v64 == 2) {
    uint64_t v47 = 150;
  }
  else {
  v48 = uint64_t v47 = 250;
  }
  v98[0] = v48;
  v98[1] = @"Your task is the following:";
  v98[2] = @"- Analyze the transactions.";
  uint64_t v49 = [NSString stringWithFormat:@"- Answer the following question asked by the user: \"%@\".", v65];
  v98[3] = v49;
  uint64_t v50 = objc_msgSend(NSString, "stringWithFormat:", @"- Limit your answer to %lu words.", v47);
  v98[4] = v50;
  long long v51 = [NSString stringWithFormat:@"- Do not add comments, and only allow bulleted list formatting"];
  v98[5] = v51;
  v98[6] = @"- Minimize mathematical operations such as sums or totals, and inform the user that the model has limited support for mathematical operations since it's still in the beta phase.";
  v98[7] = @"\n";
  long long v52 = objc_msgSend(v68, "componentsJoinedByString:");
  v98[8] = v52;
  long long v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:9];

  long long v54 = [MEMORY[0x263EFF910] distantFuture];
  if (![v85 compare:v54])
  {

    goto LABEL_41;
  }
  id v55 = [MEMORY[0x263EFF910] distantPast];
  uint64_t v56 = [v11 compare:v55];

  if (!v56)
  {
LABEL_41:
    *(float *)&double v57 = a5;
    uint64_t v62 = v63;
    [(FHInferenceController *)v81 streamingQueryWithAlternatingRoles:0 modelId:v64 temperature:v63 delegate:v57];
    goto LABEL_42;
  }
  v96[0] = @"role";
  v96[1] = @"content";
  v97[0] = @"ROLE_USER";
  id v58 = [v53 componentsJoinedByString:@"\n"];
  v97[1] = v58;
  v59 = [NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:2];

  v95 = v59;
  v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v95 count:1];
  *(float *)&double v61 = a5;
  uint64_t v62 = v63;
  [(FHInferenceController *)v81 streamingQueryWithAlternatingRoles:v60 modelId:v64 temperature:v63 delegate:v61];

LABEL_42:
}

uint64_t __100__FHInferenceController__streamBankConnectTransactionsWithSingleQuery_modelId_temperature_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

BOOL __100__FHInferenceController__streamBankConnectTransactionsWithSingleQuery_modelId_temperature_delegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 56);
  id v6 = a3;
  uint64_t v7 = [a2 objectAtIndex:2];
  id v8 = [v5 dateFromString:v7];

  id v9 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v10 = [v6 objectAtIndex:2];

  uint64_t v11 = [v9 dateFromString:v10];

  BOOL v12 = [v8 compare:v11] == -1;
  return v12;
}

- (FHDatabaseEntity)transactionAndFeauturesEntities
{
  return self->_transactionAndFeauturesEntities;
}

- (void)setTransactionAndFeauturesEntities:(id)a3
{
}

- (FHDatabaseEntity)transactionsEntities
{
  return self->_transactionsEntities;
}

- (void)setTransactionsEntities:(id)a3
{
}

- (FHDatabaseEntity)accountEntities
{
  return self->_accountEntities;
}

- (void)setAccountEntities:(id)a3
{
}

- (NSArray)selectFieldsForTransactionsAndFeatures
{
  return self->_selectFieldsForTransactionsAndFeatures;
}

- (void)setSelectFieldsForTransactionsAndFeatures:(id)a3
{
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
}

- (NSString)acDawTicket
{
  return self->_acDawTicket;
}

- (void)setAcDawTicket:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (NSDateFormatter)monthOnlyDateFormatter
{
  return self->_monthOnlyDateFormatter;
}

- (void)setMonthOnlyDateFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthOnlyDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_acDawTicket, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_selectFieldsForTransactionsAndFeatures, 0);
  objc_storeStrong((id *)&self->_accountEntities, 0);
  objc_storeStrong((id *)&self->_transactionsEntities, 0);
  objc_storeStrong((id *)&self->_transactionAndFeauturesEntities, 0);
}

@end