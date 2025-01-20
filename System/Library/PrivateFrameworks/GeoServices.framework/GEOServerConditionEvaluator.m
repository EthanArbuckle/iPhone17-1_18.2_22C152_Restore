@interface GEOServerConditionEvaluator
+ (BOOL)evaluateCondition:(id)a3;
+ (id)serverFormattedStringByEvaluatingConditionsInString:(id)a3;
@end

@implementation GEOServerConditionEvaluator

+ (BOOL)evaluateCondition:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_25:
    BOOL v8 = 0;
    goto LABEL_61;
  }
  uint64_t v6 = [v4 conditionType];
  switch(v6)
  {
    case 0:
      v7 = GEOGetStringConditionEvaluatorLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v23 = "-> FAIL, unknown condition type";
      goto LABEL_41;
    case 1:
    case 2:
    case 3:
      v7 = [v5 subconditions];
      if (![v7 count])
      {
        v22 = GEOGetStringConditionEvaluatorLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_DEBUG, "-> FAIL, no subconditions", buf, 2u);
        }
        BOOL v8 = 0;
        goto LABEL_59;
      }
      BOOL v8 = v6 != 2;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v35 = v7;
      v7 = v7;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (!v9) {
        goto LABEL_53;
      }
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(v7);
          }
          int v13 = [a1 evaluateCondition:*(void *)(*((void *)&v36 + 1) + 8 * i)];
          int v14 = v13;
          if (v6 == 2)
          {
            v15 = GEOGetStringConditionEvaluatorLog();
            BOOL v19 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
            if (!v14)
            {
              if (!v19) {
                goto LABEL_22;
              }
              *(_WORD *)buf = 0;
              v17 = v15;
              v18 = "-> CONTINUE evaluating, OR condition failed";
              goto LABEL_17;
            }
            if (v19)
            {
              *(_WORD *)buf = 0;
              v31 = "-> PASS due to successful OR condition";
LABEL_51:
              _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, v31, buf, 2u);
            }
LABEL_52:
            BOOL v8 = v6 == 2;

            goto LABEL_53;
          }
          if (v6 == 3)
          {
            v15 = GEOGetStringConditionEvaluatorLog();
            BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
            if (!v14)
            {
              if (!v16) {
                goto LABEL_22;
              }
              *(_WORD *)buf = 0;
              v17 = v15;
              v18 = "-> CONTINUE evaluating, NOT condition failed";
LABEL_17:
              _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_DEBUG, v18, buf, 2u);
              goto LABEL_22;
            }
            if (v16)
            {
              *(_WORD *)buf = 0;
              v31 = "-> FAIL due to successful NOT";
              goto LABEL_51;
            }
            goto LABEL_52;
          }
          char v20 = v8 & v13;
          v15 = GEOGetStringConditionEvaluatorLog();
          BOOL v21 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
          if ((v20 & 1) == 0)
          {
            if (v21)
            {
              *(_WORD *)buf = 0;
              v31 = "-> FAIL due to failed AND";
              goto LABEL_51;
            }
            goto LABEL_52;
          }
          if (v21)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "-> CONTINUE evaluating, AND condition passed", buf, 2u);
          }
          BOOL v8 = 1;
LABEL_22:
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v10) {
          continue;
        }
        break;
      }
LABEL_53:

      if ((unint64_t)[v7 count] < 2) {
        goto LABEL_60;
      }
      v22 = GEOGetStringConditionEvaluatorLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(double *)&uint64_t v32 = COERCE_DOUBLE([v7 count]);
        v33 = @"FAIL";
        if (v8) {
          v33 = @"PASS";
        }
        *(_DWORD *)buf = 134218242;
        double v41 = *(double *)&v32;
        __int16 v42 = 2112;
        v43 = v33;
        _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_DEBUG, "-> EVALUATED %lu subconditions, %@", buf, 0x16u);
      }
      v7 = v35;
LABEL_59:

LABEL_60:
LABEL_61:

      return v8;
    case 4:
      v24 = [v5 expirationDate];

      if (v24)
      {
        v25 = [v5 expirationDate];
        [v25 timeIntervalSinceNow];
        double v27 = v26;

        v7 = GEOGetStringConditionEvaluatorLog();
        BOOL v28 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
        if (v27 <= 0.0)
        {
          if (v28)
          {
            *(_DWORD *)buf = 134217984;
            double v41 = -v27;
            _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "-> PASS, expired %#.1lfs ago", buf, 0xCu);
          }
          BOOL v8 = 1;
          goto LABEL_60;
        }
        if (v28)
        {
          *(_DWORD *)buf = 134217984;
          double v41 = v27;
          v23 = "-> FAIL, expires in %#.1lfs";
          v29 = v7;
          uint32_t v30 = 12;
LABEL_42:
          _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_DEBUG, v23, buf, v30);
        }
      }
      else
      {
        v7 = GEOGetStringConditionEvaluatorLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v23 = "-> FAIL due to missing expiration date";
LABEL_41:
          v29 = v7;
          uint32_t v30 = 2;
          goto LABEL_42;
        }
      }
LABEL_43:
      BOOL v8 = 0;
      goto LABEL_60;
    case 5:
      v7 = GEOGetStringConditionEvaluatorLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v23 = "-> FAIL, TokenSubstitutionFailureFallback type must manually attempt to evaluate tokens to determine pass or fail";
      goto LABEL_41;
    default:
      goto LABEL_25;
  }
}

+ (id)serverFormattedStringByEvaluatingConditionsInString:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = GEOGetStringConditionEvaluatorLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v4 formatStrings];
    v7 = [v6 firstObject];
    int v18 = 138412290;
    BOOL v19 = v7;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Will evaluate string beginning \"%@\"", (uint8_t *)&v18, 0xCu);
  }
  BOOL v8 = [v4 alternativeString];

  if (v8
    && ([v4 alternativeString],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v9 condition],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [a1 evaluateCondition:v10],
        v10,
        v9,
        v11))
  {
    v12 = [v4 alternativeString];
    id v13 = [v12 formattedString];

    int v14 = GEOGetStringConditionEvaluatorLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = [v13 formatStrings];
      BOOL v16 = [v15 firstObject];
      int v18 = 138412290;
      BOOL v19 = v16;
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "-> Using alternative string beginning \"%@\"", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    id v13 = v4;
  }

  return v13;
}

@end