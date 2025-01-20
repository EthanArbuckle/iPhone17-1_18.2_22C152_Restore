@interface WFGetItemFromListAction
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFGetItemFromListAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  v67[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 numberOfItems];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = [(WFGetItemFromListAction *)self parameterValueForKey:@"WFItemSpecifier" ofClass:objc_opt_class()];
    if ([v9 isEqualToString:@"First Item"])
    {
      v10 = [(WFGetItemFromListAction *)self output];
      v11 = [v6 items];
      uint64_t v12 = [v11 firstObject];
LABEL_8:
      v13 = (void *)v12;
      [v10 addItem:v12];

      goto LABEL_9;
    }
    if ([v9 isEqualToString:@"Last Item"])
    {
      v10 = [(WFGetItemFromListAction *)self output];
      v11 = [v6 items];
      uint64_t v12 = [v11 lastObject];
      goto LABEL_8;
    }
    if ([v9 isEqualToString:@"Random Item"])
    {
      v10 = [(WFGetItemFromListAction *)self output];
      v11 = [v6 items];
      uint64_t v12 = [v11 objectAtIndex:arc4random_uniform(v8)];
      goto LABEL_8;
    }
    if ([v9 isEqualToString:@"Item At Index"])
    {
      v14 = [(WFGetItemFromListAction *)self parameterValueForKey:@"WFItemIndex" ofClass:objc_opt_class()];
      uint64_t v15 = [v14 integerValue];
      uint64_t v16 = v15;
      if (v14 && v15 > 0)
      {
        if (v15 <= v8)
        {
          v31 = [(WFGetItemFromListAction *)self output];
          v32 = [v6 items];
          v33 = [v32 objectAtIndex:v16 - 1];
          [v31 addItem:v33];
        }
        else
        {
          v17 = (void *)MEMORY[0x263F087E8];
          uint64_t v18 = *MEMORY[0x263F08438];
          uint64_t v64 = *MEMORY[0x263F08320];
          v19 = NSString;
          v20 = WFLocalizedString(@"The index you specified was outside of the possible range (you asked for item %1$d, and the list has only %2$d).");
          v21 = objc_msgSend(v19, "localizedStringWithFormat:", v20, v16, v8);
          v65 = v21;
          v22 = [NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
          *a4 = [v17 errorWithDomain:v18 code:33 userInfo:v22];
        }
      }
      else
      {
        v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v26 = *MEMORY[0x263F08438];
        uint64_t v66 = *MEMORY[0x263F08320];
        v27 = NSString;
        v28 = WFLocalizedString(@"You asked for item %d, but the first item is at index 1.");
        v29 = objc_msgSend(v27, "localizedStringWithFormat:", v28, v16);
        v67[0] = v29;
        v30 = [NSDictionary dictionaryWithObjects:v67 forKeys:&v66 count:1];
        *a4 = [v25 errorWithDomain:v26 code:33 userInfo:v30];
      }
      goto LABEL_9;
    }
    if (![v9 isEqualToString:@"Items in Range"])
    {
LABEL_9:

      goto LABEL_10;
    }
    v23 = [(WFGetItemFromListAction *)self parameterValueForKey:@"WFItemRangeStart" ofClass:objc_opt_class()];
    v57 = v23;
    if (v23) {
      uint64_t v24 = [v23 integerValue];
    }
    else {
      uint64_t v24 = 1;
    }
    v34 = [(WFGetItemFromListAction *)self parameterValueForKey:@"WFItemRangeEnd" ofClass:objc_opt_class()];
    v35 = v34;
    if (v34) {
      int64_t v36 = [v34 integerValue];
    }
    else {
      int64_t v36 = [v6 numberOfItems];
    }
    int64_t v37 = v36;
    if (v24 <= 0)
    {
      v55 = (void *)MEMORY[0x263F087E8];
      uint64_t v38 = *MEMORY[0x263F08438];
      uint64_t v62 = *MEMORY[0x263F08320];
      v45 = NSString;
      v40 = WFLocalizedString(@"The range you specified was outside of the possible range (you asked for items %1$d through %2$d, but the first item is at index 1).");
      v41 = objc_msgSend(v45, "stringWithFormat:", v40, v24, v37);
      v63 = v41;
      v42 = NSDictionary;
      v43 = &v63;
      v44 = &v62;
    }
    else
    {
      if (v36 >= v24)
      {
        if (v36 <= v8)
        {
          uint64_t v50 = v24 - 1;
          if (v24 - 1 < (unint64_t)v36)
          {
            do
            {
              v51 = [(WFGetItemFromListAction *)self output];
              v52 = [v6 items];
              v53 = [v52 objectAtIndex:v50];
              [v51 addItem:v53];

              ++v50;
            }
            while (v37 != v50);
          }
          goto LABEL_32;
        }
        v56 = (void *)MEMORY[0x263F087E8];
        uint64_t v54 = *MEMORY[0x263F08438];
        uint64_t v58 = *MEMORY[0x263F08320];
        v49 = NSString;
        v40 = WFLocalizedString(@"The range you specified was outside of the possible range (you asked for items %1$d through %2$d, and the list has only %3$d).");
        v41 = objc_msgSend(v49, "stringWithFormat:", v40, v24, v37, v8);
        v59 = v41;
        v46 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        uint64_t v48 = v54;
        v47 = v56;
LABEL_31:
        *a4 = [v47 errorWithDomain:v48 code:33 userInfo:v46];

LABEL_32:
        goto LABEL_9;
      }
      v55 = (void *)MEMORY[0x263F087E8];
      uint64_t v38 = *MEMORY[0x263F08438];
      uint64_t v60 = *MEMORY[0x263F08320];
      v39 = NSString;
      v40 = WFLocalizedString(@"The range you specified was invalid (you asked for items %1$d through %2$d).");
      v41 = objc_msgSend(v39, "stringWithFormat:", v40, v24, v37);
      v61 = v41;
      v42 = NSDictionary;
      v43 = &v61;
      v44 = &v60;
    }
    v46 = [v42 dictionaryWithObjects:v43 forKeys:v44 count:1];
    v47 = v55;
    uint64_t v48 = v38;
    goto LABEL_31;
  }
LABEL_10:
}

@end