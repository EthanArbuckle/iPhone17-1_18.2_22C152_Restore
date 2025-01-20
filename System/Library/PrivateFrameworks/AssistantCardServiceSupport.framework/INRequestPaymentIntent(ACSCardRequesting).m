@interface INRequestPaymentIntent(ACSCardRequesting)
- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting;
- (void)requestCard:()ACSCardRequesting reply:;
@end

@implementation INRequestPaymentIntent(ACSCardRequesting)

- (void)requestCard:()ACSCardRequesting reply:
{
  v72[1] = *MEMORY[0x263EF8340];
  v6 = a4;
  if (v6)
  {
    v7 = [a3 content];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v7 underlyingInteraction], (v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = v8;
      v10 = [v8 intentResponse];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [v9 intentResponse];
      }
      else
      {
        v11 = 0;
      }

      v15 = [v11 paymentRecord];
      v16 = [MEMORY[0x263EFF980] array];
      v64 = objc_msgSend(MEMORY[0x263F677D0], "acs_uniquelyIdentifiedCard");
      v17 = [v9 intent];
      int v18 = objc_msgSend(v17, "acs_needsTitleCardSection");

      v66 = v16;
      if (v18)
      {
        v19 = objc_msgSend(MEMORY[0x263F679F8], "acs_uniquelyIdentifiedCardSection");
        [v19 setIsCentered:1];
        [v19 setSeparatorStyle:5];
        unint64_t v20 = [v9 intentHandlingStatus];
        if (v20 <= 6)
        {
          if (v20 == 3)
          {
            v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v22 = v21;
            v23 = @"MONEY_REQUESTED";
          }
          else
          {
            v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v22 = v21;
            v23 = @"REQUEST_MONEY";
          }
          v24 = [v21 localizedStringForKey:v23 value:&stru_26D3AA9F8 table:0];
          [v19 setTitle:v24];

          v16 = v66;
        }
        [v16 addObject:v19];
      }
      v65 = v11;
      v25 = objc_msgSend(MEMORY[0x263F67980], "acs_wildCardSection");
      [v16 addObject:v25];

      uint64_t v26 = [a1 payer];
      if (v26)
      {
        v27 = (void *)v26;
        v28 = [a1 currencyAmount];

        if (v28)
        {
          v29 = objc_msgSend(MEMORY[0x263F679F8], "acs_uniquelyIdentifiedCardSection");
          v30 = [a1 payer];
          v31 = [v30 image];

          if (v31)
          {
            id v32 = objc_alloc(MEMORY[0x263F10340]);
            v33 = [a1 payer];
            v34 = [v33 image];
            v35 = (void *)[v32 initWithIntentsImage:v34];

            [v29 setTitleImage:v35];
          }
          [v29 setIsCentered:1];
          v36 = [a1 payer];
          v37 = [v36 displayName];
          [v29 setTitle:v37];

          v38 = [a1 currencyAmount];
          v63 = objc_msgSend(v38, "acs_formattedAmountString");

          [v29 setSubtitle:v63];
          [v29 setSeparatorStyle:5];
          v39 = NSStringFromSelector(sel_payer);
          v70[0] = v39;
          v40 = NSStringFromSelector(sel_displayName);
          v70[1] = v40;
          v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:2];
          +[ACSCardServiceHelper addParameterToSection:v29 selectorStrings:v41 class:objc_opt_class()];

          v42 = NSStringFromSelector(sel_currencyAmount);
          v69 = v42;
          v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v69 count:1];
          +[ACSCardServiceHelper addParameterToSection:v29 selectorStrings:v43 class:objc_opt_class()];

          v16 = v66;
          [v66 addObject:v29];
        }
      }
      v44 = [a1 note];
      uint64_t v45 = [v44 length];

      if (v45)
      {
        v46 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v47 = [v46 localizedStringForKey:@"NOTE" value:&stru_26D3AA9F8 table:0];
        v48 = [a1 note];
        v49 = +[ACSCardServiceHelper rowCardSectionFromLeadingText:v47 trailingText:v48];

        v16 = v66;
        v50 = NSStringFromSelector(sel_note);
        v68 = v50;
        v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v68 count:1];
        +[ACSCardServiceHelper addParameterToSection:v49 selectorStrings:v51 class:objc_opt_class()];

        [v66 addObject:v49];
      }
      v52 = [v15 feeAmount];

      unint64_t v53 = 0x263EFF000;
      if (v52)
      {
        v54 = [v15 feeAmount];
        v55 = objc_msgSend(v54, "acs_formattedAmountString");

        v56 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v57 = [v56 localizedStringForKey:@"FEE" value:&stru_26D3AA9F8 table:0];
        v58 = +[ACSCardServiceHelper rowCardSectionFromLeadingText:v57 trailingText:v55];

        v59 = NSStringFromSelector(sel_paymentRecord);
        v67[0] = v59;
        v60 = NSStringFromSelector(sel_feeAmount);
        v67[1] = v60;
        v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:2];
        +[ACSCardServiceHelper addParameterToSection:v58 selectorStrings:v61 class:objc_opt_class()];

        v16 = v66;
        [v66 addObject:v58];

        unint64_t v53 = 0x263EFF000uLL;
      }
      v62 = [*(id *)(v53 + 2240) arrayWithArray:v16];
      [v64 setCardSections:v62];

      objc_msgSend(v64, "acs_setInteraction:", v9);
      v6[2](v6, v64, 0);

      v14 = v65;
    }
    else
    {
      v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F31628];
      uint64_t v71 = *MEMORY[0x263F07F80];
      v9 = [NSString stringWithFormat:@"Content %@ is incompatible with this service", v7];
      v72[0] = v9;
      v14 = [NSDictionary dictionaryWithObjects:v72 forKeys:&v71 count:1];
      v15 = [v12 errorWithDomain:v13 code:400 userInfo:v14];
      ((void (**)(id, void *, void *))v6)[2](v6, 0, v15);
    }
  }
}

- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting
{
  return 2;
}

@end