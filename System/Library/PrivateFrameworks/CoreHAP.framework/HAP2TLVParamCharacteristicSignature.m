@interface HAP2TLVParamCharacteristicSignature
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAP2TLVCharacteristicPropertiesWrapper)characteristicProperties;
- (HAP2TLVParamCharacteristicSignature)init;
- (HAP2TLVParamCharacteristicSignature)initWithInstanceID:(id)a3 characteristicType:(id)a4 characteristicProperties:(id)a5 userDescription:(id)a6 bluetoothFormat:(id)a7 validRange:(id)a8 stepValue:(id)a9 validValues:(id)a10 validValuesRange:(id)a11;
- (HAPTLVUnsignedNumberValue)instanceID;
- (NSData)bluetoothFormat;
- (NSData)characteristicType;
- (NSData)stepValue;
- (NSData)validRange;
- (NSData)validValues;
- (NSData)validValuesRange;
- (NSString)description;
- (NSString)userDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setBluetoothFormat:(id)a3;
- (void)setCharacteristicProperties:(id)a3;
- (void)setCharacteristicType:(id)a3;
- (void)setInstanceID:(id)a3;
- (void)setStepValue:(id)a3;
- (void)setUserDescription:(id)a3;
- (void)setValidRange:(id)a3;
- (void)setValidValues:(id)a3;
- (void)setValidValuesRange:(id)a3;
@end

@implementation HAP2TLVParamCharacteristicSignature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validValuesRange, 0);
  objc_storeStrong((id *)&self->_validValues, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_validRange, 0);
  objc_storeStrong((id *)&self->_bluetoothFormat, 0);
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_characteristicProperties, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);

  objc_storeStrong((id *)&self->_instanceID, 0);
}

- (void)setValidValuesRange:(id)a3
{
}

- (NSData)validValuesRange
{
  return self->_validValuesRange;
}

- (void)setValidValues:(id)a3
{
}

- (NSData)validValues
{
  return self->_validValues;
}

- (void)setStepValue:(id)a3
{
}

- (NSData)stepValue
{
  return self->_stepValue;
}

- (void)setValidRange:(id)a3
{
}

- (NSData)validRange
{
  return self->_validRange;
}

- (void)setBluetoothFormat:(id)a3
{
}

- (NSData)bluetoothFormat
{
  return self->_bluetoothFormat;
}

- (void)setUserDescription:(id)a3
{
}

- (NSString)userDescription
{
  return self->_userDescription;
}

- (void)setCharacteristicProperties:(id)a3
{
}

- (HAP2TLVCharacteristicPropertiesWrapper)characteristicProperties
{
  return self->_characteristicProperties;
}

- (void)setCharacteristicType:(id)a3
{
}

- (NSData)characteristicType
{
  return self->_characteristicType;
}

- (void)setInstanceID:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)instanceID
{
  return self->_instanceID;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAP2TLVParamCharacteristicSignature *)self instanceID];
  v5 = [(HAP2TLVParamCharacteristicSignature *)self characteristicType];
  v6 = [(HAP2TLVParamCharacteristicSignature *)self characteristicProperties];
  v7 = [(HAP2TLVParamCharacteristicSignature *)self userDescription];
  v8 = [(HAP2TLVParamCharacteristicSignature *)self bluetoothFormat];
  v9 = [(HAP2TLVParamCharacteristicSignature *)self validRange];
  v10 = [(HAP2TLVParamCharacteristicSignature *)self stepValue];
  v11 = [(HAP2TLVParamCharacteristicSignature *)self validValues];
  v12 = [(HAP2TLVParamCharacteristicSignature *)self validValuesRange];
  v13 = [v3 stringWithFormat:@"<HAP2TLVParamCharacteristicSignature instanceID=%@, characteristicType=%@, characteristicProperties=%@, userDescription=%@, bluetoothFormat=%@, validRange=%@, stepValue=%@, validValues=%@, validValuesRange=%@>", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAP2TLVParamCharacteristicSignature *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HAP2TLVParamCharacteristicSignature *)self instanceID];
      v7 = [(HAP2TLVParamCharacteristicSignature *)v5 instanceID];
      if (v6 != v7)
      {
        v8 = [(HAP2TLVParamCharacteristicSignature *)self instanceID];
        v9 = [(HAP2TLVParamCharacteristicSignature *)v5 instanceID];
        v70 = v8;
        if (![v8 isEqual:v9])
        {
          char v10 = 0;
          goto LABEL_51;
        }
        v69 = v9;
      }
      v11 = [(HAP2TLVParamCharacteristicSignature *)self characteristicType];
      v12 = [(HAP2TLVParamCharacteristicSignature *)v5 characteristicType];
      if (v11 != v12)
      {
        v13 = [(HAP2TLVParamCharacteristicSignature *)self characteristicType];
        v14 = [(HAP2TLVParamCharacteristicSignature *)v5 characteristicType];
        if (![v13 isEqual:v14])
        {
          char v10 = 0;
LABEL_49:

LABEL_50:
          v9 = v69;
          if (v6 == v7)
          {
LABEL_52:

            goto LABEL_53;
          }
LABEL_51:

          goto LABEL_52;
        }
        v66 = v14;
        v67 = v13;
      }
      v15 = [(HAP2TLVParamCharacteristicSignature *)self characteristicProperties];
      v16 = [(HAP2TLVParamCharacteristicSignature *)v5 characteristicProperties];
      v68 = v11;
      if (v15 != v16)
      {
        v17 = [(HAP2TLVParamCharacteristicSignature *)self characteristicProperties];
        v63 = [(HAP2TLVParamCharacteristicSignature *)v5 characteristicProperties];
        v64 = v17;
        if (![v17 isEqual:v63])
        {
          char v10 = 0;
          v11 = v68;
LABEL_47:

LABEL_48:
          v14 = v66;
          v13 = v67;
          if (v11 == v12) {
            goto LABEL_50;
          }
          goto LABEL_49;
        }
      }
      uint64_t v18 = [(HAP2TLVParamCharacteristicSignature *)self userDescription];
      v19 = [(HAP2TLVParamCharacteristicSignature *)v5 userDescription];
      v62 = (void *)v18;
      v65 = v15;
      if ((void *)v18 != v19)
      {
        v20 = [(HAP2TLVParamCharacteristicSignature *)self userDescription];
        v59 = [(HAP2TLVParamCharacteristicSignature *)v5 userDescription];
        v60 = v20;
        if (!objc_msgSend(v20, "isEqual:"))
        {
          char v10 = 0;
          v21 = v62;
LABEL_45:

LABEL_46:
          v15 = v65;
          v11 = v68;
          if (v65 == v16) {
            goto LABEL_48;
          }
          goto LABEL_47;
        }
      }
      uint64_t v22 = [(HAP2TLVParamCharacteristicSignature *)self bluetoothFormat];
      [(HAP2TLVParamCharacteristicSignature *)v5 bluetoothFormat];
      uint64_t v58 = v61 = (void *)v22;
      if (v22 != v58)
      {
        v23 = [(HAP2TLVParamCharacteristicSignature *)self bluetoothFormat];
        v56 = [(HAP2TLVParamCharacteristicSignature *)v5 bluetoothFormat];
        v57 = v23;
        if (!objc_msgSend(v23, "isEqual:"))
        {
          char v10 = 0;
          v24 = (void *)v58;
LABEL_43:

LABEL_44:
          v21 = v62;
          if (v62 == v19) {
            goto LABEL_46;
          }
          goto LABEL_45;
        }
      }
      v25 = v19;
      uint64_t v26 = [(HAP2TLVParamCharacteristicSignature *)self validRange];
      uint64_t v54 = [(HAP2TLVParamCharacteristicSignature *)v5 validRange];
      v55 = (void *)v26;
      if (v26 == v54)
      {
        v19 = v25;
      }
      else
      {
        v27 = [(HAP2TLVParamCharacteristicSignature *)self validRange];
        v50 = [(HAP2TLVParamCharacteristicSignature *)v5 validRange];
        v51 = v27;
        int v28 = objc_msgSend(v27, "isEqual:");
        v19 = v25;
        if (!v28)
        {
          char v10 = 0;
          v30 = (void *)v54;
          v29 = v55;
LABEL_41:

LABEL_42:
          v24 = (void *)v58;
          if (v61 == (void *)v58) {
            goto LABEL_44;
          }
          goto LABEL_43;
        }
      }
      uint64_t v31 = [(HAP2TLVParamCharacteristicSignature *)self stepValue];
      uint64_t v52 = [(HAP2TLVParamCharacteristicSignature *)v5 stepValue];
      v53 = (void *)v31;
      v49 = v19;
      if (v31 != v52)
      {
        v32 = [(HAP2TLVParamCharacteristicSignature *)self stepValue];
        v47 = [(HAP2TLVParamCharacteristicSignature *)v5 stepValue];
        v48 = v32;
        if (!objc_msgSend(v32, "isEqual:"))
        {
          char v10 = 0;
          v33 = (void *)v52;
          goto LABEL_38;
        }
      }
      v34 = [(HAP2TLVParamCharacteristicSignature *)self validValues];
      uint64_t v46 = [(HAP2TLVParamCharacteristicSignature *)v5 validValues];
      if (v34 == (void *)v46
        || ([(HAP2TLVParamCharacteristicSignature *)self validValues],
            v35 = objc_claimAutoreleasedReturnValue(),
            [(HAP2TLVParamCharacteristicSignature *)v5 validValues],
            v44 = objc_claimAutoreleasedReturnValue(),
            v45 = v35,
            objc_msgSend(v35, "isEqual:")))
      {
        v36 = [(HAP2TLVParamCharacteristicSignature *)self validValuesRange];
        uint64_t v37 = [(HAP2TLVParamCharacteristicSignature *)v5 validValuesRange];
        v43 = v36;
        if (v36 == (void *)v37)
        {

          char v10 = 1;
        }
        else
        {
          v42 = (void *)v37;
          v41 = [(HAP2TLVParamCharacteristicSignature *)self validValuesRange];
          v38 = [(HAP2TLVParamCharacteristicSignature *)v5 validValuesRange];
          char v10 = [v41 isEqual:v38];
        }
        v39 = (void *)v46;
        if (v34 == (void *)v46)
        {
LABEL_37:

          v33 = (void *)v52;
          if (v53 == (void *)v52)
          {
            v19 = v49;
LABEL_40:

            v30 = (void *)v54;
            v29 = v55;
            if (v55 == (void *)v54) {
              goto LABEL_42;
            }
            goto LABEL_41;
          }
LABEL_38:
          v19 = v49;

          goto LABEL_40;
        }
      }
      else
      {
        char v10 = 0;
        v39 = (void *)v46;
      }

      goto LABEL_37;
    }
    char v10 = 0;
  }
LABEL_53:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAP2TLVParamCharacteristicSignature allocWithZone:a3];
  v5 = [(HAP2TLVParamCharacteristicSignature *)self instanceID];
  v6 = [(HAP2TLVParamCharacteristicSignature *)self characteristicType];
  v7 = [(HAP2TLVParamCharacteristicSignature *)self characteristicProperties];
  v8 = [(HAP2TLVParamCharacteristicSignature *)self userDescription];
  v9 = [(HAP2TLVParamCharacteristicSignature *)self bluetoothFormat];
  char v10 = [(HAP2TLVParamCharacteristicSignature *)self validRange];
  v11 = [(HAP2TLVParamCharacteristicSignature *)self stepValue];
  v12 = [(HAP2TLVParamCharacteristicSignature *)self validValues];
  v13 = [(HAP2TLVParamCharacteristicSignature *)self validValuesRange];
  v14 = [(HAP2TLVParamCharacteristicSignature *)v4 initWithInstanceID:v5 characteristicType:v6 characteristicProperties:v7 userDescription:v8 bluetoothFormat:v9 validRange:v10 stepValue:v11 validValues:v12 validValuesRange:v13];

  return v14;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v69 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  TLV8BufferInit();
  v5 = [(HAP2TLVParamCharacteristicSignature *)self instanceID];

  if (v5)
  {
    v6 = [(HAP2TLVParamCharacteristicSignature *)self instanceID];
    id v64 = 0;
    v7 = [v6 serializeWithError:&v64];
    id v8 = v64;

    if (v8) {
      goto LABEL_69;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10)
    {
LABEL_4:
      uint64_t v11 = v10;

LABEL_5:
      if (a3)
      {
        HMErrorFromOSStatus(v11);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
LABEL_71:
        v47 = 0;
        *a3 = v12;
        goto LABEL_73;
      }
      id v8 = 0;
LABEL_72:
      v47 = 0;
      goto LABEL_73;
    }
  }
  v13 = [(HAP2TLVParamCharacteristicSignature *)self characteristicType];

  if (v13)
  {
    v14 = [(HAP2TLVParamCharacteristicSignature *)self characteristicType];
    id v63 = 0;
    v7 = [v14 serializeWithError:&v63];
    id v8 = v63;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v15 = [v9 bytes];
      unint64_t v16 = v15 + [v9 length];
      while (1)
      {
        uint64_t v17 = (uint64_t)(v16 - v15) >= 255 ? 255 : v16 - v15;
        uint64_t v10 = TLV8BufferAppend();
        if (v10) {
          goto LABEL_4;
        }
        v15 += v17;
        if (v15 >= v16)
        {

          goto LABEL_18;
        }
      }
    }
    goto LABEL_69;
  }
LABEL_18:
  uint64_t v18 = [(HAP2TLVParamCharacteristicSignature *)self characteristicProperties];

  if (v18)
  {
    v19 = [(HAP2TLVParamCharacteristicSignature *)self characteristicProperties];
    id v62 = 0;
    v7 = [v19 serializeWithError:&v62];
    id v8 = v62;

    if (v8) {
      goto LABEL_69;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10) {
      goto LABEL_4;
    }
  }
  v20 = [(HAP2TLVParamCharacteristicSignature *)self userDescription];

  if (v20)
  {
    v21 = [(HAP2TLVParamCharacteristicSignature *)self userDescription];
    id v61 = 0;
    v7 = [v21 serializeWithError:&v61];
    id v8 = v61;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v22 = [v9 bytes];
      unint64_t v23 = v22 + [v9 length];
      while (1)
      {
        uint64_t v24 = (uint64_t)(v23 - v22) >= 255 ? 255 : v23 - v22;
        uint64_t v10 = TLV8BufferAppend();
        if (v10) {
          goto LABEL_4;
        }
        v22 += v24;
        if (v22 >= v23)
        {

          goto LABEL_31;
        }
      }
    }
    goto LABEL_69;
  }
LABEL_31:
  v25 = [(HAP2TLVParamCharacteristicSignature *)self bluetoothFormat];

  if (v25)
  {
    uint64_t v26 = [(HAP2TLVParamCharacteristicSignature *)self bluetoothFormat];
    id v60 = 0;
    v7 = [v26 serializeWithError:&v60];
    id v8 = v60;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v27 = [v9 bytes];
      unint64_t v28 = v27 + [v9 length];
      while (1)
      {
        uint64_t v29 = (uint64_t)(v28 - v27) >= 255 ? 255 : v28 - v27;
        uint64_t v10 = TLV8BufferAppend();
        if (v10) {
          goto LABEL_4;
        }
        v27 += v29;
        if (v27 >= v28)
        {

          goto LABEL_40;
        }
      }
    }
    goto LABEL_69;
  }
LABEL_40:
  v30 = [(HAP2TLVParamCharacteristicSignature *)self validRange];

  if (v30)
  {
    uint64_t v31 = [(HAP2TLVParamCharacteristicSignature *)self validRange];
    id v59 = 0;
    v7 = [v31 serializeWithError:&v59];
    id v8 = v59;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v32 = [v9 bytes];
      unint64_t v33 = v32 + [v9 length];
      while (1)
      {
        uint64_t v34 = (uint64_t)(v33 - v32) >= 255 ? 255 : v33 - v32;
        uint64_t v10 = TLV8BufferAppend();
        if (v10) {
          goto LABEL_4;
        }
        v32 += v34;
        if (v32 >= v33)
        {

          goto LABEL_49;
        }
      }
    }
    goto LABEL_69;
  }
LABEL_49:
  v35 = [(HAP2TLVParamCharacteristicSignature *)self stepValue];

  if (v35)
  {
    v36 = [(HAP2TLVParamCharacteristicSignature *)self stepValue];
    id v58 = 0;
    v7 = [v36 serializeWithError:&v58];
    id v8 = v58;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v37 = [v9 bytes];
      unint64_t v38 = v37 + [v9 length];
      while (1)
      {
        uint64_t v39 = (uint64_t)(v38 - v37) >= 255 ? 255 : v38 - v37;
        uint64_t v10 = TLV8BufferAppend();
        if (v10) {
          goto LABEL_4;
        }
        v37 += v39;
        if (v37 >= v38)
        {

          goto LABEL_58;
        }
      }
    }
    goto LABEL_69;
  }
LABEL_58:
  v40 = [(HAP2TLVParamCharacteristicSignature *)self validValues];

  if (v40)
  {
    v41 = [(HAP2TLVParamCharacteristicSignature *)self validValues];
    id v57 = 0;
    v7 = [v41 serializeWithError:&v57];
    id v8 = v57;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v42 = [v9 bytes];
      unint64_t v43 = v42 + [v9 length];
      while (1)
      {
        uint64_t v44 = (uint64_t)(v43 - v42) >= 255 ? 255 : v43 - v42;
        uint64_t v10 = TLV8BufferAppend();
        if (v10) {
          goto LABEL_4;
        }
        v42 += v44;
        if (v42 >= v43)
        {

          goto LABEL_67;
        }
      }
    }
LABEL_69:

    if (a3)
    {
      id v12 = v8;
      id v8 = v12;
      goto LABEL_71;
    }
    goto LABEL_72;
  }
LABEL_67:
  v45 = [(HAP2TLVParamCharacteristicSignature *)self validValuesRange];

  if (v45)
  {
    uint64_t v46 = [(HAP2TLVParamCharacteristicSignature *)self validValuesRange];
    id v56 = 0;
    v7 = [v46 serializeWithError:&v56];
    id v8 = v56;

    if (v8) {
      goto LABEL_69;
    }
    id v49 = v7;
    unint64_t v50 = [v49 bytes];
    unint64_t v51 = v50 + [v49 length];
    do
    {
      if ((uint64_t)(v51 - v50) >= 255) {
        uint64_t v52 = 255;
      }
      else {
        uint64_t v52 = v51 - v50;
      }
      uint64_t v53 = TLV8BufferAppend();
      if (v53) {
        uint64_t v54 = 0;
      }
      else {
        uint64_t v54 = v52;
      }
      v50 += v54;
      if (v53) {
        BOOL v55 = 1;
      }
      else {
        BOOL v55 = v50 >= v51;
      }
    }
    while (!v55);
    uint64_t v11 = v53;

    if (v11) {
      goto LABEL_5;
    }
  }
  v47 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v65);
  id v8 = 0;
LABEL_73:
  TLV8BufferFree();

  return v47;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  uint64_t v46 = v6;
  if (v8 < 1)
  {
    uint64_t v10 = 0;
    unint64_t v27 = 0;
    uint64_t v11 = 0;
    unint64_t v28 = 0;
    uint64_t v31 = 0;
    id v12 = 0;
    unint64_t v32 = 0;
    unint64_t v33 = 0;
    uint64_t v29 = 0;
LABEL_33:
    [(HAP2TLVParamCharacteristicSignature *)self setInstanceID:v10];
    [(HAP2TLVParamCharacteristicSignature *)self setCharacteristicType:v27];
    [(HAP2TLVParamCharacteristicSignature *)self setCharacteristicProperties:v11];
    [(HAP2TLVParamCharacteristicSignature *)self setUserDescription:v28];
    [(HAP2TLVParamCharacteristicSignature *)self setBluetoothFormat:v29];
    [(HAP2TLVParamCharacteristicSignature *)self setValidRange:v33];
    [(HAP2TLVParamCharacteristicSignature *)self setStepValue:v32];
    [(HAP2TLVParamCharacteristicSignature *)self setValidValues:v12];
    [(HAP2TLVParamCharacteristicSignature *)self setValidValuesRange:v31];
    v35 = v31;
    v36 = v10;
    unint64_t v37 = v32;
    id v9 = 0;
    BOOL v30 = 1;
  }
  else
  {
    uint64_t v39 = a4;
    v40 = 0;
    id v9 = 0;
    uint64_t v10 = 0;
    uint64_t v44 = 0;
    v45 = 0;
    uint64_t v11 = 0;
    id v12 = 0;
    v41 = 0;
    unint64_t v42 = 0;
    unint64_t v43 = 0;
    unint64_t v13 = v7 + v8;
    while (1)
    {
      char v65 = 0;
      v63[1] = 0;
      uint64_t v64 = 0;
      v63[0] = 0;
      uint64_t Next = TLV8GetNext();
      if (Next) {
        break;
      }
      if (!v64)
      {
        uint64_t v34 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

        id v9 = (id)v34;
        if (v34) {
          goto LABEL_26;
        }
        goto LABEL_32;
      }
      switch(v65)
      {
        case 4:
          id v61 = v9;
          unint64_t v15 = HAPTLVParseContiguousTlvs(4, v7, v13, v63, &v61);
          id v16 = v61;

          if (v16) {
            goto LABEL_23;
          }
          id v60 = 0;
          uint64_t v17 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v60];
          id v16 = v60;
          uint64_t v18 = v45;
          v45 = (void *)v17;
          break;
        case 5:
          unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v62 = v9;
          uint64_t v19 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v62];
          id v16 = v62;

          uint64_t v18 = v10;
          uint64_t v10 = (void *)v19;
          break;
        case 10:
          unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v59 = v9;
          uint64_t v20 = +[HAP2TLVCharacteristicPropertiesWrapper parsedFromData:v15 error:&v59];
          id v16 = v59;

          uint64_t v18 = v11;
          uint64_t v11 = (void *)v20;
          break;
        case 11:
          id v58 = v9;
          unint64_t v15 = HAPTLVParseContiguousTlvs(11, v7, v13, v63, &v58);
          id v16 = v58;

          if (v16) {
            goto LABEL_23;
          }
          id v57 = 0;
          uint64_t v21 = [NSString parsedFromData:v15 error:&v57];
          id v16 = v57;
          uint64_t v18 = v44;
          uint64_t v44 = (void *)v21;
          break;
        case 12:
          id v56 = v9;
          unint64_t v15 = HAPTLVParseContiguousTlvs(12, v7, v13, v63, &v56);
          id v16 = v56;

          if (v16) {
            goto LABEL_23;
          }
          id v55 = 0;
          uint64_t v22 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v55];
          id v16 = v55;
          uint64_t v18 = v43;
          unint64_t v43 = (void *)v22;
          break;
        case 13:
          id v54 = v9;
          unint64_t v15 = HAPTLVParseContiguousTlvs(13, v7, v13, v63, &v54);
          id v16 = v54;

          if (v16) {
            goto LABEL_23;
          }
          id v53 = 0;
          uint64_t v23 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v53];
          id v16 = v53;
          uint64_t v18 = v42;
          unint64_t v42 = (void *)v23;
          break;
        case 14:
          id v52 = v9;
          unint64_t v15 = HAPTLVParseContiguousTlvs(14, v7, v13, v63, &v52);
          id v16 = v52;

          if (v16) {
            goto LABEL_23;
          }
          id v51 = 0;
          uint64_t v24 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v51];
          id v16 = v51;
          uint64_t v18 = v41;
          v41 = (void *)v24;
          break;
        case 17:
          id v50 = v9;
          unint64_t v15 = HAPTLVParseContiguousTlvs(17, v7, v13, v63, &v50);
          id v16 = v50;

          if (v16) {
            goto LABEL_23;
          }
          id v49 = 0;
          uint64_t v25 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v49];
          id v16 = v49;
          uint64_t v18 = v12;
          id v12 = (void *)v25;
          break;
        case 18:
          id v48 = v9;
          unint64_t v15 = HAPTLVParseContiguousTlvs(18, v7, v13, v63, &v48);
          id v16 = v48;

          if (v16) {
            goto LABEL_23;
          }
          id v47 = 0;
          uint64_t v26 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v47];
          id v16 = v47;
          uint64_t v18 = v40;
          v40 = (void *)v26;
          break;
        default:
          goto LABEL_24;
      }

LABEL_23:
      id v9 = v16;
LABEL_24:
      unint64_t v7 = v63[0];
      if (v63[0] >= v13)
      {
        if (v9)
        {
LABEL_26:
          unint64_t v28 = v44;
          unint64_t v27 = v45;
          uint64_t v29 = v43;
          if (v39)
          {
            id v9 = v9;
            BOOL v30 = 0;
            id *v39 = v9;
          }
          else
          {
            BOOL v30 = 0;
          }
          goto LABEL_37;
        }
LABEL_32:
        unint64_t v28 = v44;
        unint64_t v27 = v45;
        unint64_t v33 = v42;
        uint64_t v29 = v43;
        uint64_t v31 = v40;
        unint64_t v32 = v41;
        goto LABEL_33;
      }
    }
    if (v39)
    {
      HMErrorFromOSStatus(Next);
      BOOL v30 = 0;
      id *v39 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v30 = 0;
    }
    unint64_t v28 = v44;
    unint64_t v27 = v45;
    uint64_t v29 = v43;
LABEL_37:
    v36 = v10;
    unint64_t v37 = v41;
    unint64_t v33 = v42;
    v35 = v40;
  }

  return v30;
}

- (HAP2TLVParamCharacteristicSignature)initWithInstanceID:(id)a3 characteristicType:(id)a4 characteristicProperties:(id)a5 userDescription:(id)a6 bluetoothFormat:(id)a7 validRange:(id)a8 stepValue:(id)a9 validValues:(id)a10 validValuesRange:(id)a11
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)HAP2TLVParamCharacteristicSignature;
  uint64_t v19 = [(HAP2TLVParamCharacteristicSignature *)&v30 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_instanceID, a3);
    objc_storeStrong((id *)&v20->_characteristicType, a4);
    objc_storeStrong((id *)&v20->_characteristicProperties, a5);
    objc_storeStrong((id *)&v20->_userDescription, a6);
    objc_storeStrong((id *)&v20->_bluetoothFormat, a7);
    objc_storeStrong((id *)&v20->_validRange, a8);
    objc_storeStrong((id *)&v20->_stepValue, a9);
    objc_storeStrong((id *)&v20->_validValues, a10);
    objc_storeStrong((id *)&v20->_validValuesRange, a11);
  }

  return v20;
}

- (HAP2TLVParamCharacteristicSignature)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVParamCharacteristicSignature;
  return [(HAP2TLVParamCharacteristicSignature *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAP2TLVParamCharacteristicSignature);
  unint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAP2TLVParamCharacteristicSignature *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      unint64_t v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }

  return v7;
}

@end