@interface CLFindMyAccessoryFirmwareUpdateManager
- (CLFindMyAccessoryFirmwareUpdateDelegate)delegate;
- (CLFindMyAccessoryFirmwareUpdateManager)init;
- (CLFindMyAccessoryFirmwareUpdateManager)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (id).cxx_construct;
- (void)abortFirmwareUpdateForDevice:(id)a3;
- (void)fetchWhetherLocalFirmwareAssetIsInUseForProductGroup:(id)a3 andProductNumber:(id)a4;
- (void)getPersonalizationInfoForDevice:(id)a3;
- (void)handleInterruption;
- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3;
- (void)setDelegate:(id)a3;
- (void)updateFirmwareForDevice:(id)a3 withAssetURL:(id)a4;
- (void)useDefaultFirmwareAssetSourceForProductGroup:(id)a3 andProductNumber:(id)a4;
- (void)useLocalFirmwareAssetFromURL:(id)a3 forProductGroup:(id)a4 forProductNumber:(id)a5 withSandboxExtension:(id)a6;
@end

@implementation CLFindMyAccessoryFirmwareUpdateManager

- (CLFindMyAccessoryFirmwareUpdateManager)init
{
  return 0;
}

- (CLFindMyAccessoryFirmwareUpdateManager)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLFindMyAccessoryFirmwareUpdateManager;
  v6 = [(CLFindMyAccessoryFirmwareUpdateManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, a3);
    if (a4)
    {
      v7->_delegateQueue = (OS_dispatch_queue *)a4;
      dispatch_retain((dispatch_object_t)a4);
    }
    else
    {
      v7->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.FindMyAccessoryFirmwareUpdateManager.privateQueue", 0);
    }
    operator new();
  }
  return 0;
}

- (void)handleInterruption
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005F60);
  }
  v3 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_ERROR, "Connection to locationd interrupted!!", buf, 2u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005F60);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLFindMyAccessoryFirmwareUpdateManager handleInterruption]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8 = @"Connection to locationd interrupted!";
  v5 = objc_msgSend(v4, "initWithDomain:code:userInfo:", @"kCLErrorDomainPrivate", 8, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  [objc_loadWeak((id *)&self->_delegate) findMyAccessoryFirmwareUpdateManager:self didFailWithError:v5 forDevice:0];
}

- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = (CLConnectionMessage **)a3.var0;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005F60);
  }
  v5 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = CLConnectionMessage::name(*var0);
    if (*(char *)(v6 + 23) >= 0) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = *(void *)v6;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v56 = v7;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "Got Reply: message: %s", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005F60);
    }
    CLConnectionMessage::name(*var0);
    v49 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager handleMessage:]", "CoreLocation: %s\n", v49);
    if (v49 != (char *)buf) {
      free(v49);
    }
  }
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = (NSSet *)objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
  DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v12);
  v14 = (void *)[DictionaryOfClasses objectForKeyedSubscript:0x1EE00B6E0];
  uint64_t v15 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00B740];
  v16 = (const std::string *)CLConnectionMessage::name(*var0);
  if (!std::string::compare(v16, "DurianManagement/DidFetchPersonalizationInformation"))
  {
    uint64_t v23 = [DictionaryOfClasses objectForKeyedSubscript:0x1EE00B860];
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005F60);
    }
    v24 = qword_1E929F688;
    if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = objc_msgSend((id)objc_msgSend(v14, "UUIDString"), "UTF8String");
      v26 = "Failed";
      *(_DWORD *)buf = 136315650;
      uint64_t v56 = v25;
      if (!v15) {
        v26 = "Success";
      }
      __int16 v57 = 2080;
      uint64_t v58 = (uint64_t)v26;
      __int16 v59 = 2112;
      uint64_t v60 = v23;
      _os_log_impl(&dword_1906B8000, v24, OS_LOG_TYPE_DEFAULT, "informing client -- did retreive personalization info for device: %s - %s with info: %@", buf, 0x20u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F680 != -1) {
        dispatch_once(&qword_1E929F680, &unk_1EE005F60);
      }
      objc_msgSend((id)objc_msgSend(v14, "UUIDString"), "UTF8String");
      v50 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager handleMessage:]", "CoreLocation: %s\n", v50);
      if (v50 != (char *)buf) {
        free(v50);
      }
    }
    [objc_loadWeak((id *)&self->_delegate) findMyAccessoryFirmwareUpdateManager:self personalizationRequestForDevice:v14 completedWithInfo:v23 andError:v15];
  }
  else
  {
    v17 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v17, "DurianManagement/DidUpdateFirmware"))
    {
      if (qword_1E929F680 != -1) {
        dispatch_once(&qword_1E929F680, &unk_1EE005F60);
      }
      v27 = qword_1E929F688;
      if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = objc_msgSend((id)objc_msgSend(v14, "UUIDString"), "UTF8String");
        v29 = "Failed";
        if (!v15) {
          v29 = "Succeeded";
        }
        *(_DWORD *)buf = 136315394;
        uint64_t v56 = v28;
        __int16 v57 = 2080;
        uint64_t v58 = (uint64_t)v29;
        _os_log_impl(&dword_1906B8000, v27, OS_LOG_TYPE_DEFAULT, "informing client -- firmware update for device: %s - %s", buf, 0x16u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F680 != -1) {
          dispatch_once(&qword_1E929F680, &unk_1EE005F60);
        }
        objc_msgSend((id)objc_msgSend(v14, "UUIDString"), "UTF8String");
        v51 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager handleMessage:]", "CoreLocation: %s\n", v51);
        if (v51 != (char *)buf) {
          free(v51);
        }
      }
      [objc_loadWeak((id *)&self->_delegate) findMyAccessoryFirmwareUpdateManager:self firmwareUpdateRequestForDevice:v14 completedWithError:v15];
    }
    else
    {
      v18 = (const std::string *)CLConnectionMessage::name(*var0);
      if (!std::string::compare(v18, "DurianManagement/DidUseLocalAssetRequest"))
      {
        v30 = (void *)[DictionaryOfClasses objectForKeyedSubscript:0x1EE00BE00];
        v31 = (void *)[DictionaryOfClasses objectForKeyedSubscript:0x1EE00BE20];
        if (qword_1E929F680 != -1) {
          dispatch_once(&qword_1E929F680, &unk_1EE005F60);
        }
        v32 = qword_1E929F688;
        if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = [v30 UTF8String];
          uint64_t v34 = [v31 UTF8String];
          v35 = "Failed";
          *(_DWORD *)buf = 136315650;
          uint64_t v56 = v33;
          __int16 v57 = 2080;
          if (!v15) {
            v35 = "Succeeded";
          }
          uint64_t v58 = v34;
          __int16 v59 = 2080;
          uint64_t v60 = (uint64_t)v35;
          _os_log_impl(&dword_1906B8000, v32, OS_LOG_TYPE_DEFAULT, "informing client -- use local asset request for product group: %s, product number: %s - %s", buf, 0x20u);
        }
        if (sub_1906CB57C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929F680 != -1) {
            dispatch_once(&qword_1E929F680, &unk_1EE005F60);
          }
          [v30 UTF8String];
          [v31 UTF8String];
          v52 = (char *)_os_log_send_and_compose_impl();
          sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager handleMessage:]", "CoreLocation: %s\n", v52);
          if (v52 != (char *)buf) {
            free(v52);
          }
        }
        [objc_loadWeak((id *)&self->_delegate) findMyAccessoryFirmwareUpdateManager:self useLocalAssetRequestForProductGroup:v30 andProductNumber:v31 completedWithError:v15];
      }
      else
      {
        v19 = (const std::string *)CLConnectionMessage::name(*var0);
        if (!std::string::compare(v19, "DurianManagement/DidUseDefaultAssetRequest"))
        {
          v36 = (void *)[DictionaryOfClasses objectForKeyedSubscript:0x1EE00BE00];
          v37 = (void *)[DictionaryOfClasses objectForKeyedSubscript:0x1EE00BE20];
          if (qword_1E929F680 != -1) {
            dispatch_once(&qword_1E929F680, &unk_1EE005F60);
          }
          v38 = qword_1E929F688;
          if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v39 = [v36 UTF8String];
            uint64_t v40 = [v37 UTF8String];
            v41 = "Failed";
            *(_DWORD *)buf = 136315650;
            uint64_t v56 = v39;
            __int16 v57 = 2080;
            if (!v15) {
              v41 = "Succeeded";
            }
            uint64_t v58 = v40;
            __int16 v59 = 2080;
            uint64_t v60 = (uint64_t)v41;
            _os_log_impl(&dword_1906B8000, v38, OS_LOG_TYPE_DEFAULT, "informing client -- use default asset request for product group: %s, product number: %s - %s", buf, 0x20u);
          }
          if (sub_1906CB57C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1E929F680 != -1) {
              dispatch_once(&qword_1E929F680, &unk_1EE005F60);
            }
            [v36 UTF8String];
            [v37 UTF8String];
            v53 = (char *)_os_log_send_and_compose_impl();
            sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager handleMessage:]", "CoreLocation: %s\n", v53);
            if (v53 != (char *)buf) {
              free(v53);
            }
          }
          [objc_loadWeak((id *)&self->_delegate) findMyAccessoryFirmwareUpdateManager:self useDefaultAssetRequestForProductGroup:v36 andProductNumber:v37 completedWithError:v15];
        }
        else
        {
          v20 = (const std::string *)CLConnectionMessage::name(*var0);
          if (!std::string::compare(v20, "DurianManagement/DidFetchWhetherLocalFirmwareAssetIsInUse"))
          {
            v42 = (void *)[DictionaryOfClasses objectForKeyedSubscript:0x1EE00BE00];
            v43 = (void *)[DictionaryOfClasses objectForKeyedSubscript:0x1EE00BE20];
            uint64_t v44 = objc_msgSend((id)objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", 0x1EE00BE60), "BOOLValue");
            if (qword_1E929F680 != -1) {
              dispatch_once(&qword_1E929F680, &unk_1EE005F60);
            }
            v45 = qword_1E929F688;
            if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
            {
              if (v44) {
                v46 = "IN USE";
              }
              else {
                v46 = "NOT IN USE";
              }
              uint64_t v47 = [v42 UTF8String];
              uint64_t v48 = [v43 UTF8String];
              *(_DWORD *)buf = 136315650;
              uint64_t v56 = (uint64_t)v46;
              __int16 v57 = 2080;
              uint64_t v58 = v47;
              __int16 v59 = 2080;
              uint64_t v60 = v48;
              _os_log_impl(&dword_1906B8000, v45, OS_LOG_TYPE_DEFAULT, "informing client -- local firmware asset is %s for product group: %s, product number: %s", buf, 0x20u);
            }
            if (sub_1906CB57C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1E929F680 != -1) {
                dispatch_once(&qword_1E929F680, &unk_1EE005F60);
              }
              [v42 UTF8String];
              [v43 UTF8String];
              v54 = (char *)_os_log_send_and_compose_impl();
              sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager handleMessage:]", "CoreLocation: %s\n", v54);
              if (v54 != (char *)buf) {
                free(v54);
              }
            }
            [objc_loadWeak((id *)&self->_delegate) findMyAccessoryFirmwareUpdateManager:self didFetchWhetherLocalFirmwareAssetIsInUseForProductGroup:v42 andProductNumber:v43 withResult:v44];
          }
          else
          {
            if (qword_1E929F680 != -1) {
              dispatch_once(&qword_1E929F680, &unk_1EE005F60);
            }
            v21 = qword_1E929F688;
            if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1906B8000, v21, OS_LOG_TYPE_ERROR, "CLFindMyAccessoryFirmwareUpdateManager - Unknown Message - ignoring", buf, 2u);
            }
            if (sub_1906CB57C(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1E929F680 != -1) {
                dispatch_once(&qword_1E929F680, &unk_1EE005F60);
              }
              v22 = (char *)_os_log_send_and_compose_impl();
              sub_1906D4A28("Generic", 1, 0, 0, "-[CLFindMyAccessoryFirmwareUpdateManager handleMessage:]", "CoreLocation: %s\n", v22);
              if (v22 != (char *)buf) {
                free(v22);
              }
            }
          }
        }
      }
    }
  }
}

- (void)getPersonalizationInfoForDevice:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryFirmwareUpdateManager.mm", 142, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E56984B0, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005F60);
  }
  id v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_DEFAULT, "getPersonalizationInfoForDevice: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005F60);
    }
    int v10 = 138412290;
    id v11 = a3;
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager getPersonalizationInfoForDevice:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)updateFirmwareForDevice:(id)a3 withAssetURL:(id)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryFirmwareUpdateManager.mm", 154, @"Invalid parameter not satisfying: %@", @"assetURL");
  }
  v20[0] = 0x1EE00B6E0;
  v20[1] = 0x1EE00B880;
  v21[0] = a3;
  v21[1] = a4;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  sub_1906F4748(off_1E56984B8, &v11, &v9);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005F60);
  }
  uint64_t v6 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = a3;
    __int16 v18 = 2112;
    id v19 = a4;
    _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_DEFAULT, "updateFirmwareForDevice for device: %@ with assetURL: %@", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005F60);
    }
    int v12 = 138412546;
    id v13 = a3;
    __int16 v14 = 2112;
    id v15 = a4;
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager updateFirmwareForDevice:withAssetURL:]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  v8 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v8) {
    sub_1906BFE48(v8);
  }
  if (v10) {
    sub_1906BFE48(v10);
  }
}

- (void)abortFirmwareUpdateForDevice:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryFirmwareUpdateManager.mm", 165, @"Invalid parameter not satisfying: %@", @"device");
  }
  uint64_t v14 = 0x1EE00B6E0;
  v15[0] = a3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  sub_1906F4748(off_1E56984C0, &v9, &v7);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005F60);
  }
  id v4 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_DEFAULT, "abortFirmwareUpdateForDevice: %@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005F60);
    }
    int v10 = 138412290;
    id v11 = a3;
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager abortFirmwareUpdateForDevice:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v6) {
    sub_1906BFE48(v6);
  }
  if (v8) {
    sub_1906BFE48(v8);
  }
}

- (void)useLocalFirmwareAssetFromURL:(id)a3 forProductGroup:(id)a4 forProductNumber:(id)a5 withSandboxExtension:(id)a6
{
  v35[4] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryFirmwareUpdateManager.mm", 179, @"Invalid parameter not satisfying: %@", @"firmwareUpdateAssetURL");
    if (a4)
    {
LABEL_3:
      if (a5) {
        goto LABEL_4;
      }
LABEL_19:
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryFirmwareUpdateManager.mm", 181, @"Invalid parameter not satisfying: %@", @"productNumber");
      if (a6) {
        goto LABEL_5;
      }
      goto LABEL_20;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryFirmwareUpdateManager.mm", 180, @"Invalid parameter not satisfying: %@", @"productGroup");
  if (!a5) {
    goto LABEL_19;
  }
LABEL_4:
  if (a6) {
    goto LABEL_5;
  }
LABEL_20:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryFirmwareUpdateManager.mm", 182, @"Invalid parameter not satisfying: %@", @"extension");
LABEL_5:
  v34[0] = 0x1EE00BDE0;
  v34[1] = 0x1EE00BE00;
  v35[0] = a3;
  v35[1] = a4;
  v34[2] = 0x1EE00BE20;
  v34[3] = 0x1EE00BE40;
  v35[2] = a5;
  v35[3] = a6;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
  sub_1906F4748(off_1E56984C8, &v17, &v15);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005F60);
  }
  int v12 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v27 = a3;
    __int16 v28 = 2112;
    id v29 = a4;
    __int16 v30 = 2112;
    id v31 = a5;
    __int16 v32 = 2112;
    id v33 = a6;
    _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEFAULT, "useLocalFirmwareAssetFromURL: %@ forProductGroup: %@ forPorductNumber: %@ withSandboxExtension: %@", buf, 0x2Au);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005F60);
    }
    int v18 = 138413058;
    id v19 = a3;
    __int16 v20 = 2112;
    id v21 = a4;
    __int16 v22 = 2112;
    id v23 = a5;
    __int16 v24 = 2112;
    id v25 = a6;
    id v13 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager useLocalFirmwareAssetFromURL:forProductGroup:forProductNumber:withSandboxExtension:]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  uint64_t v14 = v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v14) {
    sub_1906BFE48(v14);
  }
  if (v16) {
    sub_1906BFE48(v16);
  }
}

- (void)useDefaultFirmwareAssetSourceForProductGroup:(id)a3 andProductNumber:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryFirmwareUpdateManager.mm", 203, @"Invalid parameter not satisfying: %@", @"productGroup");
    if (a4) {
      goto LABEL_3;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryFirmwareUpdateManager.mm", 204, @"Invalid parameter not satisfying: %@", @"productNumber");
LABEL_3:
  v22[0] = 0x1EE00BE00;
  v22[1] = 0x1EE00BE20;
  v23[0] = a3;
  v23[1] = a4;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  sub_1906F4748(off_1E56984D0, &v13, &v11);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005F60);
  }
  v8 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = a3;
    __int16 v20 = 2112;
    id v21 = a4;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "useDefaultFirmwareAssetSourceForProductGroup: %@ forPorductNumber: %@", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005F60);
    }
    int v14 = 138412546;
    id v15 = a3;
    __int16 v16 = 2112;
    id v17 = a4;
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager useDefaultFirmwareAssetSourceForProductGroup:andProductNumber:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  int v10 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v10) {
    sub_1906BFE48(v10);
  }
  if (v12) {
    sub_1906BFE48(v12);
  }
}

- (void)fetchWhetherLocalFirmwareAssetIsInUseForProductGroup:(id)a3 andProductNumber:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryFirmwareUpdateManager.mm", 221, @"Invalid parameter not satisfying: %@", @"productGroup");
    if (a4) {
      goto LABEL_3;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryFirmwareUpdateManager.mm", 222, @"Invalid parameter not satisfying: %@", @"productNumber");
LABEL_3:
  v22[0] = 0x1EE00BE00;
  v22[1] = 0x1EE00BE20;
  v23[0] = a3;
  v23[1] = a4;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  sub_1906F4748(&off_1E56984D8, &v13, &v11);
  if (qword_1E929F680 != -1) {
    dispatch_once(&qword_1E929F680, &unk_1EE005F60);
  }
  v8 = qword_1E929F688;
  if (os_log_type_enabled((os_log_t)qword_1E929F688, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = a3;
    __int16 v20 = 2112;
    id v21 = a4;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "fetchWhetherLocalFirmwareAssetIsInUseForProductGroup: %@ forPorductNumber: %@", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F680 != -1) {
      dispatch_once(&qword_1E929F680, &unk_1EE005F60);
    }
    int v14 = 138412546;
    id v15 = a3;
    __int16 v16 = 2112;
    id v17 = a4;
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager fetchWhetherLocalFirmwareAssetIsInUseForProductGroup:andProductNumber:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  int v10 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionClient::sendMessage();
  if (v10) {
    sub_1906BFE48(v10);
  }
  if (v12) {
    sub_1906BFE48(v12);
  }
}

- (CLFindMyAccessoryFirmwareUpdateDelegate)delegate
{
  return (CLFindMyAccessoryFirmwareUpdateDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  sub_19073DD74((uint64_t *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end