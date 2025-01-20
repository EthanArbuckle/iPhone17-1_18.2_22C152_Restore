@interface DDScannerResult(DDUIIOS)
- (BOOL)ddui_canBeCombinedToOthers;
- (uint64_t)ddui_isEquivalentToResult:()DDUIIOS;
@end

@implementation DDScannerResult(DDUIIOS)

- (BOOL)ddui_canBeCombinedToOthers
{
  return [a1 category] == 4;
}

- (uint64_t)ddui_isEquivalentToResult:()DDUIIOS
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [a1 type];
    v6 = [v4 type];
    int v7 = [v5 isEqualToString:v6];

    if (!v7)
    {
      uint64_t v13 = 0;
      goto LABEL_21;
    }
    v8 = [a1 value];
    v9 = [v8 lowercaseString];
    v10 = [v4 value];
    v11 = [v10 lowercaseString];
    char v12 = [v9 isEqual:v11];

    if (v12)
    {
      uint64_t v13 = 1;
LABEL_21:

      goto LABEL_22;
    }
    [a1 coreResult];
    if (DDResultHasType())
    {
      id v26 = 0;
      double v27 = 0.0;
      if (DDResultCurrencyExtraction())
      {
        uint64_t v24 = 0;
        double v25 = 0.0;
        [v4 coreResult];
        if (DDResultCurrencyExtraction())
        {
          if (v27 == v25)
          {
            uint64_t v14 = objc_msgSend(v26, "isEqualToString:", v24, v27);
LABEL_17:
            uint64_t v13 = v14;
LABEL_19:
            id v15 = 0;
LABEL_20:

            goto LABEL_21;
          }
        }
      }
    }
    else
    {
      if (!DDResultHasType())
      {
        id v23 = 0;
        uint64_t v13 = [a1 getPhoneValue:&v23 label:0];
        id v15 = v23;
        if (v13)
        {
          id v22 = 0;
          int v17 = [v4 getPhoneValue:&v22 label:0];
          id v18 = v22;
          v19 = v18;
          uint64_t v13 = 0;
          if (v17 && v18)
          {
            if (v15 == v18)
            {
              uint64_t v13 = 1;
            }
            else if ([v15 containsString:@"@"])
            {
              v20 = [v15 lowercaseString];
              v21 = [v19 lowercaseString];
              uint64_t v13 = [v20 isEqualToString:v21];
            }
            else
            {
              uint64_t v13 = +[DDContactUtils phoneNumber:v15 isEqualToPhoneNumber:v19];
            }
          }
        }
        goto LABEL_20;
      }
      id v26 = 0;
      double v27 = 0.0;
      if (DDResultPhysicalUnitsExtraction())
      {
        uint64_t v24 = 0;
        double v25 = 0.0;
        [v4 coreResult];
        if (DDResultPhysicalUnitsExtraction())
        {
          if (v27 == v25)
          {
            uint64_t v14 = objc_msgSend(v26, "isEqualToArray:", v24, v27);
            goto LABEL_17;
          }
        }
      }
    }
    uint64_t v13 = 0;
    goto LABEL_19;
  }
  uint64_t v13 = 0;
LABEL_22:

  return v13;
}

@end