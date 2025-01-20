@interface HAP2EncodingUtils
+ (BOOL)parseAddOrRemovePairingRequestResponse:(id)a3 error:(id *)a4;
+ (id)addPairingRequestWithIdentity:(id)a3 error:(id *)a4;
+ (id)removePairingRequestWithIdentifier:(id)a3 error:(id *)a4;
@end

@implementation HAP2EncodingUtils

+ (BOOL)parseAddOrRemovePairingRequestResponse:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = +[HAP2TLVAddOrRemovePairingResponse parsedFromData:error:](HAP2TLVAddOrRemovePairingResponse, "parsedFromData:error:", a3);
  v6 = v5;
  if (!v5)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v13 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        id v14 = *a4;
      }
      else {
        id v14 = 0;
      }
      int v24 = 138412290;
      id v25 = v14;
      _os_log_error_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "Pairing request response failed to parse: %@", (uint8_t *)&v24, 0xCu);
    }
    goto LABEL_27;
  }
  v7 = [v5 state];
  uint64_t v8 = [v7 value];

  if (v8 != 2)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v15 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v17 = v15;
      v18 = [v6 state];
      v19 = HAP2TLVPairingStateAsString([v18 value]);
      int v24 = 138412290;
      id v25 = v19;
      _os_log_error_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "Pairing request response had invalid state: %@", (uint8_t *)&v24, 0xCu);

      if (!a4) {
        goto LABEL_27;
      }
    }
    else if (!a4)
    {
      goto LABEL_27;
    }
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = 15;
    goto LABEL_19;
  }
  v9 = [v6 responseError];

  if (!v9)
  {
    BOOL v16 = 1;
    goto LABEL_28;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v10 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    v20 = v10;
    v21 = [v6 responseError];
    v22 = HAP2TLVErrorsAsString([v21 value]);
    int v24 = 138412290;
    id v25 = v22;
    _os_log_error_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "Pairing request response had an error: %@", (uint8_t *)&v24, 0xCu);

    if (a4) {
      goto LABEL_8;
    }
LABEL_27:
    BOOL v16 = 0;
    goto LABEL_28;
  }
  if (!a4) {
    goto LABEL_27;
  }
LABEL_8:
  v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v12 = 16;
LABEL_19:
  [v11 hapErrorWithCode:v12];
  BOOL v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v16;
}

+ (id)addPairingRequestWithIdentity:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [[HAP2TLVPairingStateWrapper alloc] initWithValue:1];
  v7 = [[HAP2TLVPairingMethodWrapper alloc] initWithValue:3];
  uint64_t v8 = [HAPTLVUnsignedNumberValue alloc];
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "permissions"));
  v10 = [(HAPTLVNumberValueBase *)v8 initWithValue:v9];

  v11 = [HAP2TLVAddPairingRequest alloc];
  uint64_t v12 = [v5 identifier];
  v13 = [v5 publicKey];

  id v14 = [v13 data];
  v15 = [(HAP2TLVAddPairingRequest *)v11 initWithState:v6 method:v7 identifier:v12 publicKey:v14 permissions:v10];

  BOOL v16 = [(HAP2TLVAddPairingRequest *)v15 serializeWithError:a4];
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v19 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        id v21 = *a4;
      }
      else {
        id v21 = 0;
      }
      int v22 = 138412290;
      id v23 = v21;
      _os_log_error_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "Couldn't serialize request TLVs: %@", (uint8_t *)&v22, 0xCu);
    }
  }

  return v17;
}

+ (id)removePairingRequestWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [[HAP2TLVPairingStateWrapper alloc] initWithValue:1];
  v7 = [[HAP2TLVPairingMethodWrapper alloc] initWithValue:4];
  uint64_t v8 = [[HAP2TLVRemovePairingRequest alloc] initWithState:v6 method:v7 identifier:v5];

  v9 = [(HAP2TLVRemovePairingRequest *)v8 serializeWithError:a4];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v12 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        id v14 = *a4;
      }
      else {
        id v14 = 0;
      }
      int v15 = 138412290;
      id v16 = v14;
      _os_log_error_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "Couldn't serialize request TLVs: %@", (uint8_t *)&v15, 0xCu);
    }
  }

  return v10;
}

@end