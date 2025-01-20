@interface HAPAccessCodeConfiguration
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPAccessCodeCharacterSetWrapper)characterSet;
- (HAPAccessCodeConfiguration)init;
- (HAPAccessCodeConfiguration)initWithCharacterSet:(id)a3 minimumValueLength:(id)a4 maximumValueLength:(id)a5 maximumAccessCodes:(id)a6;
- (HAPTLVUnsignedNumberValue)maximumAccessCodes;
- (HAPTLVUnsignedNumberValue)maximumValueLength;
- (HAPTLVUnsignedNumberValue)minimumValueLength;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setCharacterSet:(id)a3;
- (void)setMaximumAccessCodes:(id)a3;
- (void)setMaximumValueLength:(id)a3;
- (void)setMinimumValueLength:(id)a3;
@end

@implementation HAPAccessCodeConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumAccessCodes, 0);
  objc_storeStrong((id *)&self->_maximumValueLength, 0);
  objc_storeStrong((id *)&self->_minimumValueLength, 0);

  objc_storeStrong((id *)&self->_characterSet, 0);
}

- (void)setMaximumAccessCodes:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)maximumAccessCodes
{
  return self->_maximumAccessCodes;
}

- (void)setMaximumValueLength:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)maximumValueLength
{
  return self->_maximumValueLength;
}

- (void)setMinimumValueLength:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)minimumValueLength
{
  return self->_minimumValueLength;
}

- (void)setCharacterSet:(id)a3
{
}

- (HAPAccessCodeCharacterSetWrapper)characterSet
{
  return self->_characterSet;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPAccessCodeConfiguration *)self characterSet];
  v5 = [(HAPAccessCodeConfiguration *)self minimumValueLength];
  v6 = [(HAPAccessCodeConfiguration *)self maximumValueLength];
  v7 = [(HAPAccessCodeConfiguration *)self maximumAccessCodes];
  v8 = [v3 stringWithFormat:@"<HAPAccessCodeConfiguration characterSet=%@, minimumValueLength=%@, maximumValueLength=%@, maximumAccessCodes=%@>", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HAPAccessCodeConfiguration *)a3;
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
      v7 = [(HAPAccessCodeConfiguration *)self characterSet];
      v8 = [(HAPAccessCodeConfiguration *)v6 characterSet];
      if (v7 != v8)
      {
        v9 = [(HAPAccessCodeConfiguration *)self characterSet];
        v3 = [(HAPAccessCodeConfiguration *)v6 characterSet];
        v32 = v9;
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
          goto LABEL_25;
        }
      }
      v11 = [(HAPAccessCodeConfiguration *)self minimumValueLength];
      v12 = [(HAPAccessCodeConfiguration *)v6 minimumValueLength];
      if (v11 != v12)
      {
        v13 = [(HAPAccessCodeConfiguration *)self minimumValueLength];
        v31 = [(HAPAccessCodeConfiguration *)v6 minimumValueLength];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
LABEL_23:

LABEL_24:
          if (v7 == v8)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
        v29 = v13;
      }
      uint64_t v14 = [(HAPAccessCodeConfiguration *)self maximumValueLength];
      v15 = [(HAPAccessCodeConfiguration *)v6 maximumValueLength];
      v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        v25 = v12;
        v26 = v11;
      }
      else
      {
        v16 = [(HAPAccessCodeConfiguration *)self maximumValueLength];
        v27 = [(HAPAccessCodeConfiguration *)v6 maximumValueLength];
        v28 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          char v10 = 0;
          v22 = v30;
          goto LABEL_21;
        }
        v25 = v12;
        v26 = v11;
      }
      v17 = [(HAPAccessCodeConfiguration *)self maximumAccessCodes];
      uint64_t v18 = [(HAPAccessCodeConfiguration *)v6 maximumAccessCodes];
      if (v17 == (void *)v18)
      {

        char v10 = 1;
      }
      else
      {
        v19 = (void *)v18;
        [(HAPAccessCodeConfiguration *)self maximumAccessCodes];
        v20 = v24 = v3;
        v21 = [(HAPAccessCodeConfiguration *)v6 maximumAccessCodes];
        char v10 = [v20 isEqual:v21];

        v3 = v24;
      }
      v22 = v30;
      v12 = v25;
      v11 = v26;
      if (v30 == v15)
      {
LABEL_22:

        v13 = v29;
        if (v11 == v12) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
LABEL_21:

      goto LABEL_22;
    }
    char v10 = 0;
  }
LABEL_27:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPAccessCodeConfiguration allocWithZone:a3];
  v5 = [(HAPAccessCodeConfiguration *)self characterSet];
  v6 = [(HAPAccessCodeConfiguration *)self minimumValueLength];
  v7 = [(HAPAccessCodeConfiguration *)self maximumValueLength];
  v8 = [(HAPAccessCodeConfiguration *)self maximumAccessCodes];
  v9 = [(HAPAccessCodeConfiguration *)v4 initWithCharacterSet:v5 minimumValueLength:v6 maximumValueLength:v7 maximumAccessCodes:v8];

  return v9;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  TLV8BufferInit();
  v5 = [(HAPAccessCodeConfiguration *)self characterSet];

  if (v5)
  {
    v6 = [(HAPAccessCodeConfiguration *)self characterSet];
    id v25 = 0;
    v7 = [v6 serializeWithError:&v25];
    id v8 = v25;

    if (v8) {
      goto LABEL_19;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10) {
      goto LABEL_12;
    }
  }
  v11 = [(HAPAccessCodeConfiguration *)self minimumValueLength];

  if (!v11) {
    goto LABEL_9;
  }
  v12 = [(HAPAccessCodeConfiguration *)self minimumValueLength];
  id v24 = 0;
  v7 = [v12 serializeWithError:&v24];
  id v8 = v24;

  if (v8) {
    goto LABEL_19;
  }
  id v9 = v7;
  [v9 bytes];
  [v9 length];
  uint64_t v10 = TLV8BufferAppend();
  if (v10)
  {
LABEL_12:
    uint64_t v15 = v10;

LABEL_13:
    if (a3)
    {
      HMErrorFromOSStatus(v15);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = 0;
LABEL_21:
      v19 = 0;
      *a3 = v16;
      goto LABEL_23;
    }
    id v8 = 0;
LABEL_22:
    v19 = 0;
    goto LABEL_23;
  }

LABEL_9:
  v13 = [(HAPAccessCodeConfiguration *)self maximumValueLength];

  if (v13)
  {
    uint64_t v14 = [(HAPAccessCodeConfiguration *)self maximumValueLength];
    id v23 = 0;
    v7 = [v14 serializeWithError:&v23];
    id v8 = v23;

    if (v8) {
      goto LABEL_19;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();
    if (v10) {
      goto LABEL_12;
    }
  }
  v17 = [(HAPAccessCodeConfiguration *)self maximumAccessCodes];

  if (v17)
  {
    uint64_t v18 = [(HAPAccessCodeConfiguration *)self maximumAccessCodes];
    id v22 = 0;
    v7 = [v18 serializeWithError:&v22];
    id v8 = v22;

    if (v8)
    {
LABEL_19:

      if (a3)
      {
        id v16 = v8;
        id v8 = v16;
        goto LABEL_21;
      }
      goto LABEL_22;
    }
    id v21 = v7;
    [v21 bytes];
    [v21 length];
    uint64_t v15 = TLV8BufferAppend();

    if (v15) {
      goto LABEL_13;
    }
  }
  v19 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v26);
  id v8 = 0;
LABEL_23:
  TLV8BufferFree();

  return v19;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  if (v8 < 1)
  {
    uint64_t v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
LABEL_20:
    [(HAPAccessCodeConfiguration *)self setCharacterSet:v13];
    [(HAPAccessCodeConfiguration *)self setMinimumValueLength:v12];
    [(HAPAccessCodeConfiguration *)self setMaximumValueLength:v11];
    [(HAPAccessCodeConfiguration *)self setMaximumAccessCodes:v10];
    id v9 = 0;
    BOOL v20 = 1;
  }
  else
  {
    id v23 = self;
    id v24 = a4;
    id v25 = v6;
    id v9 = 0;
    uint64_t v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    unint64_t v14 = v7 + v8;
    while (1)
    {
      char v33 = 0;
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      unint64_t v30 = 0;
      uint64_t Next = TLV8GetNext();
      if (Next) {
        break;
      }
      if (!v32)
      {
        uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

        id v9 = (id)v21;
        if (v21) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
      switch(v33)
      {
        case 1:
          id v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v29 = v9;
          v17 = &v29;
          +[HAPAccessCodeCharacterSetWrapper parsedFromData:v16 error:&v29];
          v13 = uint64_t v18 = v13;
          goto LABEL_10;
        case 2:
          id v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v28 = v9;
          v17 = &v28;
          +[HAPTLVUnsignedNumberValue parsedFromData:v16 error:&v28];
          v12 = uint64_t v18 = v12;
          goto LABEL_10;
        case 3:
          id v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v27 = v9;
          v17 = &v27;
          +[HAPTLVUnsignedNumberValue parsedFromData:v16 error:&v27];
          v11 = uint64_t v18 = v11;
          goto LABEL_10;
        case 4:
          id v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v26 = v9;
          v17 = &v26;
          +[HAPTLVUnsignedNumberValue parsedFromData:v16 error:&v26];
          uint64_t v10 = v18 = v10;
LABEL_10:
          id v19 = *v17;

          id v9 = v19;
          break;
        default:
          break;
      }
      if (v30 >= v14)
      {
        if (v9)
        {
LABEL_13:
          id v6 = v25;
          if (v24)
          {
            id v9 = v9;
            BOOL v20 = 0;
            id *v24 = v9;
          }
          else
          {
            BOOL v20 = 0;
          }
          goto LABEL_24;
        }
LABEL_19:
        id v6 = v25;
        self = v23;
        goto LABEL_20;
      }
    }
    if (v24)
    {
      HMErrorFromOSStatus(Next);
      BOOL v20 = 0;
      id *v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v20 = 0;
    }
    id v6 = v25;
  }
LABEL_24:

  return v20;
}

- (HAPAccessCodeConfiguration)initWithCharacterSet:(id)a3 minimumValueLength:(id)a4 maximumValueLength:(id)a5 maximumAccessCodes:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HAPAccessCodeConfiguration;
  uint64_t v15 = [(HAPAccessCodeConfiguration *)&v18 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_characterSet, a3);
    objc_storeStrong((id *)&v16->_minimumValueLength, a4);
    objc_storeStrong((id *)&v16->_maximumValueLength, a5);
    objc_storeStrong((id *)&v16->_maximumAccessCodes, a6);
  }

  return v16;
}

- (HAPAccessCodeConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPAccessCodeConfiguration;
  return [(HAPAccessCodeConfiguration *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPAccessCodeConfiguration);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPAccessCodeConfiguration *)v6 parseFromData:v5 error:&v10];
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