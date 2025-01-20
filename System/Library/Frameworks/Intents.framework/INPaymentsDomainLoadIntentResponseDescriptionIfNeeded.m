@interface INPaymentsDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INPaymentsDomainLoadIntentResponseDescriptionIfNeeded

void ___INPaymentsDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v78[6] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v66 = [[INIntentSlotDescription alloc] initWithName:@"fromAccount" tag:2 facadePropertyName:@"fromAccount" dataPropertyName:@"fromAccount" isExtended:0 isPrivate:0 valueType:61 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v77[0] = v66;
  v65 = [[INIntentSlotDescription alloc] initWithName:@"billDetails" tag:4 facadePropertyName:@"billDetails" dataPropertyName:@"billDetails" isExtended:0 isPrivate:0 valueType:60 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v77[1] = v65;
  v64 = [[INIntentSlotDescription alloc] initWithName:@"transactionAmount" tag:5 facadePropertyName:@"transactionAmount" dataPropertyName:@"transactionAmount" isExtended:0 isPrivate:0 valueType:62 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v77[2] = v64;
  v63 = [[INIntentSlotDescription alloc] initWithName:@"transactionScheduledDate" tag:6 facadePropertyName:@"transactionScheduledDate" dataPropertyName:@"transactionScheduledDate" isExtended:0 isPrivate:0 valueType:16 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v77[3] = v63;
  v62 = [[INIntentSlotDescription alloc] initWithName:@"transactionNote" tag:7 facadePropertyName:@"transactionNote" dataPropertyName:@"transactionNote" isExtended:0 isPrivate:0 valueType:30 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v77[4] = v62;
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:5];
  v60 = _INIntentSchemaBuildIntentSlotDescriptionMap(v61);
  v59 = [(INIntentResponseDescription *)v0 initWithName:@"PayBillIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.payments.PayBillIntentResponse" isPrivate:0 slotsByName:v60];
  v78[0] = v59;
  v3 = [INIntentResponseDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v58 = [[INIntentSlotDescription alloc] initWithName:@"paymentRecord" tag:1 facadePropertyName:@"paymentRecord" dataPropertyName:@"paymentRecord" isExtended:0 isPrivate:0 valueType:56 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v76 = v58;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
  v56 = _INIntentSchemaBuildIntentSlotDescriptionMap(v57);
  v55 = [(INIntentResponseDescription *)v3 initWithName:@"RequestPaymentIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.payments.RequestPaymentIntentResponse" isPrivate:0 slotsByName:v56];
  v78[1] = v55;
  v6 = [INIntentResponseDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v54 = [[INIntentSlotDescription alloc] initWithName:@"accounts" tag:2 facadePropertyName:@"accounts" dataPropertyName:@"accounts" isExtended:0 isPrivate:0 valueType:61 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75 = v54;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
  v52 = _INIntentSchemaBuildIntentSlotDescriptionMap(v53);
  v51 = [(INIntentResponseDescription *)v6 initWithName:@"SearchForAccountsIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.payments.SearchForAccountsIntentResponse" isPrivate:0 slotsByName:v52];
  v78[2] = v51;
  v9 = [INIntentResponseDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v50 = [[INIntentSlotDescription alloc] initWithName:@"bills" tag:2 facadePropertyName:@"bills" dataPropertyName:@"bills" isExtended:0 isPrivate:0 valueType:60 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v74 = v50;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
  v48 = _INIntentSchemaBuildIntentSlotDescriptionMap(v49);
  v47 = [(INIntentResponseDescription *)v9 initWithName:@"SearchForBillsIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.payments.SearchForBillsIntentResponse" isPrivate:0 slotsByName:v48];
  v78[3] = v47;
  v12 = [INIntentResponseDescription alloc];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v46 = [[INIntentSlotDescription alloc] initWithName:@"paymentRecord" tag:1 facadePropertyName:@"paymentRecord" dataPropertyName:@"paymentRecord" isExtended:0 isPrivate:0 valueType:56 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v73 = v46;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
  v44 = _INIntentSchemaBuildIntentSlotDescriptionMap(v45);
  v43 = [(INIntentResponseDescription *)v12 initWithName:@"SendPaymentIntentResponse" facadeClass:v13 dataClass:v14 type:@"sirikit.intent.payments.SendPaymentIntentResponse" isPrivate:0 slotsByName:v44];
  v78[4] = v43;
  v42 = [INIntentResponseDescription alloc];
  uint64_t v41 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = [[INIntentSlotDescription alloc] initWithName:@"fromAccount" tag:2 facadePropertyName:@"fromAccount" dataPropertyName:@"fromAccount" isExtended:0 isPrivate:0 valueType:61 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v72[0] = v16;
  v17 = [[INIntentSlotDescription alloc] initWithName:@"toAccount" tag:4 facadePropertyName:@"toAccount" dataPropertyName:@"toAccount" isExtended:0 isPrivate:0 valueType:61 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v72[1] = v17;
  v18 = [[INIntentSlotDescription alloc] initWithName:@"transactionAmount" tag:5 facadePropertyName:@"transactionAmount" dataPropertyName:@"transactionAmount" isExtended:0 isPrivate:0 valueType:62 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v72[2] = v18;
  v19 = [[INIntentSlotDescription alloc] initWithName:@"transactionScheduledDate" tag:6 facadePropertyName:@"transactionScheduledDate" dataPropertyName:@"transactionScheduledDate" isExtended:0 isPrivate:0 valueType:16 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v72[3] = v19;
  v20 = [[INIntentSlotDescription alloc] initWithName:@"transactionNote" tag:7 facadePropertyName:@"transactionNote" dataPropertyName:@"transactionNote" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v72[4] = v20;
  v21 = [[INIntentSlotDescription alloc] initWithName:@"transferFee" tag:8 facadePropertyName:@"transferFee" dataPropertyName:@"transferFee" isExtended:0 isPrivate:0 valueType:53 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v72[5] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:6];
  v23 = _INIntentSchemaBuildIntentSlotDescriptionMap(v22);
  v24 = [(INIntentResponseDescription *)v42 initWithName:@"TransferMoneyIntentResponse" facadeClass:v41 dataClass:v15 type:@"sirikit.intent.payments.TransferMoneyIntentResponse" isPrivate:0 slotsByName:v23];
  v78[5] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:6];

  uint64_t v26 = [v25 count];
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v26];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v26];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v29 = v25;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v68 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        v35 = [v34 name];
        [v27 setObject:v34 forKey:v35];

        v36 = [v34 type];
        [v28 setObject:v34 forKey:v36];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v67 objects:v71 count:16];
    }
    while (v31);
  }

  uint64_t v37 = [v27 copy];
  v38 = (void *)sPaymentsDomain_intentResponseDescsByName;
  sPaymentsDomain_intentResponseDescsByName = v37;

  uint64_t v39 = [v28 copy];
  v40 = (void *)sPaymentsDomain_intentResponseDescsByType;
  sPaymentsDomain_intentResponseDescsByType = v39;
}

@end