@interface ATGrappaSession
- (ATGrappaSession)initWithType:(unint64_t)a3;
- (id)_deviceCreateSignature:(id *)a3 forData:(id)a4;
- (id)_deviceVerifySignature:(id)a3 forData:(id)a4;
- (id)_hostCreateSignature:(id *)a3 forData:(id)a4;
- (id)_hostVerifySignature:(id)a3 forData:(id)a4;
- (id)beginHostSessionWithDeviceResponseData:(id)a3;
- (id)createSignature:(id *)a3 forData:(id)a4;
- (id)deviceInfo;
- (id)establishDeviceSessionWithRequestData:(id)a3 responseData:(id *)a4;
- (id)establishHostSessionWithDeviceInfo:(id)a3 clientRequestData:(id *)a4;
- (id)verifySignature:(id)a3 forData:(id)a4;
@end

@implementation ATGrappaSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionRequestData, 0);

  objc_storeStrong((id *)&self->_sessionResponseData, 0);
}

- (id)_hostVerifySignature:(id)a3 forData:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 length] && objc_msgSend(v6, "length"))
  {
    unsigned int sessionId = self->_sessionId;
    id v9 = v7;
    uint64_t v10 = [v9 bytes];
    uint64_t v11 = [v9 length];
    id v12 = v6;
    uint64_t v13 = [v12 bytes];
    [v12 length];
    tTA34a4tbgsKsWljx9Ip(sessionId, v10, v11, v13);
    if (v14)
    {
      int v15 = v14;
      v16 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v20 = 134217984;
        uint64_t v21 = v15;
        _os_log_impl(&dword_1D9A2D000, v16, OS_LOG_TYPE_ERROR, "GrappaHostVerify failed. err=%ld", (uint8_t *)&v20, 0xCu);
      }

      uint64_t v17 = 0;
      goto LABEL_10;
    }
  }
  else if ([v7 length] || objc_msgSend(v6, "length"))
  {
    uint64_t v17 = 4;
LABEL_10:
    v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:v17 userInfo:0];
    goto LABEL_12;
  }
  v18 = 0;
LABEL_12:

  return v18;
}

- (id)_hostCreateSignature:(id *)a3 forData:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CFDataRef v6 = (const __CFData *)a4;
  if ([(__CFData *)v6 length])
  {
    uint64_t v16 = 0;
    unsigned int v15 = 0;
    unsigned int sessionId = self->_sessionId;
    BytePtr = CFDataGetBytePtr(v6);
    CFIndex Length = CFDataGetLength(v6);
    qk82YWRPNDt4yUtuP3cY(sessionId, (uint64_t)BytePtr, Length, &v16, (uint64_t)&v15);
    if (v10)
    {
      int v11 = v10;
      id v12 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v18 = v11;
        _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_ERROR, "GrappaHostSign failed. err=%ld", buf, 0xCu);
      }

      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:0 userInfo:0];
    }
    else
    {
      *a3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v16 length:v15];
      X5EvIJWqdcALcjaxX6Pl(v16);
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
    *a3 = 0;
  }

  return v13;
}

- (id)_deviceVerifySignature:(id)a3 forData:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 length] && objc_msgSend(v5, "length"))
  {
    id v7 = v6;
    [v7 bytes];
    [v7 length];
    id v8 = v5;
    [v8 bytes];
    [v8 length];
    CFUnnB0JdUjJ5CNJMkDS();
    if (v9)
    {
      int v10 = v9;
      int v11 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 134217984;
        uint64_t v15 = v10;
        _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_ERROR, "GrappaDeviceVerify failed. err=%ld", (uint8_t *)&v14, 0xCu);
      }

      goto LABEL_9;
    }
  }
  else if ([v6 length] || objc_msgSend(v5, "length"))
  {
LABEL_9:
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:0 userInfo:0];
    goto LABEL_11;
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (id)_deviceCreateSignature:(id *)a3 forData:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CFDataRef v6 = (const __CFData *)a4;
  if ([(__CFData *)v6 length])
  {
    uint64_t v15 = 0;
    uint64_t sessionId = self->_sessionId;
    BytePtr = CFDataGetBytePtr(v6);
    CFIndex Length = CFDataGetLength(v6);
    jumT7rcoieclCtxS2rgJ(sessionId, (uint64_t)BytePtr, Length, (uint64_t)&v15);
    if (v10)
    {
      int v11 = v10;
      id v12 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v17 = v11;
        _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_ERROR, "GrappaDeviceSign failed. err=%ld", buf, 0xCu);
      }

      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:0 userInfo:0];
    }
    else
    {
      *a3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v15 length:0];
      X5EvIJWqdcALcjaxX6Pl(v15);
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
    *a3 = 0;
  }

  return v13;
}

- (id)verifySignature:(id)a3 forData:(id)a4
{
  if (self->_sessionType) {
    [(ATGrappaSession *)self _hostVerifySignature:a3 forData:a4];
  }
  else {
  v4 = [(ATGrappaSession *)self _deviceVerifySignature:a3 forData:a4];
  }

  return v4;
}

- (id)createSignature:(id *)a3 forData:(id)a4
{
  if (self->_sessionType) {
    [(ATGrappaSession *)self _hostCreateSignature:a3 forData:a4];
  }
  else {
  v4 = [(ATGrappaSession *)self _deviceCreateSignature:a3 forData:a4];
  }

  return v4;
}

- (id)beginHostSessionWithDeviceResponseData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_sessionType != 1)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"ATGrappa.m" lineNumber:109 description:@"function is host-only"];
  }
  unsigned int sessionId = self->_sessionId;
  id v7 = v5;
  LainiFYJT9auDqhZYWzW(sessionId, [v7 bytes], objc_msgSend(v7, "length"));
  if (v8)
  {
    int v9 = v8;
    int v10 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 67109120;
      v14[1] = v9;
      _os_log_impl(&dword_1D9A2D000, v10, OS_LOG_TYPE_ERROR, "GrappaHostEstablishKey failed. err=%d", (uint8_t *)v14, 8u);
    }

    int v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:0 userInfo:0];
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

- (id)establishHostSessionWithDeviceInfo:(id)a3 clientRequestData:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (self->_sessionType != 1)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"ATGrappa.m" lineNumber:85 description:@"function is host-only"];
  }
  int v8 = [v7 objectForKey:@"version"];
  v20[0] = [v8 unsignedCharValue];

  int v9 = [v7 objectForKey:@"deviceType"];
  v20[1] = [v9 unsignedIntValue];

  int v10 = [v7 objectForKey:@"protocolVersion"];
  v20[2] = [v10 unsignedCharValue];

  memset(length, 0, sizeof(length));
  uhO2GULXwfgKwPcp4YR2((uint64_t)v20, (uint64_t)&self->_sessionId, &length[1], (uint64_t)length);
  if (v11)
  {
    int v12 = v11;
    uint64_t v13 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = v12;
      _os_log_impl(&dword_1D9A2D000, v13, OS_LOG_TYPE_ERROR, "GrappaHostInit failed, %ld", buf, 0xCu);
    }

    int v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:0 userInfo:0];
  }
  else
  {
    CFDataRef v15 = CFDataCreate(0, *(const UInt8 **)&length[1], length[0]);
    rpY4QOlsWsxk0fLzfV8h(*(uint64_t *)&length[1]);
    CFDataRef v16 = v15;
    int v14 = 0;
    *a4 = v16;
  }

  return v14;
}

- (id)establishDeviceSessionWithRequestData:(id)a3 responseData:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = v7;
  if (!self->_sessionType)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_14:
    CFDataRef v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"ATGrappa.m" lineNumber:66 description:@"no session request data"];

LABEL_9:
    uint64_t v13 = 0;
    goto LABEL_10;
  }
  CFDataRef v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2 object:self file:@"ATGrappa.m" lineNumber:65 description:@"function is client-only"];

  if (!v8) {
    goto LABEL_14;
  }
LABEL_3:
  uint64_t v17 = 0;
  id v9 = v8;
  VVaAJGMXS456O5KIXfqv([v9 bytes], objc_msgSend(v9, "length"), (uint64_t)&self->_sessionId, (uint64_t)&v17);
  if (!v10)
  {
    if (v17)
    {
      *a4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v17 length:0];
      X5EvIJWqdcALcjaxX6Pl(v17);
    }
    goto LABEL_9;
  }
  int v11 = v10;
  int v12 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = v11;
    _os_log_impl(&dword_1D9A2D000, v12, OS_LOG_TYPE_ERROR, "Grappa session could not be established, %ld", buf, 0xCu);
  }

  uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:0 userInfo:0];
LABEL_10:

  return v13;
}

- (id)deviceInfo
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  NuRl2rYpg6zLtnsguhi3();
  if (v2)
  {
    int v3 = v2;
    v4 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "GrappaDeviceGetInfo failed, %ld", buf, 0xCu);
    }
    id v5 = 0;
  }
  else
  {
    CFDataRef v6 = (void *)MEMORY[0x1E4F1C9E8];
    v4 = [NSNumber numberWithUnsignedChar:0];
    id v7 = [NSNumber numberWithUnsignedLong:0];
    int v8 = [NSNumber numberWithUnsignedChar:0];
    id v5 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v4, @"version", v7, @"deviceType", v8, @"protocolVersion", 0);
  }

  return v5;
}

- (ATGrappaSession)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATGrappaSession;
  result = [(ATGrappaSession *)&v5 init];
  if (result) {
    result->_sessionType = a3;
  }
  return result;
}

@end