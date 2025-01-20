@interface MTRDeviceControllerLocalTestStorage
+ (BOOL)localTestStorageEnabled;
+ (void)setLocalTestStorageEnabled:(BOOL)a3;
- (BOOL)controller:(id)a3 removeValueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6;
- (BOOL)controller:(id)a3 storeValue:(id)a4 forKey:(id)a5 securityLevel:(unint64_t)a6 sharingType:(unint64_t)a7;
- (BOOL)controller:(id)a3 storeValues:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6;
- (MTRDeviceControllerLocalTestStorage)initWithPassThroughStorage:(id)a3;
- (id)controller:(id)a3 valueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6;
- (id)valuesForController:(id)a3 securityLevel:(unint64_t)a4 sharingType:(unint64_t)a5;
@end

@implementation MTRDeviceControllerLocalTestStorage

+ (BOOL)localTestStorageEnabled
{
  v3 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], a2, v2);
  char v5 = objc_msgSend_BOOLForKey_(v3, v4, @"enableTestStorage");

  return v5;
}

+ (void)setLocalTestStorageEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], a2, a3);
  objc_msgSend_setBool_forKey_(v4, v5, v3, @"enableTestStorage");
  v6 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v11 = v3;
    _os_log_impl(&dword_2446BD000, v6, OS_LOG_TYPE_DEFAULT, "MTRDeviceControllerLocalTestStorage setLocalTestStorageEnabled %d", buf, 8u);
  }

  if (sub_244CC4E58(2u))
  {
    BOOL v9 = v3;
    sub_244CC4DE0(0, 2);
  }
  if (objc_msgSend_BOOLForKey_(v4, v7, @"enableTestStorage", v9) != v3)
  {
    v8 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v11 = v3;
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage setLocalTestStorageEnabled %d failed", buf, 8u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }
}

- (MTRDeviceControllerLocalTestStorage)initWithPassThroughStorage:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTRDeviceControllerLocalTestStorage;
  v6 = [(MTRDeviceControllerLocalTestStorage *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_passThroughStorage, a3);
    v8 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_DEFAULT, "MTRDeviceControllerLocalTestStorage initialized with pass-through storage %@", buf, 0xCu);
    }

    if (sub_244CC4E58(2u)) {
      sub_244CC4DE0(0, 2);
    }
  }

  return v7;
}

- (id)controller:(id)a3 valueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  id v10 = a3;
  id v13 = a4;
  if (a6)
  {
    passThroughStorage = self->_passThroughStorage;
    if (passThroughStorage)
    {
      v15 = objc_msgSend_controller_valueForKey_securityLevel_sharingType_(passThroughStorage, v11, (uint64_t)v10, v13, a5, a6);
    }
    else
    {
      v22 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage valueForKey: shared type but no pass-through storage", v24, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      v15 = 0;
    }
  }
  else
  {
    v16 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v11, v12);
    v18 = objc_msgSend_dataForKey_(v16, v17, (uint64_t)v13);
    v19 = (void *)MEMORY[0x263F08928];
    v20 = MTRDeviceControllerStorageClasses();
    uint64_t v25 = 0;
    v15 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v19, v21, (uint64_t)v20, v18, &v25);
  }

  return v15;
}

- (BOOL)controller:(id)a3 storeValue:(id)a4 forKey:(id)a5 securityLevel:(unint64_t)a6 sharingType:(unint64_t)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v15 = a5;
  if (a7)
  {
    passThroughStorage = self->_passThroughStorage;
    if (passThroughStorage)
    {
      LOBYTE(a7) = objc_msgSend_controller_storeValue_forKey_securityLevel_sharingType_(passThroughStorage, v14, (uint64_t)v12, v13, v15, a6, a7);
    }
    else
    {
      v22 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage storeValue: shared type but no pass-through storage", buf, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      LOBYTE(a7) = 0;
    }
  }
  else
  {
    id v26 = 0;
    v17 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x263F08910], v14, (uint64_t)v13, 1, &v26);
    id v20 = v26;
    a7 = v20 == 0;
    if (v20)
    {
      v21 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v20;
        _os_log_impl(&dword_2446BD000, v21, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage storeValue: failed to convert value object to data %@", buf, 0xCu);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
    }
    else
    {
      v23 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v18, v19);
      objc_msgSend_setObject_forKey_(v23, v24, (uint64_t)v17, v15);
    }
  }

  return a7;
}

- (BOOL)controller:(id)a3 removeValueForKey:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  id v10 = a3;
  id v13 = a4;
  if (a6)
  {
    passThroughStorage = self->_passThroughStorage;
    if (passThroughStorage)
    {
      char v15 = objc_msgSend_controller_removeValueForKey_securityLevel_sharingType_(passThroughStorage, v11, (uint64_t)v10, v13, a5, a6);
    }
    else
    {
      v18 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl(&dword_2446BD000, v18, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage removeValueForKey: shared type but no pass-through storage", v20, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      char v15 = 0;
    }
  }
  else
  {
    v16 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v11, v12);
    objc_msgSend_removeObjectForKey_(v16, v17, (uint64_t)v13);

    char v15 = 1;
  }

  return v15;
}

- (id)valuesForController:(id)a3 securityLevel:(unint64_t)a4 sharingType:(unint64_t)a5
{
  id v10 = a3;
  if (a5)
  {
    if (self->_passThroughStorage && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v12 = objc_msgSend_valuesForController_securityLevel_sharingType_(self->_passThroughStorage, v11, (uint64_t)v10, a4, a5);
    }
    else
    {
      id v13 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage valuesForController: shared type but no pass-through storage", v18, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      uint64_t v12 = 0;
    }
  }
  else
  {
    v14 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v8, v9);
    uint64_t v12 = objc_msgSend_dictionaryRepresentation(v14, v15, v16);
  }

  return v12;
}

- (BOOL)controller:(id)a3 storeValues:(id)a4 securityLevel:(unint64_t)a5 sharingType:(unint64_t)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v32 = a4;
  if (a6)
  {
    if (self->_passThroughStorage && (objc_opt_respondsToSelector() & 1) != 0)
    {
      char v13 = objc_msgSend_controller_storeValues_securityLevel_sharingType_(self->_passThroughStorage, v12, (uint64_t)v31, v32, a5, a6);
    }
    else
    {
      v14 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage valuesForController: shared type but no pass-through storage", buf, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      char v13 = 0;
    }
  }
  else
  {
    v33 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v10, v11);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v15 = v32;
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v35, v41, 16);
    if (v18)
    {
      uint64_t v19 = *(void *)v36;
      char v13 = 1;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v15);
          }
          uint64_t v21 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x263F08910];
          v23 = objc_msgSend_objectForKeyedSubscript_(v15, v17, v21, v30);
          id v34 = 0;
          uint64_t v25 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v22, v24, (uint64_t)v23, 1, &v34);
          id v26 = v34;

          if (v26)
          {
            id v28 = sub_244CC8484(0, "NotSpecified");
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v40 = v26;
              _os_log_impl(&dword_2446BD000, v28, OS_LOG_TYPE_ERROR, "MTRDeviceControllerLocalTestStorage storeValues: failed to convert value object to data %@", buf, 0xCu);
            }

            if (sub_244CC4E58(1u))
            {
              id v30 = v26;
              sub_244CC4DE0(0, 1);
            }
            char v13 = 0;
          }
          else
          {
            objc_msgSend_setObject_forKey_(v33, v27, (uint64_t)v25, v21);
          }
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v35, v41, 16);
      }
      while (v18);
    }
    else
    {
      char v13 = 1;
    }
  }
  return v13 & 1;
}

- (void).cxx_destruct
{
}

@end