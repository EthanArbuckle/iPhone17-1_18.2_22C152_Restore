@interface HAPAudioStreamCodecConfiguration
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPAudioCodecTypeWrapper)codecType;
- (HAPAudioStreamCodecConfiguration)init;
- (HAPAudioStreamCodecConfiguration)initWithCodecType:(id)a3 codecParameters:(id)a4;
- (HAPAudioStreamCodecParameters)codecParameters;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setCodecParameters:(id)a3;
- (void)setCodecType:(id)a3;
@end

@implementation HAPAudioStreamCodecConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codecParameters, 0);

  objc_storeStrong((id *)&self->_codecType, 0);
}

- (void)setCodecParameters:(id)a3
{
}

- (HAPAudioStreamCodecParameters)codecParameters
{
  return self->_codecParameters;
}

- (void)setCodecType:(id)a3
{
}

- (HAPAudioCodecTypeWrapper)codecType
{
  return self->_codecType;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAPAudioStreamCodecConfiguration *)self codecType];
  v5 = [(HAPAudioStreamCodecConfiguration *)self codecParameters];
  v6 = [v3 stringWithFormat:@"<HAPAudioStreamCodecConfiguration codecType=%@, codecParameters=%@>", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HAPAudioStreamCodecConfiguration *)a3;
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
      v7 = [(HAPAudioStreamCodecConfiguration *)self codecType];
      v8 = [(HAPAudioStreamCodecConfiguration *)v6 codecType];
      if (v7 != v8)
      {
        v9 = [(HAPAudioStreamCodecConfiguration *)self codecType];
        v3 = [(HAPAudioStreamCodecConfiguration *)v6 codecType];
        if (![v9 isEqual:v3])
        {
          char v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      v11 = [(HAPAudioStreamCodecConfiguration *)self codecParameters];
      v12 = [(HAPAudioStreamCodecConfiguration *)v6 codecParameters];
      if (v11 == v12)
      {
        char v10 = 1;
      }
      else
      {
        v13 = [(HAPAudioStreamCodecConfiguration *)self codecParameters];
        v14 = [(HAPAudioStreamCodecConfiguration *)v6 codecParameters];
        char v10 = [v13 isEqual:v14];
      }
      v9 = v16;
      if (v7 == v8) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    char v10 = 0;
  }
LABEL_15:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPAudioStreamCodecConfiguration allocWithZone:a3];
  v5 = [(HAPAudioStreamCodecConfiguration *)self codecType];
  v6 = [(HAPAudioStreamCodecConfiguration *)self codecParameters];
  v7 = [(HAPAudioStreamCodecConfiguration *)v4 initWithCodecType:v5 codecParameters:v6];

  return v7;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  TLV8BufferInit();
  v5 = [(HAPAudioStreamCodecConfiguration *)self codecType];

  if (v5)
  {
    v6 = [(HAPAudioStreamCodecConfiguration *)self codecType];
    id v24 = 0;
    v7 = [v6 serializeWithError:&v24];
    id v8 = v24;

    if (v8) {
      goto LABEL_6;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = TLV8BufferAppend();

    if (v10)
    {
LABEL_21:
      if (a3)
      {
        HMErrorFromOSStatus(v10);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_23;
      }
      id v8 = 0;
      goto LABEL_26;
    }
  }
  v11 = [(HAPAudioStreamCodecConfiguration *)self codecParameters];

  if (!v11)
  {
LABEL_24:
    v21 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v25);
    id v8 = 0;
    goto LABEL_27;
  }
  v12 = [(HAPAudioStreamCodecConfiguration *)self codecParameters];
  id v23 = 0;
  v7 = [v12 serializeWithError:&v23];
  id v8 = v23;

  if (!v8)
  {
    id v14 = v7;
    unint64_t v15 = [v14 bytes];
    unint64_t v16 = v15 + [v14 length];
    do
    {
      if ((uint64_t)(v16 - v15) >= 255) {
        uint64_t v17 = 255;
      }
      else {
        uint64_t v17 = v16 - v15;
      }
      uint64_t v18 = TLV8BufferAppend();
      if (v18) {
        uint64_t v19 = 0;
      }
      else {
        uint64_t v19 = v17;
      }
      v15 += v19;
      if (v18) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v15 >= v16;
      }
    }
    while (!v20);
    uint64_t v10 = v18;

    if (v10) {
      goto LABEL_21;
    }
    goto LABEL_24;
  }
LABEL_6:

  if (a3)
  {
    id v13 = v8;
    id v8 = v13;
LABEL_23:
    v21 = 0;
    *a3 = v13;
    goto LABEL_27;
  }
LABEL_26:
  v21 = 0;
LABEL_27:
  TLV8BufferFree();

  return v21;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  if (v8 < 1)
  {
    id v9 = 0;
    uint64_t v10 = 0;
LABEL_16:
    -[HAPAudioStreamCodecConfiguration setCodecType:](self, "setCodecType:", v10, v24);
    [(HAPAudioStreamCodecConfiguration *)self setCodecParameters:v9];
    v11 = 0;
    BOOL v19 = 1;
    goto LABEL_24;
  }
  id v24 = a4;
  id v9 = 0;
  uint64_t v10 = 0;
  v11 = 0;
  unint64_t v12 = v7 + v8;
  while (1)
  {
    char v30 = 0;
    v28[1] = 0;
    uint64_t v29 = 0;
    v28[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next) {
      break;
    }
    if (!v29)
    {
      uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      v11 = (void *)v22;
      if (!v22) {
        goto LABEL_16;
      }
LABEL_20:
      BOOL v20 = v24;
      if (v24)
      {
        id v21 = v11;
        v11 = v21;
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    if (v30 == 2)
    {
      id v26 = v11;
      id v14 = HAPTLVParseContiguousTlvs(2, v7, v12, v28, &v26);
      id v16 = v26;

      if (!v16)
      {
        id v25 = 0;
        uint64_t v18 = +[HAPAudioStreamCodecParameters parsedFromData:v14 error:&v25];
        id v16 = v25;
        uint64_t v17 = v9;
        id v9 = (void *)v18;
LABEL_10:
      }
      v11 = v16;
      goto LABEL_12;
    }
    if (v30 == 1)
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v27 = v11;
      uint64_t v15 = +[HAPAudioCodecTypeWrapper parsedFromData:v14 error:&v27];
      id v16 = v27;

      uint64_t v17 = v10;
      uint64_t v10 = (void *)v15;
      goto LABEL_10;
    }
LABEL_12:
    unint64_t v7 = v28[0];
    if (v28[0] >= v12)
    {
      if (!v11) {
        goto LABEL_16;
      }
      goto LABEL_20;
    }
  }
  BOOL v20 = v24;
  if (v24)
  {
    HMErrorFromOSStatus(Next);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
    BOOL v19 = 0;
    *BOOL v20 = v21;
    goto LABEL_24;
  }
LABEL_23:
  BOOL v19 = 0;
LABEL_24:

  return v19;
}

- (HAPAudioStreamCodecConfiguration)initWithCodecType:(id)a3 codecParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPAudioStreamCodecConfiguration;
  id v9 = [(HAPAudioStreamCodecConfiguration *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_codecType, a3);
    objc_storeStrong((id *)&v10->_codecParameters, a4);
  }

  return v10;
}

- (HAPAudioStreamCodecConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPAudioStreamCodecConfiguration;
  return [(HAPAudioStreamCodecConfiguration *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPAudioStreamCodecConfiguration);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPAudioStreamCodecConfiguration *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      id v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }

  return v7;
}

@end