@interface LNActionConfigurationWhen(LinkServices)
- (id)actionConfigurationByEvaluatingAction:()LinkServices context:;
- (id)valueForAction:()LinkServices context:;
- (uint64_t)actionConfigurationByEvaluatingAction:()LinkServices;
@end

@implementation LNActionConfigurationWhen(LinkServices)

- (id)valueForAction:()LinkServices context:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 condition];
  v9 = [v8 parameterIdentifier];
  if ([v9 isEqualToString:*MEMORY[0x1E4F72540]])
  {
    v10 = [v7 widgetFamily];

    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F72718]);
      v12 = [v7 widgetFamily];
      v13 = [MEMORY[0x1E4F726D0] stringValueType];
      v14 = (void *)[v11 initWithValue:v12 valueType:v13];

      goto LABEL_25;
    }
  }
  else
  {
  }
  v15 = [v6 parameters];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __66__LNActionConfigurationWhen_LinkServices__valueForAction_context___block_invoke;
  v45[3] = &unk_1E5B3A438;
  v45[4] = a1;
  v16 = objc_msgSend(v15, "if_firstObjectPassingTest:", v45);

  v14 = [v16 value];
  if (v16)
  {
    id v44 = v6;
    v17 = [v16 value];
    v18 = [v17 valueType];
    v19 = [a1 condition];
    v20 = [v19 value];
    v21 = [v20 valueType];
    char v22 = [v18 isEqual:v21];

    if (v22)
    {
      id v6 = v44;
    }
    else
    {
      v23 = [v16 value];
      v24 = [v23 value];

      if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v25 = [a1 condition];
        v26 = [v25 value];
        v27 = [v26 valueType];

        if (v27)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v28 = v27;
          }
          else {
            v28 = 0;
          }
        }
        else
        {
          v28 = 0;
        }
        id v29 = v28;

        v30 = [v29 memberValueType];

        if (v30)
        {
          id v31 = v30;
        }
        else
        {
          v32 = [a1 condition];
          v33 = [v32 value];
          id v31 = [v33 valueType];
        }
        v34 = [MEMORY[0x1E4F726D0] intValueType];
        int v35 = [v31 isEqual:v34];

        id v36 = objc_alloc(MEMORY[0x1E4F72718]);
        if (v35)
        {
          v37 = (void *)MEMORY[0x1E4F28ED0];
          v38 = [v24 identifier];
          v39 = [v38 instanceIdentifier];
          v40 = objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v39, "integerValue"));
          uint64_t v41 = [MEMORY[0x1E4F726D0] intValueType];
          uint64_t v42 = [v36 initWithValue:v40 valueType:v41];

          v14 = (void *)v41;
        }
        else
        {
          v38 = [v24 identifier];
          v39 = [v38 instanceIdentifier];
          v40 = [MEMORY[0x1E4F726D0] stringValueType];
          uint64_t v42 = [v36 initWithValue:v39 valueType:v40];
        }
        id v6 = v44;

        v14 = (void *)v42;
      }
      else
      {
        id v6 = v44;
      }
    }
  }

LABEL_25:
  return v14;
}

- (id)actionConfigurationByEvaluatingAction:()LinkServices context:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 valueForAction:v6 context:v7];
  v9 = [a1 condition];
  uint64_t v10 = [v9 comparisonOperator];

  switch(v10)
  {
    case 0:
      if (v8) {
        goto LABEL_51;
      }
      goto LABEL_34;
    case 1:
      id v11 = [a1 condition];
      v12 = [v11 value];
      if (![v8 isEqual:v12]) {
        goto LABEL_27;
      }
      goto LABEL_24;
    case 2:
      id v11 = [a1 condition];
      v12 = [v11 value];
      if ([v8 isEqual:v12]) {
        goto LABEL_27;
      }
      goto LABEL_24;
    case 3:
      if (!v8) {
        goto LABEL_51;
      }
      id v11 = [a1 condition];
      v12 = [v11 value];
      if ([v8 compare:v12] == -1) {
        goto LABEL_27;
      }
LABEL_24:
      uint64_t v18 = [a1 otherwise];
      goto LABEL_28;
    case 4:
      if (!v8) {
        goto LABEL_51;
      }
      id v11 = [a1 condition];
      v12 = [v11 value];
      if ([v8 compare:v12] == -1) {
        goto LABEL_27;
      }
      goto LABEL_43;
    case 5:
      id v11 = [a1 condition];
      v12 = [v11 value];
      if ([v8 compare:v12] != 1) {
        goto LABEL_24;
      }
      goto LABEL_27;
    case 6:
      if (!v8) {
        goto LABEL_34;
      }
      id v11 = [a1 condition];
      v12 = [v11 value];
      if ([v8 compare:v12] == 1)
      {
LABEL_27:
        uint64_t v18 = [a1 when];
LABEL_28:
        v17 = (void *)v18;
      }
      else
      {
LABEL_43:
        v28 = [a1 condition];
        id v29 = [v28 value];
        if ([v8 compare:v29]) {
          [a1 otherwise];
        }
        else {
        v17 = [a1 when];
        }

LABEL_61:
      }

LABEL_63:
      v39 = [v17 actionConfigurationByEvaluatingAction:v6 context:v7];

      return v39;
    case 7:
      v19 = [a1 condition];
      v20 = [v19 value];
      v21 = [v20 value];

      if (v21)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          char v22 = v21;
        }
        else {
          char v22 = 0;
        }
      }
      else
      {
        char v22 = 0;
      }
      id v32 = v22;

      char v33 = [v32 containsObject:v8];
      if (v33) {
        goto LABEL_51;
      }
      goto LABEL_34;
    case 8:
      if (v8)
      {
LABEL_34:
        uint64_t v23 = [a1 otherwise];
      }
      else
      {
LABEL_51:
        uint64_t v23 = [a1 when];
      }
      v17 = (void *)v23;
      goto LABEL_63;
    case 9:
      v24 = [v8 value];
      if (v24)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v25 = v24;
        }
        else {
          v25 = 0;
        }
      }
      else
      {
        v25 = 0;
      }
      id v34 = v25;

      id v11 = [a1 condition];
      v12 = [v11 value];
      v28 = [v12 value];
      int v35 = [v34 containsString:v28];

      id v36 = a1;
      if (!v35) {
        goto LABEL_55;
      }
      goto LABEL_59;
    case 10:
      v26 = [v8 value];
      if (v26)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v27 = v26;
        }
        else {
          v27 = 0;
        }
      }
      else
      {
        v27 = 0;
      }
      id v30 = v27;

      id v11 = [a1 condition];
      v12 = [v11 value];
      v28 = [v12 value];
      char v31 = [v30 containsString:v28];
      goto LABEL_58;
    case 11:
      v13 = [v8 value];
      if (v13)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v14 = v13;
        }
        else {
          v14 = 0;
        }
      }
      else
      {
        v14 = 0;
      }
      id v30 = v14;

      id v11 = [a1 condition];
      v12 = [v11 value];
      v28 = [v12 value];
      char v31 = [v30 hasPrefix:v28];
      goto LABEL_58;
    case 12:
      v15 = [v8 value];
      if (v15)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v16 = v15;
        }
        else {
          v16 = 0;
        }
      }
      else
      {
        v16 = 0;
      }
      id v30 = v16;

      id v11 = [a1 condition];
      v12 = [v11 value];
      v28 = [v12 value];
      char v31 = [v30 hasSuffix:v28];
LABEL_58:
      char v38 = v31;

      id v36 = a1;
      if (v38)
      {
LABEL_55:
        uint64_t v37 = [v36 when];
      }
      else
      {
LABEL_59:
        uint64_t v37 = [v36 otherwise];
      }
      v17 = (void *)v37;
      goto LABEL_61;
    default:
      v17 = 0;
      goto LABEL_63;
  }
}

- (uint64_t)actionConfigurationByEvaluatingAction:()LinkServices
{
  return [a1 actionConfigurationByEvaluatingAction:a3 context:0];
}

@end