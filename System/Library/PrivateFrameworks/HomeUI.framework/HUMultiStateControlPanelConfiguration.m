@interface HUMultiStateControlPanelConfiguration
- (Class)cellClass;
- (HUControlPanelRule)rule;
- (void)setupControlsForCell:(id)a3 item:(id)a4;
@end

@implementation HUMultiStateControlPanelConfiguration

- (HUControlPanelRule)rule
{
  uint64_t v2 = objc_opt_class();

  return (HUControlPanelRule *)+[HUControlPanelClassRule ruleWithControlItemClass:v2];
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)setupControlsForCell:(id)a3 item:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  id v8 = v5;
  if (!v8) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;
  id v11 = v8;
  if (!v10)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v7, objc_opt_class() file lineNumber description];

LABEL_7:
    id v11 = 0;
  }
  v40 = v11;

  uint64_t v14 = objc_opt_class();
  v15 = [v6 controlItems];
  id v16 = [v15 anyObject];
  v41 = v8;
  if (!v16)
  {
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  v18 = v16;
  if (!v17)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v19 handleFailureInFunction:v20, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v14, objc_opt_class() file lineNumber description];

    goto LABEL_14;
  }
LABEL_15:

  v21 = objc_alloc_init(HUMultiStateControlView);
  v42 = v6;
  v22 = v6;
  v23 = v21;
  v24 = [v22 identifierForControlItem:v18];
  [(HUMultiStateControlView *)v23 setIdentifier:v24];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v25 = [v18 possibleValueSet];
  v26 = [v25 sortedValues];

  id obj = v26;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v46 = *(void *)v48;
    uint64_t v29 = *MEMORY[0x1E4F68AB8];
    uint64_t v30 = *MEMORY[0x1E4F689E8];
    v43 = v18;
    v44 = v23;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v48 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        v33 = [v18 possibleValueSet];
        v34 = [v33 displayResultsForValue:v32];

        v35 = [v34 objectForKeyedSubscript:v29];
        uint64_t v36 = [v34 objectForKeyedSubscript:v30];
        v37 = (void *)v36;
        if (v35)
        {
          [(HUMultiStateControlView *)v23 addPossibleValue:v32 withTitle:v35];
        }
        else if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v38 = [v37 imageIdentifier];
          v39 = HUImageNamed(v38);
          if (v39) {
            [(HUMultiStateControlView *)v44 addPossibleValue:v32 withImage:v39];
          }
          else {
            NSLog(&cfstr_MultiStateCont.isa, v43, v32);
          }

          v18 = v43;
          v23 = v44;
        }
        else
        {
          NSLog(&cfstr_MultiStateCont_0.isa, v18, v32);
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v28);
  }

  [v40 setControlView:v23];
}

@end