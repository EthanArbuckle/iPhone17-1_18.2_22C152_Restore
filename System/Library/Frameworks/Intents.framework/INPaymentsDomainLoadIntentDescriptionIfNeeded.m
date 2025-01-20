@interface INPaymentsDomainLoadIntentDescriptionIfNeeded
@end

@implementation INPaymentsDomainLoadIntentDescriptionIfNeeded

void ___INPaymentsDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v90[6] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v78 = [[INIntentSlotDescription alloc] initWithName:@"billPayee", 2, @"billPayee", @"billPayee", 0, 0, 59, 1, &unk_1EDBA9960, &unk_1EDBA9978, objc_opt_class(), sel_resolveBillPayeeForPayBill_withCompletion_, sel_resolveBillPayeeForPayBill_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v89[0] = v78;
  v77 = [[INIntentSlotDescription alloc] initWithName:@"fromAccount", 4, @"fromAccount", @"fromAccount", 0, 0, 61, 1, &unk_1EDBA9990, &unk_1EDBA99A8, objc_opt_class(), sel_resolveFromAccountForPayBill_withCompletion_, sel_resolveFromAccountForPayBill_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v89[1] = v77;
  v76 = [[INIntentSlotDescription alloc] initWithName:@"transactionAmount", 5, @"transactionAmount", @"transactionAmount", 0, 0, 62, 1, &unk_1EDBA99C0, &unk_1EDBA99D8, objc_opt_class(), sel_resolveTransactionAmountForPayBill_withCompletion_, sel_resolveTransactionAmountForPayBill_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v89[2] = v76;
  v75 = [[INIntentSlotDescription alloc] initWithName:@"transactionScheduledDate", 6, @"transactionScheduledDate", @"transactionScheduledDate", 0, 0, 16, 1, &unk_1EDBA99F0, &unk_1EDBA9A08, objc_opt_class(), sel_resolveTransactionScheduledDateForPayBill_withCompletion_, sel_resolveTransactionScheduledDateForPayBill_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v89[3] = v75;
  v74 = [[INIntentSlotDescription alloc] initWithName:@"transactionNote", 7, @"transactionNote", @"transactionNote", 0, 0, 30, 1, &unk_1EDBA9A20, &unk_1EDBA9A38, objc_opt_class(), sel_resolveTransactionNoteForPayBill_withCompletion_, sel_resolveTransactionNoteForPayBill_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v89[4] = v74;
  v73 = [[INIntentSlotDescription alloc] initWithName:@"billType", 8, @"billType", @"billType", 0, 0, 57, 1, &unk_1EDBA9A50, &unk_1EDBA9A68, objc_opt_class(), sel_resolveBillTypeForPayBill_withCompletion_, sel_resolveBillTypeForPayBill_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v89[5] = v73;
  v72 = [[INIntentSlotDescription alloc] initWithName:@"dueDate", 9, @"dueDate", @"dueDate", 0, 0, 16, 1, &unk_1EDBA9A80, &unk_1EDBA9A98, objc_opt_class(), sel_resolveDueDateForPayBill_withCompletion_, sel_resolveDueDateForPayBill_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v89[6] = v72;
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:7];
  v70 = _INIntentSchemaBuildIntentSlotDescriptionMap(v71);
  v69 = [(INIntentDescription *)v0 initWithName:@"PayBillIntent" responseName:@"PayBillIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.payments.PayBillIntent" isPrivate:0 handleSelector:sel_handlePayBill_completion_ confirmSelector:sel_confirmPayBill_completion_ slotsByName:v70];
  v90[0] = v69;
  v3 = [INIntentDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v68 = [[INIntentSlotDescription alloc] initWithName:@"payer", 2, @"payer", @"payer", 0, 0, 10, 1, &unk_1EDBA9AB0, &unk_1EDBA9AC8, objc_opt_class(), sel_resolvePayerForRequestPayment_completion_, sel_resolvePayerForRequestPayment_withCompletion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v88[0] = v68;
  v67 = [[INIntentSlotDescription alloc] initWithName:@"currencyAmount", 3, @"currencyAmount", @"currencyAmount", 0, 0, 53, 1, &unk_1EDBA9AE0, &unk_1EDBA9AF8, objc_opt_class(), sel_resolveCurrencyAmountForRequestPayment_completion_, sel_resolveCurrencyAmountForRequestPayment_withCompletion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v88[1] = v67;
  v66 = [[INIntentSlotDescription alloc] initWithName:@"note", 5, @"note", @"note", 0, 0, 30, 1, &unk_1EDBA9B10, &unk_1EDBA9B28, objc_opt_class(), sel_resolveNoteForRequestPayment_withCompletion_, sel_resolveNoteForRequestPayment_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v88[2] = v66;
  v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:3];
  v64 = _INIntentSchemaBuildIntentSlotDescriptionMap(v65);
  v63 = [(INIntentDescription *)v3 initWithName:@"RequestPaymentIntent" responseName:@"RequestPaymentIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.payments.RequestPaymentIntent" isPrivate:0 handleSelector:sel_handleRequestPayment_completion_ confirmSelector:sel_confirmRequestPayment_completion_ slotsByName:v64];
  v90[1] = v63;
  v6 = [INIntentDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v62 = [[INIntentSlotDescription alloc] initWithName:@"accountNickname", 2, @"accountNickname", @"accountNickname", 0, 0, 12, 1, &unk_1EDBA9B40, &unk_1EDBA9B58, objc_opt_class(), sel_resolveAccountNicknameForSearchForAccounts_withCompletion_, sel_resolveAccountNicknameForSearchForAccounts_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v87[0] = v62;
  v61 = [[INIntentSlotDescription alloc] initWithName:@"accountType", 4, @"accountType", @"accountType", 0, 0, 63, 1, &unk_1EDBA9B70, &unk_1EDBA9B88, objc_opt_class(), sel_resolveAccountTypeForSearchForAccounts_withCompletion_, sel_resolveAccountTypeForSearchForAccounts_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v87[1] = v61;
  v60 = [[INIntentSlotDescription alloc] initWithName:@"organizationName", 5, @"organizationName", @"organizationName", 0, 0, 12, 1, &unk_1EDBA9BA0, &unk_1EDBA9BB8, objc_opt_class(), sel_resolveOrganizationNameForSearchForAccounts_withCompletion_, sel_resolveOrganizationNameForSearchForAccounts_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v87[2] = v60;
  v59 = [[INIntentSlotDescription alloc] initWithName:@"requestedBalanceType", 6, @"requestedBalanceType", @"requestedBalanceType", 0, 0, 64, 1, &unk_1EDBA9BD0, &unk_1EDBA9BE8, objc_opt_class(), sel_resolveRequestedBalanceTypeForSearchForAccounts_withCompletion_, sel_resolveRequestedBalanceTypeForSearchForAccounts_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v87[3] = v59;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:4];
  v57 = _INIntentSchemaBuildIntentSlotDescriptionMap(v58);
  v56 = [(INIntentDescription *)v6 initWithName:@"SearchForAccountsIntent" responseName:@"SearchForAccountsIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.payments.SearchForAccountsIntent" isPrivate:0 handleSelector:sel_handleSearchForAccounts_completion_ confirmSelector:sel_confirmSearchForAccounts_completion_ slotsByName:v57];
  v90[2] = v56;
  v9 = [INIntentDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v55 = [[INIntentSlotDescription alloc] initWithName:@"billPayee", 2, @"billPayee", @"billPayee", 0, 0, 59, 1, &unk_1EDBA9C00, &unk_1EDBA9C18, objc_opt_class(), sel_resolveBillPayeeForSearchForBills_withCompletion_, sel_resolveBillPayeeForSearchForBills_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v86[0] = v55;
  v54 = [[INIntentSlotDescription alloc] initWithName:@"paymentDateRange", 3, @"paymentDateRange", @"paymentDateRange", 0, 0, 16, 1, &unk_1EDBA9C30, &unk_1EDBA9C48, objc_opt_class(), sel_resolvePaymentDateRangeForSearchForBills_withCompletion_, sel_resolvePaymentDateRangeForSearchForBills_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v86[1] = v54;
  v53 = [[INIntentSlotDescription alloc] initWithName:@"billType", 4, @"billType", @"billType", 0, 0, 57, 1, &unk_1EDBA9C60, &unk_1EDBA9C78, objc_opt_class(), sel_resolveBillTypeForSearchForBills_withCompletion_, sel_resolveBillTypeForSearchForBills_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v86[2] = v53;
  v52 = [[INIntentSlotDescription alloc] initWithName:@"status", 5, @"status", @"status", 0, 0, 58, 1, &unk_1EDBA9C90, &unk_1EDBA9CA8, objc_opt_class(), sel_resolveStatusForSearchForBills_withCompletion_, sel_resolveStatusForSearchForBills_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v86[3] = v52;
  v51 = [[INIntentSlotDescription alloc] initWithName:@"dueDateRange", 6, @"dueDateRange", @"dueDateRange", 0, 0, 16, 1, &unk_1EDBA9CC0, &unk_1EDBA9CD8, objc_opt_class(), sel_resolveDueDateRangeForSearchForBills_withCompletion_, sel_resolveDueDateRangeForSearchForBills_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v86[4] = v51;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:5];
  v49 = _INIntentSchemaBuildIntentSlotDescriptionMap(v50);
  v48 = [(INIntentDescription *)v9 initWithName:@"SearchForBillsIntent" responseName:@"SearchForBillsIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.payments.SearchForBillsIntent" isPrivate:0 handleSelector:sel_handleSearchForBills_completion_ confirmSelector:sel_confirmSearchForBills_completion_ slotsByName:v49];
  v90[3] = v48;
  v12 = [INIntentDescription alloc];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v47 = [[INIntentSlotDescription alloc] initWithName:@"payee", 2, @"payee", @"payee", 0, 0, 10, 1, &unk_1EDBA9CF0, &unk_1EDBA9D08, objc_opt_class(), sel_resolvePayeeForSendPayment_completion_, sel_resolvePayeeForSendPayment_withCompletion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v85[0] = v47;
  v46 = [[INIntentSlotDescription alloc] initWithName:@"currencyAmount", 3, @"currencyAmount", @"currencyAmount", 0, 0, 53, 1, &unk_1EDBA9D20, &unk_1EDBA9D38, objc_opt_class(), sel_resolveCurrencyAmountForSendPayment_completion_, sel_resolveCurrencyAmountForSendPayment_withCompletion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v85[1] = v46;
  v45 = [[INIntentSlotDescription alloc] initWithName:@"note", 5, @"note", @"note", 0, 0, 30, 1, &unk_1EDBA9D50, &unk_1EDBA9D68, objc_opt_class(), sel_resolveNoteForSendPayment_withCompletion_, sel_resolveNoteForSendPayment_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v85[2] = v45;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:3];
  v43 = _INIntentSchemaBuildIntentSlotDescriptionMap(v44);
  v15 = [(INIntentDescription *)v12 initWithName:@"SendPaymentIntent" responseName:@"SendPaymentIntentResponse" facadeClass:v13 dataClass:v14 type:@"sirikit.intent.payments.SendPaymentIntent" isPrivate:0 handleSelector:sel_handleSendPayment_completion_ confirmSelector:sel_confirmSendPayment_completion_ slotsByName:v43];
  v90[4] = v15;
  v42 = [INIntentDescription alloc];
  uint64_t v41 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  v16 = [[INIntentSlotDescription alloc] initWithName:@"fromAccount", 4, @"fromAccount", @"fromAccount", 0, 0, 61, 1, &unk_1EDBA9D80, &unk_1EDBA9D98, objc_opt_class(), sel_resolveFromAccountForTransferMoney_withCompletion_, sel_resolveFromAccountForTransferMoney_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v84[0] = v16;
  v17 = [[INIntentSlotDescription alloc] initWithName:@"toAccount", 5, @"toAccount", @"toAccount", 0, 0, 61, 1, &unk_1EDBA9DB0, &unk_1EDBA9DC8, objc_opt_class(), sel_resolveToAccountForTransferMoney_withCompletion_, sel_resolveToAccountForTransferMoney_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v84[1] = v17;
  v18 = [[INIntentSlotDescription alloc] initWithName:@"transactionAmount", 6, @"transactionAmount", @"transactionAmount", 0, 0, 62, 1, &unk_1EDBA9DE0, &unk_1EDBA9DF8, objc_opt_class(), sel_resolveTransactionAmountForTransferMoney_withCompletion_, sel_resolveTransactionAmountForTransferMoney_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v84[2] = v18;
  v19 = [[INIntentSlotDescription alloc] initWithName:@"transactionScheduledDate", 7, @"transactionScheduledDate", @"transactionScheduledDate", 0, 0, 16, 1, &unk_1EDBA9E10, &unk_1EDBA9E28, objc_opt_class(), sel_resolveTransactionScheduledDateForTransferMoney_withCompletion_, sel_resolveTransactionScheduledDateForTransferMoney_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v84[3] = v19;
  v20 = [[INIntentSlotDescription alloc] initWithName:@"transactionNote", 8, @"transactionNote", @"transactionNote", 0, 0, 7, 1, &unk_1EDBA9E40, &unk_1EDBA9E58, objc_opt_class(), sel_resolveTransactionNoteForTransferMoney_withCompletion_, sel_resolveTransactionNoteForTransferMoney_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v84[4] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:5];
  v22 = _INIntentSchemaBuildIntentSlotDescriptionMap(v21);
  v23 = [(INIntentDescription *)v42 initWithName:@"TransferMoneyIntent" responseName:@"TransferMoneyIntentResponse" facadeClass:v41 dataClass:v40 type:@"sirikit.intent.payments.TransferMoneyIntent" isPrivate:0 handleSelector:sel_handleTransferMoney_completion_ confirmSelector:sel_confirmTransferMoney_completion_ slotsByName:v22];
  v90[5] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:6];

  uint64_t v25 = [v24 count];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v25];
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v25];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v28 = v24;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v79 objects:v83 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v80 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        v34 = [v33 name];
        [v26 setObject:v33 forKey:v34];

        v35 = [v33 type];
        [v27 setObject:v33 forKey:v35];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v79 objects:v83 count:16];
    }
    while (v30);
  }

  uint64_t v36 = [v26 copy];
  v37 = (void *)sPaymentsDomain_intentDescsByName;
  sPaymentsDomain_intentDescsByName = v36;

  uint64_t v38 = [v27 copy];
  v39 = (void *)sPaymentsDomain_intentDescsByType;
  sPaymentsDomain_intentDescsByType = v38;
}

@end