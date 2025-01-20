@interface HAP2AccessoryServerEncodingThread
+ (id)_parseShortFormUUID:(id)a3 error:(id *)a4;
- (HAP2AccessoryServerEncodingThread)initWithEncodingFeatures:(unint64_t)a3 accessoryDescription:(id)a4;
- (HAP2EncodedAttributeDatabaseResponseThread)_attributeDatabaseResponseFromBTLEResponse:(void *)a3 error:;
- (HAP2EncodedCharacteristicRequestThread)_pairingsRequestWithCharacteristic:(uint64_t)a3 bodyValue:(char)a4 threadRequestType:(uint64_t)a5 error:;
- (HAP2EncodedCharacteristicResponse)_prepareWriteResponseFromBTLEResponses:(HAP2EncodedCharacteristicResponse *)a1 error:(void *)a2;
- (HAP2EncodedCharacteristicResponse)_readResponseFromBTLEResponses:(HAP2EncodedCharacteristicResponse *)a1 error:(void *)a2;
- (HAP2EncodedListPairingsResponseThread)_listPairingsResponseFromBTLEResponse:(HAP2EncodedListPairingsResponseThread *)a1 request:(void *)a2 error:(void *)a3;
- (NSString)description;
- (id)_errorIfResponseInvalid:(void *)a1;
- (id)_extractAndValidateControlFieldWithData:(int)a3 expectedType:;
- (id)_extractResponseBodyFromBTLEResponse:(void *)a1 request:(void *)a2 error:(void *)a3;
- (id)_parseCharacteristicMetadata:(id)a3 error:(id *)a4;
- (id)_parseCharacteristicResponsesWithBodyData:(id)a3 request:(id)a4 error:(id *)a5;
- (id)_parseCharacteristics:(id)a3 error:(id *)a4;
- (id)_parseServiceList:(id)a3 error:(id *)a4;
- (id)_parseTopLevelAttributeDatabaseFromData:(id)a3 error:(id *)a4;
- (id)_valueResponseFromBTLEResponse:(void *)a1;
- (id)decodeBodyData:(id)a3 format:(unint64_t)a4 error:(id *)a5;
- (id)encodeBodyValue:(id)a3 format:(unint64_t)a4 error:(id *)a5;
- (id)eventsForData:(id)a3 error:(id *)a4;
- (id)executeWriteRequestForCharacteristics:(id)a3 error:(id *)a4;
- (id)groupingsForReadRequestsForCharacteristics:(id)a3;
- (id)groupingsForWriteRequestsForCharacteristics:(id)a3;
- (id)notificationRequestsForCharacteristics:(id)a3 type:(unint64_t)a4 error:(id *)a5;
- (id)prepareWriteRequestForCharacteristics:(id)a3 ttl:(double)a4 error:(id *)a5;
- (id)readRequestForAttributeDatabaseWithEncryption:(BOOL)a3 error:(id *)a4;
- (id)readRequestForCharacteristics:(id)a3 shouldEncrypt:(BOOL)a4 error:(id *)a5;
- (id)requestToAddPairing:(id)a3 characteristic:(id)a4 error:(id *)a5;
- (id)requestToListPairingsWithCharacteristic:(id)a3 error:(id *)a4;
- (id)requestToRemovePairing:(id)a3 characteristic:(id)a4 error:(id *)a5;
- (id)responseForRequest:(id)a3 bodyData:(id)a4 error:(id *)a5;
- (id)unpairedIdentifyRequestWithError:(id *)a3;
- (id)writeRequestForCharacteristics:(id)a3 shouldEncrypt:(BOOL)a4 error:(id *)a5;
- (unint64_t)encodingFeatures;
@end

@implementation HAP2AccessoryServerEncodingThread

- (void).cxx_destruct
{
}

- (unint64_t)encodingFeatures
{
  return self->_encodingFeatures;
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)HAP2AccessoryServerEncodingThread;
  uint64_t v4 = [(HAP2LoggingObject *)&v9 description];
  v5 = (void *)v4;
  if (self) {
    accessoryDescription = self->_accessoryDescription;
  }
  else {
    accessoryDescription = 0;
  }
  v7 = [v3 stringWithFormat:@"%@ [%@]", v4, accessoryDescription];

  return (NSString *)v7;
}

- (id)_parseTopLevelAttributeDatabaseFromData:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([(HAP2AccessoryServerEncodingThread *)self encodingFeatures] & 2) != 0)
  {
    v18 = +[HAP2TLVAccessorySignatureReadRequest parsedFromData:v6 error:a4];

    goto LABEL_16;
  }
  v7 = +[HAP2TLVOldServiceList parsedFromData:v6 error:a4];

  if (v7)
  {
    v8 = [v7 serviceList];
    if (v8)
    {
      objc_super v9 = [HAPTLVUnsignedNumberValue alloc];
      v10 = [NSNumber numberWithUnsignedInteger:1];
      v11 = [(HAPTLVNumberValueBase *)v9 initWithValue:v10];

      v12 = [HAP2TLVParamAccessorySignature alloc];
      v13 = [v7 serviceList];
      v14 = [(HAP2TLVParamAccessorySignature *)v12 initWithAccessoryID:v11 serviceList:v13];

      v15 = [HAP2TLVParamAccessoryList alloc];
      v21 = v14;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
      v17 = [(HAP2TLVParamAccessoryList *)v15 initWithAccessorySignatureList:v16];

      v18 = [[HAP2TLVAccessorySignatureReadRequest alloc] initWithAccessoryList:v17];
LABEL_14:

      goto LABEL_15;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v19 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = self;
      __int16 v24 = 2112;
      v25 = v7;
      _os_log_error_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%@ Found no services: %@", buf, 0x16u);
      if (a4) {
        goto LABEL_11;
      }
    }
    else if (a4)
    {
LABEL_11:
      [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v18 = 0;
    goto LABEL_14;
  }
  v18 = 0;
LABEL_15:

LABEL_16:

  return v18;
}

- (id)_parseServiceList:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v12 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = self;
      _os_log_error_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%@ Service list contains no services", (uint8_t *)&buf, 0xCu);
      if (a4) {
        goto LABEL_9;
      }
    }
    else if (a4)
    {
LABEL_9:
      [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v11 = 0;
    goto LABEL_12;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2002;
  v20 = __Block_byref_object_dispose__2003;
  id v21 = 0;
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__HAP2AccessoryServerEncodingThread__parseServiceList_error___block_invoke;
  v14[3] = &unk_1E69F0AE0;
  v14[4] = self;
  p_long long buf = &buf;
  id v9 = v8;
  id v15 = v9;
  [v7 enumerateObjectsUsingBlock:v14];
  v10 = *(void **)(*((void *)&buf + 1) + 40);
  if (v10)
  {
    v11 = 0;
    if (a4) {
      *a4 = v10;
    }
  }
  else
  {
    v11 = (void *)[v9 copy];
  }

  _Block_object_dispose(&buf, 8);
LABEL_12:

  return v11;
}

void __61__HAP2AccessoryServerEncodingThread__parseServiceList_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  v7 = objc_opt_class();
  v8 = [v6 serviceType];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v9 + 40);
  v10 = [v7 _parseShortFormUUID:v8 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);

  if (v10)
  {
    v11 = [v6 instanceID];
    v12 = [v11 value];

    if (!v12)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v31 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        uint64_t v41 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v49 = v41;
        __int16 v50 = 2112;
        id v51 = v6;
        _os_log_error_impl(&dword_1D4758000, v31, OS_LOG_TYPE_ERROR, "%@ Service contains no instance id: %@", buf, 0x16u);
      }
      uint64_t v32 = [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
      uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8);
      v34 = *(void **)(v33 + 40);
      *(void *)(v33 + 40) = v32;

      *a4 = 1;
      goto LABEL_33;
    }
    v13 = *(void **)(a1 + 32);
    v14 = [v6 characteristicList];
    id v15 = [v14 characteristicSignatureList];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    id v46 = *(id *)(v16 + 40);
    v17 = [v13 _parseCharacteristics:v15 error:&v46];
    objc_storeStrong((id *)(v16 + 40), v46);

    if (!v17)
    {
      *a4 = 1;
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    v44 = a4;
    uint64_t v18 = [v6 properties];
    char v19 = [v18 value];

    v20 = [MEMORY[0x1E4F1CA48] array];
    id v21 = [v6 linkedServices];
    uint64_t v22 = [v21 length];

    if (v22)
    {
      v23 = [v6 linkedServices];
      uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
      id v45 = *(id *)(v24 + 40);
      char v25 = _parseLinkedServices(v23, v20, &v45);
      objc_storeStrong((id *)(v24 + 40), v45);

      if ((v25 & 1) == 0)
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v35 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          uint64_t v42 = *(void *)(a1 + 32);
          *(_DWORD *)long long buf = 138412546;
          uint64_t v49 = v42;
          __int16 v50 = 2112;
          id v51 = v6;
          _os_log_error_impl(&dword_1D4758000, v35, OS_LOG_TYPE_ERROR, "%@ Service contained invalid linked services: %@", buf, 0x16u);
        }
        unsigned char *v44 = 1;
        goto LABEL_31;
      }
      [v20 removeObject:v12];
    }
    uint64_t v26 = v19 & 7;
    v27 = [HAPService alloc];
    v28 = (void *)[v20 copy];
    v29 = [(HAPService *)v27 initWithType:v10 instanceID:v12 parsedCharacteristics:v17 serviceProperties:v26 linkedServices:v28];

    if (v29)
    {
      [*(id *)(a1 + 40) addObject:v29];
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v36 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v49 = v43;
        __int16 v50 = 2112;
        id v51 = v6;
        _os_log_error_impl(&dword_1D4758000, v36, OS_LOG_TYPE_ERROR, "%@ Unable to parse service: %@", buf, 0x16u);
      }
      uint64_t v37 = [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
      uint64_t v38 = *(void *)(*(void *)(a1 + 48) + 8);
      v39 = *(void **)(v38 + 40);
      *(void *)(v38 + 40) = v37;

      unsigned char *v44 = 1;
    }

LABEL_31:
    goto LABEL_32;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v30 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    uint64_t v40 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v49 = v40;
    __int16 v50 = 2112;
    id v51 = v6;
    _os_log_error_impl(&dword_1D4758000, v30, OS_LOG_TYPE_ERROR, "%@ Service contains invalid or no type: %@", buf, 0x16u);
  }
  *a4 = 1;
LABEL_34:
}

- (id)_parseCharacteristics:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    v12 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = self;
      _os_log_error_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%@ Characteristic list contains no characteristics", (uint8_t *)&buf, 0xCu);
      if (a4) {
        goto LABEL_9;
      }
    }
    else if (a4)
    {
LABEL_9:
      [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v11 = 0;
    goto LABEL_12;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x3032000000;
  char v19 = __Block_byref_object_copy__2002;
  v20 = __Block_byref_object_dispose__2003;
  id v21 = 0;
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__HAP2AccessoryServerEncodingThread__parseCharacteristics_error___block_invoke;
  v14[3] = &unk_1E69F0AB8;
  v14[4] = self;
  p_long long buf = &buf;
  id v9 = v8;
  id v15 = v9;
  [v7 enumerateObjectsUsingBlock:v14];
  v10 = *(void **)(*((void *)&buf + 1) + 40);
  if (v10)
  {
    v11 = 0;
    if (a4) {
      *a4 = v10;
    }
  }
  else
  {
    v11 = (void *)[v9 copy];
  }

  _Block_object_dispose(&buf, 8);
LABEL_12:

  return v11;
}

void __65__HAP2AccessoryServerEncodingThread__parseCharacteristics_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  v7 = objc_opt_class();
  v8 = [v6 characteristicType];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v9 + 40);
  v10 = [v7 _parseShortFormUUID:v8 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);

  if (v10)
  {
    v11 = [v6 instanceID];
    v12 = [v11 value];

    if (v12)
    {
      v13 = [v6 characteristicProperties];

      if (v13)
      {
        v14 = [v6 characteristicProperties];
        unint64_t v15 = [v14 value];

        uint64_t v16 = *(void **)(a1 + 32);
        id v45 = 0;
        v17 = [v16 _parseCharacteristicMetadata:v6 error:&v45];
        id v18 = v45;
        if (v17)
        {
          uint64_t v19 = 2 * (v15 & 1);
          if ((v15 & 0x22) != 0) {
            uint64_t v19 = (2 * (v15 & 1)) | 0x84;
          }
          LOBYTE(v44) = 1;
          v20 = [[HAPCharacteristic alloc] initWithType:v10 instanceID:v12 value:0 stateNumber:0 properties:(v15 >> 3) & 2 | v15 & 0x40 | (16 * ((v15 >> 2) & 3)) | (v15 >> 6) & 8 | (v15 >> 2) & 0x100 | ((~(_WORD)v15 & 0x180) == 0) | v19 eventNotificationsEnabled:0 implicitWriteWithResponse:v44 metadata:v17];
          if (v20)
          {
            id v21 = [MEMORY[0x1E4F1C9C8] distantPast];
            [(HAPCharacteristic *)v20 setValueUpdatedTime:v21];

            [*(id *)(a1 + 40) addObject:v20];
          }
          else
          {
            if (hap2LogInitialize_onceToken != -1) {
              dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
            }
            v36 = hap2Log_accessory;
            if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
            {
              uint64_t v43 = *(void *)(a1 + 32);
              *(_DWORD *)long long buf = 138412546;
              uint64_t v48 = v43;
              __int16 v49 = 2112;
              id v50 = v6;
              _os_log_error_impl(&dword_1D4758000, v36, OS_LOG_TYPE_ERROR, "%@ Unable to parse characteristic: %@", buf, 0x16u);
            }
            uint64_t v37 = [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
            uint64_t v38 = *(void *)(*(void *)(a1 + 48) + 8);
            v39 = *(void **)(v38 + 40);
            *(void *)(v38 + 40) = v37;

            *a4 = 1;
          }
        }
        else
        {
          if (hap2LogInitialize_onceToken != -1) {
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
          }
          uint64_t v32 = hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
          {
            uint64_t v42 = *(void *)(a1 + 32);
            *(_DWORD *)long long buf = 138412546;
            uint64_t v48 = v42;
            __int16 v49 = 2112;
            id v50 = v6;
            _os_log_error_impl(&dword_1D4758000, v32, OS_LOG_TYPE_ERROR, "%@ Characteristic contains invalid metadata: %@", buf, 0x16u);
          }
          uint64_t v33 = [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
          uint64_t v34 = *(void *)(*(void *)(a1 + 48) + 8);
          v35 = *(void **)(v34 + 40);
          *(void *)(v34 + 40) = v33;

          *a4 = 1;
        }

        goto LABEL_34;
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v26 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
LABEL_21:
        uint64_t v29 = [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
        uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
        v31 = *(void **)(v30 + 40);
        *(void *)(v30 + 40) = v29;

        *a4 = 1;
LABEL_34:

        goto LABEL_35;
      }
      uint64_t v41 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v48 = v41;
      __int16 v49 = 2112;
      id v50 = v6;
      v28 = "%@ Characteristic contains no properties: %@";
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v26 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      uint64_t v27 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v48 = v27;
      __int16 v49 = 2112;
      id v50 = v6;
      v28 = "%@ Characteristic contains no instance id: %@";
    }
    _os_log_error_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);
    goto LABEL_21;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v22 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    uint64_t v40 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v48 = v40;
    __int16 v49 = 2112;
    id v50 = v6;
    _os_log_error_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%@ Characteristic contains invalid or no type: %@", buf, 0x16u);
  }
  uint64_t v23 = [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
  uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
  char v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  *a4 = 1;
LABEL_35:
}

- (id)_parseCharacteristicMetadata:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 userDescription];
  v8 = [v6 bluetoothFormat];

  if (!v8)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v32 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v42 = self;
      __int16 v43 = 2112;
      id v44 = v6;
      _os_log_error_impl(&dword_1D4758000, v32, OS_LOG_TYPE_ERROR, "%@ Characteristic contains no format: %@", buf, 0x16u);
      if (a4) {
        goto LABEL_22;
      }
    }
    else if (a4)
    {
LABEL_22:
      [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    }
    v11 = 0;
    goto LABEL_46;
  }
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v9 = [v6 bluetoothFormat];
  int v10 = _parseBTLEPresentationFormat(v9, (uint64_t)&v39, a4);

  v11 = 0;
  if (v10)
  {
    uint64_t v38 = 0;
    v11 = 0;
    if (_parseHAPCharacteristicFormat(v39, &v38, a4))
    {
      id v37 = 0;
      char v12 = _parseHAPCharacteristicUnit(v39, &v40, &v37);
      id v13 = v37;
      if ((v12 & 1) == 0)
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v14 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412802;
          uint64_t v42 = self;
          __int16 v43 = 2112;
          id v44 = v6;
          __int16 v45 = 2112;
          id v46 = v13;
          _os_log_error_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%@ Characteristic %@ unit failed to parse with error: %@", buf, 0x20u);
        }
        uint64_t v40 = 0;
      }
      unint64_t v15 = objc_alloc_init(HAPMetadataConstraints);
      uint64_t v16 = [v6 validRange];
      if (v16
        && (v17 = (void *)v16,
            [v6 validRange],
            id v18 = objc_claimAutoreleasedReturnValue(),
            BOOL v19 = _parseCharacteristicValidRange(v18, v38, v15, a4),
            v18,
            v17,
            !v19))
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        uint64_t v33 = hap2Log_accessory;
        if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
          goto LABEL_36;
        }
      }
      else
      {
        uint64_t v20 = [v6 stepValue];
        if (!v20
          || (id v21 = (void *)v20,
              [v6 stepValue],
              uint64_t v22 = objc_claimAutoreleasedReturnValue(),
              BOOL v23 = _parseCharacteristicStepValue(v22, v38, v15, a4),
              v22,
              v21,
              v23))
        {
          uint64_t v24 = [v6 validValuesRange];
          if (!v24
            || (char v25 = (void *)v24,
                [v6 validValuesRange],
                uint64_t v26 = objc_claimAutoreleasedReturnValue(),
                BOOL valid = _parseCharacteristicValidValues(v26, v38, v15, a4),
                v26,
                v25,
                valid))
          {
            v28 = [HAPCharacteristicMetadata alloc];
            uint64_t v29 = HAPCharacteristicFormatToString(v38);
            uint64_t v30 = HAPCharacteristicUnitToString(v40);
            v11 = [(HAPCharacteristicMetadata *)v28 initWithConstraints:v15 description:v7 format:v29 units:v30];

            if (v11)
            {
              v31 = v11;
LABEL_44:

              goto LABEL_45;
            }
            if (hap2LogInitialize_onceToken != -1) {
              dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
            }
            v35 = hap2Log_accessory;
            if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412546;
              uint64_t v42 = self;
              __int16 v43 = 2112;
              id v44 = v6;
              _os_log_error_impl(&dword_1D4758000, v35, OS_LOG_TYPE_ERROR, "%@ Characteristic %@ metadata failed to parse", buf, 0x16u);
              if (!a4) {
                goto LABEL_44;
              }
            }
            else if (!a4)
            {
              goto LABEL_44;
            }
            *a4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
            goto LABEL_44;
          }
          if (hap2LogInitialize_onceToken != -1) {
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
          }
          uint64_t v33 = hap2Log_accessory;
          if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
          {
LABEL_36:
            v11 = 0;
LABEL_45:

            goto LABEL_46;
          }
          *(_DWORD *)long long buf = 138412546;
          uint64_t v42 = self;
          __int16 v43 = 2112;
          id v44 = v6;
          uint64_t v34 = "%@ Characteristic %@ valid values range failed to parse";
LABEL_35:
          _os_log_error_impl(&dword_1D4758000, v33, OS_LOG_TYPE_ERROR, v34, buf, 0x16u);
          goto LABEL_36;
        }
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        uint64_t v33 = hap2Log_accessory;
        if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
          goto LABEL_36;
        }
      }
      *(_DWORD *)long long buf = 138412546;
      uint64_t v42 = self;
      __int16 v43 = 2112;
      id v44 = v6;
      uint64_t v34 = "%@ Characteristic %@ valid range failed to parse";
      goto LABEL_35;
    }
  }
LABEL_46:

  return v11;
}

- (id)eventsForData:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  v5 = (HAP2EncodedCharacteristicEvent *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unsigned int v6 = 0;
  *(void *)&long long v7 = 138412802;
  long long v31 = v7;
  uint64_t v32 = a4;
  while (1)
  {
    if (objc_msgSend(v38, "length", v31) <= (unint64_t)v6)
    {
      uint64_t v24 = v5;
      goto LABEL_46;
    }
    v8 = objc_msgSend(v38, "subdataWithRange:", v6, objc_msgSend(v38, "length") - v6);
    uint64_t v9 = -[HAP2AccessoryServerEncodingThread _extractAndValidateControlFieldWithData:expectedType:](self, v8, 2);
    int v10 = v9;
    if (!v9)
    {
      if (!a4) {
        goto LABEL_45;
      }
      uint64_t v27 = 3;
      goto LABEL_44;
    }
    if ((unint64_t)[v9 length] <= 3) {
      break;
    }
    objc_msgSend(v10, "subdataWithRange:", 0, 2);
    id v37 = objc_claimAutoreleasedReturnValue();
    uint64_t v11 = *(unsigned __int16 *)[v37 bytes];
    objc_msgSend(v10, "subdataWithRange:", 2, 2);
    id v36 = objc_claimAutoreleasedReturnValue();
    uint64_t v12 = *(unsigned __int16 *)[v36 bytes];
    id v13 = 0;
    if ([v10 length] >= (unint64_t)(v12 + 4))
    {
      id v13 = objc_msgSend(v10, "subdataWithRange:", 4, v12);
    }
    if ([v13 length])
    {
      unsigned int v35 = v6;
      id v40 = 0;
      uint64_t v14 = +[_HAPAccessoryServerBTLE200 extractSerializedRequestValueFromBodyData:v13 error:&v40];
      unint64_t v15 = (HAP2EncodedCharacteristicEvent *)v40;
      uint64_t v16 = v15;
      uint64_t v34 = (void *)v14;
      if (v14)
      {

        id v39 = 0;
        v17 = +[_HAPAccessoryServerBTLE200 extractNotificationContextFromBodyData:v13 error:&v39];
        id v18 = (HAP2EncodedCharacteristicEvent *)v39;
        uint64_t v16 = v18;
        if (v17 || !v18)
        {
          char v25 = [HAP2EncodedCharacteristicEvent alloc];
          uint64_t v26 = [NSNumber numberWithUnsignedShort:v11];
          id v21 = [(HAP2EncodedCharacteristicEvent *)v25 initWithInstanceID:v26 encodedValueData:v34 encodedContextData:v17];

          if (v21)
          {
            [(HAP2EncodedCharacteristicEvent *)v5 addObject:v21];
            int v20 = 0;
            v35 += v12 + 5;
          }
          else
          {
            if (v32)
            {
              *uint64_t v32 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
            }

            id v21 = 0;
            v5 = 0;
            int v20 = 3;
          }
        }
        else
        {
          if (hap2LogInitialize_onceToken != -1) {
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
          }
          BOOL v19 = hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v31;
            uint64_t v42 = self;
            __int16 v43 = 2112;
            id v44 = v13;
            __int16 v45 = 2112;
            id v46 = v16;
            _os_log_error_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%@ Failed to extract notification context from data: %@ with error: %@", buf, 0x20u);
          }
          int v20 = 3;
          id v21 = v5;
          v5 = 0;
        }
      }
      else
      {
        if (a4)
        {
          uint64_t v16 = v15;
          *a4 = v16;
        }
        int v20 = 3;
        v17 = v5;
        v5 = 0;
      }
      uint64_t v22 = v37;
      uint64_t v24 = v5;

      v5 = v16;
      a4 = v32;
      unsigned int v6 = v35;
      goto LABEL_34;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v22 = v37;
    BOOL v23 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v42 = self;
      __int16 v43 = 2112;
      id v44 = v10;
      _os_log_error_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%@ Invalid event, no data: %@", buf, 0x16u);
      if (!a4)
      {
LABEL_32:
        uint64_t v24 = 0;
        goto LABEL_33;
      }
    }
    else if (!a4)
    {
      goto LABEL_32;
    }
    [MEMORY[0x1E4F28C58] hapErrorWithCode:12];
    uint64_t v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
    int v20 = 3;
LABEL_34:

    v5 = v24;
    if (v20) {
      goto LABEL_46;
    }
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  v28 = hap2Log_accessory;
  if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    if (!a4) {
      goto LABEL_45;
    }
LABEL_43:
    uint64_t v27 = 12;
LABEL_44:
    *a4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:v27];
    goto LABEL_45;
  }
  *(_DWORD *)long long buf = 138412546;
  uint64_t v42 = self;
  __int16 v43 = 2112;
  id v44 = v10;
  _os_log_error_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, "%@ Invalid event, not enough data for header: %@", buf, 0x16u);
  if (a4) {
    goto LABEL_43;
  }
LABEL_45:

  uint64_t v24 = 0;
LABEL_46:
  uint64_t v29 = (void *)[(HAP2EncodedCharacteristicEvent *)v24 copy];

  return v29;
}

- (id)_extractAndValidateControlFieldWithData:(int)a3 expectedType:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  unsigned int v6 = v5;
  if (a1)
  {
    unsigned __int8 v10 = 0;
    if (v5 && [v5 length])
    {
      [v6 getBytes:&v10 length:1];
      unsigned int v7 = (v10 >> 1) & 7;
      if (v7 > 2) {
        unsigned int v7 = 255;
      }
      if (v7 == a3)
      {
        a1 = objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v6, "length") - 1);
        goto LABEL_13;
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v8 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v12 = a1;
        __int16 v13 = 1024;
        int v14 = v10;
        _os_log_error_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%@ Invalid response, control field (%02x) is not a response", buf, 0x12u);
      }
    }
    a1 = 0;
  }
LABEL_13:

  return a1;
}

- (id)requestToListPairingsWithCharacteristic:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v12 = 0;
  unsigned int v7 = +[HAPPairingUtilities createListPairingsRequest:&v12];
  id v8 = v12;
  if (v7)
  {
    uint64_t v9 = -[HAP2AccessoryServerEncodingThread _pairingsRequestWithCharacteristic:bodyValue:threadRequestType:error:]((HAP2EncodedCharacteristicRequestThread *)self, (uint64_t)v6, (uint64_t)v7, 14, (uint64_t)a4);
    goto LABEL_10;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  unsigned __int8 v10 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412546;
    int v14 = self;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_error_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%@ Couldn't serialize list pairing request: %@", buf, 0x16u);
    if (a4) {
      goto LABEL_7;
    }
  }
  else if (a4)
  {
LABEL_7:
    uint64_t v9 = 0;
    *a4 = v8;
    goto LABEL_10;
  }
  uint64_t v9 = 0;
LABEL_10:

  return v9;
}

- (HAP2EncodedCharacteristicRequestThread)_pairingsRequestWithCharacteristic:(uint64_t)a3 bodyValue:(char)a4 threadRequestType:(uint64_t)a5 error:
{
  id v5 = a1;
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = *(void *)&asc_1D4912A48[8 * (a4 - 10)];
    unsigned int v7 = +[HAP2AccessoryServerEncodingThreadBTLERequest writeRequestForCharacteristic:a2 value:a3 authorizationData:0 contextData:0 options:3 error:a5];
    if (v7)
    {
      id v8 = [HAP2EncodedCharacteristicRequestThread alloc];
      v11[0] = v7;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      id v5 = [(HAP2EncodedCharacteristicRequestThread *)v8 initWithBTLERequests:v9 requestType:v6 enforcePDUBodyLength:((unint64_t)[(HAP2EncodedCharacteristicRequestThread *)v5 encodingFeatures] >> 5) & 1];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)requestToAddPairing:(id)a3 characteristic:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v14 = 0;
  uint64_t v9 = +[HAP2EncodingUtils addPairingRequestWithIdentity:a3 error:&v14];
  id v10 = v14;
  if (v9)
  {
    uint64_t v11 = -[HAP2AccessoryServerEncodingThread _pairingsRequestWithCharacteristic:bodyValue:threadRequestType:error:]((HAP2EncodedCharacteristicRequestThread *)self, (uint64_t)v8, (uint64_t)v9, 13, (uint64_t)a5);
    goto LABEL_10;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v12 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412546;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_error_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%@ Couldn't serialize remove request TLVs: %@", buf, 0x16u);
    if (a5) {
      goto LABEL_7;
    }
  }
  else if (a5)
  {
LABEL_7:
    uint64_t v11 = 0;
    *a5 = v10;
    goto LABEL_10;
  }
  uint64_t v11 = 0;
LABEL_10:

  return v11;
}

- (id)requestToRemovePairing:(id)a3 characteristic:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = [a3 identifier];
  id v15 = 0;
  id v10 = +[HAP2EncodingUtils removePairingRequestWithIdentifier:v9 error:&v15];
  id v11 = v15;

  if (v10)
  {
    id v12 = -[HAP2AccessoryServerEncodingThread _pairingsRequestWithCharacteristic:bodyValue:threadRequestType:error:]((HAP2EncodedCharacteristicRequestThread *)self, (uint64_t)v8, (uint64_t)v10, 10, (uint64_t)a5);
    goto LABEL_10;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  __int16 v13 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412546;
    __int16 v17 = self;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_error_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%@ Couldn't serialize remove request TLVs: %@", buf, 0x16u);
    if (a5) {
      goto LABEL_7;
    }
  }
  else if (a5)
  {
LABEL_7:
    id v12 = 0;
    *a5 = v11;
    goto LABEL_10;
  }
  id v12 = 0;
LABEL_10:

  return v12;
}

- (id)unpairedIdentifyRequestWithError:(id *)a3
{
  v3 = [[HAP2EncodedEmptyRequestThread alloc] initWithRequestType:12];

  return v3;
}

- (id)responseForRequest:(id)a3 bodyData:(id)a4 error:(id *)a5
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 type] == 12)
  {
    self = objc_alloc_init(HAP2EncodedEmptyResponseThread);
    goto LABEL_65;
  }
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v8;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    if (v11)
    {
      id v12 = [(HAP2AccessoryServerEncodingThread *)self _parseCharacteristicResponsesWithBodyData:v9 request:v11 error:a5];
      if (!v12)
      {
LABEL_63:
        self = 0;
        goto LABEL_64;
      }
      goto LABEL_36;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v13 = v8;
    }
    else {
      __int16 v13 = 0;
    }
    id v14 = [v13 btleRequest];
    id v15 = [[HAPBTLEResponse alloc] initWithRequest:v14];
    id v69 = v8;
    v71 = v9;
    if (self)
    {
      id v16 = -[HAP2AccessoryServerEncodingThread _extractAndValidateControlFieldWithData:expectedType:](self, v9, 1);
      if (v16)
      {
        *(void *)long long buf = 0;
        uint64_t v17 = [(HAPBTLEResponse *)v15 appendData:v16 error:buf];
        __int16 v18 = objc_msgSend(v16, "subdataWithRange:", v17, objc_msgSend(v16, "length") - v17);
        id v19 = 0;
      }
      else
      {
        id v19 = [MEMORY[0x1E4F28C58] hapErrorWithCode:15];
        __int16 v18 = 0;
      }
    }
    else
    {
      id v19 = 0;
      __int16 v18 = 0;
    }

    id v20 = v19;
    id v21 = v20;
    if (v18)
    {
      if (![v18 length])
      {
        v78 = v15;
        int v25 = 1;
        uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
        goto LABEL_34;
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v22 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = v22;
        uint64_t v27 = [(HAPBTLEResponse *)v15 bodyLength];
        uint64_t v28 = [v71 length];
        *(_DWORD *)long long buf = 138413058;
        *(void *)&uint8_t buf[4] = self;
        __int16 v80 = 2048;
        uint64_t v81 = v27;
        __int16 v82 = 2048;
        uint64_t v83 = v28 - 1;
        __int16 v84 = 2112;
        v85 = v21;
        _os_log_error_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%@ Failed to parse response (read %lu bytes, expected %lu): %@", buf, 0x2Au);

        if (a5) {
          goto LABEL_27;
        }
      }
      else if (a5)
      {
LABEL_27:
        id v23 = [MEMORY[0x1E4F28C58] hapErrorWithCode:15];
LABEL_30:
        uint64_t v24 = 0;
        int v25 = 0;
        *a5 = v23;
LABEL_34:

        if (!v25)
        {
          self = 0;
          id v8 = v69;
          id v9 = v71;
          id v11 = 0;
          id v12 = (void *)v24;
LABEL_64:

          goto LABEL_65;
        }
        id v8 = v69;
        id v9 = v71;
        id v11 = 0;
        id v12 = (void *)v24;
LABEL_36:
        switch([v8 type])
        {
          case 0:
          case 5:
          case 6:
          case 7:
          case 8:
          case 12:
            if (!a5) {
              goto LABEL_63;
            }
            uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v30 = 9;
            goto LABEL_39;
          case 1:
          case 4:
            id v31 = v12;
            v67 = v31;
            if (self)
            {
              uint64_t v32 = v31;
              uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v31, "count"));
              long long v74 = 0u;
              long long v75 = 0u;
              long long v76 = 0u;
              long long v77 = 0u;
              id v34 = v32;
              uint64_t v35 = [v34 countByEnumeratingWithState:&v74 objects:buf count:16];
              if (v35)
              {
                uint64_t v36 = v35;
                uint64_t v37 = *(void *)v75;
                do
                {
                  for (uint64_t i = 0; i != v36; ++i)
                  {
                    if (*(void *)v75 != v37) {
                      objc_enumerationMutation(v34);
                    }
                    id v39 = -[HAP2AccessoryServerEncodingThread _valueResponseFromBTLEResponse:](self, *(void **)(*((void *)&v74 + 1) + 8 * i));
                    [v33 addObject:v39];
                  }
                  uint64_t v36 = [v34 countByEnumeratingWithState:&v74 objects:buf count:16];
                }
                while (v36);
              }

              id v40 = [HAP2EncodedCharacteristicResponse alloc];
              uint64_t v41 = (void *)[v33 copy];
              self = [(HAP2EncodedCharacteristicResponse *)v40 initWithCharacteristics:v41];
            }
            id v12 = v67;

            goto LABEL_64;
          case 2:
            -[HAP2AccessoryServerEncodingThread _readResponseFromBTLEResponses:error:]((HAP2EncodedCharacteristicResponse *)self, v12);
            uint64_t v48 = (HAP2AccessoryServerEncodingThread *)objc_claimAutoreleasedReturnValue();
            goto LABEL_70;
          case 3:
            -[HAP2AccessoryServerEncodingThread _prepareWriteResponseFromBTLEResponses:error:]((HAP2EncodedCharacteristicResponse *)self, v12);
            uint64_t v48 = (HAP2AccessoryServerEncodingThread *)objc_claimAutoreleasedReturnValue();
LABEL_70:
            self = v48;
            break;
          case 9:
            __int16 v49 = [v12 objectAtIndexedSubscript:0];
            -[HAP2AccessoryServerEncodingThread _attributeDatabaseResponseFromBTLEResponse:error:]((HAP2EncodedAttributeDatabaseResponseThread *)self, v49, a5);
            self = (HAP2AccessoryServerEncodingThread *)objc_claimAutoreleasedReturnValue();

            break;
          case 10:
          case 11:
            id v42 = v12;
            id v70 = v8;
            id v72 = v9;
            id v66 = v11;
            v68 = v42;
            if (self)
            {
              __int16 v43 = v42;
              v73 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v42, "count"));
              if (([(HAP2AccessoryServerEncodingThread *)self encodingFeatures] & 4) != 0)
              {
                id v44 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", (unint64_t)objc_msgSend(v43, "count") >> 1);
              }
              else
              {
                id v44 = 0;
              }
              long long v76 = 0u;
              long long v77 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              id v51 = v43;
              uint64_t v52 = [v51 countByEnumeratingWithState:&v74 objects:buf count:16];
              if (v52)
              {
                uint64_t v53 = v52;
                uint64_t v54 = *(void *)v75;
                do
                {
                  for (uint64_t j = 0; j != v53; ++j)
                  {
                    if (*(void *)v75 != v54) {
                      objc_enumerationMutation(v51);
                    }
                    v56 = *(void **)(*((void *)&v74 + 1) + 8 * j);
                    v57 = [v56 request];
                    int v58 = [v57 type];

                    if (v58 == 3)
                    {
                      v59 = -[HAP2AccessoryServerEncodingThread _valueResponseFromBTLEResponse:](self, v56);
                      [v44 addObject:v59];
                    }
                    else
                    {
                      v59 = -[HAP2AccessoryServerEncodingThread _errorIfResponseInvalid:](self, v56);
                      v60 = [v56 request];
                      v61 = [v60 characteristic];
                      v62 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v61 error:v59];

                      [v73 addObject:v62];
                    }
                  }
                  uint64_t v53 = [v51 countByEnumeratingWithState:&v74 objects:buf count:16];
                }
                while (v53);
              }

              v63 = [HAP2EncodedEnableNotificationResponse alloc];
              v64 = (void *)[v73 copy];
              v65 = (void *)[v44 copy];
              self = [(HAP2EncodedEnableNotificationResponse *)v63 initWithNotificationResponses:v64 updatedValues:v65];
            }
            id v12 = v68;

            id v8 = v70;
            id v9 = v72;
            id v11 = v66;
            break;
          case 13:
          case 14:
            id v45 = [v12 objectAtIndexedSubscript:0];
            if (self)
            {
              id v46 = -[HAP2AccessoryServerEncodingThread _extractResponseBodyFromBTLEResponse:request:error:](self, v45, a5);
              if (v46
                && +[HAP2EncodingUtils parseAddOrRemovePairingRequestResponse:v46 error:a5])
              {
                self = [[HAP2EncodedResponseThread alloc] initWithBTLEResponse:v45];
              }
              else
              {
                self = 0;
              }
            }
            break;
          case 15:
            id v50 = [v12 objectAtIndexedSubscript:0];
            -[HAP2AccessoryServerEncodingThread _listPairingsResponseFromBTLEResponse:request:error:]((HAP2EncodedListPairingsResponseThread *)self, v50, a5);
            self = (HAP2AccessoryServerEncodingThread *)objc_claimAutoreleasedReturnValue();

            break;
          default:
            if (!a5) {
              goto LABEL_63;
            }
            uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v30 = 1;
LABEL_39:
            [v29 hapErrorWithCode:v30];
            self = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            break;
        }
        goto LABEL_64;
      }
    }
    else if (a5)
    {
      id v23 = v20;
      goto LABEL_30;
    }
    uint64_t v24 = 0;
    int v25 = 0;
    goto LABEL_34;
  }
  if (a5)
  {
    [MEMORY[0x1E4F28C58] hapErrorWithCode:15];
    self = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    self = 0;
  }
LABEL_65:

  return self;
}

- (HAP2EncodedCharacteristicResponse)_readResponseFromBTLEResponses:(HAP2EncodedCharacteristicResponse *)a1 error:(void *)a2
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = -[HAP2AccessoryServerEncodingThread _valueResponseFromBTLEResponse:](a1, *(void **)(*((void *)&v15 + 1) + 8 * i));
          objc_msgSend(v5, "addObject:", v11, (void)v15);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    id v12 = [HAP2EncodedCharacteristicResponse alloc];
    __int16 v13 = (void *)[v5 copy];
    a1 = [(HAP2EncodedCharacteristicResponse *)v12 initWithCharacteristics:v13];
  }

  return a1;
}

- (HAP2EncodedCharacteristicResponse)_prepareWriteResponseFromBTLEResponses:(HAP2EncodedCharacteristicResponse *)a1 error:(void *)a2
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v23 = v3;
  if (a1)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count", v3));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v11 = [v10 request];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = [v10 request];
          }
          else
          {
            id v12 = 0;
          }

          id v13 = v10;
          id v14 = [v13 request];
          long long v15 = [v13 request];
          long long v16 = [v15 characteristic];

          long long v17 = -[HAP2AccessoryServerEncodingThread _errorIfResponseInvalid:](a1, v13);

          if (v17) {
            long long v18 = v17;
          }
          else {
            long long v18 = 0;
          }
          id v19 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v16 error:v18];

          [v5 addObject:v19];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v7);
    }

    uint64_t v20 = [HAP2EncodedCharacteristicResponse alloc];
    id v21 = (void *)[v5 copy];
    a1 = [(HAP2EncodedCharacteristicResponse *)v20 initWithCharacteristics:v21];
  }

  return a1;
}

- (HAP2EncodedAttributeDatabaseResponseThread)_attributeDatabaseResponseFromBTLEResponse:(void *)a3 error:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000;
    id v31 = __Block_byref_object_copy__2002;
    uint64_t v32 = __Block_byref_object_dispose__2003;
    id v33 = 0;
    uint64_t v7 = [v5 body];
    uint64_t v8 = (id *)(v29 + 5);
    id obj = (id)v29[5];
    uint64_t v9 = [(HAP2EncodedAttributeDatabaseResponseThread *)a1 _parseTopLevelAttributeDatabaseFromData:v7 error:&obj];
    objc_storeStrong(v8, obj);

    if (v9)
    {
      id v10 = [v9 accessoryList];
      if (v10)
      {
        *(void *)long long buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        id v39 = __Block_byref_object_copy__2002;
        id v40 = __Block_byref_object_dispose__2003;
        id v11 = objc_alloc(MEMORY[0x1E4F1CA60]);
        id v12 = [v10 accessorySignatureList];
        id v41 = (id)objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

        id v13 = [v10 accessorySignatureList];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __86__HAP2AccessoryServerEncodingThread__attributeDatabaseResponseFromBTLEResponse_error___block_invoke;
        v26[3] = &unk_1E69F0B58;
        v26[4] = a1;
        v26[5] = &v28;
        v26[6] = buf;
        [v13 enumerateObjectsUsingBlock:v26];

        id v14 = *(void **)(*(void *)&buf[8] + 40);
        long long v15 = [NSNumber numberWithUnsignedInteger:1];
        long long v16 = [v14 objectForKey:v15];
        LODWORD(v14) = v16 == 0;

        if (v14)
        {
          if (hap2LogInitialize_onceToken != -1) {
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
          }
          long long v17 = hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id v34 = 138412546;
            uint64_t v35 = a1;
            __int16 v36 = 2112;
            uint64_t v37 = v10;
            _os_log_error_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%@ Attribute database response doesn't contain primary accessory: %@", v34, 0x16u);
          }
          uint64_t v18 = [MEMORY[0x1E4F28C58] hapErrorWithCode:15];
          id v19 = (void *)v29[5];
          v29[5] = v18;
        }
        uint64_t v20 = (void *)v29[5];
        if (v20)
        {
          a1 = 0;
          if (a3) {
            *a3 = v20;
          }
        }
        else
        {
          id v23 = [HAP2EncodedAttributeDatabaseResponseThread alloc];
          a1 = [(HAP2EncodedAttributeDatabaseResponseThread *)v23 initWithBTLEResponse:v6 attributeDatabase:*(void *)(*(void *)&buf[8] + 40)];
        }
        _Block_object_dispose(buf, 8);

        goto LABEL_25;
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v22 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_error_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%@ Attribute database contains no accessory list: %@", buf, 0x16u);
        if (a3) {
          goto LABEL_22;
        }
      }
      else if (a3)
      {
LABEL_22:
        [MEMORY[0x1E4F28C58] hapErrorWithCode:15];
        a1 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

        goto LABEL_26;
      }
      a1 = 0;
      goto LABEL_25;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v21 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = v29[5];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v25;
      _os_log_error_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%@ Failed to parse attribute database: %@", buf, 0x16u);
      if (a3) {
        goto LABEL_17;
      }
    }
    else if (a3)
    {
LABEL_17:
      [MEMORY[0x1E4F28C58] hapErrorWithCode:7 description:@"Invalid Response." reason:@"Failed to parse attribute database." suggestion:0 underlyingError:v29[5]];
      a1 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

      _Block_object_dispose(&v28, 8);
      goto LABEL_27;
    }
    a1 = 0;
    goto LABEL_26;
  }
LABEL_27:

  return a1;
}

- (HAP2EncodedListPairingsResponseThread)_listPairingsResponseFromBTLEResponse:(HAP2EncodedListPairingsResponseThread *)a1 request:(void *)a2 error:(void *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = -[HAP2AccessoryServerEncodingThread _extractResponseBodyFromBTLEResponse:request:error:](a1, v5, a3);
    if (!v6)
    {
      if (a3)
      {
        [MEMORY[0x1E4F28C58] hapErrorWithCode:15];
        a1 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        a1 = 0;
      }
      goto LABEL_16;
    }
    id v11 = 0;
    uint64_t v7 = +[HAPPairingUtilities parseListPairingsResponse:v6 error:&v11];
    id v8 = v11;
    if (v7)
    {
      a1 = [[HAP2EncodedListPairingsResponseThread alloc] initWithBTLEResponse:v5 pairings:v7];
LABEL_15:

LABEL_16:
      goto LABEL_17;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v9 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v13 = a1;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_error_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%@ Unable to parse list pairings response: %@", buf, 0x16u);
      if (a3) {
        goto LABEL_11;
      }
    }
    else if (a3)
    {
LABEL_11:
      a1 = 0;
      *a3 = v8;
      goto LABEL_15;
    }
    a1 = 0;
    goto LABEL_15;
  }
LABEL_17:

  return a1;
}

- (id)_extractResponseBodyFromBTLEResponse:(void *)a1 request:(void *)a2 error:(void *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = -[HAP2AccessoryServerEncodingThread _valueResponseFromBTLEResponse:](a1, v5);
  uint64_t v7 = [v6 error];

  if (!v7)
  {
    id v10 = [v5 request];
    id v11 = [v10 characteristic];

    id v12 = [v11 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v11 value];
    }
    else
    {
      uint64_t v9 = 0;
    }

    [v11 setValue:0];
    if (v9)
    {
      id v13 = v9;
LABEL_17:

      goto LABEL_20;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    __int16 v14 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      id v19 = a1;
      _os_log_error_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%@ Invalid type for HAP2 request", (uint8_t *)&v18, 0xCu);
      if (!a3) {
        goto LABEL_17;
      }
    }
    else if (!a3)
    {
      goto LABEL_17;
    }
    *a3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:15];
    goto LABEL_17;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  id v8 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    id v15 = v8;
    uint64_t v16 = [v6 error];
    int v18 = 138412546;
    id v19 = a1;
    __int16 v20 = 2112;
    id v21 = v16;
    _os_log_error_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%@ Unable to parse pairing response: %@", (uint8_t *)&v18, 0x16u);

    if (a3) {
      goto LABEL_6;
    }
  }
  else if (a3)
  {
LABEL_6:
    [v6 error];
    uint64_t v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  uint64_t v9 = 0;
LABEL_20:

  return v9;
}

- (id)_valueResponseFromBTLEResponse:(void *)a1
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 request];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 request];
  }
  else
  {
    id v5 = 0;
  }

  uint64_t v6 = [v3 request];
  uint64_t v7 = [v6 characteristic];

  id v8 = -[HAP2AccessoryServerEncodingThread _errorIfResponseInvalid:](a1, v3);
  if (v8)
  {
    [v7 setValue:0];
    [v7 setNotificationContext:0];
    uint64_t v9 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v7 error:v8];
    goto LABEL_35;
  }
  id v10 = [v3 body];

  int v11 = [v5 type];
  if (!v10)
  {
    if (v11 == 3)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v23 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        id v33 = v23;
        id v34 = [v7 type];
        uint64_t v35 = +[HAPCharacteristic hap2_shortTypeFromUUID:v34];
        __int16 v36 = [v7 instanceID];
        *(_DWORD *)long long buf = 138412802;
        uint64_t v52 = a1;
        __int16 v53 = 2112;
        uint64_t v54 = v35;
        __int16 v55 = 2112;
        v56 = v36;
        _os_log_error_impl(&dword_1D4758000, v33, OS_LOG_TYPE_ERROR, "%@ Read response for %@ [%@] does not contain a value", buf, 0x20u);
      }
      [v7 setValue:0];
      [v7 setNotificationContext:0];
      id v13 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12];
      uint64_t v9 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v7 error:v13];
      goto LABEL_34;
    }
    goto LABEL_23;
  }
  if (v11 != 3 && ([v5 writeOptions] & 2) == 0)
  {
LABEL_23:
    id v13 = [v5 requestedValue];

    if (v13)
    {
      uint64_t v24 = [v5 requestedValue];
      [v7 setValue:v24];

      [v7 setNotificationContext:0];
      id v13 = 0;
    }
    id v21 = 0;
    goto LABEL_26;
  }
  id v12 = [v3 body];
  id v50 = 0;
  id v13 = +[_HAPAccessoryServerBTLE200 extractSerializedRequestValueFromBodyData:v12 error:&v50];
  id v14 = v50;

  if (!v13)
  {
    [v7 setValue:0];
    [v7 setNotificationContext:0];
    uint64_t v9 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v7 error:v14];
    id v13 = v14;
    goto LABEL_34;
  }

  id v15 = [v5 characteristic];
  uint64_t v16 = [v15 metadata];
  long long v17 = [v16 format];
  uint64_t v18 = HAPCharacteristicFormatFromString(v17);

  if (!v18)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v25 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      id v39 = v25;
      id v40 = [v7 type];
      id v41 = +[HAPCharacteristic hap2_shortTypeFromUUID:v40];
      uint64_t v42 = [v7 instanceID];
      *(_DWORD *)long long buf = 138412802;
      uint64_t v52 = a1;
      __int16 v53 = 2112;
      uint64_t v54 = v41;
      __int16 v55 = 2112;
      v56 = v42;
      _os_log_error_impl(&dword_1D4758000, v39, OS_LOG_TYPE_ERROR, "%@ No format for characteristic %@ [%@]", buf, 0x20u);
    }
    [v7 setValue:0];
    [v7 setNotificationContext:0];
    long long v26 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12];
    uint64_t v9 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v7 error:v26];

    goto LABEL_34;
  }
  id v49 = 0;
  id v19 = [a1 decodeBodyData:v13 format:v18 error:&v49];
  id v20 = v49;
  if (v20)
  {
    id v21 = v20;
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v22 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      id v45 = v22;
      uint64_t v47 = [v7 type];
      uint64_t v37 = +[HAPCharacteristic hap2_shortTypeFromUUID:v47];
      id v38 = [v7 instanceID];
      *(_DWORD *)long long buf = 138413058;
      uint64_t v52 = a1;
      __int16 v53 = 2112;
      uint64_t v54 = v37;
      __int16 v55 = 2112;
      v56 = v38;
      __int16 v57 = 2112;
      int v58 = v21;
      _os_log_error_impl(&dword_1D4758000, v45, OS_LOG_TYPE_ERROR, "%@ Decoding value for characteristic %@ [%@] failed with error: %@", buf, 0x2Au);
    }
    [v7 setValue:0];
    [v7 setNotificationContext:0];
    uint64_t v9 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v7 error:v21];

    goto LABEL_27;
  }
  [v7 setValue:v19];
  if ([v5 type] == 3 && (objc_msgSend(v7, "properties") & 0x100) != 0)
  {
    uint64_t v28 = [v3 body];
    id v48 = 0;
    id v21 = +[_HAPAccessoryServerBTLE200 extractNotificationContextFromBodyData:v28 error:&v48];
    id v29 = v48;

    if (v21)
    {
      [v7 setNotificationContext:v21];
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v30 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        id v46 = v29;
        log = v30;
        os_log_t v44 = [v7 type];
        id v31 = +[HAPCharacteristic hap2_shortTypeFromUUID:v44];
        uint64_t v32 = [v7 instanceID];
        *(_DWORD *)long long buf = 138413058;
        uint64_t v52 = a1;
        __int16 v53 = 2112;
        uint64_t v54 = v31;
        __int16 v55 = 2112;
        v56 = v32;
        __int16 v57 = 2112;
        int v58 = v21;
        _os_log_impl(&dword_1D4758000, log, OS_LOG_TYPE_INFO, "%@ Response for characteristic %@ [%@] contains notification context %@", buf, 0x2Au);

        id v29 = v46;
      }
    }
  }
  else
  {
    id v21 = 0;
  }

LABEL_26:
  uint64_t v9 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v7 error:0];
LABEL_27:

LABEL_34:
LABEL_35:

  return v9;
}

- (id)_errorIfResponseInvalid:(void *)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 request];
  id v5 = [v4 characteristic];

  if (([v3 isValid] & 1) == 0)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v12 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v12;
      long long v17 = [v5 type];
      uint64_t v18 = +[HAPCharacteristic hap2_shortTypeFromUUID:v17];
      id v19 = [v5 instanceID];
      int v28 = 138412802;
      id v29 = v18;
      __int16 v30 = 2112;
      id v31 = v19;
      __int16 v32 = 2112;
      id v33 = a1;
      _os_log_error_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%@ Response for %@ [%@] is invalid", (uint8_t *)&v28, 0x20u);
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = 2;
    goto LABEL_24;
  }
  int v6 = [v3 statusCode];
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v7 = (void *)hap2Log_accessory;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      id v20 = v7;
      id v21 = [v5 type];
      uint64_t v22 = +[HAPCharacteristic hap2_shortTypeFromUUID:v21];
      id v23 = [v5 instanceID];
      int v28 = 138413058;
      id v29 = a1;
      __int16 v30 = 2112;
      id v31 = v22;
      __int16 v32 = 2112;
      id v33 = v23;
      __int16 v34 = 1024;
      int v35 = [v3 statusCode];
      _os_log_error_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%@ Response for characteristic: %@ [%@] contains a HAP status failure code: 0x%02x", (uint8_t *)&v28, 0x26u);
    }
    id v8 = (void *)MEMORY[0x1E4F28C58];
    unsigned int v9 = [v3 statusCode];
    uint64_t v10 = v9;
    uint64_t v11 = 3;
    switch(v9)
    {
      case 0u:
        goto LABEL_23;
      case 1u:
      case 6u:
        goto LABEL_22;
      case 2u:
        uint64_t v11 = 5;
        goto LABEL_22;
      case 3u:
        uint64_t v11 = 16;
        goto LABEL_22;
      case 4u:
        uint64_t v11 = 9;
        goto LABEL_22;
      case 5u:
        uint64_t v11 = 17;
        goto LABEL_22;
      case 8u:
        uint64_t v11 = 31;
        goto LABEL_22;
      default:
        uint64_t v11 = 1;
LABEL_22:
        uint64_t v10 = v11;
LABEL_23:
        id v13 = v8;
        break;
    }
LABEL_24:
    id v14 = [v13 hapErrorWithCode:v10];
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = v7;
    uint64_t v25 = [v5 type];
    long long v26 = +[HAPCharacteristic hap2_shortTypeFromUUID:v25];
    long long v27 = [v5 instanceID];
    int v28 = 138412802;
    id v29 = a1;
    __int16 v30 = 2112;
    id v31 = v26;
    __int16 v32 = 2112;
    id v33 = v27;
    _os_log_debug_impl(&dword_1D4758000, v24, OS_LOG_TYPE_DEBUG, "%@ Response for characteristic %@ [%@] contains a HAP status success code", (uint8_t *)&v28, 0x20u);
  }
  id v14 = 0;
LABEL_25:

  return v14;
}

void __86__HAP2AccessoryServerEncodingThread__attributeDatabaseResponseFromBTLEResponse_error___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = [v6 accessoryID];
  id v8 = [v7 value];

  if (!v8)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v11 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = a1[4];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v36;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_error_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%@ Accessory contains no accessory id: %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  if (![v8 unsignedIntValue])
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    id v12 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = a1[4];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v40;
      _os_log_error_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%@ Invalid accessory ID 0", buf, 0xCu);
    }
    goto LABEL_18;
  }
  unsigned int v9 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKey:v8];

  if (!v9)
  {
    uint64_t v16 = [v6 serviceList];
    long long v17 = [v16 serviceSignatureList];

    if (!v17)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      __int16 v32 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        uint64_t v41 = a1[4];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_error_impl(&dword_1D4758000, v32, OS_LOG_TYPE_ERROR, "%@ Attribute database contains no service list for accessory: %@", buf, 0x16u);
      }
      uint64_t v33 = [MEMORY[0x1E4F28C58] hapErrorWithCode:15];
      uint64_t v34 = *(void *)(a1[5] + 8);
      int v35 = *(void **)(v34 + 40);
      *(void *)(v34 + 40) = v33;

      *a4 = 1;
      goto LABEL_50;
    }
    uint64_t v18 = (void *)a1[4];
    uint64_t v19 = *(void *)(a1[5] + 8);
    id obj = *(id *)(v19 + 40);
    id v20 = [v18 _parseServiceList:v17 error:&obj];
    objc_storeStrong((id *)(v19 + 40), obj);
    id v46 = (void *)[v20 copy];

    if (!v46) {
      goto LABEL_44;
    }
    uint64_t v21 = a1[4];
    uint64_t v22 = *(void *)(a1[5] + 8);
    id v23 = *(id *)(v22 + 40);
    location = (id *)(v22 + 40);
    id v24 = v46;
    uint64_t v25 = v24;
    if (!v21)
    {

      objc_storeStrong(location, v23);
      goto LABEL_44;
    }
    long long v26 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", 5 * objc_msgSend(v24, "count"));
    uint64_t v54 = 0;
    __int16 v55 = &v54;
    uint64_t v56 = 0x3032000000;
    __int16 v57 = __Block_byref_object_copy__2002;
    int v58 = __Block_byref_object_dispose__2003;
    id v59 = 0;
    uint64_t v50 = 0;
    id v51 = &v50;
    uint64_t v52 = 0x2020000000;
    char v53 = 0;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    char v49 = 0;
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __67__HAP2AccessoryServerEncodingThread__validateParsedServices_error___block_invoke;
    v65 = &unk_1E69F0B30;
    v67 = &v50;
    v68 = v48;
    id v27 = v26;
    id v66 = v27;
    id v69 = &v54;
    [v25 enumerateObjectsUsingBlock:buf];
    if (*((unsigned char *)v51 + 24))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v28 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_37;
      }
      *(_DWORD *)v60 = 138412290;
      uint64_t v61 = v21;
      id v29 = "%@ Invalid instanceID encountered";
      __int16 v30 = v28;
      uint32_t v31 = 12;
    }
    else
    {
      if (!v55[5])
      {
        char v38 = 1;
LABEL_38:

        _Block_object_dispose(v48, 8);
        _Block_object_dispose(&v50, 8);
        _Block_object_dispose(&v54, 8);

        objc_storeStrong(location, v23);
        if (v38)
        {
          [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v25 forKey:v8];
LABEL_49:

LABEL_50:
          goto LABEL_19;
        }
LABEL_44:
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        __int16 v43 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          uint64_t v44 = a1[4];
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v44;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v6;
          _os_log_error_impl(&dword_1D4758000, v43, OS_LOG_TYPE_ERROR, "%@ Attribute database contains invalid service list for accessory: %@", buf, 0x16u);
        }
        *a4 = 1;
        goto LABEL_49;
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v37 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
LABEL_37:
        objc_msgSend(MEMORY[0x1E4F28C58], "hapErrorWithCode:", 7, v21, location);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        char v38 = 0;
        goto LABEL_38;
      }
      uint64_t v42 = v55[5];
      *(_DWORD *)v60 = 138412546;
      uint64_t v61 = v21;
      __int16 v62 = 2112;
      uint64_t v63 = v42;
      id v29 = "%@ Multiple items with the same instanceID: %@";
      __int16 v30 = v37;
      uint32_t v31 = 22;
    }
    _os_log_error_impl(&dword_1D4758000, v30, OS_LOG_TYPE_ERROR, v29, v60, v31);
    goto LABEL_37;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v10 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    uint64_t v39 = a1[4];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v39;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_error_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%@ Attribute database contains duplicate accessory entries: %@", buf, 0x16u);
  }
LABEL_18:
  uint64_t v13 = [MEMORY[0x1E4F28C58] hapErrorWithCode:15];
  uint64_t v14 = *(void *)(a1[5] + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  *a4 = 1;
LABEL_19:
}

void __67__HAP2AccessoryServerEncodingThread__validateParsedServices_error___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 instanceID];
  uint64_t v8 = [v7 unsignedIntegerValue];

  if (!v8)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    uint64_t v14 = *(void *)(a1[6] + 8);
    goto LABEL_5;
  }
  unsigned int v9 = (void *)a1[4];
  uint64_t v10 = [v6 instanceID];
  LODWORD(v9) = [v9 containsObject:v10];

  if (v9)
  {
    uint64_t v11 = [v6 instanceID];
    uint64_t v12 = *(void *)(a1[7] + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = *(void *)(a1[6] + 8);
LABEL_5:
    *(unsigned char *)(v14 + 24) = 1;
    *a4 = 1;
    goto LABEL_9;
  }
  id v15 = (void *)a1[4];
  uint64_t v16 = [v6 instanceID];
  [v15 addObject:v16];

  long long v17 = [v6 characteristics];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__HAP2AccessoryServerEncodingThread__validateParsedServices_error___block_invoke_2;
  v20[3] = &unk_1E69F0B08;
  uint64_t v22 = a1[6];
  long long v19 = *((_OWORD *)a1 + 2);
  id v18 = (id)v19;
  long long v21 = v19;
  uint64_t v23 = a1[7];
  [v17 enumerateObjectsUsingBlock:v20];

  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    *a4 = 1;
  }

LABEL_9:
}

void __67__HAP2AccessoryServerEncodingThread__validateParsedServices_error___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  id v6 = [v16 instanceID];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (!v7)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    uint64_t v13 = *(void *)(a1[6] + 8);
    goto LABEL_5;
  }
  uint64_t v8 = (void *)a1[4];
  unsigned int v9 = [v16 instanceID];
  LODWORD(v8) = [v8 containsObject:v9];

  if (v8)
  {
    uint64_t v10 = [v16 instanceID];
    uint64_t v11 = *(void *)(a1[7] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = *(void *)(a1[6] + 8);
LABEL_5:
    *(unsigned char *)(v13 + 24) = 1;
    *a4 = 1;
    goto LABEL_7;
  }
  uint64_t v14 = (void *)a1[4];
  id v15 = [v16 instanceID];
  [v14 addObject:v15];

LABEL_7:
}

- (id)_parseCharacteristicResponsesWithBodyData:(id)a3 request:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unsigned int v9 = [a4 btleRequests];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __93__HAP2AccessoryServerEncodingThread__parseCharacteristicResponsesWithBodyData_request_error___block_invoke;
  v44[3] = &unk_1E69F0C10;
  id v11 = v10;
  id v45 = v11;
  [v9 enumerateObjectsUsingBlock:v44];
  id v12 = v8;
  uint64_t v41 = v9;
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v40 = v12;
  id v14 = v12;
  while (1)
  {
    if (!objc_msgSend(v14, "length", v40) || !objc_msgSend(v11, "count"))
    {
      if (![v14 length])
      {
        if ([v11 count])
        {
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __93__HAP2AccessoryServerEncodingThread__parseCharacteristicResponsesWithBodyData_request_error___block_invoke_55;
          v42[3] = &unk_1E69F0A90;
          id v43 = v13;
          [v11 enumerateKeysAndObjectsUsingBlock:v42];
        }
        int v35 = (void *)[v13 copy];
        goto LABEL_38;
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint32_t v31 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        __int16 v32 = v31;
        int v33 = [v14 length];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v47 = self;
        __int16 v48 = 1024;
        int v49 = v33;
        _os_log_error_impl(&dword_1D4758000, v32, OS_LOG_TYPE_ERROR, "%@ Found %u extra bytes of incoming PDU data", buf, 0x12u);
      }
      goto LABEL_24;
    }
    id v15 = -[HAP2AccessoryServerEncodingThread _extractAndValidateControlFieldWithData:expectedType:](self, v14, 1);

    if (!v15)
    {
      if (!a5)
      {
        id v14 = 0;
        goto LABEL_37;
      }
      id v34 = [MEMORY[0x1E4F28C58] hapErrorWithCode:15];
      id v14 = 0;
LABEL_26:
      int v35 = 0;
      *a5 = v34;
      goto LABEL_38;
    }
    id v14 = v15;
    if (![v14 length])
    {

LABEL_24:
      if (!a5) {
        goto LABEL_37;
      }
      id v34 = [MEMORY[0x1E4F28C58] hapErrorWithCode:15];
      goto LABEL_26;
    }
    buf[0] = 0;
    [v14 getBytes:buf length:1];
    id v16 = [NSNumber numberWithUnsignedChar:buf[0]];

    if (!v16) {
      goto LABEL_24;
    }
    uint64_t v17 = [v11 objectForKeyedSubscript:v16];
    if (!v17) {
      break;
    }
    id v18 = (void *)v17;
    [v11 removeObjectForKey:v16];
    id v14 = v14;
    if (!self
      || (long long v19 = v14, ([(HAP2AccessoryServerEncodingThread *)self encodingFeatures] & 0x20) == 0))
    {
      long long v19 = v14;
      if (([v18 expectsResponseBody] & 1) == 0)
      {
        long long v19 = objc_msgSend(v14, "subdataWithRange:", 0, 2);
      }
    }
    id v20 = [[HAPBTLEResponse alloc] initWithRequest:v18];
    uint64_t v21 = [(HAPBTLEResponse *)v20 appendData:v19 error:a5];
    if (v21)
    {
      [v13 addObject:v20];
      uint64_t v22 = objc_msgSend(v14, "subdataWithRange:", v21, objc_msgSend(v14, "length") - v21);
      uint64_t v23 = v14;
      id v24 = v16;
      uint64_t v25 = self;
      id v26 = v11;
      id v27 = a5;
      uint64_t v28 = v13;
      uint64_t v29 = v22;

      __int16 v30 = (void *)v29;
      uint64_t v13 = v28;
      a5 = v27;
      id v11 = v26;
      self = v25;
      id v16 = v24;
      id v14 = v30;
    }

    if (!v21) {
      goto LABEL_37;
    }
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v36 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    char v38 = v36;
    int v39 = [v16 unsignedIntValue];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v47 = self;
    __int16 v48 = 1024;
    int v49 = v39;
    _os_log_error_impl(&dword_1D4758000, v38, OS_LOG_TYPE_ERROR, "%@ Unable to match request to response (tid: %x)", buf, 0x12u);

    if (a5)
    {
LABEL_31:
      *a5 = [MEMORY[0x1E4F28C58] hapErrorWithCode:15];
    }
  }
  else if (a5)
  {
    goto LABEL_31;
  }

LABEL_37:
  int v35 = 0;
LABEL_38:

  return v35;
}

void __93__HAP2AccessoryServerEncodingThread__parseCharacteristicResponsesWithBodyData_request_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = NSNumber;
  id v4 = a2;
  id v6 = [v4 identifier];
  id v5 = objc_msgSend(v3, "numberWithUnsignedChar:", objc_msgSend(v6, "unsignedCharValue"));
  [v2 setObject:v4 forKeyedSubscript:v5];
}

void __93__HAP2AccessoryServerEncodingThread__parseCharacteristicResponsesWithBodyData_request_error___block_invoke_55(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [[HAPBTLEResponse alloc] initWithRequest:v4];

  [*(id *)(a1 + 32) addObject:v5];
}

- (id)notificationRequestsForCharacteristics:(id)a3 type:(unint64_t)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a4 == 1)
  {
    char v7 = 12;
    uint64_t v8 = 11;
  }
  else if (a4)
  {
    uint64_t v8 = 0;
    char v7 = 0;
  }
  else
  {
    char v7 = 11;
    uint64_t v8 = 10;
  }
  unsigned int v9 = (void *)MEMORY[0x1E4F1CA80];
  id v10 = a3;
  id v11 = objc_msgSend(v9, "setWithCapacity:", 2 * objc_msgSend(v10, "count"));
  id v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __87__HAP2AccessoryServerEncodingThread_notificationRequestsForCharacteristics_type_error___block_invoke;
  v21[3] = &unk_1E69F0A68;
  char v25 = v7;
  v21[4] = self;
  id v22 = v11;
  id v23 = v12;
  unint64_t v24 = a4;
  id v13 = v12;
  id v14 = v11;
  [v10 enumerateObjectsUsingBlock:v21];

  id v15 = v13;
  if (self)
  {
    if (([(HAP2AccessoryServerEncodingThread *)self encodingFeatures] & 4) != 0)
    {
      id v18 = [HAP2EncodedCharacteristicRequestThread alloc];
      long long v19 = (void *)[v15 copy];
      uint64_t v17 = [(HAP2EncodedCharacteristicRequestThread *)v18 initWithBTLERequests:v19 requestType:v8 enforcePDUBodyLength:([(HAP2AccessoryServerEncodingThread *)self encodingFeatures] >> 5) & 1];

      v26[0] = v17;
      self = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    }
    else
    {
      id v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __77__HAP2AccessoryServerEncodingThread__hapRequestsForBTLERequests_requestType___block_invoke;
      v26[3] = &unk_1E69F09F0;
      uint64_t v28 = self;
      uint64_t v29 = v8;
      id v27 = v16;
      uint64_t v17 = v16;
      [v15 enumerateObjectsUsingBlock:v26];
      self = (HAP2AccessoryServerEncodingThread *)[(HAP2EncodedCharacteristicRequestThread *)v17 copy];
    }
  }

  return self;
}

void __87__HAP2AccessoryServerEncodingThread_notificationRequestsForCharacteristics_type_error___block_invoke(uint64_t a1, void *a2)
{
  id v26 = a2;
  id v3 = 0;
  do
  {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
    id v5 = *(void **)(a1 + 32);
    if (v5) {
      unint64_t v6 = ((unint64_t)[v5 encodingFeatures] >> 5) & 1;
    }
    else {
      unint64_t v6 = 0;
    }
    char v7 = +[HAP2AccessoryServerEncodingThreadBTLERequest notificationRequestForCharacteristic:v26 threadRequestType:v4 enforcePDUBodyLength:v6];

    uint64_t v8 = *(void **)(a1 + 40);
    unsigned int v9 = NSNumber;
    id v10 = [v7 identifier];
    id v11 = objc_msgSend(v9, "numberWithUnsignedChar:", objc_msgSend(v10, "unsignedCharValue"));
    LOBYTE(v8) = [v8 containsObject:v11];

    id v3 = v7;
  }
  while ((v8 & 1) != 0);
  [*(id *)(a1 + 48) addObject:v7];
  id v12 = *(void **)(a1 + 40);
  id v13 = NSNumber;
  id v14 = [v7 identifier];
  id v15 = objc_msgSend(v13, "numberWithUnsignedChar:", objc_msgSend(v14, "unsignedCharValue"));
  [v12 addObject:v15];

  if (!*(void *)(a1 + 56) && ([*(id *)(a1 + 32) encodingFeatures] & 4) != 0)
  {
    id v16 = 0;
    do
    {
      uint64_t v17 = v16;
      id v16 = +[HAP2AccessoryServerEncodingThreadBTLERequest readRequestForCharacteristic:v26];

      id v18 = *(void **)(a1 + 40);
      long long v19 = NSNumber;
      id v20 = [v16 identifier];
      uint64_t v21 = objc_msgSend(v19, "numberWithUnsignedChar:", objc_msgSend(v20, "unsignedCharValue"));
      LOBYTE(v18) = [v18 containsObject:v21];
    }
    while ((v18 & 1) != 0);
    id v22 = *(void **)(a1 + 40);
    id v23 = NSNumber;
    unint64_t v24 = [v16 identifier];
    char v25 = objc_msgSend(v23, "numberWithUnsignedChar:", objc_msgSend(v24, "unsignedCharValue"));
    [v22 addObject:v25];

    [*(id *)(a1 + 48) addObject:v16];
  }
}

void __77__HAP2AccessoryServerEncodingThread__hapRequestsForBTLERequests_requestType___block_invoke(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  id v5 = [HAP2EncodedCharacteristicRequestThread alloc];
  v11[0] = v3;
  unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  char v7 = (void *)a1[5];
  uint64_t v8 = a1[6];
  if (v7) {
    unint64_t v9 = ((unint64_t)[v7 encodingFeatures] >> 5) & 1;
  }
  else {
    unint64_t v9 = 0;
  }
  id v10 = [(HAP2EncodedCharacteristicRequestThread *)v5 initWithBTLERequests:v6 requestType:v8 enforcePDUBodyLength:v9];
  [v4 addObject:v10];
}

- (id)executeWriteRequestForCharacteristics:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  unint64_t v24 = __Block_byref_object_copy__2002;
  char v25 = __Block_byref_object_dispose__2003;
  id v26 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __81__HAP2AccessoryServerEncodingThread_executeWriteRequestForCharacteristics_error___block_invoke;
  id v18 = &unk_1E69F0A18;
  id v20 = &v21;
  id v8 = v7;
  id v19 = v8;
  [v6 enumerateObjectsUsingBlock:&v15];
  unint64_t v9 = (void *)v22[5];
  if (v9)
  {
    id v10 = 0;
    if (a4) {
      *a4 = v9;
    }
  }
  else
  {
    id v11 = [HAP2EncodedCharacteristicRequestThread alloc];
    id v12 = objc_msgSend(v8, "copy", v15, v16, v17, v18);
    if (self) {
      unint64_t v13 = ([(HAP2AccessoryServerEncodingThread *)self encodingFeatures] >> 5) & 1;
    }
    else {
      unint64_t v13 = 0;
    }
    id v10 = [(HAP2EncodedCharacteristicRequestThread *)v11 initWithBTLERequests:v12 requestType:4 enforcePDUBodyLength:v13];
  }
  _Block_object_dispose(&v21, 8);

  return v10;
}

void __81__HAP2AccessoryServerEncodingThread_executeWriteRequestForCharacteristics_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  char v7 = [v6 characteristic];
  id v8 = [v6 value];

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v9 + 40);
  id v10 = +[HAP2AccessoryServerEncodingThreadBTLERequest executeWriteRequestForCharacteristic:v7 value:v8 options:5 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);

  if (v10) {
    [*(id *)(a1 + 32) addObject:v10];
  }
  else {
    *a4 = 1;
  }
}

- (id)prepareWriteRequestForCharacteristics:(id)a3 ttl:(double)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  char v25 = __Block_byref_object_copy__2002;
  id v26 = __Block_byref_object_dispose__2003;
  id v27 = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __85__HAP2AccessoryServerEncodingThread_prepareWriteRequestForCharacteristics_ttl_error___block_invoke;
  id v19 = &unk_1E69F0A18;
  uint64_t v21 = &v22;
  id v9 = v8;
  id v20 = v9;
  [v7 enumerateObjectsUsingBlock:&v16];
  id v10 = (void *)v23[5];
  if (v10)
  {
    id v11 = 0;
    if (a5) {
      *a5 = v10;
    }
  }
  else
  {
    id v12 = [HAP2EncodedCharacteristicRequestThread alloc];
    unint64_t v13 = objc_msgSend(v9, "copy", v16, v17, v18, v19);
    if (self) {
      unint64_t v14 = ([(HAP2AccessoryServerEncodingThread *)self encodingFeatures] >> 5) & 1;
    }
    else {
      unint64_t v14 = 0;
    }
    id v11 = [(HAP2EncodedCharacteristicRequestThread *)v12 initWithBTLERequests:v13 requestType:3 enforcePDUBodyLength:v14];
  }
  _Block_object_dispose(&v22, 8);

  return v11;
}

void __85__HAP2AccessoryServerEncodingThread_prepareWriteRequestForCharacteristics_ttl_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 characteristic];
  id v8 = [v6 value];
  id v9 = [v6 authorizationData];
  id v10 = [v6 contextData];

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v11 + 40);
  id v12 = +[HAP2AccessoryServerEncodingThreadBTLERequest prepareWriteRequestForCharacteristic:v7 value:v8 authorizationData:v9 contextData:v10 options:5 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);

  if (v12) {
    [*(id *)(a1 + 32) addObject:v12];
  }
  else {
    *a4 = 1;
  }
}

- (id)writeRequestForCharacteristics:(id)a3 shouldEncrypt:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  [(HAP2AccessoryServerEncodingThread *)self encodingFeatures];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v8, "count"));
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__2002;
  uint32_t v31 = __Block_byref_object_dispose__2003;
  id v32 = 0;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __88__HAP2AccessoryServerEncodingThread_writeRequestForCharacteristics_shouldEncrypt_error___block_invoke;
  uint64_t v22 = &unk_1E69F0A40;
  BOOL v26 = a4;
  char v25 = &v27;
  id v11 = v9;
  id v23 = v11;
  id v12 = v10;
  id v24 = v12;
  [v8 enumerateObjectsUsingBlock:&v19];
  unint64_t v13 = (void *)v28[5];
  if (v13)
  {
    unint64_t v14 = 0;
    if (a5) {
      *a5 = v13;
    }
  }
  else
  {
    uint64_t v15 = [HAP2EncodedCharacteristicRequestThread alloc];
    uint64_t v16 = objc_msgSend(v12, "copy", v19, v20, v21, v22, v23);
    if (self) {
      unint64_t v17 = ([(HAP2AccessoryServerEncodingThread *)self encodingFeatures] >> 5) & 1;
    }
    else {
      unint64_t v17 = 0;
    }
    unint64_t v14 = [(HAP2EncodedCharacteristicRequestThread *)v15 initWithBTLERequests:v16 requestType:1 enforcePDUBodyLength:v17];
  }
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __88__HAP2AccessoryServerEncodingThread_writeRequestForCharacteristics_shouldEncrypt_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v24 = a4;
  id v5 = a2;
  int v6 = [v5 includeResponseValue];
  id v7 = 0;
  uint64_t v8 = 2;
  if (!v6) {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v8 | *(unsigned __int8 *)(a1 + 56);
  while (1)
  {
    id v10 = v7;
    id v11 = objc_msgSend(v5, "characteristic", v24);
    id v12 = [v5 value];
    unint64_t v13 = [v5 authorizationData];
    unint64_t v14 = [v5 contextData];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v15 + 40);
    id v7 = +[HAP2AccessoryServerEncodingThreadBTLERequest writeRequestForCharacteristic:v11 value:v12 authorizationData:v13 contextData:v14 options:v9 error:&obj];
    objc_storeStrong((id *)(v15 + 40), obj);

    if (!v7) {
      break;
    }
    uint64_t v16 = *(void **)(a1 + 32);
    unint64_t v17 = NSNumber;
    id v18 = [v7 identifier];
    uint64_t v19 = objc_msgSend(v17, "numberWithUnsignedChar:", objc_msgSend(v18, "unsignedCharValue"));
    LOBYTE(v16) = [v16 containsObject:v19];

    if ((v16 & 1) == 0)
    {
      uint64_t v20 = *(void **)(a1 + 32);
      uint64_t v21 = NSNumber;
      uint64_t v22 = [v7 identifier];
      id v23 = objc_msgSend(v21, "numberWithUnsignedChar:", objc_msgSend(v22, "unsignedCharValue"));
      [v20 addObject:v23];

      [*(id *)(a1 + 40) addObject:v7];
      goto LABEL_8;
    }
  }
  *id v24 = 1;
LABEL_8:
}

- (id)groupingsForWriteRequestsForCharacteristics:(id)a3
{
  id v4 = a3;
  char v5 = [(HAP2AccessoryServerEncodingThread *)self encodingFeatures];
  int v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  id v7 = v6;
  if ((v5 & 4) != 0)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__2002;
    uint64_t v21 = __Block_byref_object_dispose__2003;
    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__HAP2AccessoryServerEncodingThread_groupingsForWriteRequestsForCharacteristics___block_invoke_52;
    v14[3] = &unk_1E69F0A18;
    uint64_t v16 = &v17;
    id v11 = v7;
    id v15 = v11;
    [v4 enumerateObjectsUsingBlock:v14];
    if ([(id)v18[5] count])
    {
      id v12 = (void *)[(id)v18[5] copy];
      [v11 addObject:v12];
    }
    uint64_t v9 = (void *)[v11 copy];

    _Block_object_dispose(&v17, 8);
    id v10 = (void *)v22;
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __81__HAP2AccessoryServerEncodingThread_groupingsForWriteRequestsForCharacteristics___block_invoke;
    v23[3] = &unk_1E69F2F90;
    id v24 = v6;
    id v8 = v6;
    [v4 enumerateObjectsUsingBlock:v23];
    uint64_t v9 = (void *)[v8 copy];
    id v10 = v24;
  }

  return v9;
}

void __81__HAP2AccessoryServerEncodingThread_groupingsForWriteRequestsForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  int v6 = a2;
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  char v5 = [v3 arrayWithObjects:&v6 count:1];
  objc_msgSend(v2, "addObject:", v5, v6, v7);
}

void __81__HAP2AccessoryServerEncodingThread_groupingsForWriteRequestsForCharacteristics___block_invoke_52(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 timedWrite];
  char v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    if ([v5 count])
    {
      int v6 = *(void **)(a1 + 32);
      uint64_t v7 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
      [v6 addObject:v7];

      uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    id v11 = *(void **)(a1 + 32);
    v13[0] = v3;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v11 addObject:v12];
  }
  else
  {
    [v5 addObject:v3];
  }
}

- (id)readRequestForCharacteristics:(id)a3 shouldEncrypt:(BOOL)a4 error:(id *)a5
{
  id v6 = a3;
  [(HAP2AccessoryServerEncodingThread *)self encodingFeatures];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __87__HAP2AccessoryServerEncodingThread_readRequestForCharacteristics_shouldEncrypt_error___block_invoke;
  uint64_t v19 = &unk_1E69F2FB8;
  id v9 = v7;
  id v20 = v9;
  id v10 = v8;
  id v21 = v10;
  [v6 enumerateObjectsUsingBlock:&v16];

  id v11 = [HAP2EncodedCharacteristicRequestThread alloc];
  id v12 = objc_msgSend(v10, "copy", v16, v17, v18, v19);
  if (self) {
    unint64_t v13 = ([(HAP2AccessoryServerEncodingThread *)self encodingFeatures] >> 5) & 1;
  }
  else {
    unint64_t v13 = 0;
  }
  unint64_t v14 = [(HAP2EncodedCharacteristicRequestThread *)v11 initWithBTLERequests:v12 requestType:2 enforcePDUBodyLength:v13];

  return v14;
}

void __87__HAP2AccessoryServerEncodingThread_readRequestForCharacteristics_shouldEncrypt_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = 0;
  do
  {
    char v5 = v4;
    id v14 = +[HAP2AccessoryServerEncodingThreadBTLERequest readRequestForCharacteristic:a2];

    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = NSNumber;
    uint64_t v8 = [v14 identifier];
    id v9 = objc_msgSend(v7, "numberWithUnsignedChar:", objc_msgSend(v8, "unsignedCharValue"));
    LOBYTE(v6) = [v6 containsObject:v9];

    id v4 = v14;
  }
  while ((v6 & 1) != 0);
  id v10 = *(void **)(a1 + 32);
  id v11 = NSNumber;
  id v12 = [v14 identifier];
  unint64_t v13 = objc_msgSend(v11, "numberWithUnsignedChar:", objc_msgSend(v12, "unsignedCharValue"));
  [v10 addObject:v13];

  [*(id *)(a1 + 40) addObject:v14];
}

- (id)groupingsForReadRequestsForCharacteristics:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(HAP2AccessoryServerEncodingThread *)self encodingFeatures] & 4) != 0)
  {
    v11[0] = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    char v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__HAP2AccessoryServerEncodingThread_groupingsForReadRequestsForCharacteristics___block_invoke;
    v9[3] = &unk_1E69F3740;
    id v10 = v5;
    id v6 = v5;
    [v4 enumerateObjectsUsingBlock:v9];
    uint64_t v7 = (void *)[v6 copy];
  }

  return v7;
}

void __80__HAP2AccessoryServerEncodingThread_groupingsForReadRequestsForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v6 = a2;
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  char v5 = [v3 arrayWithObjects:&v6 count:1];
  objc_msgSend(v2, "addObject:", v5, v6, v7);
}

- (id)readRequestForAttributeDatabaseWithEncryption:(BOOL)a3 error:(id *)a4
{
  char v5 = +[HAP2AccessoryServerEncodingThreadBTLERequest attributeDatabaseRequest];
  id v6 = [HAP2EncodedRequestThread alloc];
  if (self) {
    unint64_t v7 = ([(HAP2AccessoryServerEncodingThread *)self encodingFeatures] >> 5) & 1;
  }
  else {
    unint64_t v7 = 0;
  }
  uint64_t v8 = [(HAP2EncodedRequestThread *)v6 initWithBTLERequest:v5 enforcePDUBodyLength:v7];

  return v8;
}

- (id)decodeBodyData:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = +[HAPDataValueTransformer defaultDataValueTransformer];
  id v9 = [v8 reverseTransformedValue:v7 format:a4 error:a5];

  if (v9 && ([v9 conformsToProtocol:&unk_1F2CA6008] & 1) == 0)
  {

    if (a5)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:12];
      id v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (id)encodeBodyValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = +[HAPDataValueTransformer defaultDataValueTransformer];
  id v9 = [v8 transformedValue:v7 format:a4 error:a5];

  return v9;
}

- (HAP2AccessoryServerEncodingThread)initWithEncodingFeatures:(unint64_t)a3 accessoryDescription:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HAP2AccessoryServerEncodingThread;
  uint64_t v8 = [(HAP2AccessoryServerEncodingThread *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    v8->_encodingFeatures = a3;
    objc_storeStrong((id *)&v8->_accessoryDescription, a4);
  }

  return v9;
}

+ (id)_parseShortFormUUID:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  if ([v5 length] == 16)
  {
    memset(buf, 0, sizeof(buf));
    [v6 getBytes:buf length:16];
    int8x16_t v7 = vrev64q_s8(*(int8x16_t *)buf);
    int8x16_t v20 = vextq_s8(v7, v7, 8uLL);
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v20];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 UUIDString];
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = 0;
    }

    goto LABEL_24;
  }
  if ((unint64_t)[v6 length] >= 5)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    objc_super v11 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_error_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "Provided UUID has invalid length: %@", buf, 0xCu);
      if (a4) {
        goto LABEL_10;
      }
LABEL_23:
      id v10 = 0;
      goto LABEL_24;
    }
LABEL_9:
    if (a4)
    {
LABEL_10:
      [MEMORY[0x1E4F28C58] hapErrorWithCode:7];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  id v12 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v6, "length"));
  id v13 = v6;
  uint64_t v14 = [v13 bytes];
  uint64_t v15 = [v13 length];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = v14 - 1;
    do
    {
      if (v16 == [v13 length]) {
        id v18 = @"%X";
      }
      else {
        id v18 = @"%02X";
      }
      objc_msgSend(v12, "appendFormat:", v18, *(unsigned __int8 *)(v17 + v16--));
    }
    while (v16);
  }
  id v10 = (void *)[v12 copy];

LABEL_24:

  return v10;
}

@end