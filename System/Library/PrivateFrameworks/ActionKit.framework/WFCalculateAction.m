@interface WFCalculateAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFCalculateAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__WFCalculateAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_264E5B1D8;
  v4[4] = self;
  id v3 = a3;
  [v3 getObjectRepresentation:v4 forClass:objc_opt_class()];
}

void __48__WFCalculateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v70 = a3;
  id v71 = a4;
  if (v7)
  {
    v8 = [*(id *)(a1 + 32) parameterValueForKey:@"WFMathOperation" ofClass:objc_opt_class()];
    v69 = [*(id *)(a1 + 32) parameterValueForKey:@"WFScientificMathOperation" ofClass:objc_opt_class()];
    uint64_t v9 = [*(id *)(a1 + 32) parameterValueForKey:@"WFMathOperand" ofClass:objc_opt_class()];
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (void *)MEMORY[0x263F087B0];
    }
    else
    {
      v12 = NSNumber;
      v13 = [*(id *)(a1 + 32) parameterForKey:@"WFMathOperand"];
      v14 = [v13 localizedPlaceholder];
      [v14 doubleValue];
      v10 = objc_msgSend(v12, "numberWithDouble:");

      v11 = (void *)MEMORY[0x263F087B0];
      if (!v10)
      {
        v72[0] = 0;
        v72[1] = 0;
        int v73 = 0;
LABEL_7:
        v15 = [v11 decimalNumberWithDecimal:v72];
        v16 = [*(id *)(a1 + 32) parameterValueForKey:@"WFScientificMathOperand" ofClass:objc_opt_class()];
        if (!v16)
        {
          v17 = NSNumber;
          v18 = [*(id *)(a1 + 32) parameterForKey:@"WFScientificMathOperand"];
          v19 = [v18 localizedPlaceholder];
          [v19 doubleValue];
          uint64_t v20 = objc_msgSend(v17, "numberWithDouble:");

          v16 = (void *)v20;
        }
        if ([v8 isEqualToString:@"+"])
        {
          v21 = [*(id *)(a1 + 32) output];
          v22 = [v7 decimalNumberByAdding:v15];
          [v21 addObject:v22];
LABEL_17:

LABEL_18:
          [*(id *)(a1 + 32) finishRunningWithError:0];

          goto LABEL_19;
        }
        if ([v8 isEqualToString:@"-"])
        {
          v21 = [*(id *)(a1 + 32) output];
          v22 = [v7 decimalNumberBySubtracting:v15];
          [v21 addObject:v22];
          goto LABEL_17;
        }
        if (([v8 isEqualToString:@"×"] & 1) != 0
          || ([v8 isEqualToString:@"*"] & 1) != 0
          || [v8 isEqualToString:@"x"])
        {
          v21 = [*(id *)(a1 + 32) output];
          v22 = [v7 decimalNumberByMultiplyingBy:v15];
          [v21 addObject:v22];
          goto LABEL_17;
        }
        if (([v8 isEqualToString:@"÷"] & 1) != 0
          || [v8 isEqualToString:@"/"])
        {
          v21 = [*(id *)(a1 + 32) output];
          v22 = [v7 decimalNumberByDividingBy:v15];
          [v21 addObject:v22];
          goto LABEL_17;
        }
        if ([v69 isEqualToString:@"Modulus"])
        {
          v23 = [v7 stringValue];
          v24 = [v23 stringByAppendingString:@" mod "];
          v25 = [v16 stringValue];
          v26 = [v24 stringByAppendingString:v25];

          double Helper_x8__OBJC_CLASS___Calculate = gotLoadHelper_x8__OBJC_CLASS___Calculate(v27);
          v30 = objc_msgSend(*(id *)(v29 + 3336), "evaluate:options:", v26, MEMORY[0x263EFFA78], Helper_x8__OBJC_CLASS___Calculate);
          v68 = [v30 terms];
          v31 = [v68 firstObject];
          uint64_t v32 = [v31 value];

          v33 = (void *)v32;
          if (v32)
          {
            v34 = [*(id *)(a1 + 32) output];
            [v34 addObject:v33];
          }
          goto LABEL_47;
        }
        if ([v69 isEqualToString:@"x^2"])
        {
          v26 = [*(id *)(a1 + 32) output];
          v35 = [v7 decimalNumberByRaisingToPower:2];
          [v26 addObject:v35];
        }
        else if ([v69 isEqualToString:@"x^3"])
        {
          v26 = [*(id *)(a1 + 32) output];
          v35 = [v7 decimalNumberByRaisingToPower:3];
          [v26 addObject:v35];
        }
        else if ([v69 isEqualToString:@"x^y"])
        {
          v26 = [*(id *)(a1 + 32) output];
          v36 = NSNumber;
          [v7 doubleValue];
          long double v38 = v37;
          [v16 doubleValue];
          v35 = objc_msgSend(v36, "numberWithDouble:", (double)pow(v38, v39));
          [v26 addObject:v35];
        }
        else if ([v69 isEqualToString:@"e^x"])
        {
          v26 = [*(id *)(a1 + 32) output];
          v40 = NSNumber;
          [v7 doubleValue];
          v35 = [v40 numberWithDouble:(double)exp(v41)];
          [v26 addObject:v35];
        }
        else if ([v69 isEqualToString:@"10^x"])
        {
          v26 = [*(id *)(a1 + 32) output];
          v42 = NSNumber;
          [v7 doubleValue];
          v35 = [v42 numberWithDouble:__exp10(v43)];
          [v26 addObject:v35];
        }
        else if ([v69 isEqualToString:@"ln(x)"])
        {
          v26 = [*(id *)(a1 + 32) output];
          v44 = NSNumber;
          [v7 doubleValue];
          v35 = [v44 numberWithDouble:(double)log(v45)];
          [v26 addObject:v35];
        }
        else
        {
          v66 = v16;
          v67 = v15;
          if ([v69 isEqualToString:@"log(x)"])
          {
            v26 = [*(id *)(a1 + 32) output];
            v46 = NSNumber;
            [v7 doubleValue];
            v35 = [v46 numberWithDouble:(double)log10(v47)];
            [v26 addObject:v35];
          }
          else if ([v69 isEqualToString:@"√x"])
          {
            v26 = [*(id *)(a1 + 32) output];
            v48 = NSNumber;
            [v7 doubleValue];
            v35 = [v48 numberWithDouble:sqrt(v49)];
            [v26 addObject:v35];
          }
          else
          {
            if (![v69 isEqualToString:@"∛x"])
            {
              if ([v69 isEqualToString:@"x!"])
              {
                v52 = [MEMORY[0x263F087B0] one];
                for (id i = v7; (int)[i intValue] > 1; id i = (id)v56)
                {
                  uint64_t v54 = [v52 decimalNumberByMultiplyingBy:i];

                  v55 = [MEMORY[0x263F087B0] one];
                  uint64_t v56 = [i decimalNumberBySubtracting:v55];

                  v52 = (void *)v54;
                }

                v59 = [*(id *)(a1 + 32) output];
                [v59 addObject:v52];
              }
              else
              {
                if ([v69 isEqualToString:@"sin(x)"])
                {
                  v26 = [*(id *)(a1 + 32) output];
                  v57 = NSNumber;
                  [v7 doubleValue];
                  v35 = [v57 numberWithDouble:(double)sin(v58)];
                  [v26 addObject:v35];
                  goto LABEL_46;
                }
                if ([v69 isEqualToString:@"cos(x)"])
                {
                  v26 = [*(id *)(a1 + 32) output];
                  v60 = NSNumber;
                  [v7 doubleValue];
                  v35 = [v60 numberWithDouble:(double)cos(v61)];
                  [v26 addObject:v35];
                  goto LABEL_46;
                }
                if ([v69 isEqualToString:@"tan(x)"])
                {
                  v26 = [*(id *)(a1 + 32) output];
                  v62 = NSNumber;
                  [v7 doubleValue];
                  v35 = [v62 numberWithDouble:(double)tan(v63)];
                  [v26 addObject:v35];
                  goto LABEL_46;
                }
                if ([v69 isEqualToString:@"abs(x)"])
                {
                  v26 = [*(id *)(a1 + 32) output];
                  v64 = NSNumber;
                  [v7 doubleValue];
                  v35 = [v64 numberWithDouble:fabs(v65)];
                  [v26 addObject:v35];
                  goto LABEL_46;
                }
              }
              v16 = v66;
              v15 = v67;
              goto LABEL_18;
            }
            v26 = [*(id *)(a1 + 32) output];
            v50 = NSNumber;
            [v7 doubleValue];
            v35 = [v50 numberWithDouble:(double)cbrt(v51)];
            [v26 addObject:v35];
          }
        }
LABEL_46:

LABEL_47:
        goto LABEL_18;
      }
    }
    [v10 decimalValue];
    goto LABEL_7;
  }
  [*(id *)(a1 + 32) finishRunningWithError:v71];
LABEL_19:
}

@end