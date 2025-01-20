@interface MFAddressConcatenator
+ (id)defaultRecipientListConcatenator;
- (NSString)andNMoreFormat;
- (NSString)andNMoreNoEllipsisFormat;
- (NSString)nAddressesFormat;
- (NSString)oneAddressFormat;
- (NSString)truncatedAddressFormat;
- (id)commaSeparatedAddressListWithAddressCount:(unint64_t)a3 prefixForAddressAtIndex:(id)a4 stringForAddressAtIndex:(id)a5 lengthValidationBlock:(id)a6;
- (void)getCommaSeparatedAddressList:(id *)a3 andListSuffix:(id *)a4 withAddressCount:(unint64_t)a5 prefixForAddressAtIndex:(id)a6 stringForAddressAtIndex:(id)a7 lengthValidationBlock:(id)a8;
- (void)setAndNMoreFormat:(id)a3;
- (void)setAndNMoreNoEllipsisFormat:(id)a3;
- (void)setNAddressesFormat:(id)a3;
- (void)setOneAddressFormat:(id)a3;
- (void)setTruncatedAddressFormat:(id)a3;
@end

@implementation MFAddressConcatenator

+ (id)defaultRecipientListConcatenator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MFAddressConcatenator_defaultRecipientListConcatenator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultRecipientListConcatenator_onceToken != -1) {
    dispatch_once(&defaultRecipientListConcatenator_onceToken, block);
  }
  v2 = (void *)defaultRecipientListConcatenator___context;

  return v2;
}

void __57__MFAddressConcatenator_defaultRecipientListConcatenator__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultRecipientListConcatenator___context;
  defaultRecipientListConcatenator___context = (uint64_t)v1;

  v3 = (void *)defaultRecipientListConcatenator___context;
  id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v13 localizedStringForKey:@"AND_N_MORE" value:&stru_1F0817A00 table:@"Main"];
  [v3 setAndNMoreFormat:v4];

  v5 = (void *)defaultRecipientListConcatenator___context;
  id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v14 localizedStringForKey:@"AND_N_MORE_NO_ELLIPSIS" value:&stru_1F0817A00 table:@"Main"];
  [v5 setAndNMoreNoEllipsisFormat:v6];

  v7 = (void *)defaultRecipientListConcatenator___context;
  id v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = [v15 localizedStringForKey:@"N_RECIPIENTS" value:&stru_1F0817A00 table:@"Main"];
  [v7 setNAddressesFormat:v8];

  v9 = (void *)defaultRecipientListConcatenator___context;
  id v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v16 localizedStringForKey:@"ONE_RECIPIENT" value:&stru_1F0817A00 table:@"Main"];
  [v9 setOneAddressFormat:v10];

  v11 = (void *)defaultRecipientListConcatenator___context;
  id v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v12 = [v17 localizedStringForKey:@"TRUNCATED_RECIPIENT_FORMAT" value:&stru_1F0817A00 table:@"Main"];
  [v11 setTruncatedAddressFormat:v12];
}

- (void)setTruncatedAddressFormat:(id)a3
{
}

- (void)setOneAddressFormat:(id)a3
{
}

- (void)setNAddressesFormat:(id)a3
{
}

- (void)setAndNMoreNoEllipsisFormat:(id)a3
{
}

- (void)setAndNMoreFormat:(id)a3
{
}

- (void)getCommaSeparatedAddressList:(id *)a3 andListSuffix:(id *)a4 withAddressCount:(unint64_t)a5 prefixForAddressAtIndex:(id)a6 stringForAddressAtIndex:(id)a7 lengthValidationBlock:(id)a8
{
  v11 = (void (**)(id, unint64_t))a6;
  id v12 = a7;
  id v13 = (uint64_t (**)(id, void *, void))a8;
  id v14 = self;
  v44 = (void (**)(void, void))v12;
  id v45 = 0;
  unint64_t v15 = 0;
  v46 = v13;
  id v16 = &stru_1F0817A00;
  v42 = v11;
  v43 = self;
  while (v15 < a5)
  {
    if (v11)
    {
      id v17 = v11[2](v11, v15);
      if (v15) {
        goto LABEL_7;
      }
    }
    else
    {
      id v17 = 0;
      if (v15)
      {
LABEL_7:
        if (!v17)
        {
          id v17 = MFLocalizedAddressSeparator();
        }
      }
    }
    if (v17)
    {
      v18 = [@"‌" stringByAppendingString:v17];
    }
    else
    {
      v18 = 0;
    }
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__9;
    v65 = __Block_byref_object_dispose__9;
    id v66 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __155__MFAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke;
    aBlock[3] = &unk_1E5F7D020;
    unint64_t v59 = v15;
    unint64_t v60 = a5;
    v58 = &v61;
    id v16 = v16;
    v56 = v16;
    id v19 = v18;
    id v57 = v19;
    v20 = (void (**)(void *, void *, void))_Block_copy(aBlock);
    v21 = v44[2](v44, v15);
    v22 = ((void (**)(void *, void *, NSString *))v20)[2](v20, v21, v14->_andNMoreFormat);
    int v23 = v46[2](v46, v22, v62[5]);
    char v24 = v23;
    if (v23)
    {
      v25 = v22;

      id v26 = (id)v62[5];
      ++v15;
      id v16 = v25;
      id v14 = v43;
      id v45 = v26;
      v11 = v42;
    }
    else
    {
      if (![(__CFString *)v16 length]
        && v14->_truncatedAddressFormat
        && v14->_andNMoreNoEllipsisFormat
        && (unint64_t)[v21 length] >= 2)
      {
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __155__MFAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke_2;
        v52[3] = &unk_1E5F7D048;
        v54 = v20;
        v52[4] = v14;
        id v38 = v21;
        id v53 = v38;
        v36 = _Block_copy(v52);
        uint64_t v39 = [v38 length] - 1;
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __155__MFAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke_3;
        v48[3] = &unk_1E5F7D070;
        v49 = v46;
        v37 = v36;
        id v50 = v37;
        v51 = &v61;
        uint64_t v29 = MFLastIndexPassingTest(v39, v48);
        id v14 = v43;
        if (v29)
        {
          v30 = v37;
          if (v29 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v31 = v37[2](v37);

            id v32 = (id)v62[5];
            id v16 = (__CFString *)v31;
            id v45 = v32;
            v11 = v42;
            id v14 = v43;
          }
        }
        else
        {
          v30 = v37;
        }
      }
      if (![(__CFString *)v16 length])
      {
        if (a5 >= 2 && v14->_nAddressesFormat)
        {
          v27 = objc_msgSend(MEMORY[0x1E4F28EE0], "ef_formatInteger:withGrouping:", a5, 1);
          uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", v14->_nAddressesFormat, v27);

          id v16 = (__CFString *)v28;
          v11 = v42;
        }
        else
        {
          v33 = v14->_oneAddressFormat;

          id v16 = v33;
        }
        id v14 = v43;
      }
    }

    _Block_object_dispose(&v61, 8);
    if ((v24 & 1) == 0) {
      break;
    }
  }
  v34 = v16;
  *a3 = v34;
  id v35 = v45;
  *a4 = v35;
}

id __155__MFAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = a2;
  id v6 = a3;
  unint64_t v7 = *(void *)(a1 + 56);
  unint64_t v8 = *(void *)(a1 + 64) - 1;
  if (v8 <= v7)
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    v9 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x1E4F28EE0], "ef_formatInteger:withGrouping:", v8 - v7, 1);
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", v6, v9);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  id v14 = *(__CFString **)(a1 + 40);
  unint64_t v15 = &stru_1F0817A00;
  if (!v14) {
    id v14 = &stru_1F0817A00;
  }
  if (v5) {
    unint64_t v15 = v5;
  }
  id v16 = [*(id *)(a1 + 32) stringByAppendingFormat:@"%@%@", v14, v15];

  return v16;
}

id __155__MFAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = NSString;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 40);
  id v6 = [*(id *)(a1 + 40) substringToIndex:a2];
  unint64_t v7 = objc_msgSend(v3, "stringWithFormat:", v5, v6);
  unint64_t v8 = (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v7, *(void *)(*(void *)(a1 + 32) + 16));

  return v8;
}

uint64_t __155__MFAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[4];
  v3 = (*(void (**)(void))(a1[5] + 16))();
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, *(void *)(*(void *)(a1[6] + 8) + 40));

  return v4;
}

- (id)commaSeparatedAddressListWithAddressCount:(unint64_t)a3 prefixForAddressAtIndex:(id)a4 stringForAddressAtIndex:(id)a5 lengthValidationBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __137__MFAddressConcatenator_commaSeparatedAddressListWithAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke;
  aBlock[3] = &unk_1E5F7D098;
  id v13 = v12;
  id v23 = v13;
  id v14 = _Block_copy(aBlock);
  id v20 = 0;
  id v21 = 0;
  [(MFAddressConcatenator *)self getCommaSeparatedAddressList:&v21 andListSuffix:&v20 withAddressCount:a3 prefixForAddressAtIndex:v10 stringForAddressAtIndex:v11 lengthValidationBlock:v14];
  id v15 = v21;
  id v16 = v20;
  if (v16)
  {
    id v17 = [v15 stringByAppendingString:v16];
  }
  else
  {
    id v17 = v15;
  }
  v18 = v17;

  return v18;
}

uint64_t __137__MFAddressConcatenator_commaSeparatedAddressListWithAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6)
  {
    unint64_t v8 = [v5 stringByAppendingString:v6];
  }
  else
  {
    unint64_t v8 = v5;
  }
  uint64_t v9 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  if (v6) {

  }
  return v9;
}

- (NSString)andNMoreFormat
{
  return self->_andNMoreFormat;
}

- (NSString)andNMoreNoEllipsisFormat
{
  return self->_andNMoreNoEllipsisFormat;
}

- (NSString)oneAddressFormat
{
  return self->_oneAddressFormat;
}

- (NSString)nAddressesFormat
{
  return self->_nAddressesFormat;
}

- (NSString)truncatedAddressFormat
{
  return self->_truncatedAddressFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncatedAddressFormat, 0);
  objc_storeStrong((id *)&self->_nAddressesFormat, 0);
  objc_storeStrong((id *)&self->_oneAddressFormat, 0);
  objc_storeStrong((id *)&self->_andNMoreNoEllipsisFormat, 0);

  objc_storeStrong((id *)&self->_andNMoreFormat, 0);
}

@end