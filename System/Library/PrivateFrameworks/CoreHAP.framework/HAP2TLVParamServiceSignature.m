@interface HAP2TLVParamServiceSignature
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAP2TLVParamCharacteristicList)characteristicList;
- (HAP2TLVParamServiceSignature)init;
- (HAP2TLVParamServiceSignature)initWithInstanceID:(id)a3 serviceType:(id)a4 properties:(id)a5 linkedServices:(id)a6 characteristicList:(id)a7;
- (HAP2TLVServicePropertiesWrapper)properties;
- (HAPTLVUnsignedNumberValue)instanceID;
- (NSData)linkedServices;
- (NSData)serviceType;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setCharacteristicList:(id)a3;
- (void)setInstanceID:(id)a3;
- (void)setLinkedServices:(id)a3;
- (void)setProperties:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation HAP2TLVParamServiceSignature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicList, 0);
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);

  objc_storeStrong((id *)&self->_instanceID, 0);
}

- (void)setCharacteristicList:(id)a3
{
}

- (HAP2TLVParamCharacteristicList)characteristicList
{
  return self->_characteristicList;
}

- (void)setLinkedServices:(id)a3
{
}

- (NSData)linkedServices
{
  return self->_linkedServices;
}

- (void)setProperties:(id)a3
{
}

- (HAP2TLVServicePropertiesWrapper)properties
{
  return self->_properties;
}

- (void)setServiceType:(id)a3
{
}

- (NSData)serviceType
{
  return self->_serviceType;
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
  v4 = [(HAP2TLVParamServiceSignature *)self instanceID];
  v5 = [(HAP2TLVParamServiceSignature *)self serviceType];
  v6 = [(HAP2TLVParamServiceSignature *)self properties];
  v7 = [(HAP2TLVParamServiceSignature *)self linkedServices];
  v8 = [(HAP2TLVParamServiceSignature *)self characteristicList];
  v9 = [v3 stringWithFormat:@"<HAP2TLVParamServiceSignature instanceID=%@, serviceType=%@, properties=%@, linkedServices=%@, characteristicList=%@>", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HAP2TLVParamServiceSignature *)a3;
  if (self == v5)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v7 = [(HAP2TLVParamServiceSignature *)self instanceID];
      v8 = [(HAP2TLVParamServiceSignature *)v6 instanceID];
      if (v7 != v8)
      {
        v9 = [(HAP2TLVParamServiceSignature *)self instanceID];
        [(HAP2TLVParamServiceSignature *)v6 instanceID];
        v38 = v39 = v9;
        if (!objc_msgSend(v9, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_29;
        }
      }
      v11 = [(HAP2TLVParamServiceSignature *)self serviceType];
      v12 = [(HAP2TLVParamServiceSignature *)v6 serviceType];
      if (v11 != v12)
      {
        v3 = [(HAP2TLVParamServiceSignature *)self serviceType];
        v35 = [(HAP2TLVParamServiceSignature *)v6 serviceType];
        if (!objc_msgSend(v3, "isEqual:"))
        {
          char v10 = 0;
LABEL_27:

LABEL_28:
          if (v7 == v8)
          {
LABEL_30:

            goto LABEL_31;
          }
LABEL_29:

          goto LABEL_30;
        }
      }
      uint64_t v13 = [(HAP2TLVParamServiceSignature *)self properties];
      uint64_t v36 = [(HAP2TLVParamServiceSignature *)v6 properties];
      v37 = (void *)v13;
      if (v13 != v36)
      {
        v14 = [(HAP2TLVParamServiceSignature *)self properties];
        v33 = [(HAP2TLVParamServiceSignature *)v6 properties];
        v34 = v14;
        if (!objc_msgSend(v14, "isEqual:"))
        {
          char v10 = 0;
          v16 = (void *)v36;
          v15 = v37;
LABEL_25:

LABEL_26:
          if (v11 == v12) {
            goto LABEL_28;
          }
          goto LABEL_27;
        }
      }
      v17 = [(HAP2TLVParamServiceSignature *)self linkedServices];
      v18 = [(HAP2TLVParamServiceSignature *)v6 linkedServices];
      v32 = v3;
      if (v17 == v18)
      {
        v29 = v12;
      }
      else
      {
        v19 = [(HAP2TLVParamServiceSignature *)self linkedServices];
        v30 = [(HAP2TLVParamServiceSignature *)v6 linkedServices];
        v31 = v19;
        if (!objc_msgSend(v19, "isEqual:"))
        {
          char v10 = 0;
          v3 = v32;
          goto LABEL_23;
        }
        v29 = v12;
      }
      v20 = [(HAP2TLVParamServiceSignature *)self characteristicList];
      uint64_t v21 = [(HAP2TLVParamServiceSignature *)v6 characteristicList];
      if (v20 == (void *)v21)
      {

        char v10 = 1;
      }
      else
      {
        v22 = (void *)v21;
        [(HAP2TLVParamServiceSignature *)self characteristicList];
        v23 = v27 = v17;
        [(HAP2TLVParamServiceSignature *)v6 characteristicList];
        v28 = v11;
        v25 = v24 = v18;
        char v10 = [v23 isEqual:v25];

        v18 = v24;
        v11 = v28;

        v17 = v27;
      }
      v12 = v29;
      v3 = v32;
      if (v17 == v18)
      {
LABEL_24:

        v16 = (void *)v36;
        v15 = v37;
        if (v37 == (void *)v36) {
          goto LABEL_26;
        }
        goto LABEL_25;
      }
LABEL_23:

      goto LABEL_24;
    }
    char v10 = 0;
  }
LABEL_31:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAP2TLVParamServiceSignature allocWithZone:a3];
  v5 = [(HAP2TLVParamServiceSignature *)self instanceID];
  v6 = [(HAP2TLVParamServiceSignature *)self serviceType];
  v7 = [(HAP2TLVParamServiceSignature *)self properties];
  v8 = [(HAP2TLVParamServiceSignature *)self linkedServices];
  v9 = [(HAP2TLVParamServiceSignature *)self characteristicList];
  char v10 = [(HAP2TLVParamServiceSignature *)v4 initWithInstanceID:v5 serviceType:v6 properties:v7 linkedServices:v8 characteristicList:v9];

  return v10;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  TLV8BufferInit();
  v5 = [(HAP2TLVParamServiceSignature *)self instanceID];

  if (v5)
  {
    v6 = [(HAP2TLVParamServiceSignature *)self instanceID];
    id v40 = 0;
    v7 = [v6 serializeWithError:&v40];
    id v8 = v40;

    if (v8) {
      goto LABEL_33;
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
LABEL_35:
        v27 = 0;
        *a3 = v12;
        goto LABEL_37;
      }
      id v8 = 0;
LABEL_36:
      v27 = 0;
      goto LABEL_37;
    }
  }
  uint64_t v13 = [(HAP2TLVParamServiceSignature *)self serviceType];

  if (v13)
  {
    v14 = [(HAP2TLVParamServiceSignature *)self serviceType];
    id v39 = 0;
    v7 = [v14 serializeWithError:&v39];
    id v8 = v39;

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
    goto LABEL_33;
  }
LABEL_18:
  v18 = [(HAP2TLVParamServiceSignature *)self properties];

  if (v18)
  {
    v19 = [(HAP2TLVParamServiceSignature *)self properties];
    id v38 = 0;
    v7 = [v19 serializeWithError:&v38];
    id v8 = v38;

    if (v8) {
      goto LABEL_33;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10) {
      goto LABEL_4;
    }
  }
  v20 = [(HAP2TLVParamServiceSignature *)self linkedServices];

  if (v20)
  {
    uint64_t v21 = [(HAP2TLVParamServiceSignature *)self linkedServices];
    id v37 = 0;
    v7 = [v21 serializeWithError:&v37];
    id v8 = v37;

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
LABEL_33:

    if (a3)
    {
      id v12 = v8;
      id v8 = v12;
      goto LABEL_35;
    }
    goto LABEL_36;
  }
LABEL_31:
  v25 = [(HAP2TLVParamServiceSignature *)self characteristicList];

  if (v25)
  {
    v26 = [(HAP2TLVParamServiceSignature *)self characteristicList];
    id v36 = 0;
    v7 = [v26 serializeWithError:&v36];
    id v8 = v36;

    if (v8) {
      goto LABEL_33;
    }
    id v29 = v7;
    unint64_t v30 = [v29 bytes];
    unint64_t v31 = v30 + [v29 length];
    do
    {
      if ((uint64_t)(v31 - v30) >= 255) {
        uint64_t v32 = 255;
      }
      else {
        uint64_t v32 = v31 - v30;
      }
      uint64_t v33 = TLV8BufferAppend();
      if (v33) {
        uint64_t v34 = 0;
      }
      else {
        uint64_t v34 = v32;
      }
      v30 += v34;
      if (v33) {
        BOOL v35 = 1;
      }
      else {
        BOOL v35 = v30 >= v31;
      }
    }
    while (!v35);
    uint64_t v11 = v33;

    if (v11) {
      goto LABEL_5;
    }
  }
  v27 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v41);
  id v8 = 0;
LABEL_37:
  TLV8BufferFree();

  return v27;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  if (v8 >= 1)
  {
    v28 = a4;
    id v29 = 0;
    id v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    unint64_t v30 = 0;
    id v12 = 0;
    unint64_t v13 = v7 + v8;
    while (1)
    {
      unsigned __int8 v41 = 0;
      uint64_t v40 = 0;
      v39[0] = 0;
      v39[1] = 0;
      uint64_t Next = TLV8GetNext();
      if (Next)
      {
        if (v28)
        {
          HMErrorFromOSStatus(Next);
          BOOL v25 = 0;
          id *v28 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v25 = 0;
        }
        uint64_t v24 = v29;
        unint64_t v23 = v30;
        goto LABEL_34;
      }
      if (!v40)
      {
        uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

        id v9 = (id)v26;
        if (v26) {
          goto LABEL_23;
        }
        goto LABEL_29;
      }
      if (v41 <= 0xEu)
      {
        if (v41 == 6)
        {
          id v37 = v9;
          unint64_t v15 = HAPTLVParseContiguousTlvs(6, v7, v13, v39, &v37);
          id v16 = v37;

          if (!v16)
          {
            id v36 = 0;
            uint64_t v22 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v36];
            id v16 = v36;
            v18 = v30;
            unint64_t v30 = (void *)v22;
LABEL_19:
          }
LABEL_20:

          id v9 = v16;
          goto LABEL_21;
        }
        if (v41 == 7)
        {
          unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v38 = v9;
          uint64_t v19 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v38];
          id v16 = v38;

          v18 = v12;
          id v12 = (void *)v19;
          goto LABEL_19;
        }
      }
      else
      {
        switch(v41)
        {
          case 0xFu:
            unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
            id v35 = v9;
            uint64_t v20 = +[HAP2TLVServicePropertiesWrapper parsedFromData:v15 error:&v35];
            id v16 = v35;

            v18 = v11;
            uint64_t v11 = (void *)v20;
            goto LABEL_19;
          case 0x10u:
            id v34 = v9;
            unint64_t v15 = HAPTLVParseContiguousTlvs(16, v7, v13, v39, &v34);
            id v16 = v34;

            if (!v16)
            {
              id v33 = 0;
              uint64_t v21 = [MEMORY[0x1E4F1C9B8] parsedFromData:v15 error:&v33];
              id v16 = v33;
              v18 = v29;
              id v29 = (void *)v21;
              goto LABEL_19;
            }
            goto LABEL_20;
          case 0x14u:
            id v32 = v9;
            unint64_t v15 = HAPTLVParseContiguousTlvs(20, v7, v13, v39, &v32);
            id v16 = v32;

            if (!v16)
            {
              id v31 = 0;
              uint64_t v17 = +[HAP2TLVParamCharacteristicList parsedFromData:v15 error:&v31];
              id v16 = v31;
              v18 = v10;
              uint64_t v10 = (void *)v17;
              goto LABEL_19;
            }
            goto LABEL_20;
        }
      }
LABEL_21:
      unint64_t v7 = v39[0];
      if (v39[0] >= v13)
      {
        if (v9)
        {
LABEL_23:
          uint64_t v24 = v29;
          unint64_t v23 = v30;
          if (v28)
          {
            id v9 = v9;
            BOOL v25 = 0;
            id *v28 = v9;
          }
          else
          {
            BOOL v25 = 0;
          }
          goto LABEL_34;
        }
LABEL_29:
        uint64_t v24 = v29;
        unint64_t v23 = v30;
        goto LABEL_30;
      }
    }
  }
  uint64_t v10 = 0;
  uint64_t v24 = 0;
  uint64_t v11 = 0;
  unint64_t v23 = 0;
  id v12 = 0;
LABEL_30:
  [(HAP2TLVParamServiceSignature *)self setInstanceID:v12];
  [(HAP2TLVParamServiceSignature *)self setServiceType:v23];
  [(HAP2TLVParamServiceSignature *)self setProperties:v11];
  [(HAP2TLVParamServiceSignature *)self setLinkedServices:v24];
  [(HAP2TLVParamServiceSignature *)self setCharacteristicList:v10];
  id v9 = 0;
  BOOL v25 = 1;
LABEL_34:

  return v25;
}

- (HAP2TLVParamServiceSignature)initWithInstanceID:(id)a3 serviceType:(id)a4 properties:(id)a5 linkedServices:(id)a6 characteristicList:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HAP2TLVParamServiceSignature;
  uint64_t v17 = [(HAP2TLVParamServiceSignature *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_instanceID, a3);
    objc_storeStrong((id *)&v18->_serviceType, a4);
    objc_storeStrong((id *)&v18->_properties, a5);
    objc_storeStrong((id *)&v18->_linkedServices, a6);
    objc_storeStrong((id *)&v18->_characteristicList, a7);
  }

  return v18;
}

- (HAP2TLVParamServiceSignature)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVParamServiceSignature;
  return [(HAP2TLVParamServiceSignature *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAP2TLVParamServiceSignature);
  unint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAP2TLVParamServiceSignature *)v6 parseFromData:v5 error:&v10];
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