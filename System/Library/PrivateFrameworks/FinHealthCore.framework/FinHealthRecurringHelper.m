@interface FinHealthRecurringHelper
+ (id)histogramKeysForCardPurchaseTransaction:(id)a3 transactionAmount:(id)a4 transactionType:(int64_t)a5 amountFromDatabase:(int64_t)a6 receiptIdentifier:(id)a7;
+ (id)histogramKeysForMerchantDetailedCategoryTransaction:(id)a3 transactionAmount:(id)a4 transactionType:(int64_t)a5 amountFromDatabase:(int64_t)a6;
+ (id)histogramKeysForPeerPaymentTransaction:(id)a3 transactionAmount:(id)a4 transactionPeerPaymentSubtype:(int64_t)a5 amountFromDatabase:(int64_t)a6;
+ (id)histogramKeysForTopUpTransaction:(id)a3 amountFromDatabase:(int64_t)a4;
+ (id)histogramKeysForTransaction:(id)a3;
+ (id)rootMeanSquareError:(id)a3;
+ (id)rootMeanSquareError:(id)a3 decimalKey:(id)a4 startIndex:(unint64_t)a5 arrayLength:(unint64_t)a6 decimalDenominator:(id)a7;
+ (id)rootMeanSquareError:(id)a3 startIndex:(unint64_t)a4 arrayLength:(unint64_t)a5;
+ (void)rootMeanSquareErrorForSlidingWindowWithCompletion:(id)a3 slidingWindowWidth:(unint64_t)a4 decimalThreshold:(id)a5 decimalDenominator:(id)a6 decimalKeyEntry:(id)a7 completion:(id)a8;
@end

@implementation FinHealthRecurringHelper

+ (void)rootMeanSquareErrorForSlidingWindowWithCompletion:(id)a3 slidingWindowWidth:(unint64_t)a4 decimalThreshold:(id)a5 decimalDenominator:(id)a6 decimalKeyEntry:(id)a7 completion:(id)a8
{
  id v20 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (void (**)(id, unint64_t, void *))a8;
  if (1 - a4 + [v20 count])
  {
    unint64_t v18 = 0;
    do
    {
      v19 = [a1 rootMeanSquareError:v20 decimalKey:v16 startIndex:v18 arrayLength:a4 decimalDenominator:v15];
      if ([v19 lessThan:v14]) {
        v17[2](v17, v18, v19);
      }

      ++v18;
    }
    while (v18 < 1 - a4 + [v20 count]);
  }
}

+ (id)histogramKeysForTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 transactionType];
  v6 = 0;
  if (v5 > 5)
  {
    if (v5 == 6)
    {
      v7 = [v4 amount];
      v6 = objc_msgSend(a1, "histogramKeysForTopUpTransaction:amountFromDatabase:", v7, objc_msgSend(v4, "amountFromDatabase"));
      goto LABEL_10;
    }
    if (v5 != 10) {
      goto LABEL_11;
    }
  }
  else if (v5)
  {
    if (v5 != 3) {
      goto LABEL_11;
    }
    v7 = [v4 peerPaymentCounterpartHandle];
    v8 = [v4 amount];
    v6 = objc_msgSend(a1, "histogramKeysForPeerPaymentTransaction:transactionAmount:transactionPeerPaymentSubtype:amountFromDatabase:", v7, v8, objc_msgSend(v4, "peerPaymentType"), objc_msgSend(v4, "amountFromDatabase"));
    goto LABEL_8;
  }
  v7 = [v4 displayName];
  v8 = [v4 amount];
  uint64_t v9 = [v4 transactionType];
  uint64_t v10 = [v4 amountFromDatabase];
  v11 = [v4 receiptIdentifier];
  v6 = [a1 histogramKeysForCardPurchaseTransaction:v7 transactionAmount:v8 transactionType:v9 amountFromDatabase:v10 receiptIdentifier:v11];

LABEL_8:
LABEL_10:

LABEL_11:
  return v6;
}

+ (id)histogramKeysForCardPurchaseTransaction:(id)a3 transactionAmount:(id)a4 transactionType:(int64_t)a5 amountFromDatabase:(int64_t)a6 receiptIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = v14;
  if (v14)
  {
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __139__FinHealthRecurringHelper_histogramKeysForCardPurchaseTransaction_transactionAmount_transactionType_amountFromDatabase_receiptIdentifier___block_invoke;
    v41[3] = &unk_265314850;
    id v42 = v14;
    id v16 = +[FHDatabaseClauseFromBuilder initWithBuilder:v41];
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__0;
    v39 = __Block_byref_object_dispose__0;
    id v40 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v17 = [[FHDatabaseEntity alloc] initWithEntity:@"fh_receipt_data"];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __139__FinHealthRecurringHelper_histogramKeysForCardPurchaseTransaction_transactionAmount_transactionType_amountFromDatabase_receiptIdentifier___block_invoke_424;
    v34[3] = &unk_265314D30;
    v34[4] = &v35;
    v34[5] = a1;
    v34[6] = a5;
    [(FHDatabaseEntity *)v17 queryDataWithBlock:v16 logicalOperator:@"AND" selectFields:&unk_2700274F8 usingBlock:v34];
    if ([(id)v36[5] count])
    {
      uint64_t v18 = [(id)v36[5] copy];
    }
    else
    {
      uint64_t v18 = [a1 histogramKeysForCardPurchaseTransaction:v12 transactionAmount:v13 transactionType:a5 amountFromDatabase:a6 receiptIdentifier:0];
    }
    v30 = (void *)v18;

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    id v33 = v13;
    [v13 doubleValue];
    v32 = [NSString stringWithFormat:@"%@_%ld_%.2f", v12, a5, log(fabs(v19) + 1.0)];
    id v20 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v32, "hash"));
    v21 = [NSString stringWithFormat:@"%@_%ld_%ld", v12, a5, 14 * a6];
    v22 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v21, "hash"));
    int v23 = _os_feature_enabled_impl();
    v24 = (void *)MEMORY[0x263EFFA08];
    v25 = [[FHSmartCompoundFeatureRankedValue alloc] initWithLabelAndIntegerRank:v20 featureRank:0];
    v26 = [[FHSmartCompoundFeatureRankedValue alloc] initWithLabelAndIntegerRank:v22 featureRank:0];
    v27 = v26;
    if (v23)
    {
      v28 = [[FHSmartCompoundFeatureRankedValue alloc] initWithLabelAndIntegerRank:v20 featureRank:7];
      v29 = [[FHSmartCompoundFeatureRankedValue alloc] initWithLabelAndIntegerRank:v22 featureRank:7];
      v30 = objc_msgSend(v24, "setWithObjects:", v25, v27, v28, v29, 0);
    }
    else
    {
      v30 = objc_msgSend(v24, "setWithObjects:", v25, v26, 0);
    }

    id v13 = v33;
  }

  return v30;
}

uint64_t __139__FinHealthRecurringHelper_histogramKeysForCardPurchaseTransaction_transactionAmount_transactionType_amountFromDatabase_receiptIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addStringClause:@"==" fieldName:@"fh_receipt_data.receiptIdentifier" expression:*(void *)(a1 + 32)];
}

void __139__FinHealthRecurringHelper_histogramKeysForCardPurchaseTransaction_transactionAmount_transactionType_amountFromDatabase_receiptIdentifier___block_invoke_424(void *a1, void *a2)
{
  id v3 = a2;
  id v16 = [v3 stringAtIndex:0];
  id v4 = [v3 stringAtIndex:1];
  int v5 = [v3 intAtIndex:2];

  v6 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithInteger:v5];
  v7 = [MEMORY[0x263F087B0] defaultDatabaseAmountMultiplier];
  v8 = [v6 decimalNumberByDividingBy:v7];

  uint64_t v9 = (void *)a1[5];
  uint64_t v10 = *(void **)(*(void *)(a1[4] + 8) + 40);
  v11 = [NSString stringWithFormat:@"%@%@", v16, v4];
  id v12 = [v9 histogramKeysForCardPurchaseTransaction:v11 transactionAmount:v8 transactionType:a1[6] amountFromDatabase:v5 receiptIdentifier:0];
  uint64_t v13 = [v10 setByAddingObjectsFromSet:v12];
  uint64_t v14 = *(void *)(a1[4] + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

+ (id)histogramKeysForPeerPaymentTransaction:(id)a3 transactionAmount:(id)a4 transactionPeerPaymentSubtype:(int64_t)a5 amountFromDatabase:(int64_t)a6
{
  id v9 = a3;
  [a4 doubleValue];
  v11 = [NSString stringWithFormat:@"%@_%ld_%.2f", v9, a5, log(fabs(v10) + 1.0)];
  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v11, "hash"));
  uint64_t v13 = [NSString stringWithFormat:@"%@_%ld_%ld", v9, a5, 14 * a6];
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v13, "hash"));
  id v15 = [NSString stringWithFormat:@"%@_%ld", v9, a5];

  id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v15, "hash"));
  v17 = (void *)MEMORY[0x263EFFA08];
  uint64_t v18 = [[FHSmartCompoundFeatureRankedValue alloc] initWithLabelAndIntegerRank:v12 featureRank:3];
  double v19 = [[FHSmartCompoundFeatureRankedValue alloc] initWithLabelAndIntegerRank:v14 featureRank:3];
  id v20 = [[FHSmartCompoundFeatureRankedValue alloc] initWithLabelAndIntegerRank:v16 featureRank:4];
  v21 = objc_msgSend(v17, "setWithObjects:", v18, v19, v20, 0);

  return v21;
}

+ (id)histogramKeysForTopUpTransaction:(id)a3 amountFromDatabase:(int64_t)a4
{
  [a3 doubleValue];
  v6 = [NSString stringWithFormat:@"%.2f", log(fabs(v5) + 1.0)];
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v6, "hash"));
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", 14 * a4);
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v8, "hash"));
  double v10 = (void *)MEMORY[0x263EFFA08];
  v11 = [[FHSmartCompoundFeatureRankedValue alloc] initWithLabelAndIntegerRank:v7 featureRank:5];
  id v12 = [[FHSmartCompoundFeatureRankedValue alloc] initWithLabelAndIntegerRank:v9 featureRank:5];
  uint64_t v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, 0);

  return v13;
}

+ (id)histogramKeysForMerchantDetailedCategoryTransaction:(id)a3 transactionAmount:(id)a4 transactionType:(int64_t)a5 amountFromDatabase:(int64_t)a6
{
  id v9 = a3;
  [a4 doubleValue];
  v11 = [NSString stringWithFormat:@"%@_%ld_%.2f", v9, a5, log(fabs(v10) + 1.0)];
  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v11, "hash"));
  uint64_t v13 = [NSString stringWithFormat:@"%@_%ld_%ld", v9, a5, 14 * a6];

  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v13, "hash"));
  id v15 = (void *)MEMORY[0x263EFFA08];
  id v16 = [[FHSmartCompoundFeatureRankedValue alloc] initWithLabelAndIntegerRank:v12 featureRank:9];
  v17 = [[FHSmartCompoundFeatureRankedValue alloc] initWithLabelAndIntegerRank:v14 featureRank:9];
  uint64_t v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, 0);

  return v18;
}

+ (id)rootMeanSquareError:(id)a3 startIndex:(unint64_t)a4 arrayLength:(unint64_t)a5
{
  id v7 = a3;
  if (a5 + a4 > a4)
  {
    uint64_t v8 = 0;
    double v9 = 0.0;
    do
    {
      double v10 = [v7 objectAtIndex:a4 + v8];
      [v10 doubleValue];
      double v9 = v9 + v11;

      ++v8;
    }
    while (a5 != v8);
    double v12 = (double)a5;
    double v13 = v9 / (double)a5;
    if (v13 >= 7.0 - 2.0)
    {
      double v14 = 0.0;
      if (a5 + a4 > a4)
      {
        do
        {
          id v15 = [v7 objectAtIndex:a4];
          [v15 doubleValue];
          double v17 = v16;

          double v14 = v14 + (v17 - v13) * (v17 - v13);
          ++a4;
          --a5;
        }
        while (a5);
      }
      goto LABEL_10;
    }
LABEL_9:
    id v18 = objc_alloc(MEMORY[0x263F087B0]);
    double v19 = 2.0 + 1.0;
    goto LABEL_11;
  }
  double v12 = (double)a5;
  double v14 = 0.0;
  if (0.0 / (double)a5 < 7.0 - 2.0) {
    goto LABEL_9;
  }
LABEL_10:
  id v18 = objc_alloc(MEMORY[0x263F087B0]);
  double v19 = sqrt(v14 / v12);
LABEL_11:
  id v20 = (void *)[v18 initWithDouble:v19];

  return v20;
}

+ (id)rootMeanSquareError:(id)a3
{
  id v4 = a3;
  double v5 = objc_msgSend(a1, "rootMeanSquareError:startIndex:arrayLength:", v4, 0, objc_msgSend(v4, "count"));

  return v5;
}

+ (id)rootMeanSquareError:(id)a3 decimalKey:(id)a4 startIndex:(unint64_t)a5 arrayLength:(unint64_t)a6 decimalDenominator:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  [a7 doubleValue];
  double v14 = v13;
  double v15 = 0.0;
  if (a5 + 1 < a6 + a5)
  {
    unint64_t v16 = a6 - 1;
    unint64_t v17 = a5;
    do
    {
      unint64_t v18 = v17 + 1;
      double v19 = objc_msgSend(v11, "objectAtIndex:");
      id v20 = [v19 objectForKey:v12];

      v21 = [v11 objectAtIndex:v18];
      v22 = [v21 objectForKey:v12];

      int v23 = [v20 decimalNumberBySubtracting:v22];
      [v23 doubleValue];
      double v15 = v15 + v24 / v14;

      unint64_t v17 = v18;
      --v16;
    }
    while (v16);
  }
  unint64_t v25 = a6 - 1;
  double v26 = (double)(a6 - 1);
  double v27 = v15 / v26;
  if (v27 >= 7.0 - 2.0)
  {
    double v30 = 0.0;
    if (a5 + 1 < a6 + a5)
    {
      do
      {
        unint64_t v31 = a5 + 1;
        v32 = [v11 objectAtIndex:a5];
        id v33 = [v32 objectForKey:v12];

        v34 = [v11 objectAtIndex:v31];
        uint64_t v35 = [v34 objectForKey:v12];

        v36 = [v33 decimalNumberBySubtracting:v35];
        [v36 doubleValue];
        double v38 = v37 / v14;

        double v30 = v30 + (v38 - v27) * (v38 - v27);
        a5 = v31;
        --v25;
      }
      while (v25);
    }
    id v28 = objc_alloc(MEMORY[0x263F087B0]);
    double v29 = sqrt(v30 / v26);
  }
  else
  {
    id v28 = objc_alloc(MEMORY[0x263F087B0]);
    double v29 = 2.0 + 1.0;
  }
  v39 = (void *)[v28 initWithDouble:v29];

  return v39;
}

@end