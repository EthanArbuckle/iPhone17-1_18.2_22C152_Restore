@interface HAPWiFiConfigurationControl
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPTLVUnsignedNumberValue)cookie;
- (HAPTLVUnsignedNumberValue)operationTimeout;
- (HAPWiFiConfigurationControl)init;
- (HAPWiFiConfigurationControl)initWithOperationType:(id)a3 cookie:(id)a4 updateStatus:(id)a5 operationTimeout:(id)a6 countryCodeConfiguration:(id)a7 stationConfiguration:(id)a8;
- (HAPWiFiConfigurationOperationTypeWrapper)operationType;
- (HAPWiFiConfigurationUpdateStatusWrapper)updateStatus;
- (HAPWiFiStationConfiguration)stationConfiguration;
- (NSString)countryCodeConfiguration;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setCookie:(id)a3;
- (void)setCountryCodeConfiguration:(id)a3;
- (void)setOperationTimeout:(id)a3;
- (void)setOperationType:(id)a3;
- (void)setStationConfiguration:(id)a3;
- (void)setUpdateStatus:(id)a3;
@end

@implementation HAPWiFiConfigurationControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationConfiguration, 0);
  objc_storeStrong((id *)&self->_countryCodeConfiguration, 0);
  objc_storeStrong((id *)&self->_operationTimeout, 0);
  objc_storeStrong((id *)&self->_updateStatus, 0);
  objc_storeStrong((id *)&self->_cookie, 0);

  objc_storeStrong((id *)&self->_operationType, 0);
}

- (void)setStationConfiguration:(id)a3
{
}

- (HAPWiFiStationConfiguration)stationConfiguration
{
  return self->_stationConfiguration;
}

- (void)setCountryCodeConfiguration:(id)a3
{
}

- (NSString)countryCodeConfiguration
{
  return self->_countryCodeConfiguration;
}

- (void)setOperationTimeout:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)operationTimeout
{
  return self->_operationTimeout;
}

- (void)setUpdateStatus:(id)a3
{
}

- (HAPWiFiConfigurationUpdateStatusWrapper)updateStatus
{
  return self->_updateStatus;
}

- (void)setCookie:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)cookie
{
  return self->_cookie;
}

- (void)setOperationType:(id)a3
{
}

- (HAPWiFiConfigurationOperationTypeWrapper)operationType
{
  return self->_operationType;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPWiFiConfigurationControl *)self operationType];
  v5 = [(HAPWiFiConfigurationControl *)self cookie];
  v6 = [(HAPWiFiConfigurationControl *)self updateStatus];
  v7 = [(HAPWiFiConfigurationControl *)self operationTimeout];
  v8 = [(HAPWiFiConfigurationControl *)self countryCodeConfiguration];
  v9 = [(HAPWiFiConfigurationControl *)self stationConfiguration];
  v10 = [v3 stringWithFormat:@"<HAPWiFiConfigurationControl operationType=%@, cookie=%@, updateStatus=%@, operationTimeout=%@, countryCodeConfiguration=%@, stationConfiguration=%@>", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HAPWiFiConfigurationControl *)a3;
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
      v7 = [(HAPWiFiConfigurationControl *)self operationType];
      v8 = [(HAPWiFiConfigurationControl *)v6 operationType];
      if (v7 != v8)
      {
        v9 = [(HAPWiFiConfigurationControl *)self operationType];
        v48 = [(HAPWiFiConfigurationControl *)v6 operationType];
        v49 = v9;
        if (!objc_msgSend(v9, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_36;
        }
      }
      v11 = [(HAPWiFiConfigurationControl *)self cookie];
      v12 = [(HAPWiFiConfigurationControl *)v6 cookie];
      if (v11 != v12)
      {
        v3 = [(HAPWiFiConfigurationControl *)self cookie];
        v47 = [(HAPWiFiConfigurationControl *)v6 cookie];
        if (!objc_msgSend(v3, "isEqual:"))
        {
          char v10 = 0;
LABEL_34:

LABEL_35:
          if (v7 == v8)
          {
LABEL_37:

            goto LABEL_38;
          }
LABEL_36:

          goto LABEL_37;
        }
      }
      uint64_t v13 = [(HAPWiFiConfigurationControl *)self updateStatus];
      uint64_t v14 = [(HAPWiFiConfigurationControl *)v6 updateStatus];
      v46 = (void *)v13;
      BOOL v15 = v13 == v14;
      v16 = (void *)v14;
      if (!v15)
      {
        v17 = [(HAPWiFiConfigurationControl *)self updateStatus];
        v41 = [(HAPWiFiConfigurationControl *)v6 updateStatus];
        v42 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          char v10 = 0;
          v18 = v46;
LABEL_32:

LABEL_33:
          if (v11 == v12) {
            goto LABEL_35;
          }
          goto LABEL_34;
        }
      }
      uint64_t v19 = [(HAPWiFiConfigurationControl *)self operationTimeout];
      uint64_t v44 = [(HAPWiFiConfigurationControl *)v6 operationTimeout];
      v45 = (void *)v19;
      v43 = v16;
      if (v19 == v44)
      {
        v37 = v12;
      }
      else
      {
        v20 = v3;
        v21 = [(HAPWiFiConfigurationControl *)self operationTimeout];
        v39 = [(HAPWiFiConfigurationControl *)v6 operationTimeout];
        v40 = v21;
        if (!objc_msgSend(v21, "isEqual:"))
        {
          char v10 = 0;
          v24 = (void *)v44;
          v3 = v20;
LABEL_30:

LABEL_31:
          v16 = v43;
          v18 = v46;
          if (v46 == v43) {
            goto LABEL_33;
          }
          goto LABEL_32;
        }
        v37 = v12;
        v3 = v20;
      }
      v22 = [(HAPWiFiConfigurationControl *)self countryCodeConfiguration];
      uint64_t v38 = [(HAPWiFiConfigurationControl *)v6 countryCodeConfiguration];
      if (v22 == (void *)v38)
      {
        v33 = v3;
        v34 = v11;
      }
      else
      {
        v23 = [(HAPWiFiConfigurationControl *)self countryCodeConfiguration];
        v35 = [(HAPWiFiConfigurationControl *)v6 countryCodeConfiguration];
        v36 = v23;
        if (!objc_msgSend(v23, "isEqual:"))
        {
          char v10 = 0;
          v12 = v37;
          v30 = (void *)v38;
          goto LABEL_28;
        }
        v33 = v3;
        v34 = v11;
      }
      v25 = [(HAPWiFiConfigurationControl *)self stationConfiguration];
      uint64_t v26 = [(HAPWiFiConfigurationControl *)v6 stationConfiguration];
      if (v25 == (void *)v26)
      {

        char v10 = 1;
      }
      else
      {
        v27 = (void *)v26;
        [(HAPWiFiConfigurationControl *)self stationConfiguration];
        v28 = v32 = v22;
        v29 = [(HAPWiFiConfigurationControl *)v6 stationConfiguration];
        char v10 = [v28 isEqual:v29];

        v22 = v32;
      }
      v12 = v37;
      v30 = (void *)v38;
      v3 = v33;
      v11 = v34;
      if (v22 == (void *)v38)
      {
LABEL_29:

        v24 = (void *)v44;
        if (v45 == (void *)v44) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    char v10 = 0;
  }
LABEL_38:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPWiFiConfigurationControl allocWithZone:a3];
  v5 = [(HAPWiFiConfigurationControl *)self operationType];
  v6 = [(HAPWiFiConfigurationControl *)self cookie];
  v7 = [(HAPWiFiConfigurationControl *)self updateStatus];
  v8 = [(HAPWiFiConfigurationControl *)self operationTimeout];
  v9 = [(HAPWiFiConfigurationControl *)self countryCodeConfiguration];
  char v10 = [(HAPWiFiConfigurationControl *)self stationConfiguration];
  v11 = [(HAPWiFiConfigurationControl *)v4 initWithOperationType:v5 cookie:v6 updateStatus:v7 operationTimeout:v8 countryCodeConfiguration:v9 stationConfiguration:v10];

  return v11;
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
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  TLV8BufferInit();
  v5 = [(HAPWiFiConfigurationControl *)self operationType];

  if (v5)
  {
    v6 = [(HAPWiFiConfigurationControl *)self operationType];
    id v40 = 0;
    v7 = [v6 serializeWithError:&v40];
    id v8 = v40;

    if (v8) {
      goto LABEL_32;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10) {
      goto LABEL_16;
    }
  }
  v11 = [(HAPWiFiConfigurationControl *)self cookie];

  if (v11)
  {
    v12 = [(HAPWiFiConfigurationControl *)self cookie];
    id v39 = 0;
    v7 = [v12 serializeWithError:&v39];
    id v8 = v39;

    if (v8) {
      goto LABEL_32;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10) {
      goto LABEL_16;
    }
  }
  uint64_t v13 = [(HAPWiFiConfigurationControl *)self updateStatus];

  if (!v13) {
    goto LABEL_13;
  }
  uint64_t v14 = [(HAPWiFiConfigurationControl *)self updateStatus];
  id v38 = 0;
  v7 = [v14 serializeWithError:&v38];
  id v8 = v38;

  if (v8) {
    goto LABEL_32;
  }
  id v9 = v7;
  [v9 bytes];
  [v9 length];
  uint64_t v10 = TLV8BufferAppend();
  if (v10)
  {
LABEL_16:
    uint64_t v17 = v10;

LABEL_17:
    if (a3)
    {
      HMErrorFromOSStatus(v17);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = 0;
LABEL_34:
      uint64_t v26 = 0;
      *a3 = v18;
      goto LABEL_36;
    }
    id v8 = 0;
LABEL_35:
    uint64_t v26 = 0;
    goto LABEL_36;
  }

LABEL_13:
  BOOL v15 = [(HAPWiFiConfigurationControl *)self operationTimeout];

  if (v15)
  {
    v16 = [(HAPWiFiConfigurationControl *)self operationTimeout];
    id v37 = 0;
    v7 = [v16 serializeWithError:&v37];
    id v8 = v37;

    if (v8) {
      goto LABEL_32;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10) {
      goto LABEL_16;
    }
  }
  uint64_t v19 = [(HAPWiFiConfigurationControl *)self countryCodeConfiguration];

  if (v19)
  {
    v20 = [(HAPWiFiConfigurationControl *)self countryCodeConfiguration];
    id v36 = 0;
    v7 = [v20 serializeWithError:&v36];
    id v8 = v36;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v21 = [v9 bytes];
      unint64_t v22 = v21 + [v9 length];
      while (1)
      {
        uint64_t v23 = (uint64_t)(v22 - v21) >= 255 ? 255 : v22 - v21;
        uint64_t v10 = TLV8BufferAppend();
        if (v10) {
          goto LABEL_16;
        }
        v21 += v23;
        if (v21 >= v22)
        {

          goto LABEL_30;
        }
      }
    }
LABEL_32:

    if (a3)
    {
      id v18 = v8;
      id v8 = v18;
      goto LABEL_34;
    }
    goto LABEL_35;
  }
LABEL_30:
  v24 = [(HAPWiFiConfigurationControl *)self stationConfiguration];

  if (v24)
  {
    v25 = [(HAPWiFiConfigurationControl *)self stationConfiguration];
    id v35 = 0;
    v7 = [v25 serializeWithError:&v35];
    id v8 = v35;

    if (v8) {
      goto LABEL_32;
    }
    id v28 = v7;
    unint64_t v29 = [v28 bytes];
    unint64_t v30 = v29 + [v28 length];
    do
    {
      if ((uint64_t)(v30 - v29) >= 255) {
        uint64_t v31 = 255;
      }
      else {
        uint64_t v31 = v30 - v29;
      }
      uint64_t v32 = TLV8BufferAppend();
      if (v32) {
        uint64_t v33 = 0;
      }
      else {
        uint64_t v33 = v31;
      }
      v29 += v33;
      if (v32) {
        BOOL v34 = 1;
      }
      else {
        BOOL v34 = v29 >= v30;
      }
    }
    while (!v34);
    uint64_t v17 = v32;

    if (v17) {
      goto LABEL_17;
    }
  }
  uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v41);
  id v8 = 0;
LABEL_36:
  TLV8BufferFree();

  return v26;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 bytes];
  uint64_t v7 = [v5 length];
  if (v7 < 1)
  {
    id v9 = 0;
    v25 = 0;
    v24 = 0;
    uint64_t v10 = 0;
    v11 = 0;
    v12 = 0;
LABEL_25:
    -[HAPWiFiConfigurationControl setOperationType:](self, "setOperationType:", v9, v29);
    [(HAPWiFiConfigurationControl *)self setCookie:v12];
    [(HAPWiFiConfigurationControl *)self setUpdateStatus:v11];
    [(HAPWiFiConfigurationControl *)self setOperationTimeout:v10];
    [(HAPWiFiConfigurationControl *)self setCountryCodeConfiguration:v24];
    [(HAPWiFiConfigurationControl *)self setStationConfiguration:v25];
    id v8 = 0;
    BOOL v26 = 1;
  }
  else
  {
    id v29 = v5;
    id v8 = 0;
    id v9 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v10 = 0;
    v11 = 0;
    v12 = 0;
    unint64_t v13 = v6 + v7;
    while (1)
    {
      char v43 = 0;
      uint64_t v42 = 0;
      v41[0] = 0;
      v41[1] = 0;
      uint64_t Next = TLV8GetNext();
      if (Next) {
        break;
      }
      if (!v42)
      {
        uint64_t v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

        id v8 = (id)v27;
        if (v27) {
          goto LABEL_18;
        }
        goto LABEL_24;
      }
      switch(v43)
      {
        case 1:
          BOOL v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v40 = v8;
          uint64_t v16 = +[HAPWiFiConfigurationOperationTypeWrapper parsedFromData:v15 error:&v40];
          id v17 = v40;

          id v18 = v9;
          id v9 = (void *)v16;
          break;
        case 2:
          BOOL v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v39 = v8;
          uint64_t v19 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v39];
          id v17 = v39;

          id v18 = v12;
          v12 = (void *)v19;
          break;
        case 3:
          BOOL v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v38 = v8;
          uint64_t v20 = +[HAPWiFiConfigurationUpdateStatusWrapper parsedFromData:v15 error:&v38];
          id v17 = v38;

          id v18 = v11;
          v11 = (void *)v20;
          break;
        case 4:
          BOOL v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v37 = v8;
          uint64_t v21 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v37];
          id v17 = v37;

          id v18 = v10;
          uint64_t v10 = (void *)v21;
          break;
        case 10:
          id v36 = v8;
          BOOL v15 = HAPTLVParseContiguousTlvs(10, v6, v13, v41, &v36);
          id v17 = v36;

          if (v17) {
            goto LABEL_15;
          }
          id v35 = 0;
          uint64_t v22 = [NSString parsedFromData:v15 error:&v35];
          id v17 = v35;
          id v18 = v32;
          uint64_t v32 = (void *)v22;
          break;
        case 11:
          id v34 = v8;
          BOOL v15 = HAPTLVParseContiguousTlvs(11, v6, v13, v41, &v34);
          id v17 = v34;

          if (v17) {
            goto LABEL_15;
          }
          id v33 = 0;
          uint64_t v23 = +[HAPWiFiStationConfiguration parsedFromData:v15 error:&v33];
          id v17 = v33;
          id v18 = v31;
          uint64_t v31 = (void *)v23;
          break;
        default:
          goto LABEL_16;
      }

LABEL_15:
      id v8 = v17;
LABEL_16:
      unint64_t v6 = v41[0];
      if (v41[0] >= v13)
      {
        if (v8)
        {
LABEL_18:
          id v5 = v29;
          v25 = v31;
          v24 = v32;
          if (a4)
          {
            id v8 = v8;
            BOOL v26 = 0;
            *a4 = v8;
          }
          else
          {
            BOOL v26 = 0;
          }
          goto LABEL_29;
        }
LABEL_24:
        id v5 = v29;
        v25 = v31;
        v24 = v32;
        goto LABEL_25;
      }
    }
    if (a4)
    {
      HMErrorFromOSStatus(Next);
      BOOL v26 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v26 = 0;
    }
    id v5 = v29;
    v25 = v31;
    v24 = v32;
  }
LABEL_29:

  return v26;
}

- (HAPWiFiConfigurationControl)initWithOperationType:(id)a3 cookie:(id)a4 updateStatus:(id)a5 operationTimeout:(id)a6 countryCodeConfiguration:(id)a7 stationConfiguration:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HAPWiFiConfigurationControl;
  id v18 = [(HAPWiFiConfigurationControl *)&v24 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_operationType, a3);
    objc_storeStrong((id *)&v19->_cookie, a4);
    objc_storeStrong((id *)&v19->_updateStatus, a5);
    objc_storeStrong((id *)&v19->_operationTimeout, a6);
    objc_storeStrong((id *)&v19->_countryCodeConfiguration, a7);
    objc_storeStrong((id *)&v19->_stationConfiguration, a8);
  }

  return v19;
}

- (HAPWiFiConfigurationControl)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPWiFiConfigurationControl;
  return [(HAPWiFiConfigurationControl *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = objc_alloc_init(HAPWiFiConfigurationControl);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPWiFiConfigurationControl *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      uint64_t v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }

  return v7;
}

@end