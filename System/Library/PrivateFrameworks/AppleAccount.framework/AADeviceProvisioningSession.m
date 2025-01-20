@interface AADeviceProvisioningSession
- (AADeviceProvisioningSession)init;
- (AADeviceProvisioningSession)initWithAccount:(id)a3;
- (AADeviceProvisioningSession)initWithDSID:(id)a3;
- (id)deviceProvisioningInfo;
- (int)eraseProvisioning;
- (int)provisionDeviceWithData:(id)a3;
- (int)synchronizeProvisioningWithData:(id)a3;
- (void)addProvisioningInfoToAARequest:(id)a3;
- (void)addProvisioningInfoToAARequest:(id)a3 withFallback:(BOOL)a4;
- (void)addProvisioningInfoToURLRequest:(id)a3 sendEmptyValues:(BOOL)a4;
- (void)setCookieStorageRef:(OpaqueCFHTTPCookieStorage *)a3;
@end

@implementation AADeviceProvisioningSession

- (AADeviceProvisioningSession)init
{
  return [(AADeviceProvisioningSession *)self initWithDSID:0];
}

- (AADeviceProvisioningSession)initWithDSID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "BADNESS!!! Nil DSID passed into provisioning session.", buf, 2u);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)AADeviceProvisioningSession;
  v7 = [(AADeviceProvisioningSession *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dsid, a3);
    uint64_t v9 = [v5 longLongValue];
    v8->_dsidNumber = v9;
    if (!v9)
    {
      v10 = _AALogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        dsid = v8->_dsid;
        *(_DWORD *)buf = 138412290;
        v15 = dsid;
        _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "BADNESS!!! Invalid DSID passed into provisioning session: %@", buf, 0xCu);
      }
    }
  }

  return v8;
}

- (AADeviceProvisioningSession)initWithAccount:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"AADeviceProvisioningSession.m" lineNumber:47 description:@"Nil account passed to provisioning session."];
  }
  v6 = objc_msgSend(v5, "aa_personID");
  v7 = [(AADeviceProvisioningSession *)self initWithDSID:v6];

  return v7;
}

- (void)setCookieStorageRef:(OpaqueCFHTTPCookieStorage *)a3
{
  self->_cookieStorageRef = a3;
}

- (void)addProvisioningInfoToAARequest:(id)a3
{
}

- (void)addProvisioningInfoToAARequest:(id)a3 withFallback:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  v6 = [(AADeviceProvisioningSession *)self deviceProvisioningInfo];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 objectForKeyedSubscript:@"mid_data"];
    [v10 setDeviceProvisioningMachineId:v8];

    uint64_t v9 = [v7 objectForKeyedSubscript:@"otp_data"];
    [v10 setDeviceProvisioningOneTimePassword:v9];
  }
  else if (v4)
  {
    [v10 setDeviceProvisioningOneTimePassword:&stru_1EF456870];
    [v10 setDeviceProvisioningMachineId:&stru_1EF456870];
  }
}

- (void)addProvisioningInfoToURLRequest:(id)a3 sendEmptyValues:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(AADeviceProvisioningSession *)self deviceProvisioningInfo];
  v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v4;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Adding HSA info to request. sendEmptyValues = %d", (uint8_t *)v12, 8u);
  }

  uint64_t v9 = [v7 objectForKeyedSubscript:@"mid_data"];
  uint64_t v10 = [v7 objectForKeyedSubscript:@"otp_data"];
  if (v4 && v9 == 0) {
    uint64_t v9 = &stru_1EF456870;
  }
  if (v4 && v10 == 0) {
    v11 = &stru_1EF456870;
  }
  else {
    v11 = (__CFString *)v10;
  }
  if (v9) {
    [v6 setValue:v9 forHTTPHeaderField:@"X-Apple-MD-M"];
  }
  if (v11) {
    [v6 setValue:v11 forHTTPHeaderField:@"X-Apple-MD"];
  }
}

- (id)deviceProvisioningInfo
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!self->_dsid)
  {
    uint64_t v10 = 0;
    goto LABEL_21;
  }
  v3 = _AALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v3, OS_LOG_TYPE_DEFAULT, "Request device provisioning info.", buf, 2u);
  }

  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v18 = 0;
  qi864985u0(self->_dsidNumber, (uint64_t)&v20, (uint64_t)&v18 + 4, (uint64_t)&v19, (uint64_t)&v18);
  if (!v4)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    id v6 = [v11 initWithBytesNoCopy:v20 length:HIDWORD(v18) freeWhenDone:0];
    id v12 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v13 = (void *)[v12 initWithBytesNoCopy:v19 length:v18 freeWhenDone:0];
    v14 = [v6 base64EncodedStringWithOptions:0];
    v15 = [v13 base64EncodedStringWithOptions:0];
    uint64_t v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v14;
      __int16 v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "Provisioning Info: mid - %@ otp - %@", buf, 0x16u);
    }

    v21[0] = @"mid_data";
    v21[1] = @"otp_data";
    v22[0] = v14;
    v22[1] = v15;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    if (v20) {
      jk24uiwqrg(v20);
    }
    if (v19) {
      jk24uiwqrg(v19);
    }

    goto LABEL_20;
  }
  int v5 = v4;
  if (v4 == -45061)
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Account not provisioned";
      v8 = v6;
      uint32_t v9 = 2;
LABEL_18:
      _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }
  else
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = v5;
      v7 = "ADIOTPRequest failed. ERROR: %d";
      v8 = v6;
      uint32_t v9 = 8;
      goto LABEL_18;
    }
  }
  uint64_t v10 = 0;
LABEL_20:

LABEL_21:

  return v10;
}

- (int)provisionDeviceWithData:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Begin device provisioning.", buf, 2u);
  }

  uint64_t v46 = 0;
  uint64_t v47 = 0;
  unint64_t dsidNumber = self->_dsidNumber;
  id v7 = v4;
  rsegvyrt87(dsidNumber, [v7 bytes], objc_msgSend(v7, "length"), (uint64_t)&v47, (uint64_t)&v46 + 4, (uint64_t)&v46);
  int v9 = v8;
  BOOL v10 = v8 == 0;
  id v11 = _AALogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "ADIProvisioningStart successful", buf, 2u);
    }

    id v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v47 length:HIDWORD(v46)];
    uint64_t v13 = +[AAURLConfiguration urlConfiguration];
    v14 = [v13 finishProvisioningURL];

    v15 = [[AADeviceProvisioningRequest alloc] initWithDSID:self->_dsid URLString:v14 requestData:v11];
    uint64_t v16 = v15;
    if (self->_cookieStorageRef) {
      -[AARequest setCookieStorage:](v15, "setCookieStorage:");
    }
    *(void *)buf = 0;
    v51 = buf;
    uint64_t v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__5;
    v54 = __Block_byref_object_dispose__5;
    id v55 = 0;
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__5;
    v44 = __Block_byref_object_dispose__5;
    id v45 = 0;
    v17 = _AALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "Sending finishProvisioningMachine Request", v36, 2u);
    }

    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    *(void *)v36 = 0;
    v37 = v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 1;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __55__AADeviceProvisioningSession_provisionDeviceWithData___block_invoke;
    v31[3] = &unk_1E5A49118;
    v33 = v36;
    v31[4] = self;
    v34 = buf;
    v35 = &v40;
    uint64_t v19 = v18;
    v32 = v19;
    [(AARequest *)v16 performRequestWithHandler:v31];
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    if (v37[24])
    {
      uint64_t v20 = _AALogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v48 = 0;
        _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "Calling ADIProvisioningEnd", v48, 2u);
      }

      [*((id *)v51 + 5) bytes];
      [*((id *)v51 + 5) length];
      [ (id) v41[5] bytes];
      [(id)v41[5] length];
      uv5t6nhkui();
      int v22 = v21;
      if (v21)
      {
        v23 = _AALogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v48 = 67109120;
          int v49 = v22;
          _os_log_impl(&dword_1A11D8000, v23, OS_LOG_TYPE_DEFAULT, "ADIProvisioningEnd failed. ERROR: %d", v48, 8u);
        }
      }
    }
    v24 = _AALogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v48 = 0;
      _os_log_impl(&dword_1A11D8000, v24, OS_LOG_TYPE_DEFAULT, "Calling ADIProvisioningSessionDestroy", v48, 2u);
    }

    fy34trz2st();
    int v9 = v25;
    if (v25)
    {
      v26 = _AALogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v48 = 67109120;
        int v49 = v9;
        uint64_t v27 = "ADIProvisioningSessionDestroy failed. ERROR: %d";
        v28 = v26;
        uint32_t v29 = 8;
LABEL_26:
        _os_log_impl(&dword_1A11D8000, v28, OS_LOG_TYPE_DEFAULT, v27, v48, v29);
      }
    }
    else
    {
      v26 = _AALogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v48 = 0;
        uint64_t v27 = "Device provisioning complete. Huzzah!";
        v28 = v26;
        uint32_t v29 = 2;
        goto LABEL_26;
      }
    }

    _Block_object_dispose(v36, 8);
    _Block_object_dispose(&v40, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_28;
  }
  if (v12)
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v9;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "ADIProvisioningStart failed. ERROR: %d", buf, 8u);
  }
LABEL_28:

  return v9;
}

void __55__AADeviceProvisioningSession_provisionDeviceWithData___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    int v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      id v24 = v7;
      _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "finishProvisioningMachine failed. ERROR: %@", (uint8_t *)&v23, 0xCu);
    }
  }
  else
  {
    int v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "finishProvisioningMachine succeeded", (uint8_t *)&v23, 2u);
    }

    BOOL v10 = [v6 responseDictionary];
    int v8 = [v10 objectForKeyedSubscript:@"settingInfo"];

    id v11 = [v6 responseDictionary];
    BOOL v12 = [v11 objectForKeyedSubscript:@"transportKey"];

    uint64_t v13 = [v6 responseDictionary];
    v14 = [v13 objectForKeyedSubscript:@"dsId"];
    uint64_t v15 = [v14 longLongValue];

    if (v15 != *(void *)(*(void *)(a1 + 32) + 16))
    {
      uint64_t v16 = _AALogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "Returned DSID from finishProvisioningMachine doesn't match!", (uint8_t *)&v23, 2u);
      }
    }
    if (v8)
    {
      uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
      uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v19 = *(NSObject **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    else
    {
      uint64_t v19 = _AALogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Didn't get a settingsInfo back from the server", (uint8_t *)&v23, 2u);
      }
    }

    if (v12)
    {
      uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v12 options:0];
      uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
      int v22 = *(NSObject **)(v21 + 40);
      *(void *)(v21 + 40) = v20;
    }
    else
    {
      int v22 = _AALogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "Didn't get a transportKey back from the server", (uint8_t *)&v23, 2u);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (int)synchronizeProvisioningWithData:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Begin synchronizing device provisioning.", buf, 2u);
  }

  uint64_t v25 = 0;
  *(void *)buf = 0;
  uint64_t v24 = 0;
  unint64_t dsidNumber = self->_dsidNumber;
  id v7 = v4;
  uint64_t v8 = [v7 bytes];
  uint64_t v9 = [v7 length];

  tn46gtiuhw(dsidNumber, v8, v9, (uint64_t)buf, (uint64_t)&v24 + 4, (uint64_t)&v25, (uint64_t)&v24);
  int v11 = v10;
  BOOL v12 = _AALogSystem();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)uint64_t v27 = 67109120;
      int v28 = v11;
      _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "ADISynchronize failed. ERROR: %d", v27, 8u);
    }
  }
  else
  {
    if (v13)
    {
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "ADISynchronize successful", v27, 2u);
    }

    BOOL v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v25 length:v24];
    id v14 = [NSString alloc];
    uint64_t v15 = (void *)[v14 initWithBytes:*(void *)buf length:HIDWORD(v24) encoding:0];
    uint64_t v16 = +[AAURLConfiguration urlConfiguration];
    uint64_t v17 = [v16 syncMachineURL];

    uint64_t v18 = [[AADeviceProvisioningRequest alloc] initWithDSID:self->_dsid URLString:v17 requestData:v12];
    [(AARequest *)v18 setDeviceProvisioningMachineId:v15];
    if (self->_cookieStorageRef) {
      -[AARequest setCookieStorage:](v18, "setCookieStorage:");
    }
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __63__AADeviceProvisioningSession_synchronizeProvisioningWithData___block_invoke;
    v22[3] = &unk_1E5A49140;
    v22[4] = self;
    dispatch_semaphore_t v23 = v19;
    uint64_t v20 = v19;
    [(AARequest *)v18 performRequestWithHandler:v22];
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  }
  return v11;
}

void __63__AADeviceProvisioningSession_synchronizeProvisioningWithData___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AALogSystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v16 = 138412290;
      id v17 = v7;
      int v10 = "syncMachine failed. ERROR: %@";
      int v11 = v8;
      uint32_t v12 = 12;
LABEL_9:
      _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, v12);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v9)
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "syncMachine succeeded", (uint8_t *)&v16, 2u);
  }

  BOOL v13 = [v6 responseDictionary];
  id v14 = [v13 objectForKeyedSubscript:@"dsId"];
  uint64_t v15 = [v14 longLongValue];

  if (v15 != *(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      int v10 = "Returned DSID from finishProvisioningMachine doesn't match!";
      int v11 = v8;
      uint32_t v12 = 2;
      goto LABEL_9;
    }
LABEL_10:
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (int)eraseProvisioning
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = _AALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    dsid = self->_dsid;
    *(_DWORD *)BOOL v9 = 138412290;
    *(void *)&v9[4] = dsid;
    _os_log_impl(&dword_1A11D8000, v3, OS_LOG_TYPE_DEFAULT, "Erase device provisioning for dsid:%@", v9, 0xCu);
  }

  int v5 = [MEMORY[0x1E4F28FE8] scannerWithString:self->_dsid];
  *(void *)BOOL v9 = 0;
  [v5 scanUnsignedLongLong:v9];
  p435tmhbla();
  int v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
}

@end