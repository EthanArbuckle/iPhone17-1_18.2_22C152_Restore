@interface MKWalletMerchantLookupBankMerchantInfo
- (NSNumber)bankMerchantCleanConfidenceLevel;
- (NSString)bankMerchantAdditionalData;
- (NSString)bankMerchantAddress;
- (NSString)bankMerchantCanl;
- (NSString)bankMerchantCity;
- (NSString)bankMerchantCountryCode;
- (NSString)bankMerchantDoingBizAsName;
- (NSString)bankMerchantEnhancedName;
- (NSString)bankMerchantId;
- (NSString)bankMerchantRawAddress;
- (NSString)bankMerchantRawCity;
- (NSString)bankMerchantRawState;
- (NSString)bankMerchantState;
- (NSString)bankMerchantType;
- (NSString)bankMerchantZip;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBankMerchantAdditionalData:(id)a3;
- (void)setBankMerchantAddress:(id)a3;
- (void)setBankMerchantCanl:(id)a3;
- (void)setBankMerchantCity:(id)a3;
- (void)setBankMerchantCleanConfidenceLevel:(id)a3;
- (void)setBankMerchantCountryCode:(id)a3;
- (void)setBankMerchantDoingBizAsName:(id)a3;
- (void)setBankMerchantEnhancedName:(id)a3;
- (void)setBankMerchantId:(id)a3;
- (void)setBankMerchantRawAddress:(id)a3;
- (void)setBankMerchantRawCity:(id)a3;
- (void)setBankMerchantRawState:(id)a3;
- (void)setBankMerchantState:(id)a3;
- (void)setBankMerchantType:(id)a3;
- (void)setBankMerchantZip:(id)a3;
@end

@implementation MKWalletMerchantLookupBankMerchantInfo

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_bankMerchantId copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_bankMerchantDoingBizAsName copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSString *)self->_bankMerchantEnhancedName copy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [(NSString *)self->_bankMerchantCity copy];
  v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [(NSString *)self->_bankMerchantRawCity copy];
  v14 = (void *)v4[5];
  v4[5] = v13;

  uint64_t v15 = [(NSString *)self->_bankMerchantState copy];
  v16 = (void *)v4[6];
  v4[6] = v15;

  uint64_t v17 = [(NSString *)self->_bankMerchantRawState copy];
  v18 = (void *)v4[7];
  v4[7] = v17;

  uint64_t v19 = [(NSString *)self->_bankMerchantZip copy];
  v20 = (void *)v4[8];
  v4[8] = v19;

  uint64_t v21 = [(NSString *)self->_bankMerchantAddress copy];
  v22 = (void *)v4[9];
  v4[9] = v21;

  uint64_t v23 = [(NSString *)self->_bankMerchantRawAddress copy];
  v24 = (void *)v4[10];
  v4[10] = v23;

  uint64_t v25 = [(NSString *)self->_bankMerchantCountryCode copy];
  v26 = (void *)v4[11];
  v4[11] = v25;

  uint64_t v27 = [(NSString *)self->_bankMerchantType copy];
  v28 = (void *)v4[12];
  v4[12] = v27;

  uint64_t v29 = [(NSNumber *)self->_bankMerchantCleanConfidenceLevel copy];
  v30 = (void *)v4[13];
  v4[13] = v29;

  uint64_t v31 = [(NSString *)self->_bankMerchantAdditionalData copy];
  v32 = (void *)v4[14];
  v4[14] = v31;

  uint64_t v33 = [(NSString *)self->_bankMerchantCanl copy];
  v34 = (void *)v4[15];
  v4[15] = v33;

  return v4;
}

- (NSString)bankMerchantId
{
  return self->_bankMerchantId;
}

- (void)setBankMerchantId:(id)a3
{
}

- (NSString)bankMerchantDoingBizAsName
{
  return self->_bankMerchantDoingBizAsName;
}

- (void)setBankMerchantDoingBizAsName:(id)a3
{
}

- (NSString)bankMerchantEnhancedName
{
  return self->_bankMerchantEnhancedName;
}

- (void)setBankMerchantEnhancedName:(id)a3
{
}

- (NSString)bankMerchantCity
{
  return self->_bankMerchantCity;
}

- (void)setBankMerchantCity:(id)a3
{
}

- (NSString)bankMerchantRawCity
{
  return self->_bankMerchantRawCity;
}

- (void)setBankMerchantRawCity:(id)a3
{
}

- (NSString)bankMerchantState
{
  return self->_bankMerchantState;
}

- (void)setBankMerchantState:(id)a3
{
}

- (NSString)bankMerchantRawState
{
  return self->_bankMerchantRawState;
}

- (void)setBankMerchantRawState:(id)a3
{
}

- (NSString)bankMerchantZip
{
  return self->_bankMerchantZip;
}

- (void)setBankMerchantZip:(id)a3
{
}

- (NSString)bankMerchantAddress
{
  return self->_bankMerchantAddress;
}

- (void)setBankMerchantAddress:(id)a3
{
}

- (NSString)bankMerchantRawAddress
{
  return self->_bankMerchantRawAddress;
}

- (void)setBankMerchantRawAddress:(id)a3
{
}

- (NSString)bankMerchantCountryCode
{
  return self->_bankMerchantCountryCode;
}

- (void)setBankMerchantCountryCode:(id)a3
{
}

- (NSString)bankMerchantType
{
  return self->_bankMerchantType;
}

- (void)setBankMerchantType:(id)a3
{
}

- (NSNumber)bankMerchantCleanConfidenceLevel
{
  return self->_bankMerchantCleanConfidenceLevel;
}

- (void)setBankMerchantCleanConfidenceLevel:(id)a3
{
}

- (NSString)bankMerchantAdditionalData
{
  return self->_bankMerchantAdditionalData;
}

- (void)setBankMerchantAdditionalData:(id)a3
{
}

- (NSString)bankMerchantCanl
{
  return self->_bankMerchantCanl;
}

- (void)setBankMerchantCanl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bankMerchantCanl, 0);
  objc_storeStrong((id *)&self->_bankMerchantAdditionalData, 0);
  objc_storeStrong((id *)&self->_bankMerchantCleanConfidenceLevel, 0);
  objc_storeStrong((id *)&self->_bankMerchantType, 0);
  objc_storeStrong((id *)&self->_bankMerchantCountryCode, 0);
  objc_storeStrong((id *)&self->_bankMerchantRawAddress, 0);
  objc_storeStrong((id *)&self->_bankMerchantAddress, 0);
  objc_storeStrong((id *)&self->_bankMerchantZip, 0);
  objc_storeStrong((id *)&self->_bankMerchantRawState, 0);
  objc_storeStrong((id *)&self->_bankMerchantState, 0);
  objc_storeStrong((id *)&self->_bankMerchantRawCity, 0);
  objc_storeStrong((id *)&self->_bankMerchantCity, 0);
  objc_storeStrong((id *)&self->_bankMerchantEnhancedName, 0);
  objc_storeStrong((id *)&self->_bankMerchantDoingBizAsName, 0);

  objc_storeStrong((id *)&self->_bankMerchantId, 0);
}

@end