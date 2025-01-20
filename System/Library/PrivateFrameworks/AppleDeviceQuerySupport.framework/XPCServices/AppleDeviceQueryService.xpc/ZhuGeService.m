@interface ZhuGeService
- (Class)supportAssistantClass;
- (NSString)armoryClassName;
- (NSString)baseEntitlement;
- (NSString)domainString;
- (id)isCallerEntitledforInternalKey:(id)a3 withError:(id *)a4;
- (id)isCallerEntitledforKey:(id)a3 withError:(id *)a4;
- (void)assertCallerEntitledForInternalService;
- (void)assertCallerEntitledForService;
- (void)initData;
- (void)setBulkInternalKeys:(id)a3 getValuesAndError:(id)a4;
- (void)setBulkInternalMGKeys:(id)a3 getValuesAndError:(id)a4;
- (void)setBulkKeys:(id)a3 getValuesAndError:(id)a4;
- (void)setBulkMGKeys:(id)a3 getValuesAndError:(id)a4;
- (void)setInternalKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 getValueAndError:(id)a6;
- (void)setInternalMGKey:(id)a3 getValueAndError:(id)a4;
- (void)setKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 getValueAndError:(id)a6;
- (void)setMGKey:(id)a3 getValueAndError:(id)a4;
@end

@implementation ZhuGeService

- (void)initData
{
  baseEntitlement = self->_baseEntitlement;
  self->_baseEntitlement = (NSString *)@"com.apple.private.ZhuGeSupport.CopyValue";

  self->_supportAssistantClass = (Class)objc_opt_class();
  armoryClassName = self->_armoryClassName;
  self->_armoryClassName = (NSString *)@"OBJC_CLASS_$_AppleDeviceQueryArmory";

  domainString = self->_domainString;
  self->_domainString = (NSString *)&stru_1000148A0;
}

- (void)assertCallerEntitledForService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A444;
  block[3] = &unk_100014710;
  block[4] = self;
  if (qword_10001A2A8 != -1) {
    dispatch_once(&qword_10001A2A8, block);
  }
  if ((byte_10001A2B0 & 1) == 0)
  {
    v2 = +[ZhuGeSingletonService sharedInstance];
    v3 = [v2 xpcConnection];
    v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 processIdentifier]);
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService assertCallerEntitledForService]", 87, @"Failed to validate ZhuGe service entitlement for pid %@!", v5, v6, v7, (uint64_t)v4);

    v8 = +[ZhuGeSingletonService sharedInstance];
    v9 = [v8 xpcConnection];
    [v9 invalidate];
  }
}

- (id)isCallerEntitledforKey:(id)a3 withError:(id *)a4
{
  id v9 = a3;
  if (qword_10001A2B8 != -1) {
    dispatch_once(&qword_10001A2B8, &stru_100014730);
  }
  if (!v9)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService isCallerEntitledforKey:withError:]", 112, @"key pointer is nil!", v6, v7, v8, v43);
    id v18 = +[NSError errorWithZhuGeErrorCode:45 underlyingError:0];
    v15 = 0;
    v16 = 0;
    id v17 = 0;
LABEL_7:
    *a4 = v18;
    goto LABEL_8;
  }
  uint64_t v10 = [(id)qword_10001A2C0 getCacheForKey:v9];
  v11 = (void *)qword_10001A2C8;
  qword_10001A2C8 = v10;

  if (qword_10001A2C8)
  {
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService isCallerEntitledforKey:withError:]", 120, @"Get entitlement validation result for key \"%@\" from cache", v12, v13, v14, (uint64_t)v9);
    v15 = 0;
    v16 = 0;
    id v17 = 0;
    goto LABEL_8;
  }
  v21 = [(ZhuGeService *)self supportAssistantClass];
  v22 = [(ZhuGeService *)self armoryClassName];
  id v46 = 0;
  v15 = [(objc_class *)v21 getSharedInstanceByName:v22 withError:&v46];
  id v17 = v46;

  if (!v15)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService isCallerEntitledforKey:withError:]", 127, @"Failed to get the dylib shared instance!", v23, v24, v25, v43);
    id v18 = +[NSError errorWithZhuGeErrorCode:13 underlyingError:0];
    v16 = 0;
    goto LABEL_7;
  }
  v26 = [v15 helper];
  id v45 = v17;
  v16 = [v26 getConfigOfKey:v9 withError:&v45];
  id v27 = v45;

  if (!v16)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService isCallerEntitledforKey:withError:]", 134, @"Failed to get configuration for key \"%@\"!", v28, v29, v30, (uint64_t)v9);
    id v18 = v27;
    id v17 = v18;
    goto LABEL_7;
  }
  v31 = +[ZhuGeSingletonService sharedInstance];
  v32 = [v31 xpcConnection];
  v33 = [v16 objectForKeyedSubscript:@"ENTITLEMENT"];
  char v34 = isXPCConnectionEntitled(v32, v33);

  if (v34)
  {
    v38 = (void *)qword_10001A2C8;
    qword_10001A2C8 = (uint64_t)&__kCFBooleanTrue;

    id v44 = v27;
    unsigned __int8 v39 = [(id)qword_10001A2C0 setCache:qword_10001A2C8 forKey:v9 withError:&v44];
    id v17 = v44;

    if ((v39 & 1) == 0) {
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService isCallerEntitledforKey:withError:]", 149, @"Failed to cache entitlement validation result for key \"%@\", error: %@!", v40, v41, v42, (uint64_t)v9);
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService isCallerEntitledforKey:withError:]", 140, @"Current XPC connection is not entitled for key \"%@\"!", v35, v36, v37, (uint64_t)v9);
    id v17 = +[NSError errorWithZhuGeErrorCode:68 underlyingError:0];
  }
LABEL_8:
  id v19 = (id)qword_10001A2C8;

  return v19;
}

- (void)assertCallerEntitledForInternalService
{
  if (qword_10001A2D0 != -1) {
    dispatch_once(&qword_10001A2D0, &stru_100014750);
  }
  if ((byte_10001A2D8 & 1) == 0)
  {
    v2 = +[ZhuGeSingletonService sharedInstance];
    v3 = [v2 xpcConnection];
    v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 processIdentifier]);
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService assertCallerEntitledForInternalService]", 170, @"Failed to validate ZhuGe internal service entitlement for pid %@!", v5, v6, v7, (uint64_t)v4);

    id v9 = +[ZhuGeSingletonService sharedInstance];
    uint64_t v8 = [v9 xpcConnection];
    [v8 invalidate];
  }
}

- (id)isCallerEntitledforInternalKey:(id)a3 withError:(id *)a4
{
  id v8 = a3;
  if (qword_10001A2E0 != -1) {
    dispatch_once(&qword_10001A2E0, &stru_100014770);
  }
  if (!v8)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService isCallerEntitledforInternalKey:withError:]", 195, @"key pointer is nil!", v5, v6, v7, v41);
    id v17 = +[NSError errorWithZhuGeErrorCode:45 underlyingError:0];
    uint64_t v14 = 0;
    v15 = 0;
    id v16 = 0;
LABEL_7:
    *a4 = v17;
    goto LABEL_8;
  }
  uint64_t v9 = [(id)qword_10001A2E8 getCacheForKey:v8];
  uint64_t v10 = (void *)qword_10001A2F0;
  qword_10001A2F0 = v9;

  if (qword_10001A2F0)
  {
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService isCallerEntitledforInternalKey:withError:]", 203, @"Get entitlement validation result for internal key \"%@\" from cache", v11, v12, v13, (uint64_t)v8);
    uint64_t v14 = 0;
    v15 = 0;
    id v16 = 0;
    goto LABEL_8;
  }
  id v44 = 0;
  uint64_t v14 = +[ZhuGeSupportAssistant getSharedInstanceByName:@"OBJC_CLASS_$_ZhuGeInternalArmory" withError:&v44];
  id v23 = v44;
  if (!v14)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService isCallerEntitledforInternalKey:withError:]", 210, @"Failed to get the internal dylib shared instance!", v20, v21, v22, v41);
    id v17 = v23;
    id v16 = v17;
    v15 = 0;
    goto LABEL_7;
  }
  uint64_t v24 = [v14 helper];
  id v43 = v23;
  v15 = [v24 getConfigOfKey:v8 withError:&v43];
  id v25 = v43;

  if (!v15)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService isCallerEntitledforInternalKey:withError:]", 217, @"Failed to get configuration for internal key \"%@\"!", v26, v27, v28, (uint64_t)v8);
    id v17 = v25;
    id v16 = v17;
    goto LABEL_7;
  }
  uint64_t v29 = +[ZhuGeSingletonService sharedInstance];
  uint64_t v30 = [v29 xpcConnection];
  v31 = [v15 objectForKeyedSubscript:@"ENTITLEMENT"];
  char v32 = isXPCConnectionEntitled(v30, v31);

  if (v32)
  {
    uint64_t v36 = (void *)qword_10001A2F0;
    qword_10001A2F0 = (uint64_t)&__kCFBooleanTrue;

    id v42 = v25;
    unsigned __int8 v37 = [(id)qword_10001A2E8 setCache:qword_10001A2F0 forKey:v8 withError:&v42];
    id v16 = v42;

    if ((v37 & 1) == 0) {
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService isCallerEntitledforInternalKey:withError:]", 232, @"Failed to cache entitlement validation result for internal key \"%@\", error: %@!", v38, v39, v40, (uint64_t)v8);
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService isCallerEntitledforInternalKey:withError:]", 223, @"Current XPC connection is not entitled for internal key \"%@\"!", v33, v34, v35, (uint64_t)v8);
    id v16 = +[NSError errorWithZhuGeErrorCode:68 underlyingError:0];
  }
LABEL_8:
  id v18 = (id)qword_10001A2F0;

  return v18;
}

- (void)setKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 getValueAndError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void *, id))a6;
  [(ZhuGeService *)self assertCallerEntitledForService];
  if (!v10)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setKey:andOptions:andPreferences:getValueAndError:]", 256, @"key pointer is nil!", v14, v15, v16, v33);
    id v21 = +[NSError errorWithZhuGeErrorCode:45 underlyingError:0];
    id v17 = 0;
LABEL_8:
    uint64_t v24 = 0;
    uint64_t v29 = 0;
    goto LABEL_9;
  }
  ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setKey:andOptions:andPreferences:getValueAndError:]", 261, @"Received key: \"%@\"", v14, v15, v16, (uint64_t)v10);
  id v37 = 0;
  id v17 = [(ZhuGeService *)self isCallerEntitledforKey:v10 withError:&v37];
  id v21 = v37;
  if (!v17)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setKey:andOptions:andPreferences:getValueAndError:]", 265, @"The caller is not entitled for key \"%@\"!", v18, v19, v20, (uint64_t)v10);
    goto LABEL_8;
  }
  uint64_t v22 = [(ZhuGeService *)self supportAssistantClass];
  id v23 = [(ZhuGeService *)self armoryClassName];
  id v36 = v21;
  uint64_t v24 = [(objc_class *)v22 getSharedInstanceByName:v23 withError:&v36];
  id v25 = v36;

  if (v24)
  {
    id v35 = v25;
    uint64_t v29 = [v24 queryKey:v10 andOptions:v11 andPreferences:v12 withError:&v35];
    id v21 = v35;

    if (!v29) {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setKey:andOptions:andPreferences:getValueAndError:]", 290, @"\"%@\" query failed!", v30, v31, v32, (uint64_t)v10);
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setKey:andOptions:andPreferences:getValueAndError:]", 284, @"Failed to get the dylib shared instance!", v26, v27, v28, v34);
    uint64_t v29 = 0;
    id v21 = v25;
  }
LABEL_9:
  v13[2](v13, v29, v21);
}

- (void)setBulkKeys:(id)a3 getValuesAndError:(id)a4
{
  id v6 = a3;
  id v36 = (void (**)(id, id, void *))a4;
  [(ZhuGeService *)self assertCallerEntitledForService];
  id v35 = v6;
  if (v6)
  {
    ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkKeys:getValuesAndError:]", 313, @"Begin: bulk query keys", v7, v8, v9, v32);
    id v38 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v11)
    {
      uint64_t v37 = *(void *)v53;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v53 != v37) {
            objc_enumerationMutation(v10);
          }
          uint64_t v13 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          uint64_t v14 = [v10 objectForKeyedSubscript:v13];
          uint64_t v15 = [v14 objectForKeyedSubscript:@"Options"];

          uint64_t v16 = [v10 objectForKeyedSubscript:v13];
          id v17 = [v16 objectForKeyedSubscript:@"Preferences"];

          uint64_t v46 = 0;
          v47 = &v46;
          uint64_t v48 = 0x3032000000;
          v49 = sub_10000B664;
          v50 = sub_10000B674;
          id v51 = 0;
          uint64_t v40 = 0;
          uint64_t v41 = &v40;
          uint64_t v42 = 0x3032000000;
          id v43 = sub_10000B664;
          id v44 = sub_10000B674;
          id v45 = 0;
          uint64_t v34 = [(ZhuGeService *)self domainString];
          ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkKeys:getValuesAndError:]", 324, @"In bulk query, query key: \"%@\" in %@entrusted way", v18, v19, v20, v13);

          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_10000B67C;
          v39[3] = &unk_100014798;
          v39[4] = &v46;
          v39[5] = &v40;
          [(ZhuGeService *)self setKey:v13 andOptions:v15 andPreferences:v17 getValueAndError:v39];
          uint64_t v24 = v47[5];
          if (v24)
          {
            CFStringRef v56 = @"Value";
            uint64_t v57 = v24;
            +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
          }
          else
          {
            ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkKeys:getValuesAndError:]", 332, @"In bulk query, key \"%@\" failed! Error: %@", v21, v22, v23, v13);
            uint64_t v26 = v41[5];
            CFStringRef v58 = @"Error";
            uint64_t v59 = v26;
            +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          id v25 = };
          [v38 setObject:v25 forKeyedSubscript:v13];

          _Block_object_dispose(&v40, 8);
          _Block_object_dispose(&v46, 8);
        }
        id v11 = [v10 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v11);
    }

    id v30 = v38;
    uint64_t v31 = 0;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkKeys:getValuesAndError:]", 308, @"keysDict pointer is nil!", v7, v8, v9, v32);
    uint64_t v31 = +[NSError errorWithZhuGeErrorCode:45 underlyingError:0];
    id v30 = 0;
  }
  ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkKeys:getValuesAndError:]", 344, @"End: bulk query keys", v27, v28, v29, v33);
  v36[2](v36, v30, v31);
}

- (void)setInternalKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 getValueAndError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, id))a6;
  uint64_t v39 = 0;
  uint64_t v40 = (id *)&v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = sub_10000B664;
  id v43 = sub_10000B674;
  id v44 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = sub_10000B664;
  uint64_t v37 = sub_10000B674;
  id v38 = 0;
  [(ZhuGeService *)self assertCallerEntitledForInternalService];
  if (!v10)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setInternalKey:andOptions:andPreferences:getValueAndError:]", 363, @"key pointer is nil!", v14, v15, v16, v29);
    uint64_t v27 = +[NSError errorWithZhuGeErrorCode:45 underlyingError:0];
    id v28 = v40[5];
    v40[5] = (id)v27;

LABEL_7:
    uint64_t v23 = 0;
    uint64_t v18 = 0;
    goto LABEL_8;
  }
  ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setInternalKey:andOptions:andPreferences:getValueAndError:]", 368, @"Received internal key: \"%@\"", v14, v15, v16, (uint64_t)v10);
  id v17 = v40;
  id obj = v40[5];
  uint64_t v18 = [(ZhuGeService *)self isCallerEntitledforInternalKey:v10 withError:&obj];
  objc_storeStrong(v17 + 5, obj);
  if (!v18)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setInternalKey:andOptions:andPreferences:getValueAndError:]", 372, @"The caller is not entitled for internal key \"%@\"!", v19, v20, v21, (uint64_t)v10);
    goto LABEL_7;
  }
  uint64_t v22 = v40;
  id v31 = v40[5];
  uint64_t v23 = +[ZhuGeInternalSupportAssistant getXpcProxyWithError:&v31];
  objc_storeStrong(v22 + 5, v31);
  if (v23)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10000BA20;
    v30[3] = &unk_100014798;
    v30[4] = &v33;
    v30[5] = &v39;
    [v23 setKey:v10 andOptions:v11 andPreferences:v12 getValueAndError:v30];
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setInternalKey:andOptions:andPreferences:getValueAndError:]", 379, @"Failed to get internal service proxy for internal key \"%@\"!", v24, v25, v26, (uint64_t)v10);
    uint64_t v23 = 0;
  }
LABEL_8:
  v13[2](v13, v34[5], v40[5]);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
}

- (void)setBulkInternalKeys:(id)a3 getValuesAndError:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, id))a4;
  uint64_t v31 = 0;
  uint64_t v32 = (id *)&v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = sub_10000B664;
  uint64_t v35 = sub_10000B674;
  id v36 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_10000B664;
  uint64_t v29 = sub_10000B674;
  id v30 = 0;
  [(ZhuGeService *)self assertCallerEntitledForInternalService];
  if (!v6)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkInternalKeys:getValuesAndError:]", 403, @"keysDict pointer is nil!", v8, v9, v10, v21);
    uint64_t v19 = +[NSError errorWithZhuGeErrorCode:45 underlyingError:0];
    id v20 = v32[5];
    v32[5] = (id)v19;

LABEL_7:
    id v12 = 0;
    goto LABEL_8;
  }
  ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkInternalKeys:getValuesAndError:]", 408, @"Begin: bulk query internal keys", v8, v9, v10, v21);
  id v11 = v32;
  id obj = v32[5];
  id v12 = +[ZhuGeInternalSupportAssistant getXpcProxyWithError:&obj];
  objc_storeStrong(v11 + 5, obj);
  if (!v12)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkInternalKeys:getValuesAndError:]", 413, @"In bulk query, failed to get internal service proxy for internal keys!", v13, v14, v15, v22);
    goto LABEL_7;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000BD70;
  v23[3] = &unk_1000147C0;
  v23[4] = &v25;
  v23[5] = &v31;
  [v12 setBulkKeys:v6 getValuesAndError:v23];
  if (!v26[5]) {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkInternalKeys:getValuesAndError:]", 423, @"In bulk query, failed to query internal keys!", v16, v17, v18, v22);
  }
LABEL_8:
  ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkInternalKeys:getValuesAndError:]", 428, @"End: bulk query internal keys", v16, v17, v18, v22);
  v7[2](v7, v26[5], v32[5]);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

- (void)setMGKey:(id)a3 getValueAndError:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, id))a4;
  [(ZhuGeService *)self assertCallerEntitledForService];
  if (v6)
  {
    ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setMGKey:getValueAndError:]", 447, @"Trying MG key \"%@\"", v8, v9, v10, (uint64_t)v6);
    id v17 = 0;
    id v11 = MGQuery(v6, &v17);
    id v15 = v17;
    if (!v11) {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setMGKey:getValueAndError:]", 452, @"\"%@\" query failed!", v12, v13, v14, (uint64_t)v6);
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setMGKey:getValueAndError:]", 442, @"key pointer is nil!", v8, v9, v10, v16);
    id v15 = +[NSError errorWithZhuGeErrorCode:45 underlyingError:0];
    id v11 = 0;
  }
  v7[2](v7, v11, v15);
}

- (void)setBulkMGKeys:(id)a3 getValuesAndError:(id)a4
{
  id v6 = a3;
  uint64_t v32 = (void (**)(id, id, void *))a4;
  [(ZhuGeService *)self assertCallerEntitledForService];
  uint64_t v31 = v6;
  if (v6)
  {
    ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkMGKeys:getValuesAndError:]", 476, @"Begin: bulk query MG keys", v7, v8, v9, v28);
    id v34 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v6;
    id v10 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v49;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v42 = 0;
          id v43 = &v42;
          uint64_t v44 = 0x3032000000;
          id v45 = sub_10000B664;
          uint64_t v46 = sub_10000B674;
          id v47 = 0;
          uint64_t v36 = 0;
          uint64_t v37 = &v36;
          uint64_t v38 = 0x3032000000;
          uint64_t v39 = sub_10000B664;
          uint64_t v40 = sub_10000B674;
          id v41 = 0;
          id v30 = [(ZhuGeService *)self domainString];
          ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkMGKeys:getValuesAndError:]", 485, @"In bulk query, query key: \"%@\" from %@entrusted MG", v14, v15, v16, v13);

          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_10000C37C;
          v35[3] = &unk_100014798;
          v35[4] = &v42;
          v35[5] = &v36;
          [(ZhuGeService *)self setMGKey:v13 getValueAndError:v35];
          uint64_t v20 = v43[5];
          if (v20)
          {
            CFStringRef v52 = @"Value";
            uint64_t v53 = v20;
            +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
          }
          else
          {
            ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkMGKeys:getValuesAndError:]", 493, @"In bulk query, MG Key \"%@\" failed! Error: %@", v17, v18, v19, v13);
            uint64_t v22 = v37[5];
            CFStringRef v54 = @"Error";
            uint64_t v55 = v22;
            +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
          uint64_t v21 = };
          [v34 setObject:v21 forKeyedSubscript:v13];

          _Block_object_dispose(&v36, 8);
          _Block_object_dispose(&v42, 8);
        }
        id v10 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v10);
    }

    id v26 = v34;
    uint64_t v27 = 0;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkMGKeys:getValuesAndError:]", 471, @"keysList pointer is nil!", v7, v8, v9, v28);
    uint64_t v27 = +[NSError errorWithZhuGeErrorCode:45 underlyingError:0];
    id v26 = 0;
  }
  ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkMGKeys:getValuesAndError:]", 505, @"End: bulk query MG keys", v23, v24, v25, v29);
  v32[2](v32, v26, v27);
}

- (void)setInternalMGKey:(id)a3 getValueAndError:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, id))a4;
  uint64_t v27 = 0;
  uint64_t v28 = (id *)&v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_10000B664;
  uint64_t v31 = sub_10000B674;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_10000B664;
  uint64_t v25 = sub_10000B674;
  id v26 = 0;
  [(ZhuGeService *)self assertCallerEntitledForInternalService];
  if (!v6)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setInternalMGKey:getValueAndError:]", 520, @"key pointer is nil!", v8, v9, v10, v18);
    uint64_t v16 = +[NSError errorWithZhuGeErrorCode:45 underlyingError:0];
    id v17 = v28[5];
    v28[5] = (id)v16;

LABEL_6:
    uint64_t v12 = 0;
    goto LABEL_7;
  }
  ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setInternalMGKey:getValueAndError:]", 525, @"Trying internal MG key \"%@\"", v8, v9, v10, (uint64_t)v6);
  uint64_t v11 = v28;
  id obj = v28[5];
  uint64_t v12 = +[ZhuGeInternalSupportAssistant getXpcProxyWithError:&obj];
  objc_storeStrong(v11 + 5, obj);
  if (!v12)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setInternalMGKey:getValueAndError:]", 530, @"Failed to get internal service proxy for internal MG key \"%@\"!", v13, v14, v15, (uint64_t)v6);
    goto LABEL_6;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000C67C;
  v19[3] = &unk_100014798;
  v19[4] = &v21;
  v19[5] = &v27;
  [v12 setMGKey:v6 getValueAndError:v19];
LABEL_7:
  v7[2](v7, v22[5], v28[5]);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

- (void)setBulkInternalMGKeys:(id)a3 getValuesAndError:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, id))a4;
  uint64_t v31 = 0;
  id v32 = (id *)&v31;
  uint64_t v33 = 0x3032000000;
  id v34 = sub_10000B664;
  uint64_t v35 = sub_10000B674;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_10000B664;
  uint64_t v29 = sub_10000B674;
  id v30 = 0;
  [(ZhuGeService *)self assertCallerEntitledForInternalService];
  if (!v6)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkInternalMGKeys:getValuesAndError:]", 554, @"keysList pointer is nil!", v8, v9, v10, v21);
    uint64_t v19 = +[NSError errorWithZhuGeErrorCode:45 underlyingError:0];
    id v20 = v32[5];
    v32[5] = (id)v19;

LABEL_7:
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkInternalMGKeys:getValuesAndError:]", 559, @"Begin: bulk query internal MG keys", v8, v9, v10, v21);
  uint64_t v11 = v32;
  id obj = v32[5];
  uint64_t v12 = +[ZhuGeInternalSupportAssistant getXpcProxyWithError:&obj];
  objc_storeStrong(v11 + 5, obj);
  if (!v12)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkInternalMGKeys:getValuesAndError:]", 564, @"In bulk query, failed to get internal service proxy for internal MG keys!", v13, v14, v15, v22);
    goto LABEL_7;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000C9CC;
  v23[3] = &unk_1000147C0;
  v23[4] = &v25;
  v23[5] = &v31;
  [v12 setBulkMGKeys:v6 getValuesAndError:v23];
  if (!v26[5]) {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkInternalMGKeys:getValuesAndError:]", 574, @"In bulk query, failed to query internal MG keys!", v16, v17, v18, v22);
  }
LABEL_8:
  ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService setBulkInternalMGKeys:getValuesAndError:]", 579, @"End: bulk query internal MG keys", v16, v17, v18, v22);
  v7[2](v7, v26[5], v32[5]);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

- (NSString)baseEntitlement
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (Class)supportAssistantClass
{
  return self->_supportAssistantClass;
}

- (NSString)armoryClassName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)domainString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainString, 0);
  objc_storeStrong((id *)&self->_armoryClassName, 0);

  objc_storeStrong((id *)&self->_baseEntitlement, 0);
}

@end