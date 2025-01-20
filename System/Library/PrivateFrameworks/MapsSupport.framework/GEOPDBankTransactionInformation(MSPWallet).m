@interface GEOPDBankTransactionInformation(MSPWallet)
- (id)initWithMSPWalletBankTransactionInformation:()MSPWallet rawMerchantCode:industryCategory:;
@end

@implementation GEOPDBankTransactionInformation(MSPWallet)

- (id)initWithMSPWalletBankTransactionInformation:()MSPWallet rawMerchantCode:industryCategory:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = a1;
  v27.super_class = (Class)&off_1F121BB78;
  id v11 = objc_msgSendSuper2(&v27, sel_init);
  if (v11)
  {
    objc_msgSend(v11, "setBankTransactionType:", objc_msgSend(v8, "transactionType"));
    v12 = [v8 bankTransactionDescription];
    [v11 setBankTransactionDescription:v12];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v13 = objc_msgSend(v8, "otherTransactionLocations", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          [v11 addOtherTransactionLocations:*(void *)(*((void *)&v23 + 1) + 8 * v17++)];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v15);
    }

    [v8 transactionTimestamp];
    objc_msgSend(v11, "setTransactionTimestamp:");
    objc_msgSend(v11, "setIndustryCode:", objc_msgSend(v8, "industryCode"));
    objc_msgSend(v11, "setEnableBrandMuidFallback:", objc_msgSend(v8, "enableBrandMuidFallback"));
    v18 = [v8 transactionCurrencyCode];
    [v11 setTransactionCurrencyCode:v18];

    objc_msgSend(v11, "setTransactionStatus:", objc_msgSend(v8, "transactionStatus"));
    v19 = [v8 merchantInformation];
    [v11 setMerchantInformation:v19];

    v20 = [v8 bankTransactionDescriptionClean];
    [v11 setBankTransactionDescriptionClean:v20];

    v21 = [v8 bankIdentifier];
    [v11 setBankIdentifier:v21];

    [v11 setRawMerchantCode:v9];
    [v11 setIndustryCategory:v10];
  }

  return v11;
}

@end