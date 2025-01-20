@interface NSCloudKitMirroringRequestManager
- (BOOL)enqueueRequest:(uint64_t *)a3 error:;
- (id)dequeueNextRequest;
- (void)dealloc;
- (void)dequeueAllPendingRequests;
- (void)requestFinished:(uint64_t)a1;
@end

@implementation NSCloudKitMirroringRequestManager

- (void)dealloc
{
  self->_pendingImportRequest = 0;
  self->_pendingExportRequest = 0;

  self->_pendingSetupRequest = 0;
  self->_pendingDelegateResetRequest = 0;

  self->_pendingResetRequest = 0;
  self->_pendingFetchRecordsRequest = 0;

  self->_pendingResetMetadataRequest = 0;
  self->_pendingSerializationRequest = 0;

  self->_pendingInitializeSchemaRequest = 0;
  self->_pendingExportProgressRequest = 0;

  self->_pendingAcceptShareInvitationRequest = 0;
  self->_activeRequest = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringRequestManager;
  [(NSCloudKitMirroringRequestManager *)&v3 dealloc];
}

- (BOOL)enqueueRequest:(uint64_t *)a3 error:
{
  v45[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v5 = (void *)result;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v5[3])
      {
        v5[3] = (id)a2;
        return 1;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!v5[6])
        {
          v5[6] = (id)a2;
          return 1;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v5[1])
          {
            v5[1] = (id)a2;
            return 1;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = v5[2];
            if (!v12)
            {
              v5[2] = (id)a2;
              return 1;
            }
            if (a2 && *(unsigned char *)(a2 + 56))
            {
              -[NSCloudKitMirroringRequest addContainerBlock:](v12, (void *)[(id)a2 requestCompletionBlock]);
              return 1;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (!v5[5])
              {
                v5[5] = (id)a2;
                return 1;
              }
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (!v5[7])
                {
                  v5[7] = (id)a2;
                  return 1;
                }
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if (!v5[4])
                  {
                    v5[4] = (id)a2;
                    return 1;
                  }
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    if (!v5[8])
                    {
                      v5[8] = (id)a2;
                      return 1;
                    }
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      if (!v5[9])
                      {
                        v5[9] = (id)a2;
                        return 1;
                      }
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        if (!v5[10])
                        {
                          v5[10] = (id)a2;
                          return 1;
                        }
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          uint64_t v26 = [NSString stringWithUTF8String:"Unknown request class: %@"];
                          _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, a2);
                          v33 = __pflogFaultLog;
                          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            *(void *)&buf[4] = a2;
                            _os_log_fault_impl(&dword_18AB82000, v33, OS_LOG_TYPE_FAULT, "CoreData: Unknown request class: %@", buf, 0xCu);
                          }
                          goto LABEL_53;
                        }
                        if (!v5[11])
                        {
                          v5[11] = (id)a2;
                          return 1;
                        }
                        if (a2 && *(unsigned char *)(a2 + 56))
                        {
                          id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
                          uint64_t v14 = v5[11];
                          if (v14) {
                            uint64_t v15 = *(void *)(v14 + 80);
                          }
                          else {
                            uint64_t v15 = 0;
                          }
                          v16 = (void *)[v13 initWithArray:v15];
                          [v16 addObjectsFromArray:*(void *)(a2 + 80)];
                          id v17 = objc_alloc(MEMORY[0x1E4F1CA48]);
                          uint64_t v18 = v5[11];
                          if (v18) {
                            uint64_t v19 = *(void *)(v18 + 88);
                          }
                          else {
                            uint64_t v19 = 0;
                          }
                          v20 = (void *)[v17 initWithArray:v19];
                          [v20 addObjectsFromArray:*(void *)(a2 + 88)];
                          v22 = (void *)v5[11];
                          if (v22
                            && (objc_setProperty_nonatomic_copy(v22, v21, v16, 80), (v24 = (void *)v5[11]) != 0))
                          {
                            objc_setProperty_nonatomic_copy(v24, v23, v20, 88);
                            uint64_t v25 = v5[11];
                          }
                          else
                          {
                            uint64_t v25 = 0;
                          }
                          -[NSCloudKitMirroringRequest addContainerBlock:](v25, (void *)[(id)a2 requestCompletionBlock]);

                          return 1;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F281F8];
    v45[0] = *MEMORY[0x1E4F28588];
    v8 = NSString;
    v9 = (objc_class *)objc_opt_class();
    *(void *)buf = [v8 stringWithFormat:@"Request '%@' was cancelled because there is already a pending request of type '%@'.", a2, NSStringFromClass(v9)];
    uint64_t v10 = objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 134417, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", buf, v45, 1));
    if (v10)
    {
      if (a3)
      {
        uint64_t v11 = v10;
        result = 0;
        *a3 = v11;
        return result;
      }
      return 0;
    }
LABEL_53:
    uint64_t v34 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringRequestManager.m");
    v41 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringRequestManager.m";
    __int16 v43 = 1024;
    int v44 = 164;
    _os_log_fault_impl(&dword_18AB82000, v41, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    return 0;
  }
  return result;
}

- (id)dequeueNextRequest
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (a1[12])
  {
    uint64_t v2 = [NSString stringWithUTF8String:"Dequeue called during an active request: %@"];
    _NSCoreDataLog(17, v2, v3, v4, v5, v6, v7, v8, (uint64_t)a1[12]);
    v9 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      id v14 = a1[12];
      *(_DWORD *)buf = 138412290;
      id v16 = v14;
      _os_log_fault_impl(&dword_18AB82000, v9, OS_LOG_TYPE_FAULT, "CoreData: Dequeue called during an active request: %@", buf, 0xCu);
    }
  }
  uint64_t v11 = a1 + 4;
  id v10 = a1[4];
  if (!v10)
  {
    uint64_t v11 = a1 + 3;
    id v10 = a1[3];
    if (!v10)
    {
      uint64_t v11 = a1 + 9;
      id v10 = a1[9];
      if (!v10)
      {
        uint64_t v11 = a1 + 5;
        id v10 = a1[5];
        if (!v10)
        {
          uint64_t v11 = a1 + 7;
          id v10 = a1[7];
          if (!v10)
          {
            uint64_t v11 = a1 + 11;
            id v10 = a1[11];
            if (!v10)
            {
              uint64_t v11 = a1 + 8;
              id v10 = a1[8];
              if (!v10)
              {
                uint64_t v11 = a1 + 1;
                id v10 = a1[1];
                if (!v10)
                {
                  uint64_t v11 = a1 + 2;
                  id v10 = a1[2];
                  if (!v10)
                  {
                    uint64_t v11 = a1 + 6;
                    id v10 = a1[6];
                    if (!v10)
                    {
                      uint64_t v11 = a1 + 10;
                      id v10 = a1[10];
                      if (!v10) {
                        return 0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  id v12 = v10;

  *uint64_t v11 = 0;
  if (v12) {
    a1[12] = v12;
  }
  return v12;
}

- (void)requestFinished:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 96);
    if (!v4)
    {
      uint64_t v17 = [NSString stringWithUTF8String:"requestFinished called without an active request: %@"];
      _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)a2);
      uint64_t v24 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        return;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = a2;
      id v14 = "CoreData: requestFinished called without an active request: %@";
      uint64_t v15 = v24;
      uint32_t v16 = 12;
      goto LABEL_8;
    }
    if (v4 != a2)
    {
      uint64_t v5 = [NSString stringWithUTF8String:"requestFinished called with a different request than the active request: %@\nCalled with: %@"];
      _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, *(void *)(a1 + 96));
      uint64_t v12 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        return;
      }
      id v13 = *(void **)(a1 + 96);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v13;
      __int16 v27 = 2112;
      uint64_t v28 = a2;
      id v14 = "CoreData: requestFinished called with a different request than the active request: %@\nCalled with: %@";
      uint64_t v15 = v12;
      uint32_t v16 = 22;
LABEL_8:
      _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, v14, buf, v16);
      return;
    }

    *(void *)(a1 + 96) = 0;
  }
}

- (void)dequeueAllPendingRequests
{
  if (!a1) {
    return 0;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = v2;
  if (a1[4])
  {
    objc_msgSend(v2, "addObject:");

    a1[4] = 0;
  }
  if (a1[3])
  {
    objc_msgSend(v3, "addObject:");

    a1[3] = 0;
  }
  if (a1[9])
  {
    objc_msgSend(v3, "addObject:");

    a1[9] = 0;
  }
  if (a1[5])
  {
    objc_msgSend(v3, "addObject:");

    a1[5] = 0;
  }
  if (a1[7])
  {
    objc_msgSend(v3, "addObject:");

    a1[7] = 0;
  }
  if (a1[8])
  {
    objc_msgSend(v3, "addObject:");

    a1[8] = 0;
  }
  if (a1[1])
  {
    objc_msgSend(v3, "addObject:");

    a1[1] = 0;
  }
  if (a1[2])
  {
    objc_msgSend(v3, "addObject:");

    a1[2] = 0;
  }
  if (a1[6])
  {
    objc_msgSend(v3, "addObject:");

    a1[6] = 0;
  }
  if (a1[10])
  {
    objc_msgSend(v3, "addObject:");

    a1[10] = 0;
  }
  if (a1[11])
  {
    objc_msgSend(v3, "addObject:");

    a1[11] = 0;
  }
  return v3;
}

@end