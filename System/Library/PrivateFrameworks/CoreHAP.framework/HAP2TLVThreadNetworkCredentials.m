@interface HAP2TLVThreadNetworkCredentials
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAP2TLVThreadNetworkCredentials)init;
- (HAP2TLVThreadNetworkCredentials)initWithNetworkName:(id)a3 channel:(id)a4 panID:(id)a5 extendedPanID:(id)a6 masterKey:(id)a7 reattachPeriod:(id)a8;
- (HAPTLVUnsignedNumberValue)channel;
- (HAPTLVUnsignedNumberValue)panID;
- (HAPTLVUnsignedNumberValue)reattachPeriod;
- (NSData)extendedPanID;
- (NSData)masterKey;
- (NSString)description;
- (NSString)networkName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setChannel:(id)a3;
- (void)setExtendedPanID:(id)a3;
- (void)setMasterKey:(id)a3;
- (void)setNetworkName:(id)a3;
- (void)setPanID:(id)a3;
- (void)setReattachPeriod:(id)a3;
@end

@implementation HAP2TLVThreadNetworkCredentials

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reattachPeriod, 0);
  objc_storeStrong((id *)&self->_masterKey, 0);
  objc_storeStrong((id *)&self->_extendedPanID, 0);
  objc_storeStrong((id *)&self->_panID, 0);
  objc_storeStrong((id *)&self->_channel, 0);

  objc_storeStrong((id *)&self->_networkName, 0);
}

- (void)setReattachPeriod:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)reattachPeriod
{
  return self->_reattachPeriod;
}

- (void)setMasterKey:(id)a3
{
}

- (NSData)masterKey
{
  return self->_masterKey;
}

- (void)setExtendedPanID:(id)a3
{
}

- (NSData)extendedPanID
{
  return self->_extendedPanID;
}

- (void)setPanID:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)panID
{
  return self->_panID;
}

- (void)setChannel:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)channel
{
  return self->_channel;
}

- (void)setNetworkName:(id)a3
{
}

- (NSString)networkName
{
  return self->_networkName;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HAP2TLVThreadNetworkCredentials *)self networkName];
  v5 = [(HAP2TLVThreadNetworkCredentials *)self channel];
  v6 = [(HAP2TLVThreadNetworkCredentials *)self panID];
  v7 = [(HAP2TLVThreadNetworkCredentials *)self extendedPanID];
  v8 = [(HAP2TLVThreadNetworkCredentials *)self masterKey];
  v9 = [(HAP2TLVThreadNetworkCredentials *)self reattachPeriod];
  v10 = [v3 stringWithFormat:@"<HAP2TLVThreadNetworkCredentials networkName=%@, channel=%@, panID=%@, extendedPanID=%@, masterKey=%@, reattachPeriod=%@>", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HAP2TLVThreadNetworkCredentials *)a3;
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
      v7 = [(HAP2TLVThreadNetworkCredentials *)self networkName];
      v8 = [(HAP2TLVThreadNetworkCredentials *)v6 networkName];
      if (v7 != v8)
      {
        v9 = [(HAP2TLVThreadNetworkCredentials *)self networkName];
        v48 = [(HAP2TLVThreadNetworkCredentials *)v6 networkName];
        v49 = v9;
        if (!objc_msgSend(v9, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_36;
        }
      }
      v11 = [(HAP2TLVThreadNetworkCredentials *)self channel];
      v12 = [(HAP2TLVThreadNetworkCredentials *)v6 channel];
      if (v11 != v12)
      {
        v3 = [(HAP2TLVThreadNetworkCredentials *)self channel];
        v47 = [(HAP2TLVThreadNetworkCredentials *)v6 channel];
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
      uint64_t v13 = [(HAP2TLVThreadNetworkCredentials *)self panID];
      uint64_t v14 = [(HAP2TLVThreadNetworkCredentials *)v6 panID];
      v46 = (void *)v13;
      BOOL v15 = v13 == v14;
      v16 = (void *)v14;
      if (!v15)
      {
        v17 = [(HAP2TLVThreadNetworkCredentials *)self panID];
        v41 = [(HAP2TLVThreadNetworkCredentials *)v6 panID];
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
      uint64_t v19 = [(HAP2TLVThreadNetworkCredentials *)self extendedPanID];
      uint64_t v44 = [(HAP2TLVThreadNetworkCredentials *)v6 extendedPanID];
      v45 = (void *)v19;
      v43 = v16;
      if (v19 == v44)
      {
        v37 = v12;
      }
      else
      {
        v20 = v3;
        v21 = [(HAP2TLVThreadNetworkCredentials *)self extendedPanID];
        v39 = [(HAP2TLVThreadNetworkCredentials *)v6 extendedPanID];
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
      v22 = [(HAP2TLVThreadNetworkCredentials *)self masterKey];
      uint64_t v38 = [(HAP2TLVThreadNetworkCredentials *)v6 masterKey];
      if (v22 == (void *)v38)
      {
        v33 = v3;
        v34 = v11;
      }
      else
      {
        v23 = [(HAP2TLVThreadNetworkCredentials *)self masterKey];
        v35 = [(HAP2TLVThreadNetworkCredentials *)v6 masterKey];
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
      v25 = [(HAP2TLVThreadNetworkCredentials *)self reattachPeriod];
      uint64_t v26 = [(HAP2TLVThreadNetworkCredentials *)v6 reattachPeriod];
      if (v25 == (void *)v26)
      {

        char v10 = 1;
      }
      else
      {
        v27 = (void *)v26;
        [(HAP2TLVThreadNetworkCredentials *)self reattachPeriod];
        v28 = v32 = v22;
        v29 = [(HAP2TLVThreadNetworkCredentials *)v6 reattachPeriod];
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
  v4 = +[HAP2TLVThreadNetworkCredentials allocWithZone:a3];
  v5 = [(HAP2TLVThreadNetworkCredentials *)self networkName];
  v6 = [(HAP2TLVThreadNetworkCredentials *)self channel];
  v7 = [(HAP2TLVThreadNetworkCredentials *)self panID];
  v8 = [(HAP2TLVThreadNetworkCredentials *)self extendedPanID];
  v9 = [(HAP2TLVThreadNetworkCredentials *)self masterKey];
  char v10 = [(HAP2TLVThreadNetworkCredentials *)self reattachPeriod];
  v11 = [(HAP2TLVThreadNetworkCredentials *)v4 initWithNetworkName:v5 channel:v6 panID:v7 extendedPanID:v8 masterKey:v9 reattachPeriod:v10];

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
  v5 = [(HAP2TLVThreadNetworkCredentials *)self networkName];

  if (v5)
  {
    v6 = [(HAP2TLVThreadNetworkCredentials *)self networkName];
    id v40 = 0;
    v7 = [v6 serializeWithError:&v40];
    id v8 = v40;

    if (!v8)
    {
      id v9 = v7;
      unint64_t v10 = [v9 bytes];
      unint64_t v11 = v10 + [v9 length];
      while (1)
      {
        uint64_t v12 = (uint64_t)(v11 - v10) >= 255 ? 255 : v11 - v10;
        uint64_t v13 = TLV8BufferAppend();
        if (v13) {
          goto LABEL_17;
        }
        v10 += v12;
        if (v10 >= v11)
        {

          goto LABEL_10;
        }
      }
    }
LABEL_42:

    if (a3)
    {
      id v19 = v8;
      id v8 = v19;
      goto LABEL_44;
    }
    goto LABEL_45;
  }
LABEL_10:
  uint64_t v14 = [(HAP2TLVThreadNetworkCredentials *)self channel];

  if (v14)
  {
    BOOL v15 = [(HAP2TLVThreadNetworkCredentials *)self channel];
    id v39 = 0;
    v7 = [v15 serializeWithError:&v39];
    id v8 = v39;

    if (v8) {
      goto LABEL_42;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v13 = TLV8BufferAppend();
    if (v13) {
      goto LABEL_17;
    }
  }
  v16 = [(HAP2TLVThreadNetworkCredentials *)self panID];

  if (v16)
  {
    v17 = [(HAP2TLVThreadNetworkCredentials *)self panID];
    id v38 = 0;
    v7 = [v17 serializeWithError:&v38];
    id v8 = v38;

    if (v8) {
      goto LABEL_42;
    }
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    uint64_t v13 = TLV8BufferAppend();
    if (v13) {
      goto LABEL_17;
    }
  }
  v20 = [(HAP2TLVThreadNetworkCredentials *)self extendedPanID];

  if (v20)
  {
    v21 = [(HAP2TLVThreadNetworkCredentials *)self extendedPanID];
    id v37 = 0;
    v7 = [v21 serializeWithError:&v37];
    id v8 = v37;

    if (v8) {
      goto LABEL_42;
    }
    id v9 = v7;
    unint64_t v22 = [v9 bytes];
    unint64_t v23 = v22 + [v9 length];
    while (1)
    {
      uint64_t v24 = (uint64_t)(v23 - v22) >= 255 ? 255 : v23 - v22;
      uint64_t v13 = TLV8BufferAppend();
      if (v13) {
        goto LABEL_17;
      }
      v22 += v24;
      if (v22 >= v23)
      {

        break;
      }
    }
  }
  v25 = [(HAP2TLVThreadNetworkCredentials *)self masterKey];

  if (v25)
  {
    uint64_t v26 = [(HAP2TLVThreadNetworkCredentials *)self masterKey];
    id v36 = 0;
    v7 = [v26 serializeWithError:&v36];
    id v8 = v36;

    if (v8) {
      goto LABEL_42;
    }
    id v9 = v7;
    unint64_t v27 = [v9 bytes];
    unint64_t v28 = v27 + [v9 length];
    while (1)
    {
      uint64_t v29 = (uint64_t)(v28 - v27) >= 255 ? 255 : v28 - v27;
      uint64_t v13 = TLV8BufferAppend();
      if (v13) {
        break;
      }
      v27 += v29;
      if (v27 >= v28)
      {

        goto LABEL_40;
      }
    }
LABEL_17:
    uint64_t v18 = v13;

LABEL_18:
    if (a3)
    {
      HMErrorFromOSStatus(v18);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = 0;
LABEL_44:
      v32 = 0;
      *a3 = v19;
      goto LABEL_46;
    }
    id v8 = 0;
LABEL_45:
    v32 = 0;
    goto LABEL_46;
  }
LABEL_40:
  v30 = [(HAP2TLVThreadNetworkCredentials *)self reattachPeriod];

  if (v30)
  {
    v31 = [(HAP2TLVThreadNetworkCredentials *)self reattachPeriod];
    id v35 = 0;
    v7 = [v31 serializeWithError:&v35];
    id v8 = v35;

    if (v8) {
      goto LABEL_42;
    }
    id v34 = v7;
    [v34 bytes];
    [v34 length];
    uint64_t v18 = TLV8BufferAppend();

    if (v18) {
      goto LABEL_18;
    }
  }
  v32 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v41);
  id v8 = 0;
LABEL_46:
  TLV8BufferFree();

  return v32;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 bytes];
  uint64_t v7 = [v5 length];
  if (v7 < 1)
  {
    unint64_t v23 = 0;
    id v9 = 0;
    v25 = 0;
    uint64_t v24 = 0;
    unint64_t v10 = 0;
    unint64_t v11 = 0;
LABEL_26:
    [(HAP2TLVThreadNetworkCredentials *)self setNetworkName:v23];
    [(HAP2TLVThreadNetworkCredentials *)self setChannel:v11];
    [(HAP2TLVThreadNetworkCredentials *)self setPanID:v10];
    [(HAP2TLVThreadNetworkCredentials *)self setExtendedPanID:v24];
    [(HAP2TLVThreadNetworkCredentials *)self setMasterKey:v25];
    [(HAP2TLVThreadNetworkCredentials *)self setReattachPeriod:v9];
    id v8 = 0;
    BOOL v26 = 1;
  }
  else
  {
    id v8 = 0;
    v31 = 0;
    v32 = 0;
    id v9 = 0;
    v30 = 0;
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    unint64_t v12 = v6 + v7;
    while (1)
    {
      char v44 = 0;
      v42[1] = 0;
      uint64_t v43 = 0;
      v42[0] = 0;
      uint64_t Next = TLV8GetNext();
      if (Next) {
        break;
      }
      if (!v43)
      {
        uint64_t v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];

        id v8 = (id)v27;
        if (v27) {
          goto LABEL_19;
        }
        goto LABEL_25;
      }
      switch(v44)
      {
        case 1:
          id v41 = v8;
          uint64_t v14 = HAPTLVParseContiguousTlvs(1, v6, v12, v42, &v41);
          id v15 = v41;

          if (v15) {
            goto LABEL_16;
          }
          id v40 = 0;
          uint64_t v16 = [NSString parsedFromData:v14 error:&v40];
          id v15 = v40;
          v17 = v32;
          v32 = (void *)v16;
          break;
        case 2:
          uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v39 = v8;
          uint64_t v18 = +[HAPTLVUnsignedNumberValue parsedFromData:v14 error:&v39];
          id v15 = v39;

          v17 = v11;
          unint64_t v11 = (void *)v18;
          break;
        case 3:
          uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v38 = v8;
          uint64_t v19 = +[HAPTLVUnsignedNumberValue parsedFromData:v14 error:&v38];
          id v15 = v38;

          v17 = v10;
          unint64_t v10 = (void *)v19;
          break;
        case 4:
          id v37 = v8;
          uint64_t v14 = HAPTLVParseContiguousTlvs(4, v6, v12, v42, &v37);
          id v15 = v37;

          if (v15) {
            goto LABEL_16;
          }
          id v36 = 0;
          uint64_t v20 = [MEMORY[0x1E4F1C9B8] parsedFromData:v14 error:&v36];
          id v15 = v36;
          v17 = v31;
          v31 = (void *)v20;
          break;
        case 5:
          id v35 = v8;
          uint64_t v14 = HAPTLVParseContiguousTlvs(5, v6, v12, v42, &v35);
          id v15 = v35;

          if (v15) {
            goto LABEL_16;
          }
          id v34 = 0;
          uint64_t v21 = [MEMORY[0x1E4F1C9B8] parsedFromData:v14 error:&v34];
          id v15 = v34;
          v17 = v30;
          v30 = (void *)v21;
          break;
        case 6:
          uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
          id v33 = v8;
          uint64_t v22 = +[HAPTLVUnsignedNumberValue parsedFromData:v14 error:&v33];
          id v15 = v33;

          v17 = v9;
          id v9 = (void *)v22;
          break;
        default:
          goto LABEL_17;
      }

LABEL_16:
      id v8 = v15;
LABEL_17:
      unint64_t v6 = v42[0];
      if (v42[0] >= v12)
      {
        if (v8)
        {
LABEL_19:
          uint64_t v24 = v31;
          unint64_t v23 = v32;
          v25 = v30;
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
          goto LABEL_30;
        }
LABEL_25:
        uint64_t v24 = v31;
        unint64_t v23 = v32;
        v25 = v30;
        goto LABEL_26;
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
    uint64_t v24 = v31;
    unint64_t v23 = v32;
    v25 = v30;
  }
LABEL_30:

  return v26;
}

- (HAP2TLVThreadNetworkCredentials)initWithNetworkName:(id)a3 channel:(id)a4 panID:(id)a5 extendedPanID:(id)a6 masterKey:(id)a7 reattachPeriod:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HAP2TLVThreadNetworkCredentials;
  uint64_t v18 = [(HAP2TLVThreadNetworkCredentials *)&v24 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_networkName, a3);
    objc_storeStrong((id *)&v19->_channel, a4);
    objc_storeStrong((id *)&v19->_panID, a5);
    objc_storeStrong((id *)&v19->_extendedPanID, a6);
    objc_storeStrong((id *)&v19->_masterKey, a7);
    objc_storeStrong((id *)&v19->_reattachPeriod, a8);
  }

  return v19;
}

- (HAP2TLVThreadNetworkCredentials)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVThreadNetworkCredentials;
  return [(HAP2TLVThreadNetworkCredentials *)&v3 init];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = objc_alloc_init(HAP2TLVThreadNetworkCredentials);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAP2TLVThreadNetworkCredentials *)v6 parseFromData:v5 error:&v10];
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