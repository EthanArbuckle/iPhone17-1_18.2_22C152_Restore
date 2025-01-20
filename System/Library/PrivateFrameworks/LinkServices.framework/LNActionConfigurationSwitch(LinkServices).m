@interface LNActionConfigurationSwitch(LinkServices)
- (id)actionConfigurationByEvaluatingAction:()LinkServices context:;
- (id)valueForAction:()LinkServices context:;
- (uint64_t)actionConfigurationByEvaluatingAction:()LinkServices;
@end

@implementation LNActionConfigurationSwitch(LinkServices)

- (id)actionConfigurationByEvaluatingAction:()LinkServices context:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v34 = v6;
  v8 = [a1 valueForAction:v6 context:v7];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v9 = [a1 cases];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v40;
    id v31 = v7;
    v33 = v9;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v40 != v13) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v39 + 1) + 8 * v14);
      if (objc_msgSend(v15, "isDefaultCase", v31))
      {
        id v16 = v12;
        id v12 = v15;
      }
      else
      {
        v17 = [v15 value];
        v18 = [v17 value];

        if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          if (!v8)
          {
            v32 = [v15 value];
            if (!v32)
            {
LABEL_36:
              v18 = [v15 configuration];
              v27 = v34;
              id v7 = v31;
              v28 = [v18 actionConfigurationByEvaluatingAction:v34 context:v31];
LABEL_38:

              goto LABEL_39;
            }
          }
          v24 = [v15 value];
          int v25 = [v8 isEqual:v24];

          if (v8)
          {
            if (v25) {
              goto LABEL_36;
            }
          }
          else
          {

            if (v25) {
              goto LABEL_36;
            }
          }
          goto LABEL_30;
        }
        if ([v18 count]) {
          BOOL v19 = 0;
        }
        else {
          BOOL v19 = v8 == 0;
        }
        if (v19)
        {
          v29 = [v15 configuration];
          v27 = v34;
          id v7 = v31;
          v28 = [v29 actionConfigurationByEvaluatingAction:v34 context:v31];

          goto LABEL_38;
        }
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v16 = v18;
        uint64_t v20 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v36;
          while (2)
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v36 != v22) {
                objc_enumerationMutation(v16);
              }
              if ([v8 isEqual:*(void *)(*((void *)&v35 + 1) + 8 * i)])
              {
                v26 = [v15 configuration];
                v27 = v34;
                id v7 = v31;
                v28 = [v26 actionConfigurationByEvaluatingAction:v34 context:v31];

                v9 = v33;
                goto LABEL_39;
              }
            }
            uint64_t v21 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }

        v9 = v33;
      }

LABEL_30:
      if (++v14 == v11)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
        id v7 = v31;
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_35;
      }
    }
  }
  id v12 = 0;
LABEL_35:

  v9 = [v12 configuration];
  v27 = v34;
  v28 = [v9 actionConfigurationByEvaluatingAction:v34 context:v7];
LABEL_39:

  return v28;
}

- (id)valueForAction:()LinkServices context:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 parameterIdentifier];
  if ([v8 isEqualToString:*MEMORY[0x1E4F72540]])
  {
    v9 = [v7 widgetFamily];

    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F72718]);
      uint64_t v11 = [v7 widgetFamily];
      id v12 = [MEMORY[0x1E4F726D0] stringValueType];
      uint64_t v13 = (void *)[v10 initWithValue:v11 valueType:v12];

      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v14 = [v6 parameters];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__LNActionConfigurationSwitch_LinkServices__valueForAction_context___block_invoke;
  v17[3] = &unk_1E5B3A438;
  v17[4] = a1;
  v15 = objc_msgSend(v14, "if_firstObjectPassingTest:", v17);

  uint64_t v13 = [v15 value];

LABEL_6:
  return v13;
}

- (uint64_t)actionConfigurationByEvaluatingAction:()LinkServices
{
  return [a1 actionConfigurationByEvaluatingAction:a3 context:0];
}

@end