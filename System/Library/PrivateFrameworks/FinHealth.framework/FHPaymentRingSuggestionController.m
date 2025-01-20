@interface FHPaymentRingSuggestionController
- (BOOL)_allMandatoryValuesAreSameAmount:(id)a3;
- (BOOL)_categoryIsCurrentBalanceType:(unint64_t)a3;
- (BOOL)_categoryIsPaymentPlan:(unint64_t)a3;
- (BOOL)_fhEqualObjects:(id)a3 obj2:(id)a4;
- (FHPaymentRingSuggestionController)init;
- (id)_calculateThresholdForLastPaymentCategory:(unint64_t)a3 statementBalance:(id)a4 lastPaymentCategoryAmount:(id)a5 previousStatementPaymentsSum:(id)a6 statementPurchasesSum:(id)a7;
- (id)_filterSuggestions:(id)a3 belowThreshold:(id)a4;
- (id)_suggestedAmountsForPayOffDateForStatementBalance:(id)a3 statementPurchasesSum:(id)a4 creditUtilization:(id)a5 lastPaymentCategory:(unint64_t)a6;
- (id)_zerothOrFirstMonthPaymentRingSuggestionsForList:(id)a3;
- (id)generatePaymentRingSuggestion:(id)a3;
- (id)generatePaymentRingSuggestionsFromConvertedObjects:(id)a3 previousStatementPaymentsSum:(id)a4 currentStatementPaymentsSum:(id)a5 statementPurchasesSum:(id)a6 merchantCategoryTransactionSums:(id)a7 billPaymentSelectedSuggestedAmountData:(id)a8 isMonthZero:(BOOL)a9 isMonthOne:(BOOL)a10;
- (void)_minimumMerchcantCategoriesAboveMinimumAmount:(id)a3 minMerchantCategory1:(int64_t *)a4 minMerchantCategory2:(int64_t *)a5 minMerchantCategorySum1:(id *)a6 minMerchantCategorySum2:(id *)a7 merchantCategoryTransactionSums:(id)a8;
- (void)recordPaymentRingAction:(id)a3;
@end

@implementation FHPaymentRingSuggestionController

- (FHPaymentRingSuggestionController)init
{
  v6.receiver = self;
  v6.super_class = (Class)FHPaymentRingSuggestionController;
  v2 = [(FHPaymentRingSuggestionController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(FHSearchSuggestionController);
    searchController = v2->_searchController;
    v2->_searchController = v3;
  }
  return v2;
}

- (id)generatePaymentRingSuggestionsFromConvertedObjects:(id)a3 previousStatementPaymentsSum:(id)a4 currentStatementPaymentsSum:(id)a5 statementPurchasesSum:(id)a6 merchantCategoryTransactionSums:(id)a7 billPaymentSelectedSuggestedAmountData:(id)a8 isMonthZero:(BOOL)a9 isMonthOne:(BOOL)a10
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v11 = RequestFromPKAccountSummary(a3, a4, a5, a6, a7, a8, a9, a10);
  v12 = [(FHPaymentRingSuggestionController *)self generatePaymentRingSuggestion:v11];
  v13 = ResponseToPKBillPaymentSuggestion(v12);
  v14 = FinHealthLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = [v13 description];
    int v17 = 136315394;
    v18 = "-[FHPaymentRingSuggestionController generatePaymentRingSuggestionsFromConvertedObjects:previousStatementPaymen"
          "tsSum:currentStatementPaymentsSum:statementPurchasesSum:merchantCategoryTransactionSums:billPaymentSelectedSug"
          "gestedAmountData:isMonthZero:isMonthOne:]";
    __int16 v19 = 2112;
    v20 = v15;
    _os_log_impl(&dword_236773000, v14, OS_LOG_TYPE_DEBUG, "%s FinHealth final suggestions: %@", (uint8_t *)&v17, 0x16u);
  }
  return v13;
}

- (id)generatePaymentRingSuggestion:(id)a3
{
  uint64_t v223 = *MEMORY[0x263EF8340];
  id v168 = a3;
  v3 = [v168 currentStatement];
  v161 = [v3 remainingMinimumPayment];

  v4 = [v168 currentStatement];
  v167 = [v4 remainingStatementBalance];

  v5 = [v168 currentStatement];
  v160 = [v5 currentBalance];

  objc_super v6 = [v168 currentStatement];
  v166 = [v6 statementBalance];

  v7 = [v168 currentStatement];
  v165 = [v7 creditLimit];

  v8 = [v168 currentStatement];
  v159 = [v8 openingDate];

  v9 = [v168 currentStatement];
  v158 = [v9 closingDate];

  v10 = [v168 currentStatement];
  int v11 = [v10 isMonthZero];

  v12 = [v168 currentStatement];
  int v13 = [v12 isMonthOne];

  v14 = [v168 currentStatement];
  int v15 = [v14 isMonthOfMerge];

  v16 = [v168 paymentDetails];
  previousSelectedSuggestion = self->_previousSelectedSuggestion;
  self->_previousSelectedSuggestion = v16;

  uint64_t v201 = 0;
  v202 = &v201;
  uint64_t v203 = 0x3032000000;
  v204 = __Block_byref_object_copy_;
  v205 = __Block_byref_object_dispose_;
  id v206 = (id)objc_opt_new();
  if (v167)
  {
    v18 = [MEMORY[0x263F087B0] zero];
    BOOL v19 = [v167 compare:v18] == 1;
  }
  else
  {
    BOOL v19 = 0;
  }
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  v162 = [MEMORY[0x263F087B0] zero];
  if (v166)
  {
    if (v165)
    {
      uint64_t v21 = [MEMORY[0x263F087B0] zero];
      char v22 = [v165 isEqualToNumber:v21];

      if ((v22 & 1) == 0)
      {
        uint64_t v23 = [v166 decimalNumberByDividingBy:v165];

        v162 = (void *)v23;
      }
    }
  }
  if (v15)
  {
    v24 = [v168 currentStatement];
    v25 = [v24 combinedBalance];
    BOOL v26 = v25 == 0;

    if (!v26)
    {
      id v27 = objc_alloc(MEMORY[0x263F3C8A0]);
      v28 = [v168 currentStatement];
      v29 = [v28 combinedBalance];
      v30 = (void *)[v27 initWithAmount:v29 category:31];

      [v20 addObject:v30];
      goto LABEL_18;
    }
  }
  if ((v11 | v13)) {
    goto LABEL_14;
  }
  v31 = [v168 previousStatementPaymentsSum];
  if (!v31) {
    goto LABEL_14;
  }
  v32 = [v168 previousStatementPaymentsSum];
  v33 = [MEMORY[0x263F087B0] zero];
  BOOL v34 = [(FHPaymentRingSuggestionController *)self _fhEqualObjects:v32 obj2:v33];

  if (v34)
  {
LABEL_14:
    v35 = FinHealthLogObject();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v36 = [v168 description];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[FHPaymentRingSuggestionController generatePaymentRingSuggestion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v36;
      _os_log_impl(&dword_236773000, v35, OS_LOG_TYPE_DEBUG, "%s Request %@", buf, 0x16u);
    }
    v37 = [(FHPaymentRingSuggestionController *)self _zerothOrFirstMonthPaymentRingSuggestionsForList:v168];
    [v20 addObjectsFromArray:v37];

    goto LABEL_17;
  }
  if ([(FHPaymentRingSuggestionController *)self _allMandatoryValuesAreSameAmount:v168])
  {
LABEL_17:
    v30 = 0;
    goto LABEL_18;
  }
  uint64_t v197 = 0;
  v198 = &v197;
  uint64_t v199 = 0x2020000000;
  uint64_t v200 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v220 = __Block_byref_object_copy_;
  v221 = __Block_byref_object_dispose_;
  id v222 = 0;
  if (v19)
  {
    v40 = self->_previousSelectedSuggestion;
    v192[0] = MEMORY[0x263EF8330];
    v192[1] = 3221225472;
    v192[2] = __67__FHPaymentRingSuggestionController_generatePaymentRingSuggestion___block_invoke;
    v192[3] = &unk_264CAF3F0;
    v195 = &v197;
    v192[4] = self;
    id v193 = v168;
    id v194 = v167;
    v196 = buf;
    [(NSArray *)v40 enumerateObjectsUsingBlock:v192];

    uint64_t v41 = v198[3];
  }
  else
  {
    uint64_t v41 = 18;
    uint64_t v200 = 18;
  }
  self->_isOnPlanCompletion = v41 == 13;
  v42 = [v168 previousStatementPaymentsSum];
  unint64_t v43 = 0x263F08000;
  if (v42)
  {
    BOOL v44 = !self->_isOnPaymentPlan;

    if (v44)
    {
      id v46 = objc_alloc(MEMORY[0x263F3C8A0]);
      v47 = [v168 previousStatementPaymentsSum];
      v45 = (void *)[v46 initWithAmount:v47 category:2];

      [v20 addObject:v45];
      unint64_t v43 = 0x263F08000uLL;
    }
    else
    {
      v45 = 0;
      unint64_t v43 = 0x263F08000;
    }
  }
  else
  {
    v45 = 0;
  }
  v48 = [v168 statementPurchasesSum];
  if (!v48) {
    goto LABEL_32;
  }
  v49 = [v168 statementPurchasesSum];
  v50 = [*(id *)(v43 + 1968) zero];
  BOOL v51 = [(FHPaymentRingSuggestionController *)self _fhEqualObjects:v49 obj2:v50];

  if (!v51)
  {
    v53 = [v168 statementPurchasesSum];
    v52 = (void *)[objc_alloc(MEMORY[0x263F3C8A0]) initWithAmount:v53 category:5];

    [v20 addObject:v52];
  }
  else
  {
LABEL_32:
    v52 = v45;
  }
  uint64_t v190 = 0;
  v191 = 0;
  v54 = [*(id *)(v43 + 1968) zero];
  if ([v161 compare:v54] != 1)
  {

LABEL_40:
    v58 = [MEMORY[0x263F087B0] zero];
    if ([v167 compare:v58] == 1)
    {
      BOOL v59 = [v167 compare:v160] == -1;

      v57 = v167;
      if (v59) {
        goto LABEL_45;
      }
    }
    else
    {
    }
    v57 = v160;
    goto LABEL_45;
  }
  BOOL v55 = [v161 compare:v167] == -1;

  if (!v55) {
    goto LABEL_40;
  }
  uint64_t v56 = [v161 compare:v160];
  v57 = v161;
  if (v56 != -1) {
    v57 = v160;
  }
LABEL_45:
  id v152 = v57;
  v60 = FinHealthLogObject();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v211 = 134218754;
    id v212 = v191;
    __int16 v213 = 2048;
    uint64_t v214 = v190;
    __int16 v215 = 2112;
    uint64_t v216 = 0;
    __int16 v217 = 2112;
    uint64_t v218 = 0;
    _os_log_impl(&dword_236773000, v60, OS_LOG_TYPE_DEBUG, "Printing _merchantCategoryTransactionSums %lu, %lu, %@, %@", v211, 0x2Au);
  }

  id v188 = 0;
  id v189 = 0;
  v61 = [v168 merchantCategoryTransactionSums];
  [(FHPaymentRingSuggestionController *)self _minimumMerchcantCategoriesAboveMinimumAmount:v152 minMerchantCategory1:&v191 minMerchantCategory2:&v190 minMerchantCategorySum1:&v189 minMerchantCategorySum2:&v188 merchantCategoryTransactionSums:v61];
  id v155 = v189;
  id v154 = v188;

  v62 = [v168 previousStatementPaymentsSum];

  if (v62)
  {
    if (v155)
    {
      v63 = [v168 previousStatementPaymentsSum];
      v64 = [v155 decimalNumberByAdding:v63];

      v65 = [v168 statementPurchasesSum];
      BOOL v66 = [v64 compare:v65] == -1;

      if (v66)
      {
        v67 = (void *)[objc_alloc(MEMORY[0x263F3C8A0]) initWithAmount:v64 category:3];

        [v67 setMerchantCategory:v191];
        [v20 addObject:v67];
      }
      else
      {
        v67 = v52;
      }
    }
    else
    {
      v67 = v52;
    }
    if (v154)
    {
      v68 = [v168 previousStatementPaymentsSum];
      v69 = [v154 decimalNumberByAdding:v68];

      v70 = [v168 statementPurchasesSum];
      BOOL v71 = [v69 compare:v70] == -1;

      if (v71)
      {
        v52 = (void *)[objc_alloc(MEMORY[0x263F3C8A0]) initWithAmount:v69 category:4];

        [v52 setMerchantCategory:v190];
        [v20 addObject:v52];
      }
      else
      {
        v52 = v67;
      }
    }
    else
    {
      v52 = v67;
    }
  }
  if (v166)
  {
    v72 = [v168 statementPurchasesSum];
    BOOL v73 = !v72 || v162 == 0;
    BOOL v74 = !v73;

    if (v74)
    {
      v75 = [v168 statementPurchasesSum];
      uint64_t v76 = [(FHPaymentRingSuggestionController *)self _suggestedAmountsForPayOffDateForStatementBalance:v166 statementPurchasesSum:v75 creditUtilization:v162 lastPaymentCategory:v198[3]];

      [v20 addObject:v76];
      v52 = (void *)v76;
    }
  }
  dispatch_semaphore_t v77 = dispatch_semaphore_create(0);
  searchController = self->_searchController;
  v185[0] = MEMORY[0x263EF8330];
  v185[1] = 3221225472;
  v185[2] = __67__FHPaymentRingSuggestionController_generatePaymentRingSuggestion___block_invoke_77;
  v185[3] = &unk_264CAF418;
  v187 = &v201;
  v79 = v77;
  v186 = v79;
  [(FHSearchSuggestionController *)searchController paymentRingSuggestionsFromSearchFeatures:@"Payment Ring" startDate:v159 endDate:v158 completion:v185];
  dispatch_time_t v80 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v79, v80);
  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  id v81 = (id)v202[5];
  uint64_t v82 = [v81 countByEnumeratingWithState:&v181 objects:v210 count:16];
  v151 = v79;
  if (v82)
  {
    uint64_t v83 = *(void *)v182;
    do
    {
      for (uint64_t i = 0; i != v82; ++i)
      {
        if (*(void *)v182 != v83) {
          objc_enumerationMutation(v81);
        }
        v85 = *(void **)(*((void *)&v181 + 1) + 8 * i);
        v86 = [v85 featureRank];
        v87 = [v85 featureLabel];
        uint64_t v88 = FHPaymentRingSuggestionCategoryFromString();

        if (v88 != 32)
        {
          uint64_t v89 = [objc_alloc(MEMORY[0x263F3C8A0]) initWithAmount:v86 category:v88];

          [v20 addObject:v89];
          v52 = (void *)v89;
        }
      }
      uint64_t v82 = [v81 countByEnumeratingWithState:&v181 objects:v210 count:16];
    }
    while (v82);
  }

  if (self->_isOnPaymentPlan)
  {
    uint64_t v90 = [*(id *)(*(void *)&buf[8] + 40) paymentAmountCategory];
    unint64_t v91 = 0x263F08000;
    uint64_t v92 = v90;
  }
  else
  {
    uint64_t v92 = v198[3];
    unint64_t v91 = 0x263F08000uLL;
  }
  v157 = [*(id *)(v91 + 1968) zero];
  long long v179 = 0u;
  long long v180 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  v93 = [v168 paymentDetails];
  uint64_t v94 = [v93 countByEnumeratingWithState:&v177 objects:v209 count:16];
  if (v94)
  {
    uint64_t v95 = *(void *)v178;
    while (2)
    {
      for (uint64_t j = 0; j != v94; ++j)
      {
        if (*(void *)v178 != v95) {
          objc_enumerationMutation(v93);
        }
        v97 = *(void **)(*((void *)&v177 + 1) + 8 * j);
        uint64_t v98 = [v97 paymentAmountCategory];
        if (v98 == v198[3])
        {
          uint64_t v99 = [v97 transactionAmount];

          v157 = (void *)v99;
          goto LABEL_91;
        }
      }
      uint64_t v94 = [v93 countByEnumeratingWithState:&v177 objects:v209 count:16];
      if (v94) {
        continue;
      }
      break;
    }
  }
LABEL_91:

  id v100 = [v168 previousStatementPaymentsSum];
  v101 = [v168 statementPurchasesSum];
  v156 = [(FHPaymentRingSuggestionController *)self _calculateThresholdForLastPaymentCategory:v92 statementBalance:v166 lastPaymentCategoryAmount:v157 previousStatementPaymentsSum:v100 statementPurchasesSum:v101];

  v102 = FinHealthLogObject();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v211 = 138412290;
    id v212 = v156;
    _os_log_impl(&dword_236773000, v102, OS_LOG_TYPE_DEBUG, "Calculated Threshold value : %@", v211, 0xCu);
  }

  v103 = [(FHPaymentRingSuggestionController *)self _filterSuggestions:v20 belowThreshold:v156];

  v104 = FinHealthLogObject();
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
  {
    id v100 = [v103 description];
    *(_DWORD *)v211 = 138412290;
    id v212 = v100;
    _os_log_impl(&dword_236773000, v104, OS_LOG_TYPE_DEBUG, "FinHealth Suggestions after threshold value : %@", v211, 0xCu);
  }
  if (!v166) {
    goto LABEL_108;
  }
  v105 = [v168 statementPurchasesSum];
  if (v105)
  {
    v106 = [v168 statementPurchasesSum];
    uint64_t v107 = [v166 compare:v106];
    if (!v107
      || ([v168 statementPurchasesSum],
          id v100 = (id)objc_claimAutoreleasedReturnValue(),
          [v166 compare:v100] == -1))
    {
      BOOL v108 = [v165 compare:v166] == 1;
      if (v107)
      {

        if (!v108) {
          goto LABEL_106;
        }
      }
      else
      {

        if (!v108) {
          goto LABEL_106;
        }
      }
      v109 = [MEMORY[0x263F087B0] decimalNumberWithString:@"2"];
      v110 = [v166 decimalNumberByDividingBy:v109];
      v111 = [v166 decimalNumberBySubtracting:v110];
      v112 = [MEMORY[0x263F087B0] decimalNumberWithString:@"2"];
      v113 = [v166 decimalNumberByDividingBy:v112];
      v114 = [v165 decimalNumberBySubtracting:v113];
      v115 = [v111 decimalNumberByDividingBy:v114];

      v116 = [MEMORY[0x263F087B0] decimalNumberWithString:@"0.33"];
      BOOL v117 = [v115 compare:v116] == -1;

      if (v117)
      {
        id v150 = objc_alloc(MEMORY[0x263F3C8A0]);
        v121 = [MEMORY[0x263F087B0] decimalNumberWithString:@"2"];
        v122 = [v166 decimalNumberByDividingBy:v121];
        v123 = [v166 decimalNumberBySubtracting:v122];
        v164 = [MEMORY[0x263F087B0] decimalNumberWithString:@"3"];
        v153 = [v123 decimalNumberByDividingBy:v164];
        v124 = [MEMORY[0x263F087B0] decimalNumberWithString:@"2"];
        v125 = [v166 decimalNumberByDividingBy:v124];
        v126 = [v153 decimalNumberByAdding:v125];
        uint64_t v127 = [v150 initWithAmount:v126 category:23];
      }
      else
      {
        v118 = [MEMORY[0x263F087B0] decimalNumberWithString:@"0.67"];
        BOOL v119 = [v115 compare:v118] == -1;

        id v120 = objc_alloc(MEMORY[0x263F3C8A0]);
        v121 = [MEMORY[0x263F087B0] decimalNumberWithString:@"2"];
        v122 = [v166 decimalNumberByDividingBy:v121];
        v123 = [v166 decimalNumberBySubtracting:v122];
        if (v119)
        {
          v164 = [MEMORY[0x263F087B0] decimalNumberWithString:@"6"];
          v153 = [v123 decimalNumberByDividingBy:v164];
          v124 = [MEMORY[0x263F087B0] decimalNumberWithString:@"2"];
          v125 = [v166 decimalNumberByDividingBy:v124];
          v126 = [v153 decimalNumberByAdding:v125];
          uint64_t v127 = [v120 initWithAmount:v126 category:24];
        }
        else
        {
          v164 = [MEMORY[0x263F087B0] decimalNumberWithString:@"9"];
          v153 = [v123 decimalNumberByDividingBy:v164];
          v124 = [MEMORY[0x263F087B0] decimalNumberWithString:@"2"];
          v125 = [v166 decimalNumberByDividingBy:v124];
          v126 = [v153 decimalNumberByAdding:v125];
          uint64_t v127 = [v120 initWithAmount:v126 category:25];
        }
      }
      v30 = (void *)v127;

      [v103 addObject:v30];
      goto LABEL_109;
    }
  }
LABEL_106:
  if (v161 && ![(FHPaymentRingSuggestionController *)self _categoryIsPaymentPlan:v198[3]])
  {
    id v146 = objc_alloc(MEMORY[0x263F3C8A0]);
    v147 = [v166 decimalNumberByAdding:v161];
    v148 = [MEMORY[0x263F087B0] decimalNumberWithString:@"2"];
    v149 = [v147 decimalNumberByDividingBy:v148];
    v30 = (void *)[v146 initWithAmount:v149 category:29];

    [v103 addObject:v30];
    goto LABEL_109;
  }
LABEL_108:
  v30 = v52;
LABEL_109:
  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  id v128 = (id)v202[5];
  uint64_t v129 = [v128 countByEnumeratingWithState:&v173 objects:v208 count:16];
  if (v129)
  {
    uint64_t v130 = *(void *)v174;
    do
    {
      for (uint64_t k = 0; k != v129; ++k)
      {
        if (*(void *)v174 != v130) {
          objc_enumerationMutation(v128);
        }
        v132 = *(void **)(*((void *)&v173 + 1) + 8 * k);
        v133 = [v132 featureRank];
        v134 = [v132 featureLabel];
        uint64_t v135 = FHPaymentRingSuggestionCategoryFromString();

        if (v135 == 32)
        {
          uint64_t v136 = [objc_alloc(MEMORY[0x263F3C8A0]) initWithAmount:v133 category:32];

          [v103 addObject:v136];
          v30 = (void *)v136;
        }
      }
      uint64_t v129 = [v128 countByEnumeratingWithState:&v173 objects:v208 count:16];
    }
    while (v129);
  }

  v137 = [v168 currentStatementPaymentsSum];

  if (v137)
  {
    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    id v138 = v103;
    uint64_t v139 = [v138 countByEnumeratingWithState:&v169 objects:v207 count:16];
    if (v139)
    {
      uint64_t v140 = *(void *)v170;
      do
      {
        for (uint64_t m = 0; m != v139; ++m)
        {
          if (*(void *)v170 != v140) {
            objc_enumerationMutation(v138);
          }
          v142 = *(void **)(*((void *)&v169 + 1) + 8 * m);
          v143 = [v142 amount];
          v144 = [v168 currentStatementPaymentsSum];
          v145 = [v143 decimalNumberBySubtracting:v144];

          [v142 setAmount:v145];
        }
        uint64_t v139 = [v138 countByEnumeratingWithState:&v169 objects:v207 count:16];
      }
      while (v139);
    }
  }
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v197, 8);
  id v20 = v103;
LABEL_18:
  id v38 = v20;

  _Block_object_dispose(&v201, 8);
  return v38;
}

void __67__FHPaymentRingSuggestionController_generatePaymentRingSuggestion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v9 paymentAmountCategory];
  if (objc_msgSend(*(id *)(a1 + 32), "_categoryIsPaymentPlan:", objc_msgSend(v9, "paymentAmountCategory")))
  {
    v7 = [*(id *)(a1 + 40) previousStatementPaymentsSum];
    uint64_t v8 = [v7 compare:*(void *)(a1 + 48)];

    if (v8 == -1)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

void __67__FHPaymentRingSuggestionController_generatePaymentRingSuggestion___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v11 = a1;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:v3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v10 = FinHealthLogObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          int v17 = "-[FHPaymentRingSuggestionController generatePaymentRingSuggestion:]_block_invoke";
          __int16 v18 = 2112;
          uint64_t v19 = v9;
          _os_log_impl(&dword_236773000, v10, OS_LOG_TYPE_DEBUG, "[%s] FinHealth suggestion: %@", buf, 0x16u);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v6);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v11 + 32));
}

- (void)recordPaymentRingAction:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v14 = objc_alloc_init(v4);
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x263F3C7F8]];
  uint64_t v7 = (int)[v6 intValue] + 200;

  uint64_t v8 = [NSNumber numberWithInteger:v7];
  [v14 setObject:v8 forKey:*MEMORY[0x263F3C7B0]];

  uint64_t v9 = [v5 objectForKey:*MEMORY[0x263F3C7E8]];
  [v14 setObject:v9 forKey:*MEMORY[0x263F3C7B8]];

  [v14 setObject:&unk_26E9B66F8 forKey:*MEMORY[0x263F3C7A8]];
  v10 = [v5 objectForKey:*MEMORY[0x263F3C7E0]];
  [v14 setObject:v10 forKey:*MEMORY[0x263F3C790]];

  uint64_t v11 = [v5 objectForKey:*MEMORY[0x263F3C7F0]];

  [v14 setObject:v11 forKey:*MEMORY[0x263F3C7A0]];
  searchController = self->_searchController;
  long long v13 = (void *)[v14 copy];
  [(FHSearchSuggestionController *)searchController recordUserInteraction:v13];
}

- (id)_zerothOrFirstMonthPaymentRingSuggestionsForList:(id)a3
{
  uint64_t v129 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 currentStatement];
  uint64_t v6 = [v5 creditLimit];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263F087B0] zero];
  }
  uint64_t v99 = v8;

  uint64_t v9 = [v4 currentStatement];
  v105 = [v9 currentBalanceForMonthZero];

  v10 = [v4 currentStatement];
  uint64_t v11 = [v10 remainingMinimumPayment];
  long long v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x263F087B0] zero];
  }
  v102 = v13;
  id v14 = v99;

  long long v15 = [v4 currentStatement];
  v16 = [v15 remainingStatementBalance];
  int v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [MEMORY[0x263F087B0] zero];
  }
  v101 = v18;

  uint64_t v19 = [v4 currentStatement];
  id v20 = [v19 minimumDue];
  uint64_t v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = [MEMORY[0x263F087B0] zero];
  }
  v103 = v22;

  uint64_t v23 = [v4 currentStatement];
  v24 = [v23 statementBalance];
  v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    id v26 = [MEMORY[0x263F087B0] zero];
  }
  v104 = v26;

  id v27 = [v4 currentStatement];
  int v28 = [v27 isMonthZero];

  v29 = [v4 currentStatement];
  LODWORD(v30) = [v29 isMonthOne];

  id v100 = objc_alloc_init(MEMORY[0x263EFF980]);
  v31 = FinHealthLogObject();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138414082;
    *(void *)&uint8_t buf[4] = v99;
    __int16 v115 = 2112;
    v116 = v105;
    __int16 v117 = 2112;
    v118 = v102;
    __int16 v119 = 2112;
    id v120 = v101;
    __int16 v121 = 2112;
    v122 = v103;
    __int16 v123 = 2112;
    v124 = v104;
    __int16 v125 = 1024;
    int v126 = v28;
    __int16 v127 = 1024;
    int v128 = v30;
    _os_log_impl(&dword_236773000, v31, OS_LOG_TYPE_DEBUG, "Month-zero values CL, CB, RMP, RSB, MD, SB, isMonthZero, isMonthOne, %@, %@, %@, %@, %@, %@, %d, %d", buf, 0x4Au);
  }

  uint64_t v32 = [MEMORY[0x263F087B0] zero];
  v33 = (void *)v32;
  if (v105 && v99)
  {
    char v34 = v30;
    v35 = [MEMORY[0x263F087B0] zero];
    char v36 = [v99 isEqualToNumber:v35];

    if (v36)
    {
      v37 = v33;
    }
    else
    {
      uint64_t v38 = [v105 decimalNumberByDividingBy:v99];

      v39 = FinHealthLogObject();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v38;
        _os_log_impl(&dword_236773000, v39, OS_LOG_TYPE_DEBUG, "Logging creditUtilizationForMonthZero %@", buf, 0xCu);
      }

      v37 = (void *)v38;
    }
    LOBYTE(v30) = v34;
  }
  else
  {
    v37 = (void *)v32;
  }
  uint64_t v98 = [MEMORY[0x263F087B0] zero];
  if (v105 && v104)
  {
    v40 = v37;
    uint64_t v41 = [MEMORY[0x263F087B0] zero];
    if (([v105 isEqualToNumber:v41] & 1) == 0)
    {
      v42 = [MEMORY[0x263F087B0] zero];
      char v43 = [v99 isEqualToNumber:v42];

      if (v43)
      {
LABEL_33:
        v37 = v40;
        goto LABEL_34;
      }
      [v104 decimalNumberByDividingBy:v99];
      v98 = uint64_t v41 = v98;
    }

    goto LABEL_33;
  }
LABEL_34:
  if ([(FHPaymentRingSuggestionController *)self _allMandatoryValuesAreSameAmount:v4])
  {
    goto LABEL_89;
  }
  *(void *)buf = 0;
  id v111 = 0;
  uint64_t v112 = 0;
  id v110 = 0;
  BOOL v44 = [v4 merchantCategoryTransactionSums];
  [(FHPaymentRingSuggestionController *)self _minimumMerchcantCategoriesAboveMinimumAmount:v102 minMerchantCategory1:buf minMerchantCategory2:&v112 minMerchantCategorySum1:&v111 minMerchantCategorySum2:&v110 merchantCategoryTransactionSums:v44];
  id v45 = v111;
  id v96 = v110;

  uint64_t v94 = v45;
  if (!v45)
  {
    v97 = 0;
    v47 = v100;
    goto LABEL_45;
  }
  id v46 = objc_msgSend(v45, "decimalNumberByAdding:", v103, v45);
  v47 = v100;
  if (v28) {
    goto LABEL_43;
  }
  if ((v30 & 1) != 0
    || ([v4 previousStatementPaymentsSum], (v48 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([v46 compare:v101] != -1) {
      goto LABEL_42;
    }
LABEL_43:
    v49 = (void *)[objc_alloc(MEMORY[0x263F3C8A0]) initWithAmount:v46 category:3];
    [v49 setMerchantCategory:*(void *)buf];
    v97 = v49;
    [v100 addObject:v49];
    goto LABEL_44;
  }

LABEL_42:
  v97 = 0;
LABEL_44:

LABEL_45:
  if (!v96) {
    goto LABEL_53;
  }
  v50 = [v96 decimalNumberByAdding:v103];
  if (v28) {
    goto LABEL_51;
  }
  if ((v30 & 1) != 0
    || ([v4 previousStatementPaymentsSum], (BOOL v51 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v52 = objc_msgSend(v4, "currentStatement", v94);
    [v52 remainingStatementBalance];
    uint64_t v30 = v53 = v30;
    uint64_t v54 = [v50 compare:v30];

    LOBYTE(v30) = v53;
    v47 = v100;

    if (v54 != -1) {
      goto LABEL_52;
    }
LABEL_51:
    BOOL v55 = (void *)[objc_alloc(MEMORY[0x263F3C8A0]) initWithAmount:v50 category:4];

    [v55 setMerchantCategory:v112];
    [v47 addObject:v55];
    v97 = v55;
    goto LABEL_52;
  }

LABEL_52:
LABEL_53:
  if (v37) {
    int v56 = v28;
  }
  else {
    int v56 = 0;
  }
  uint64_t v95 = v37;
  if (v105 && v56)
  {
    v57 = [MEMORY[0x263F087B0] decimalNumberWithString:@"0.33"];
    uint64_t v58 = [v37 compare:v57];

    if (v58 == -1)
    {
      id v79 = objc_alloc(MEMORY[0x263F3C8A0]);
      v62 = [MEMORY[0x263F087B0] decimalNumberWithString:@"3"];
      v63 = [v105 decimalNumberByDividingBy:v62];
      v64 = v79;
      v65 = v63;
      uint64_t v66 = 20;
    }
    else
    {
      BOOL v59 = [MEMORY[0x263F087B0] decimalNumberWithString:@"0.67"];
      uint64_t v60 = [v37 compare:v59];

      id v61 = objc_alloc(MEMORY[0x263F3C8A0]);
      if (v60 == -1)
      {
        v62 = [MEMORY[0x263F087B0] decimalNumberWithString:@"6"];
        v63 = [v105 decimalNumberByDividingBy:v62];
        v64 = v61;
        v65 = v63;
        uint64_t v66 = 21;
      }
      else
      {
        v62 = [MEMORY[0x263F087B0] decimalNumberWithString:@"9"];
        v63 = [v105 decimalNumberByDividingBy:v62];
        v64 = v61;
        v65 = v63;
        uint64_t v66 = 22;
      }
    }
    id v81 = objc_msgSend(v64, "initWithAmount:category:", v65, v66, v94);
  }
  else
  {
    if (v98) {
      char v67 = v30;
    }
    else {
      char v67 = 0;
    }
    if (!v104 || (v67 & 1) == 0)
    {
      v68 = objc_msgSend(v4, "previousStatementPaymentsSum", v94);

      if (v68) {
        goto LABEL_77;
      }
    }
    v69 = objc_msgSend(MEMORY[0x263F087B0], "decimalNumberWithString:", @"0.33", v94);
    uint64_t v70 = [v98 compare:v69];

    if (v70 == -1)
    {
      id v80 = objc_alloc(MEMORY[0x263F3C8A0]);
      BOOL v74 = [MEMORY[0x263F087B0] decimalNumberWithString:@"3"];
      v75 = [v104 decimalNumberByDividingBy:v74];
      uint64_t v76 = v80;
      dispatch_semaphore_t v77 = v75;
      uint64_t v78 = 26;
    }
    else
    {
      BOOL v71 = [MEMORY[0x263F087B0] decimalNumberWithString:@"0.67"];
      uint64_t v72 = [v98 compare:v71];

      id v73 = objc_alloc(MEMORY[0x263F3C8A0]);
      if (v72 == -1)
      {
        BOOL v74 = [MEMORY[0x263F087B0] decimalNumberWithString:@"6"];
        v75 = [v104 decimalNumberByDividingBy:v74];
        uint64_t v76 = v73;
        dispatch_semaphore_t v77 = v75;
        uint64_t v78 = 27;
      }
      else
      {
        BOOL v74 = [MEMORY[0x263F087B0] decimalNumberWithString:@"9"];
        v75 = [v104 decimalNumberByDividingBy:v74];
        uint64_t v76 = v73;
        dispatch_semaphore_t v77 = v75;
        uint64_t v78 = 28;
      }
    }
    id v81 = (void *)[v76 initWithAmount:v77 category:v78];

    uint64_t v82 = [v81 amount];
    uint64_t v83 = [v82 compare:v101];

    v97 = v81;
    if (v83 != -1) {
      goto LABEL_77;
    }
  }
  [v47 addObject:v81];
  v97 = v81;
LABEL_77:
  v84 = [v4 currentStatementPaymentsSum];
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v85 = v47;
  uint64_t v86 = [v85 countByEnumeratingWithState:&v106 objects:v113 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v107;
    do
    {
      for (uint64_t i = 0; i != v87; ++i)
      {
        if (*(void *)v107 != v88) {
          objc_enumerationMutation(v85);
        }
        if (v84)
        {
          uint64_t v90 = *(void **)(*((void *)&v106 + 1) + 8 * i);
          unint64_t v91 = [v90 amount];
          if (!-[FHPaymentRingSuggestionController _categoryIsCurrentBalanceType:](self, "_categoryIsCurrentBalanceType:", [v90 category]))
          {
            uint64_t v92 = [v91 decimalNumberBySubtracting:v84];
            [v90 setAmount:v92];
          }
        }
      }
      uint64_t v87 = [v85 countByEnumeratingWithState:&v106 objects:v113 count:16];
    }
    while (v87);
  }

  id v14 = v99;
  v37 = v95;
LABEL_89:

  return v100;
}

- (BOOL)_allMandatoryValuesAreSameAmount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 currentStatement];
  id v5 = [v4 currentBalance];

  uint64_t v6 = [v3 currentStatement];
  uint64_t v7 = [v6 remainingStatementBalance];

  id v8 = [v3 currentStatement];

  uint64_t v9 = [v8 remainingMinimumPayment];

  v10 = [MEMORY[0x263F087B0] zero];
  if (v5 && [v5 compare:v10] == -1)
  {
    id v11 = v10;

    id v5 = v11;
  }
  if (v7 && [v7 compare:v10] == -1)
  {
    id v14 = v10;

    uint64_t v7 = v14;
    if (!v9) {
      goto LABEL_15;
    }
  }
  else if (!v9)
  {
    goto LABEL_15;
  }
  if ([v9 compare:v10] == -1)
  {
    id v12 = v10;

    uint64_t v9 = v12;
  }
  char v13 = 0;
  if (v5 && v7 && v9)
  {
    if ([v5 isEqual:v7])
    {
      char v13 = [v7 isEqual:v9];
      goto LABEL_16;
    }
LABEL_15:
    char v13 = 0;
  }
LABEL_16:

  return v13;
}

- (void)_minimumMerchcantCategoriesAboveMinimumAmount:(id)a3 minMerchantCategory1:(int64_t *)a4 minMerchantCategory2:(int64_t *)a5 minMerchantCategorySum1:(id *)a6 minMerchantCategorySum2:(id *)a7 merchantCategoryTransactionSums:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v33 = 0;
  char v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  if (v13)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __205__FHPaymentRingSuggestionController__minimumMerchcantCategoriesAboveMinimumAmount_minMerchantCategory1_minMerchantCategory2_minMerchantCategorySum1_minMerchantCategorySum2_merchantCategoryTransactionSums___block_invoke;
    v15[3] = &unk_264CAF440;
    id v16 = v13;
    int v17 = &v27;
    id v18 = &v37;
    uint64_t v19 = &v21;
    id v20 = &v33;
    [v14 enumerateKeysAndObjectsUsingBlock:v15];
  }
  if (a4) {
    *a4 = v38[3];
  }
  if (a5) {
    *a5 = v34[3];
  }
  if (a6) {
    *a6 = (id) v28[5];
  }
  if (a7) {
    *a7 = (id) v22[5];
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
}

void __205__FHPaymentRingSuggestionController__minimumMerchcantCategoriesAboveMinimumAmount_minMerchantCategory1_minMerchantCategory2_minMerchantCategorySum1_minMerchantCategorySum2_merchantCategoryTransactionSums___block_invoke(void *a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if ([v5 compare:a1[4]] == 1)
  {
    uint64_t v6 = *(void *)(a1[5] + 8);
    uint64_t v8 = *(void *)(v6 + 40);
    uint64_t v7 = (id *)(v6 + 40);
    if (!v8)
    {
LABEL_8:
      objc_storeStrong(v7, a3);
      uint64_t v12 = [v14 integerValue];
      uint64_t v13 = a1[6];
LABEL_11:
      *(void *)(*(void *)(v13 + 8) + 24) = v12;
      goto LABEL_12;
    }
    uint64_t v9 = *(void *)(a1[7] + 8);
    uint64_t v11 = *(void *)(v9 + 40);
    v10 = (id *)(v9 + 40);
    if (!v11)
    {
LABEL_10:
      objc_storeStrong(v10, a3);
      uint64_t v12 = [v14 integerValue];
      uint64_t v13 = a1[8];
      goto LABEL_11;
    }
    if (objc_msgSend(v5, "compare:") == -1
      || [v5 compare:*(void *)(*(void *)(a1[7] + 8) + 40)] == -1)
    {
      if ([*(id *)(*(void *)(a1[5] + 8) + 40) compare:*(void *)(*(void *)(a1[7] + 8) + 40)] != -1)
      {
        uint64_t v7 = (id *)(*(void *)(a1[5] + 8) + 40);
        goto LABEL_8;
      }
      v10 = (id *)(*(void *)(a1[7] + 8) + 40);
      goto LABEL_10;
    }
  }
LABEL_12:
}

- (id)_suggestedAmountsForPayOffDateForStatementBalance:(id)a3 statementPurchasesSum:(id)a4 creditUtilization:(id)a5 lastPaymentCategory:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  uint64_t v13 = 0;
  if (v9 && v10 && v11)
  {
    switch(a6)
    {
      case 6uLL:
      case 0xEuLL:
      case 0x19uLL:
        id v14 = objc_alloc(MEMORY[0x263F3C8A0]);
        long long v15 = [v9 decimalNumberBySubtracting:v10];
        id v16 = [MEMORY[0x263F087B0] decimalNumberWithString:@"8"];
        int v17 = [v15 decimalNumberByDividingBy:v16];
        id v18 = [v17 decimalNumberByAdding:v10];
        uint64_t v19 = v14;
        id v20 = v18;
        uint64_t v21 = 7;
        goto LABEL_18;
      case 7uLL:
        id v24 = objc_alloc(MEMORY[0x263F3C8A0]);
        long long v15 = [v9 decimalNumberBySubtracting:v10];
        id v16 = [MEMORY[0x263F087B0] decimalNumberWithString:@"7"];
        int v17 = [v15 decimalNumberByDividingBy:v16];
        id v18 = [v17 decimalNumberByAdding:v10];
        uint64_t v19 = v24;
        id v20 = v18;
        uint64_t v21 = 8;
        goto LABEL_18;
      case 8uLL:
        id v25 = objc_alloc(MEMORY[0x263F3C8A0]);
        long long v15 = [v9 decimalNumberBySubtracting:v10];
        id v16 = [MEMORY[0x263F087B0] decimalNumberWithString:@"6"];
        int v17 = [v15 decimalNumberByDividingBy:v16];
        id v18 = [v17 decimalNumberByAdding:v10];
        uint64_t v19 = v25;
        id v20 = v18;
        uint64_t v21 = 9;
        goto LABEL_18;
      case 9uLL:
      case 0xFuLL:
      case 0x18uLL:
        id v22 = objc_alloc(MEMORY[0x263F3C8A0]);
        long long v15 = [v9 decimalNumberBySubtracting:v10];
        id v16 = [MEMORY[0x263F087B0] decimalNumberWithString:@"5"];
        int v17 = [v15 decimalNumberByDividingBy:v16];
        id v18 = [v17 decimalNumberByAdding:v10];
        uint64_t v19 = v22;
        id v20 = v18;
        uint64_t v21 = 10;
        goto LABEL_18;
      case 0xAuLL:
        id v26 = objc_alloc(MEMORY[0x263F3C8A0]);
        long long v15 = [v9 decimalNumberBySubtracting:v10];
        id v16 = [MEMORY[0x263F087B0] decimalNumberWithString:@"4"];
        int v17 = [v15 decimalNumberByDividingBy:v16];
        id v18 = [v17 decimalNumberByAdding:v10];
        uint64_t v19 = v26;
        id v20 = v18;
        uint64_t v21 = 11;
        goto LABEL_18;
      case 0xBuLL:
        id v27 = objc_alloc(MEMORY[0x263F3C8A0]);
        long long v15 = [v9 decimalNumberBySubtracting:v10];
        id v16 = [MEMORY[0x263F087B0] decimalNumberWithString:@"3"];
        int v17 = [v15 decimalNumberByDividingBy:v16];
        id v18 = [v17 decimalNumberByAdding:v10];
        uint64_t v19 = v27;
        id v20 = v18;
        uint64_t v21 = 12;
        goto LABEL_18;
      case 0xCuLL:
      case 0x10uLL:
      case 0x17uLL:
        id v23 = objc_alloc(MEMORY[0x263F3C8A0]);
        long long v15 = [v9 decimalNumberBySubtracting:v10];
        id v16 = [MEMORY[0x263F087B0] decimalNumberWithString:@"2"];
        int v17 = [v15 decimalNumberByDividingBy:v16];
        id v18 = [v17 decimalNumberByAdding:v10];
        uint64_t v19 = v23;
        id v20 = v18;
        uint64_t v21 = 13;
        goto LABEL_18;
      case 0xDuLL:
        uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F3C8A0]) initWithAmount:v9 category:17];
        break;
      default:
        int v28 = [MEMORY[0x263F087B0] decimalNumberWithString:@"0.33"];
        uint64_t v29 = [v12 compare:v28];

        if (v29 == -1)
        {
          id v33 = objc_alloc(MEMORY[0x263F3C8A0]);
          long long v15 = [v9 decimalNumberBySubtracting:v10];
          id v16 = [MEMORY[0x263F087B0] decimalNumberWithString:@"3"];
          int v17 = [v15 decimalNumberByDividingBy:v16];
          id v18 = [v17 decimalNumberByAdding:v10];
          uint64_t v19 = v33;
          id v20 = v18;
          uint64_t v21 = 16;
        }
        else
        {
          uint64_t v30 = [MEMORY[0x263F087B0] decimalNumberWithString:@"0.67"];
          uint64_t v31 = [v12 compare:v30];

          id v32 = objc_alloc(MEMORY[0x263F3C8A0]);
          long long v15 = [v9 decimalNumberBySubtracting:v10];
          if (v31 == -1)
          {
            id v16 = [MEMORY[0x263F087B0] decimalNumberWithString:@"6"];
            int v17 = [v15 decimalNumberByDividingBy:v16];
            id v18 = [v17 decimalNumberByAdding:v10];
            uint64_t v19 = v32;
            id v20 = v18;
            uint64_t v21 = 15;
          }
          else
          {
            id v16 = [MEMORY[0x263F087B0] decimalNumberWithString:@"9"];
            int v17 = [v15 decimalNumberByDividingBy:v16];
            id v18 = [v17 decimalNumberByAdding:v10];
            uint64_t v19 = v32;
            id v20 = v18;
            uint64_t v21 = 14;
          }
        }
LABEL_18:
        uint64_t v13 = (void *)[v19 initWithAmount:v20 category:v21];

        break;
    }
  }

  return v13;
}

- (id)_calculateThresholdForLastPaymentCategory:(unint64_t)a3 statementBalance:(id)a4 lastPaymentCategoryAmount:(id)a5 previousStatementPaymentsSum:(id)a6 statementPurchasesSum:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (v13)
  {
    id v15 = v13;
    switch(a3)
    {
      case 0uLL:
        break;
      case 6uLL:
      case 0xEuLL:
      case 0x19uLL:
        id v16 = [v11 decimalNumberBySubtracting:v14];
        int v17 = (void *)MEMORY[0x263F087B0];
        id v18 = @"8";
        goto LABEL_13;
      case 7uLL:
        id v16 = [v11 decimalNumberBySubtracting:v14];
        int v17 = (void *)MEMORY[0x263F087B0];
        id v18 = @"7";
        goto LABEL_13;
      case 8uLL:
        id v16 = [v11 decimalNumberBySubtracting:v14];
        int v17 = (void *)MEMORY[0x263F087B0];
        id v18 = @"6";
        goto LABEL_13;
      case 9uLL:
      case 0xFuLL:
      case 0x18uLL:
        id v16 = [v11 decimalNumberBySubtracting:v14];
        int v17 = (void *)MEMORY[0x263F087B0];
        id v18 = @"5";
        goto LABEL_13;
      case 0xAuLL:
        id v16 = [v11 decimalNumberBySubtracting:v14];
        int v17 = (void *)MEMORY[0x263F087B0];
        id v18 = @"4";
        goto LABEL_13;
      case 0xBuLL:
        id v16 = [v11 decimalNumberBySubtracting:v14];
        int v17 = (void *)MEMORY[0x263F087B0];
        id v18 = @"3";
        goto LABEL_13;
      case 0xCuLL:
      case 0x10uLL:
      case 0x17uLL:
        id v16 = [v11 decimalNumberBySubtracting:v14];
        int v17 = (void *)MEMORY[0x263F087B0];
        id v18 = @"2";
LABEL_13:
        id v20 = [v17 decimalNumberWithString:v18];
        uint64_t v21 = [v16 decimalNumberByDividingBy:v20];
        uint64_t v22 = [v21 decimalNumberByAdding:v14];

        id v15 = v16;
        goto LABEL_14;
      case 0xDuLL:
        id v19 = v11;
        goto LABEL_19;
      default:
        if ([v12 compare:v15] != 1) {
          break;
        }
        id v19 = v12;
LABEL_19:
        uint64_t v22 = (uint64_t)v19;
LABEL_14:

        id v15 = (id)v22;
        break;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_filterSuggestions:(id)a3 belowThreshold:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "amount", (void)v18);
        if ([v14 compare:v6] == 1)
        {
        }
        else
        {
          id v15 = [v13 amount];
          uint64_t v16 = [v15 compare:v6];

          if (v16) {
            continue;
          }
        }
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

- (BOOL)_categoryIsPaymentPlan:(unint64_t)a3
{
  return (a3 < 0x1A) & (0x383FFC0u >> a3);
}

- (BOOL)_categoryIsCurrentBalanceType:(unint64_t)a3
{
  return a3 - 20 < 3;
}

- (BOOL)_fhEqualObjects:(id)a3 obj2:(id)a4
{
  if (a3 && a4) {
    return [a3 isEqual:a4];
  }
  else {
    return a3 == a4;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_previousSelectedSuggestion, 0);
}

@end