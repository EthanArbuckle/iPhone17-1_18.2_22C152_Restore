@interface NSDictionary
@end

@implementation NSDictionary

void __40__NSDictionary_XPCObject___cs_xpcObject__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (objc_opt_respondsToSelector())
    {
      v7 = objc_msgSend(v6, "_cs_xpcObject");
      if (v7)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        v9 = *(void **)(a1 + 32);
        if (isKindOfClass)
        {
          id v10 = [NSString stringWithFormat:@"%@", v5];
          xpc_dictionary_set_value(v9, (const char *)[v10 UTF8String], v7);
        }
        else
        {
          xpc_dictionary_set_value(v9, (const char *)[v5 UTF8String], v7);
        }
      }
    }
    else
    {
      v11 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        v13 = [v6 description];
        *(_DWORD *)buf = 136315394;
        v16 = "-[NSDictionary(XPCObject) _cs_xpcObject]_block_invoke";
        __int16 v17 = 2114;
        v18 = v13;
        _os_log_error_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_ERROR, "%s Cannot encode non-plist types into XPC object : %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[NSDictionary(XPCObject) _cs_xpcObject]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_ERROR, "%s Cannot encode key into xpcobject since the key is not NSString class type", buf, 0xCu);
    }
  }
}

uint64_t __49__NSDictionary_XPCObject___cs_initWithXPCObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2 && v5)
  {
    v7 = [NSString stringWithUTF8String:a2];
    uint64_t v8 = MEMORY[0x1BA9E7EA0](v6);
    if (v8 == MEMORY[0x1E4F145F8]
      || v8 == MEMORY[0x1E4F145C0]
      || v8 == MEMORY[0x1E4F14570]
      || v8 == MEMORY[0x1E4F14598])
    {
      v14 = (Class *)0x1E4F28ED0;
    }
    else if (v8 == MEMORY[0x1E4F14590])
    {
      v14 = (Class *)0x1E4F1C9E8;
    }
    else if (v8 == MEMORY[0x1E4F145F0])
    {
      v14 = (Class *)0x1E4F29018;
    }
    else if (v8 == MEMORY[0x1E4F14580])
    {
      v14 = (Class *)0x1E4F1C9B8;
    }
    else
    {
      if (v8 != MEMORY[0x1E4F14568])
      {
        v12 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136315138;
          uint64_t v19 = "-[NSDictionary(XPCObject) _cs_initWithXPCObject:]_block_invoke";
          _os_log_error_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_ERROR, "%s Cannot decode non-plist types of XPC object", (uint8_t *)&v18, 0xCu);
        }
LABEL_28:

        goto LABEL_29;
      }
      v14 = (Class *)0x1E4F1C978;
    }
    id v15 = objc_alloc(*v14);
    v16 = objc_msgSend(v15, "_cs_initWithXPCObject:", v6);

    if (v16)
    {
      [*(id *)(a1 + 32) setObject:v16 forKey:v7];
    }
    goto LABEL_28;
  }
  v13 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136315138;
    uint64_t v19 = "-[NSDictionary(XPCObject) _cs_initWithXPCObject:]_block_invoke";
    _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, "%s xpcObject key or value is NULL", (uint8_t *)&v18, 0xCu);
  }
LABEL_29:

  return 1;
}

@end