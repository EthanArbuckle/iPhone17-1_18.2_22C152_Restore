@interface HMDDataStreamMessageCoder
+ (BOOL)_decodeOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6;
+ (BOOL)_decryptEncryptedOPACKFrame:(id)a3 sessionEncryption:(id)a4 receivedHeader:(id *)a5 receivedPayload:(id *)a6 error:(id *)a7;
+ (BOOL)_unpackUnencryptedOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6;
+ (BOOL)decryptEncryptedOPACKFrame:(id)a3 sessionEncryption:(id)a4 receivedHeader:(id *)a5 receivedPayload:(id *)a6 error:(id *)a7;
+ (BOOL)readHeaderFromPartialData:(const char *)a3 length:(unint64_t)a4 frameType:(unsigned __int8 *)a5 payloadLength:(unint64_t *)a6;
+ (BOOL)readHeaderFromPartialData:(id)a3 frameType:(unsigned __int8 *)a4 payloadLength:(unint64_t *)a5;
+ (BOOL)unpackUnencryptedOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6;
+ (id)_buildUnencryptedOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5;
+ (id)_encodeOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5;
+ (id)_encryptEncryptedOPACKHeader:(id)a3 payload:(id)a4 sessionEncryption:(id)a5 error:(id *)a6;
+ (id)buildUnencryptedOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5;
+ (id)encryptEncryptedOPACKHeader:(id)a3 payload:(id)a4 sessionEncryption:(id)a5 error:(id *)a6;
+ (id)eventHeaderForProtocol:(id)a3 topic:(id)a4;
+ (id)requestHeaderForProtocol:(id)a3 topic:(id)a4 identifier:(id)a5;
+ (id)responseHeaderForRequestHeader:(id)a3 status:(unsigned __int16)a4;
@end

@implementation HMDDataStreamMessageCoder

+ (id)responseHeaderForRequestHeader:(id)a3 status:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  v13[4] = *MEMORY[0x263EF8340];
  v12[0] = @"protocol";
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"protocol"];
  v13[0] = v6;
  v12[1] = @"response";
  v7 = [v5 objectForKeyedSubscript:@"request"];
  v13[1] = v7;
  v12[2] = @"id";
  v8 = objc_msgSend(v5, "objectForKeyedSubscript:");

  v13[2] = v8;
  v12[3] = @"status";
  v9 = [NSNumber numberWithUnsignedShort:v4];
  v13[3] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];

  return v10;
}

+ (id)requestHeaderForProtocol:(id)a3 topic:(id)a4 identifier:(id)a5
{
  v14[3] = *MEMORY[0x263EF8340];
  v13[0] = @"protocol";
  v13[1] = @"request";
  v14[0] = a3;
  v14[1] = a4;
  v13[2] = @"id";
  v14[2] = a5;
  v7 = NSDictionary;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v7 dictionaryWithObjects:v14 forKeys:v13 count:3];

  return v11;
}

+ (id)eventHeaderForProtocol:(id)a3 topic:(id)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"protocol";
  v10[1] = @"event";
  v11[0] = a3;
  v11[1] = a4;
  id v5 = NSDictionary;
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

+ (BOOL)readHeaderFromPartialData:(const char *)a3 length:(unint64_t)a4 frameType:(unsigned __int8 *)a5 payloadLength:(unint64_t *)a6
{
  if (a4 >= 4)
  {
    if (a5) {
      *a5 = *a3;
    }
    if (a6) {
      *a6 = ((unint64_t)*((unsigned __int8 *)a3 + 1) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 2) << 8) | *((unsigned __int8 *)a3 + 3);
    }
  }
  return a4 > 3;
}

+ (BOOL)readHeaderFromPartialData:(id)a3 frameType:(unsigned __int8 *)a4 payloadLength:(unint64_t *)a5
{
  if (dispatch_data_get_size((dispatch_data_t)a3) < 4) {
    return 0;
  }
  subrange = dispatch_data_create_subrange((dispatch_data_t)a3, 0, 4uLL);
  size_t v12 = 0;
  buffer_ptr = 0;
  dispatch_data_t v10 = dispatch_data_create_map(subrange, (const void **)&buffer_ptr, &v12);

  BOOL v8 = v10 != 0;
  if (v10)
  {
    if (a4) {
      *a4 = *(unsigned char *)buffer_ptr;
    }
    if (a5) {
      *a5 = ((unint64_t)*((unsigned __int8 *)buffer_ptr + 1) << 16) | ((unint64_t)*((unsigned __int8 *)buffer_ptr
    }
                                                                                                + 2) << 8) | *((unsigned __int8 *)buffer_ptr + 3);
  }

  return v8;
}

+ (id)buildUnencryptedOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5
{
  return +[HMDDataStreamMessageCoder _buildUnencryptedOPACKHeader:a3 payload:a4 error:a5];
}

+ (BOOL)unpackUnencryptedOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6
{
  return +[HMDDataStreamMessageCoder _unpackUnencryptedOPACKFrame:a3 receivedHeader:a4 receivedPayload:a5 error:a6];
}

+ (id)encryptEncryptedOPACKHeader:(id)a3 payload:(id)a4 sessionEncryption:(id)a5 error:(id *)a6
{
  return +[HMDDataStreamMessageCoder _encryptEncryptedOPACKHeader:a3 payload:a4 sessionEncryption:a5 error:a6];
}

+ (BOOL)decryptEncryptedOPACKFrame:(id)a3 sessionEncryption:(id)a4 receivedHeader:(id *)a5 receivedPayload:(id *)a6 error:(id *)a7
{
  return +[HMDDataStreamMessageCoder _decryptEncryptedOPACKFrame:a3 sessionEncryption:a4 receivedHeader:a5 receivedPayload:a6 error:a7];
}

+ (id)_buildUnencryptedOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5
{
  id v6 = +[HMDDataStreamMessageCoder _encodeOPACKHeader:payload:error:](HMDDataStreamMessageCoder, "_encodeOPACKHeader:payload:error:", a3, a4);
  id v7 = v6;
  if (!v6)
  {
LABEL_5:
    id v9 = 0;
    goto LABEL_7;
  }
  uint64_t v8 = [v6 length];
  if ((unint64_t)(v8 + 4) >= 0x100000)
  {
    if (a5)
    {
      [MEMORY[0x263F087E8] hmInternalErrorWithCode:1052];
      id v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  v11[0] = 3;
  v11[1] = BYTE2(v8);
  v11[2] = BYTE1(v8);
  void v11[3] = v8;
  id v9 = objc_msgSend(MEMORY[0x263EFF990], "dataWithCapacity:");
  [v9 appendBytes:v11 length:4];
  [v9 appendData:v7];
LABEL_7:

  return v9;
}

+ (id)_encryptEncryptedOPACKHeader:(id)a3 payload:(id)a4 sessionEncryption:(id)a5 error:(id *)a6
{
  id v9 = a5;
  dispatch_data_t v10 = +[HMDDataStreamMessageCoder _encodeOPACKHeader:a3 payload:a4 error:a6];
  v11 = v10;
  if (!v10)
  {
LABEL_5:
    v14 = 0;
    goto LABEL_7;
  }
  uint64_t v12 = [v10 length];
  uint64_t v13 = v12 + 20;
  if ((unint64_t)(v12 + 20) >= 0x100000)
  {
    if (a6)
    {
      [MEMORY[0x263F087E8] hmInternalErrorWithCode:1052];
      v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  v18[0] = 1;
  v18[1] = BYTE2(v12);
  v18[2] = BYTE1(v12);
  v18[3] = v12;
  v15 = [MEMORY[0x263EFF8F8] dataWithBytes:v18 length:4];
  v16 = [v9 encrypt:v11 additionalAuthenticatedData:v15];

  v14 = [MEMORY[0x263EFF990] dataWithCapacity:v13];
  [v14 appendBytes:v18 length:4];
  [v14 appendData:v16];

LABEL_7:
  return v14;
}

+ (id)_encodeOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5
{
  id v7 = a4;
  int v18 = 0;
  uint64_t v8 = (void *)MEMORY[0x230FBC730](a3, 0, &v18);
  if (v18) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  if (!v9)
  {
    uint64_t v11 = MEMORY[0x230FBC730](v7, 0, &v18);
    uint64_t v12 = (void *)v11;
    if (v18 || !v11)
    {
      if (a5)
      {
        v15 = HMErrorFromOSStatus();
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v13 = [v8 length];
      uint64_t v14 = [v12 length];
      if (v13 < 0x100)
      {
        char v17 = v13;
        dispatch_data_t v10 = [MEMORY[0x263EFF990] dataWithCapacity:v13 + v14 + 1];
        [v10 appendBytes:&v17 length:1];
        [v10 appendData:v8];
        [v10 appendData:v12];
        goto LABEL_19;
      }
      if (a5)
      {
        v15 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1052];
LABEL_15:
        dispatch_data_t v10 = 0;
        *a5 = v15;
LABEL_19:

        goto LABEL_20;
      }
    }
    dispatch_data_t v10 = 0;
    goto LABEL_19;
  }
  if (a5)
  {
    HMErrorFromOSStatus();
    dispatch_data_t v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    dispatch_data_t v10 = 0;
  }
LABEL_20:

  return v10;
}

+ (BOOL)_unpackUnencryptedOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  if ((unint64_t)[v9 length] > 3)
  {
    uint64_t v11 = objc_msgSend(v9, "subdataWithRange:", 4, objc_msgSend(v9, "length") - 4);
    BOOL v10 = +[HMDDataStreamMessageCoder _decodeOPACKFrame:v11 receivedHeader:a4 receivedPayload:a5 error:a6];
  }
  else if (a6)
  {
    [MEMORY[0x263F087E8] hmInternalErrorWithCode:1050];
    BOOL v10 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)_decodeOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  BOOL v10 = (unsigned __int8 *)[v9 bytes];
  uint64_t v11 = [v9 length];

  if (v11 && v11 - 1 >= (unint64_t)*v10)
  {
    unint64_t v13 = (void *)OPACKDecodeBytes();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v14 = (void *)OPACKDecodeBytes();
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (a4) {
          *a4 = v13;
        }
        if (a5) {
          *a5 = v14;
        }
        BOOL v12 = 1;
      }
      else if (a6)
      {
        [MEMORY[0x263F087E8] hmInternalErrorWithCode:1052];
        BOOL v12 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else if (a6)
    {
      [MEMORY[0x263F087E8] hmInternalErrorWithCode:1052];
      BOOL v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else if (a6)
  {
    [MEMORY[0x263F087E8] hmInternalErrorWithCode:1050];
    BOOL v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v12;
}

+ (BOOL)_decryptEncryptedOPACKFrame:(id)a3 sessionEncryption:(id)a4 receivedHeader:(id *)a5 receivedPayload:(id *)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  if ((unint64_t)[v11 length] > 0x13)
  {
    id v14 = v11;
    uint64_t v15 = [v14 bytes];
    uint64_t v16 = [v14 length];
    id v21 = 0;
    char v17 = [v12 decrypt:v15 + 4 length:v16 - 20 additionalAuthData:v15 additionalAuthDataLength:4 authTagData:v15 + v16 - 16 authTagDataLength:16 error:&v21];
    id v18 = v21;
    v19 = v18;
    if (v18)
    {
      BOOL v13 = 0;
      if (a7) {
        *a7 = v18;
      }
    }
    else
    {
      BOOL v13 = +[HMDDataStreamMessageCoder _decodeOPACKFrame:v17 receivedHeader:a5 receivedPayload:a6 error:a7];
    }
  }
  else if (a7)
  {
    [MEMORY[0x263F087E8] hmInternalErrorWithCode:1050];
    BOOL v13 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

@end