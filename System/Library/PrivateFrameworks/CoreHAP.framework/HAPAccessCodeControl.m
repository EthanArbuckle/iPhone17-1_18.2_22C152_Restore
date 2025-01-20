@interface HAPAccessCodeControl
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPAccessCodeControl)init;
- (HAPAccessCodeControl)initWithOperationType:(id)a3 accessCodeControlRequest:(id)a4 accessCodeControlResponse:(id)a5;
- (HAPAccessCodeOperationTypeWrapper)operationType;
- (NSMutableArray)accessCodeControlRequest;
- (NSMutableArray)accessCodeControlResponse;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setAccessCodeControlRequest:(id)a3;
- (void)setAccessCodeControlResponse:(id)a3;
- (void)setOperationType:(id)a3;
@end

@implementation HAPAccessCodeControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessCodeControlResponse, 0);
  objc_storeStrong((id *)&self->_accessCodeControlRequest, 0);

  objc_storeStrong((id *)&self->_operationType, 0);
}

- (void)setAccessCodeControlResponse:(id)a3
{
}

- (NSMutableArray)accessCodeControlResponse
{
  return self->_accessCodeControlResponse;
}

- (void)setAccessCodeControlRequest:(id)a3
{
}

- (NSMutableArray)accessCodeControlRequest
{
  return self->_accessCodeControlRequest;
}

- (void)setOperationType:(id)a3
{
}

- (HAPAccessCodeOperationTypeWrapper)operationType
{
  return self->_operationType;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPAccessCodeControl *)self operationType];
  v5 = [(HAPAccessCodeControl *)self accessCodeControlRequest];
  v6 = [(HAPAccessCodeControl *)self accessCodeControlResponse];
  v7 = [v3 stringWithFormat:@"<HAPAccessCodeControl operationType=%@, accessCodeControlRequest=%@, accessCodeControlResponse=%@>", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HAPAccessCodeControl *)a3;
  if (self == v6)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      v8 = [(HAPAccessCodeControl *)self operationType];
      v9 = [(HAPAccessCodeControl *)v7 operationType];
      if (v8 != v9)
      {
        v3 = [(HAPAccessCodeControl *)self operationType];
        v4 = [(HAPAccessCodeControl *)v7 operationType];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(HAPAccessCodeControl *)self accessCodeControlRequest];
      v12 = [(HAPAccessCodeControl *)v7 accessCodeControlRequest];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(HAPAccessCodeControl *)self accessCodeControlRequest];
        v26 = [(HAPAccessCodeControl *)v7 accessCodeControlRequest];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      v14 = [(HAPAccessCodeControl *)self accessCodeControlResponse];
      uint64_t v15 = [(HAPAccessCodeControl *)v7 accessCodeControlResponse];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        [(HAPAccessCodeControl *)self accessCodeControlResponse];
        v17 = v23 = v3;
        [(HAPAccessCodeControl *)v7 accessCodeControlResponse];
        v22 = v4;
        v18 = v9;
        v20 = v19 = v8;
        char v10 = [v17 isEqual:v20];

        v8 = v19;
        v9 = v18;
        v4 = v22;

        v3 = v23;
      }
      v13 = v24;
      v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    char v10 = 0;
  }
LABEL_21:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPAccessCodeControl allocWithZone:a3];
  v5 = [(HAPAccessCodeControl *)self operationType];
  v6 = [(HAPAccessCodeControl *)self accessCodeControlRequest];
  v7 = [(HAPAccessCodeControl *)self accessCodeControlResponse];
  v8 = [(HAPAccessCodeControl *)v4 initWithOperationType:v5 accessCodeControlRequest:v6 accessCodeControlResponse:v7];

  return v8;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v50 = 0u;
  TLV8BufferInit();
  v5 = [(HAPAccessCodeControl *)self operationType];

  if (!v5)
  {
LABEL_8:
    long long v46 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v43 = 0u;
    id v7 = [(HAPAccessCodeControl *)self accessCodeControlRequest];
    uint64_t v35 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v35)
    {
      uint64_t v12 = *(void *)v44;
      char v13 = 1;
      v36 = a3;
LABEL_10:
      uint64_t v14 = 0;
LABEL_11:
      if (*(void *)v44 != v12) {
        objc_enumerationMutation(v7);
      }
      uint64_t v15 = *(void **)(*((void *)&v43 + 1) + 8 * v14);
      if ((v13 & 1) != 0 || (uint64_t v16 = TLV8BufferAppend(), !v16))
      {
        id v42 = 0;
        v17 = [v15 serializeWithError:&v42];
        id v18 = v42;
        if (!v18)
        {
          id v19 = v17;
          unint64_t v20 = [v19 bytes];
          unint64_t v21 = v20 + [v19 length];
          while (1)
          {
            uint64_t v22 = (uint64_t)(v21 - v20) >= 255 ? 255 : v21 - v20;
            uint64_t v23 = TLV8BufferAppend();
            if (v23) {
              goto LABEL_41;
            }
            v20 += v22;
            if (v20 >= v21)
            {

              char v13 = 0;
              if (++v14 != v35) {
                goto LABEL_11;
              }
              char v13 = 0;
              a3 = v36;
              uint64_t v35 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
              if (v35) {
                goto LABEL_10;
              }
              goto LABEL_24;
            }
          }
        }
        goto LABEL_51;
      }
    }
    else
    {
LABEL_24:

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v7 = [(HAPAccessCodeControl *)self accessCodeControlResponse];
      uint64_t v24 = [v7 countByEnumeratingWithState:&v38 objects:v48 count:16];
      if (!v24)
      {
LABEL_40:

        v33 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v50);
        id v8 = 0;
        goto LABEL_48;
      }
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v39;
      char v27 = 1;
      v36 = a3;
LABEL_26:
      uint64_t v28 = 0;
LABEL_27:
      if (*(void *)v39 != v26) {
        objc_enumerationMutation(v7);
      }
      v29 = *(void **)(*((void *)&v38 + 1) + 8 * v28);
      if ((v27 & 1) != 0 || (uint64_t v16 = TLV8BufferAppend(), !v16))
      {
        id v37 = 0;
        v17 = [v29 serializeWithError:&v37];
        id v18 = v37;
        if (!v18)
        {
          id v19 = v17;
          unint64_t v30 = [v19 bytes];
          unint64_t v31 = v30 + [v19 length];
          while (1)
          {
            uint64_t v32 = (uint64_t)(v31 - v30) >= 255 ? 255 : v31 - v30;
            uint64_t v23 = TLV8BufferAppend();
            if (v23) {
              break;
            }
            v30 += v32;
            if (v30 >= v31)
            {

              char v27 = 0;
              if (++v28 != v25) {
                goto LABEL_27;
              }
              uint64_t v25 = [v7 countByEnumeratingWithState:&v38 objects:v48 count:16];
              char v27 = 0;
              if (v25) {
                goto LABEL_26;
              }
              goto LABEL_40;
            }
          }
LABEL_41:
          uint64_t v11 = v23;

LABEL_42:
          a3 = v36;
          goto LABEL_43;
        }
LABEL_51:
        id v8 = v18;
        a3 = v36;

LABEL_3:
        if (a3)
        {
          id v9 = v8;
          id v8 = v9;
LABEL_45:
          v33 = 0;
          *a3 = v9;
          goto LABEL_48;
        }
        goto LABEL_47;
      }
    }
    uint64_t v11 = v16;
    goto LABEL_42;
  }
  v6 = [(HAPAccessCodeControl *)self operationType];
  id v47 = 0;
  id v7 = [v6 serializeWithError:&v47];
  id v8 = v47;

  if (v8) {
    goto LABEL_3;
  }
  id v7 = v7;
  [v7 bytes];
  [v7 length];
  uint64_t v10 = TLV8BufferAppend();
  if (!v10)
  {

    goto LABEL_8;
  }
  uint64_t v11 = v10;
LABEL_43:

  if (a3)
  {
    HMErrorFromOSStatus(v11);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    goto LABEL_45;
  }
  id v8 = 0;
LABEL_47:
  v33 = 0;
LABEL_48:
  TLV8BufferFree();

  return v33;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  uint64_t v24 = a4;
  id v5 = a3;
  unint64_t v6 = [v5 bytes];
  uint64_t v7 = [v5 length];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [MEMORY[0x1E4F1CA48] array];
  if (v7 < 1)
  {
    uint64_t v11 = 0;
LABEL_22:
    -[HAPAccessCodeControl setOperationType:](self, "setOperationType:", v11, v24);
    [(HAPAccessCodeControl *)self setAccessCodeControlRequest:v8];
    [(HAPAccessCodeControl *)self setAccessCodeControlResponse:v9];
    uint64_t v10 = 0;
    BOOL v19 = 1;
    goto LABEL_30;
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  unint64_t v12 = v6 + v7;
  while (1)
  {
    char v32 = 0;
    v30[1] = 0;
    uint64_t v31 = 0;
    v30[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next) {
      break;
    }
    if (!v31)
    {
      uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      uint64_t v10 = (void *)v22;
      if (!v22) {
        goto LABEL_22;
      }
LABEL_26:
      unint64_t v20 = v24;
      if (v24)
      {
        id v21 = v10;
        uint64_t v10 = v21;
        goto LABEL_28;
      }
      goto LABEL_29;
    }
    switch(v32)
    {
      case 3:
        id v26 = v10;
        uint64_t v14 = HAPTLVParseContiguousTlvs(3, v6, v12, v30, &v26);
        id v16 = v26;

        if (!v16)
        {
          id v25 = 0;
          v17 = +[HAPAccessCodeControlResponse parsedFromData:v14 error:&v25];
          id v16 = v25;
          if (!v16)
          {
            id v18 = v9;
            goto LABEL_15;
          }
LABEL_16:
        }
LABEL_17:

        uint64_t v10 = v16;
        break;
      case 2:
        id v28 = v10;
        uint64_t v14 = HAPTLVParseContiguousTlvs(2, v6, v12, v30, &v28);
        id v16 = v28;

        if (!v16)
        {
          id v27 = 0;
          v17 = +[HAPAccessCodeControlRequest parsedFromData:v14 error:&v27];
          id v16 = v27;
          if (!v16)
          {
            id v18 = v8;
LABEL_15:
            objc_msgSend(v18, "addObject:", v17, v24);
          }
          goto LABEL_16;
        }
        goto LABEL_17;
      case 1:
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
        id v29 = v10;
        uint64_t v15 = +[HAPAccessCodeOperationTypeWrapper parsedFromData:v14 error:&v29];
        id v16 = v29;

        v17 = v11;
        uint64_t v11 = (void *)v15;
        goto LABEL_16;
    }
    unint64_t v6 = v30[0];
    if (v30[0] >= v12)
    {
      if (!v10) {
        goto LABEL_22;
      }
      goto LABEL_26;
    }
  }
  unint64_t v20 = v24;
  if (v24)
  {
    HMErrorFromOSStatus(Next);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:
    BOOL v19 = 0;
    id *v20 = v21;
    goto LABEL_30;
  }
LABEL_29:
  BOOL v19 = 0;
LABEL_30:

  return v19;
}

- (HAPAccessCodeControl)initWithOperationType:(id)a3 accessCodeControlRequest:(id)a4 accessCodeControlResponse:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HAPAccessCodeControl;
  unint64_t v12 = [(HAPAccessCodeControl *)&v19 init];
  char v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_operationType, a3);
    uint64_t v14 = [v10 mutableCopy];
    accessCodeControlRequest = v13->_accessCodeControlRequest;
    v13->_accessCodeControlRequest = (NSMutableArray *)v14;

    uint64_t v16 = [v11 mutableCopy];
    accessCodeControlResponse = v13->_accessCodeControlResponse;
    v13->_accessCodeControlResponse = (NSMutableArray *)v16;
  }
  return v13;
}

- (HAPAccessCodeControl)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPAccessCodeControl;
  return [(HAPAccessCodeControl *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = objc_alloc_init(HAPAccessCodeControl);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPAccessCodeControl *)v6 parseFromData:v5 error:&v10];
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