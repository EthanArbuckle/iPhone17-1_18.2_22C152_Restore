@interface CNComposeAddressConcatenator
@end

@implementation CNComposeAddressConcatenator

void __65___CNComposeAddressConcatenator_defaultRecipientListConcatenator__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultRecipientListConcatenator___context;
  defaultRecipientListConcatenator___context = (uint64_t)v1;

  v3 = (void *)defaultRecipientListConcatenator___context;
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"AND_N_MORE" value:&stru_1F0EC0C28 table:@"Localized"];
  [v3 setAndNMoreFormat:v5];

  v6 = (void *)defaultRecipientListConcatenator___context;
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"AND_N_MORE_NO_ELLIPSIS" value:&stru_1F0EC0C28 table:@"Localized"];
  [v6 setAndNMoreNoEllipsisFormat:v8];

  v9 = (void *)defaultRecipientListConcatenator___context;
  v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"N_RECIPIENTS" value:&stru_1F0EC0C28 table:@"Localized"];
  [v9 setNAddressesFormat:v11];

  v12 = (void *)defaultRecipientListConcatenator___context;
  id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v13 = [v14 localizedStringForKey:@"TRUNCATED_RECIPIENT_FORMAT" value:&stru_1F0EC0C28 table:@"Localized"];
  [v12 setTruncatedAddressFormat:v13];
}

id __163___CNComposeAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke(uint64_t a1, __CFString *a2, uint64_t a3)
{
  unint64_t v5 = *(void *)(a1 + 56);
  unint64_t v6 = *(void *)(a1 + 64) - 1;
  uint64_t v7 = v6 - v5;
  if (v6 <= v5)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    v13 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;
    v15 = a2;
  }
  else
  {
    v9 = NSString;
    v10 = a2;
    uint64_t v11 = objc_msgSend(v9, "localizedStringWithFormat:", a3, v7);
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

  v16 = *(__CFString **)(a1 + 40);
  v17 = &stru_1F0EC0C28;
  if (!v16) {
    v16 = &stru_1F0EC0C28;
  }
  if (a2) {
    v17 = a2;
  }
  v18 = [*(id *)(a1 + 32) stringByAppendingFormat:@"%@%@", v16, v17];

  return v18;
}

id __163___CNComposeAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = NSString;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 32);
  unint64_t v6 = [*(id *)(a1 + 40) substringToIndex:a2];
  uint64_t v7 = objc_msgSend(v3, "stringWithFormat:", v5, v6);
  v8 = (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v7, *(void *)(*(void *)(a1 + 32) + 16));

  return v8;
}

uint64_t __163___CNComposeAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[4];
  v3 = (*(void (**)(void))(a1[5] + 16))();
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, *(void *)(*(void *)(a1[6] + 8) + 40));

  return v4;
}

uint64_t __145___CNComposeAddressConcatenator_commaSeparatedAddressListWithAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    uint64_t v4 = objc_msgSend(a2, "stringByAppendingString:");
    uint64_t v5 = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    return v5;
  }
  else
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t))(v3 + 16);
    uint64_t v8 = *(void *)(a1 + 32);
    return v7(v8);
  }
}

@end