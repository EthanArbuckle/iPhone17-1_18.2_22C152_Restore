@interface HIDDisplayPresetData
- (BOOL)set:(id)a3 error:(id *)a4;
- (BOOL)valid;
- (BOOL)writable;
- (HIDDisplayPresetData)initWithDisplayDevice:(id)a3 index:(int64_t)a4;
- (NSData)uniqueID;
- (id)get:(id *)a3;
- (id)hidDisplay;
- (void)setHidDisplay:(id)a3;
- (void)uniqueID;
- (void)valid;
- (void)writable;
@end

@implementation HIDDisplayPresetData

- (HIDDisplayPresetData)initWithDisplayDevice:(id)a3 index:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HIDDisplayPresetData;
  v7 = [(HIDDisplayPresetData *)&v11 init];
  v8 = v7;
  if (v7)
  {
    [(HIDDisplayPresetData *)v7 setHidDisplay:v6];
    v8->_index = a4;
    v9 = v8;
  }

  return v8;
}

- (id)hidDisplay
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceRef);
  return WeakRetained;
}

- (void)setHidDisplay:(id)a3
{
}

- (BOOL)valid
{
  v17[1] = *MEMORY[0x263EF8340];
  v3 = [(HIDDisplayPresetData *)self hidDisplay];
  if (v3)
  {
    p_deviceRef = &self->_deviceRef;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceRef);
    int64_t index = self->_index;
    id v16 = 0;
    char v7 = [WeakRetained setCurrentPresetIndex:index error:&v16];
    id v8 = v16;

    if (v7)
    {
      uint64_t v9 = [v3 getHIDElementForUsage:6];
      v10 = v9;
      if (v9)
      {
        v17[0] = v9;
        objc_super v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
        int v12 = [v3 extract:v11 error:0];

        if (v12)
        {
          BOOL v13 = [v10 integerValue] == 1;
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        v14 = HIDDisplayLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[HIDDisplayPresetData valid]((id *)p_deviceRef);
        }
      }
    }
    else
    {
      v10 = HIDDisplayLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[HIDDisplayPresetData valid]();
      }
    }
    BOOL v13 = 0;
    goto LABEL_13;
  }
  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)writable
{
  v17[1] = *MEMORY[0x263EF8340];
  v3 = [(HIDDisplayPresetData *)self hidDisplay];
  if (v3)
  {
    p_deviceRef = &self->_deviceRef;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceRef);
    int64_t index = self->_index;
    id v16 = 0;
    char v7 = [WeakRetained setCurrentPresetIndex:index error:&v16];
    id v8 = v16;

    if (v7)
    {
      uint64_t v9 = [v3 getHIDElementForUsage:5];
      v10 = v9;
      if (v9)
      {
        v17[0] = v9;
        objc_super v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
        int v12 = [v3 extract:v11 error:0];

        if (v12)
        {
          BOOL v13 = [v10 integerValue] == 1;
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        v14 = HIDDisplayLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[HIDDisplayPresetData writable]((id *)p_deviceRef);
        }
      }
    }
    else
    {
      v10 = HIDDisplayLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[HIDDisplayPresetData valid]();
      }
    }
    BOOL v13 = 0;
    goto LABEL_13;
  }
  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (id)get:(id *)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  char v7 = [(HIDDisplayPresetData *)self hidDisplay];
  if (!v7)
  {
    if (a3)
    {
      id v39 = objc_alloc(MEMORY[0x263F087E8]);
      id v16 = 0;
      id v40 = 0;
      *a3 = (id)[v39 initWithDomain:*MEMORY[0x263F08410] code:-536870911 userInfo:0];
      goto LABEL_60;
    }
    goto LABEL_56;
  }
  p_deviceRef = &self->_deviceRef;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceRef);
  int64_t index = self->_index;
  p_int64_t index = &self->_index;
  int v12 = [WeakRetained setCurrentPresetIndex:index error:a3];

  if (!v12)
  {
    v41 = HIDDisplayLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayPresetData valid]();
    }

    goto LABEL_56;
  }
  for (uint64_t i = 0; i != 9; ++i)
  {
    v14 = [v7 getHIDElementForUsage:qword_221B14BB0[i]];
    if (v14) {
      [v6 addObject:v14];
    }
  }
  if (![v7 extract:v6 error:a3])
  {
LABEL_56:
    id v16 = 0;
    id v40 = 0;
    goto LABEL_60;
  }
  location = (id *)p_deviceRef;
  uint64_t v15 = 0;
  id v16 = 0;
  do
  {
    uint64_t v17 = qword_221B14BB0[v15];
    v18 = [v7 getHIDElementForUsage:v17];
    v19 = v18;
    if (v18)
    {
      switch(v17)
      {
        case 5:
          if ([v18 integerValue] == 1) {
            uint64_t v20 = MEMORY[0x263EFFA88];
          }
          else {
            uint64_t v20 = MEMORY[0x263EFFA80];
          }
          v21 = &kHIDDisplayPresetFieldWritableKey;
          goto LABEL_19;
        case 6:
          if ([v18 integerValue] == 1) {
            uint64_t v20 = MEMORY[0x263EFFA88];
          }
          else {
            uint64_t v20 = MEMORY[0x263EFFA80];
          }
          v21 = &kHIDDisplayPresetFieldValidKey;
LABEL_19:
          [v5 setObject:v20 forKeyedSubscript:*v21];
          break;
        case 8:
          v22 = [v18 dataValue];
          uint64_t v23 = getUnicharStringFromData(v22);

          if (v23)
          {
            v24 = &kHIDDisplayPresetFieldNameKey;
            goto LABEL_24;
          }
          v31 = HIDDisplayLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = [v19 dataValue];
            *(_DWORD *)buf = 138412290;
            id v48 = v32;
            _os_log_impl(&dword_221B0C000, v31, OS_LOG_TYPE_DEFAULT, "Invalid / Empty Name Data %@", buf, 0xCu);
          }
          v33 = &kHIDDisplayPresetFieldNameKey;
          goto LABEL_43;
        case 9:
          v25 = [v18 dataValue];
          uint64_t v23 = getUnicharStringFromData(v25);

          if (v23)
          {
            v24 = &kHIDDisplayPresetFieldDescriptionKey;
LABEL_24:
            [v5 setObject:v23 forKeyedSubscript:*v24];
            id v16 = (void *)v23;
          }
          else
          {
            v34 = HIDDisplayLog();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              v35 = [v19 dataValue];
              *(_DWORD *)buf = 138412290;
              id v48 = v35;
              _os_log_impl(&dword_221B0C000, v34, OS_LOG_TYPE_DEFAULT, "Invalid / Empty Description Data %@", buf, 0xCu);
            }
            v33 = &kHIDDisplayPresetFieldDescriptionKey;
LABEL_43:
            [v5 setObject:&stru_26D40F450 forKeyedSubscript:*v33];
            id v16 = 0;
          }
          break;
        case 10:
          v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "integerValue"));
          v28 = &kHIDDisplayPresetFieldDataBlockOneLengthKey;
          goto LABEL_33;
        case 11:
          v26 = [v18 dataValue];

          if (v26)
          {
            v27 = [v19 dataValue];
            v28 = &kHIDDisplayPresetFieldDataBlockOneKey;
            goto LABEL_33;
          }
          v27 = HIDDisplayLog();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_34;
          }
          v36 = [v19 dataValue];
          *(_DWORD *)buf = 138412290;
          id v48 = v36;
          v37 = v27;
          v38 = "Invalid Data Block One Data %@";
          goto LABEL_50;
        case 12:
          v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "integerValue"));
          v28 = &kHIDDisplayPresetFieldDataBlockTwoLengthKey;
          goto LABEL_33;
        case 13:
          v29 = [v18 dataValue];

          if (v29)
          {
            v27 = [v19 dataValue];
            v28 = &kHIDDisplayPresetFieldDataBlockTwoKey;
            goto LABEL_33;
          }
          v27 = HIDDisplayLog();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_34;
          }
          v36 = [v19 dataValue];
          *(_DWORD *)buf = 138412290;
          id v48 = v36;
          v37 = v27;
          v38 = "Invalid Data Block Two Data %@";
          goto LABEL_50;
        case 14:
          v30 = [v18 dataValue];

          if (v30)
          {
            v27 = [v19 dataValue];
            v28 = &kHIDDisplayPresetUniqueIDKey;
LABEL_33:
            [v5 setObject:v27 forKeyedSubscript:*v28];
          }
          else
          {
            v27 = HIDDisplayLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v36 = [v19 dataValue];
              *(_DWORD *)buf = 138412290;
              id v48 = v36;
              v37 = v27;
              v38 = "Invalid UUID Data %@";
LABEL_50:
              _os_log_impl(&dword_221B0C000, v37, OS_LOG_TYPE_DEFAULT, v38, buf, 0xCu);
            }
          }
LABEL_34:

          break;
        default:
          break;
      }
    }

    ++v15;
  }
  while (v15 != 9);
  v42 = HIDDisplayLog();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    id v43 = objc_loadWeakRetained(location);
    int64_t v44 = *p_index;
    *(_DWORD *)buf = 138412802;
    id v48 = v43;
    __int16 v49 = 2048;
    int64_t v50 = v44;
    __int16 v51 = 2114;
    id v52 = v5;
    _os_log_impl(&dword_221B0C000, v42, OS_LOG_TYPE_DEFAULT, "%@ get preset for index %ld returned data %{public}@", buf, 0x20u);
  }
  id v40 = v5;
LABEL_60:

  return v40;
}

- (BOOL)set:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = (uint64_t (*)(uint64_t, uint64_t))a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  id v37 = (id)0xAAAAAAAAAAAAAAAALL;
  id v37 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  char v7 = HIDDisplayLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceRef);
    int64_t index = self->_index;
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = WeakRetained;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = index;
    *(_WORD *)&buf[22] = 2114;
    id v39 = v6;
    _os_log_impl(&dword_221B0C000, v7, OS_LOG_TYPE_DEFAULT, "%@ set preset for index %ld data %{public}@", buf, 0x20u);
  }
  v10 = [(HIDDisplayPresetData *)self hidDisplay];
  if (v10)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v39 = __Block_byref_object_copy_;
    id v40 = __Block_byref_object_dispose_;
    id v41 = 0;
    objc_super v11 = [(HIDDisplayPresetData *)self get:a4];
    BOOL v12 = v11 == 0;

    if (v12)
    {
      v19 = HIDDisplayLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[HIDDisplayPresetData set:error:]((uint64_t)self);
      }

      BOOL v18 = 0;
    }
    else
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __34__HIDDisplayPresetData_set_error___block_invoke;
      v23[3] = &unk_2645DFD30;
      v23[4] = self;
      id v13 = v10;
      id v24 = v13;
      v25 = &v32;
      v26 = buf;
      v27 = &v28;
      [v6 enumerateKeysAndObjectsUsingBlock:v23];
      if (*((unsigned char *)v29 + 24))
      {
        uint64_t v14 = v33[5];
        uint64_t v15 = *(void *)&buf[8];
        id obj = *(id *)(*(void *)&buf[8] + 40);
        char v16 = [v13 commit:v14 error:&obj];
        objc_storeStrong((id *)(v15 + 40), obj);
        *((unsigned char *)v29 + 24) = v16;
      }
      else
      {
        uint64_t v20 = HIDDisplayLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[HIDDisplayPresetData set:error:](v20);
        }
      }
      if (a4) {
        *a4 = *(id *)(*(void *)&buf[8] + 40);
      }
      BOOL v18 = *((unsigned char *)v29 + 24) != 0;
    }
    _Block_object_dispose(buf, 8);
  }
  else if (a4)
  {
    id v17 = objc_alloc(MEMORY[0x263F087E8]);
    BOOL v18 = 0;
    *a4 = (id)[v17 initWithDomain:*MEMORY[0x263F08410] code:-536870911 userInfo:0];
  }
  else
  {
    BOOL v18 = 0;
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

void __34__HIDDisplayPresetData_set_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = HIDDisplayLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138413058;
    id v32 = WeakRetained;
    __int16 v33 = 2048;
    uint64_t v34 = v21;
    __int16 v35 = 2112;
    id v36 = v7;
    __int16 v37 = 2112;
    id v38 = v8;
    _os_log_debug_impl(&dword_221B0C000, v9, OS_LOG_TYPE_DEBUG, "%@ set preset for index %ld key : %@ value : %@", buf, 0x2Au);
  }
  if ([v7 isEqualToString:kHIDDisplayPresetFieldNameKey])
  {
    v10 = [*(id *)(a1 + 40) getHIDElementForUsage:8];
    if (!v10) {
      goto LABEL_55;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_55;
    }
    objc_super v11 = [v8 dataUsingEncoding:2483028224];
    BOOL v12 = v11;
    if (v11 && [v11 length]) {
      goto LABEL_19;
    }
    __int16 v30 = 0;
    uint64_t v13 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v30 length:2];

    uint64_t v14 = HIDDisplayLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412290;
    id v32 = v8;
    uint64_t v15 = "Invalid Name %@ , Converting it to 2 byte null value";
    goto LABEL_17;
  }
  if ([v7 isEqualToString:kHIDDisplayPresetFieldDescriptionKey])
  {
    v10 = [*(id *)(a1 + 40) getHIDElementForUsage:9];
    if (!v10) {
      goto LABEL_55;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_55;
    }
    char v16 = [v8 dataUsingEncoding:2483028224];
    BOOL v12 = v16;
    if (v16 && [v16 length]) {
      goto LABEL_19;
    }
    __int16 v30 = 0;
    uint64_t v13 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v30 length:2];

    uint64_t v14 = HIDDisplayLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:

      BOOL v12 = (void *)v13;
LABEL_19:
      [v10 setDataValue:v12];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v10];

LABEL_55:
      goto LABEL_56;
    }
    *(_DWORD *)buf = 138412290;
    id v32 = v8;
    uint64_t v15 = "Invalid Description %@ , Converting it to 2 byte null value";
LABEL_17:
    _os_log_impl(&dword_221B0C000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    goto LABEL_18;
  }
  if ([v7 isEqualToString:kHIDDisplayPresetFieldDataBlockOneLengthKey])
  {
    id v17 = *(void **)(a1 + 40);
    uint64_t v18 = 10;
LABEL_52:
    v10 = [v17 getHIDElementForUsage:v18];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(v10, "setIntegerValue:", objc_msgSend(v8, "integerValue"));
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v10];
      }
    }
    goto LABEL_55;
  }
  if ([v7 isEqualToString:kHIDDisplayPresetFieldDataBlockOneKey])
  {
    v10 = [*(id *)(a1 + 40) getHIDElementForUsage:11];
    if (!v10) {
      goto LABEL_55;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_55;
    }
    id v19 = v8;
    if ([v19 length]) {
      goto LABEL_26;
    }
    v26 = HIDDisplayLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      __34__HIDDisplayPresetData_set_error___block_invoke_cold_1();
    }

    id v23 = objc_alloc(MEMORY[0x263F087E8]);
    id v24 = @"Invalid Block One Data";
LABEL_48:
    uint64_t v27 = [v23 initWithDomain:v24 code:-536870206 userInfo:0];
    uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
    v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_49;
  }
  if ([v7 isEqualToString:kHIDDisplayPresetFieldDataBlockTwoLengthKey])
  {
    id v17 = *(void **)(a1 + 40);
    uint64_t v18 = 12;
    goto LABEL_52;
  }
  if ([v7 isEqualToString:kHIDDisplayPresetFieldDataBlockTwoKey])
  {
    v10 = [*(id *)(a1 + 40) getHIDElementForUsage:13];
    if (!v10) {
      goto LABEL_55;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_55;
    }
    id v19 = v8;
    if (![v19 length])
    {
      v22 = HIDDisplayLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __34__HIDDisplayPresetData_set_error___block_invoke_cold_1();
      }

      id v23 = objc_alloc(MEMORY[0x263F087E8]);
      id v24 = @"Invalid Block Two Data";
      goto LABEL_48;
    }
LABEL_26:
    [v10 setDataValue:v19];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v10];
LABEL_49:

    goto LABEL_55;
  }
  if ([v7 isEqualToString:kHIDDisplayPresetFieldValidKey])
  {
    id v17 = *(void **)(a1 + 40);
    uint64_t v18 = 6;
    goto LABEL_52;
  }
  if ([v7 isEqualToString:kHIDDisplayPresetUniqueIDKey])
  {
    v10 = [*(id *)(a1 + 40) getHIDElementForUsage:14];
    if (!v10) {
      goto LABEL_55;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_55;
    }
    id v19 = v8;
    if (![v19 length])
    {
      v25 = HIDDisplayLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        __34__HIDDisplayPresetData_set_error___block_invoke_cold_3();
      }

      id v23 = objc_alloc(MEMORY[0x263F087E8]);
      id v24 = @"Invalid Unique ID Data";
      goto LABEL_48;
    }
    goto LABEL_26;
  }
  if ([v7 isEqualToString:kHIDDisplayPresetFieldWritableKey])
  {
    id v17 = *(void **)(a1 + 40);
    uint64_t v18 = 5;
    goto LABEL_52;
  }
LABEL_56:
}

- (NSData)uniqueID
{
  v17[1] = *MEMORY[0x263EF8340];
  v3 = [(HIDDisplayPresetData *)self hidDisplay];
  if (!v3)
  {
    uint64_t v13 = 0;
    goto LABEL_14;
  }
  p_deviceRef = &self->_deviceRef;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceRef);
  int64_t index = self->_index;
  id v16 = 0;
  char v7 = [WeakRetained setCurrentPresetIndex:index error:&v16];
  id v8 = v16;

  if ((v7 & 1) == 0)
  {
    v10 = HIDDisplayLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayPresetData valid]();
    }
    goto LABEL_12;
  }
  uint64_t v9 = [v3 getHIDElementForUsage:14];
  v10 = v9;
  if (!v9)
  {
    uint64_t v14 = HIDDisplayLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[HIDDisplayPresetData uniqueID]((id *)p_deviceRef);
    }

    goto LABEL_12;
  }
  v17[0] = v9;
  objc_super v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  int v12 = [v3 extract:v11 error:0];

  if (!v12)
  {
LABEL_12:
    uint64_t v13 = 0;
    goto LABEL_13;
  }
  uint64_t v13 = [v10 dataValue];
LABEL_13:

LABEL_14:
  return (NSData *)v13;
}

- (void).cxx_destruct
{
}

- (void)valid
{
  OUTLINED_FUNCTION_6();
  objc_loadWeakRetained(v1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_221B0C000, v2, v3, "%@ Failed set preset index %ld", v4, v5, v6, v7, v8);
}

- (void)writable
{
  id WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_221B0C000, v2, v3, "%@ Preset data writable no associated element", v4, v5, v6, v7, v8);
}

- (void)set:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_221B0C000, v2, v3, "%@ Failed to update elements for preset index %ld", v4, v5, v6, v7, v8);
}

- (void)set:(os_log_t)log error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_221B0C000, log, OS_LOG_TYPE_ERROR, "Skip Device Transaction due to previous issues", v1, 2u);
}

void __34__HIDDisplayPresetData_set_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_221B0C000, v0, v1, "Invalid Block One Data %@ Cancel Device Transaction", v2, v3, v4, v5, v6);
}

void __34__HIDDisplayPresetData_set_error___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_221B0C000, v0, v1, "Invalid Unique ID Data %@ Cancel Device Transaction", v2, v3, v4, v5, v6);
}

- (void)uniqueID
{
  id WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_221B0C000, v2, v3, "%@ Preset data uniqueID no associated element", v4, v5, v6, v7, v8);
}

@end