@interface HAPSupportedFirmwareUpdateConfiguration
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPSupportedFirmwareUpdateConfiguration)init;
- (HAPSupportedFirmwareUpdateConfiguration)initWithUpdateDuration:(id)a3;
- (HAPTLVUnsignedNumberValue)updateDuration;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setUpdateDuration:(id)a3;
@end

@implementation HAPSupportedFirmwareUpdateConfiguration

- (void).cxx_destruct
{
}

- (void)setUpdateDuration:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)updateDuration
{
  return self->_updateDuration;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(HAPSupportedFirmwareUpdateConfiguration *)self updateDuration];
  v4 = [v2 stringWithFormat:@"<HAPSupportedFirmwareUpdateConfiguration updateDuration=%@>", v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAPSupportedFirmwareUpdateConfiguration *)a3;
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
      v6 = [(HAPSupportedFirmwareUpdateConfiguration *)self updateDuration];
      v7 = [(HAPSupportedFirmwareUpdateConfiguration *)v5 updateDuration];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        v8 = [(HAPSupportedFirmwareUpdateConfiguration *)self updateDuration];
        v9 = [(HAPSupportedFirmwareUpdateConfiguration *)v5 updateDuration];
        char v10 = [v8 isEqual:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPSupportedFirmwareUpdateConfiguration allocWithZone:a3];
  v5 = [(HAPSupportedFirmwareUpdateConfiguration *)self updateDuration];
  v6 = [(HAPSupportedFirmwareUpdateConfiguration *)v4 initWithUpdateDuration:v5];

  return v6;
}

- (id)serializeWithError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
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
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  TLV8BufferInit();
  v5 = [(HAPSupportedFirmwareUpdateConfiguration *)self updateDuration];

  if (!v5) {
    goto LABEL_9;
  }
  v6 = [(HAPSupportedFirmwareUpdateConfiguration *)self updateDuration];
  id v14 = 0;
  v7 = [v6 serializeWithError:&v14];
  id v8 = v14;

  if (!v8)
  {
    id v10 = v7;
    [v10 bytes];
    [v10 length];
    uint64_t v11 = TLV8BufferAppend();

    if (v11)
    {
      if (a3)
      {
        HMErrorFromOSStatus(v11);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_8;
      }
      id v8 = 0;
      goto LABEL_11;
    }
LABEL_9:
    v12 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v15);
    id v8 = 0;
    goto LABEL_12;
  }

  if (a3)
  {
    id v9 = v8;
    id v8 = v9;
LABEL_8:
    v12 = 0;
    *a3 = v9;
    goto LABEL_12;
  }
LABEL_11:
  v12 = 0;
LABEL_12:
  TLV8BufferFree();

  return v12;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];
  if (v8 < 1)
  {
    id v9 = 0;
    goto LABEL_17;
  }
  long long v20 = self;
  id v9 = 0;
  id v10 = 0;
  unint64_t v11 = v7 + v8;
  do
  {
    char v25 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    unint64_t v22 = 0;
    uint64_t Next = TLV8GetNext();
    if (Next)
    {
      if (a4)
      {
        HMErrorFromOSStatus(Next);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
LABEL_18:
      BOOL v17 = 0;
      goto LABEL_19;
    }
    if (!v24)
    {
      uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

      id v10 = (void *)v18;
      if (!v18) {
        goto LABEL_16;
      }
LABEL_9:
      if (a4)
      {
        id v16 = v10;
        id v10 = v16;
LABEL_14:
        BOOL v17 = 0;
        *a4 = v16;
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    if (v25 == 1)
    {
      v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      id v21 = v10;
      uint64_t v14 = +[HAPTLVUnsignedNumberValue parsedFromData:v13 error:&v21];
      id v15 = v21;

      id v10 = v15;
      id v9 = (void *)v14;
    }
  }
  while (v22 < v11);
  if (v10) {
    goto LABEL_9;
  }
LABEL_16:
  self = v20;
LABEL_17:
  -[HAPSupportedFirmwareUpdateConfiguration setUpdateDuration:](self, "setUpdateDuration:", v9, v20);
  id v10 = 0;
  BOOL v17 = 1;
LABEL_19:

  return v17;
}

- (HAPSupportedFirmwareUpdateConfiguration)initWithUpdateDuration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPSupportedFirmwareUpdateConfiguration;
  id v6 = [(HAPSupportedFirmwareUpdateConfiguration *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_updateDuration, a3);
  }

  return v7;
}

- (HAPSupportedFirmwareUpdateConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPSupportedFirmwareUpdateConfiguration;
  return [(HAPSupportedFirmwareUpdateConfiguration *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPSupportedFirmwareUpdateConfiguration);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPSupportedFirmwareUpdateConfiguration *)v6 parseFromData:v5 error:&v10];
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