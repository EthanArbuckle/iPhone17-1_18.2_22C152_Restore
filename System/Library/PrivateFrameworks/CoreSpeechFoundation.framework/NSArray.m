@interface NSArray
@end

@implementation NSArray

void __35__NSArray_XPCObject___cs_xpcObject__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    v4 = *(void **)(a1 + 32);
    v5 = objc_msgSend(v3, "_cs_xpcObject");
    xpc_array_append_value(v4, v5);
  }
  else
  {
    v6 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      v8 = [v3 description];
      int v9 = 136315394;
      v10 = "-[NSArray(XPCObject) _cs_xpcObject]_block_invoke";
      __int16 v11 = 2114;
      v12 = v8;
      _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s Cannot encode non-plist types into XPC object : %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
}

uint64_t __44__NSArray_XPCObject___cs_initWithXPCObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1BA9E7EA0](v4);
    if (v6 == MEMORY[0x1E4F145F8]
      || v6 == MEMORY[0x1E4F145C0]
      || v6 == MEMORY[0x1E4F14570]
      || v6 == MEMORY[0x1E4F14598])
    {
      v12 = (Class *)0x1E4F28ED0;
    }
    else if (v6 == MEMORY[0x1E4F14590])
    {
      v12 = (Class *)0x1E4F1C9E8;
    }
    else if (v6 == MEMORY[0x1E4F145F0])
    {
      v12 = (Class *)0x1E4F29018;
    }
    else if (v6 == MEMORY[0x1E4F14580])
    {
      v12 = (Class *)0x1E4F1C9B8;
    }
    else
    {
      if (v6 != MEMORY[0x1E4F14568])
      {
        v10 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          int v16 = 136315138;
          v17 = "-[NSArray(XPCObject) _cs_initWithXPCObject:]_block_invoke";
          __int16 v11 = "%s Cannot decode non-plist types of XPC object";
LABEL_20:
          _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v16, 0xCu);
          goto LABEL_28;
        }
        goto LABEL_28;
      }
      v12 = (Class *)0x1E4F1C978;
    }
    id v13 = objc_alloc(*v12);
    v14 = objc_msgSend(v13, "_cs_initWithXPCObject:", v5);

    if (v14)
    {
      [*(id *)(a1 + 32) addObject:v14];
    }
    goto LABEL_28;
  }
  v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136315138;
    v17 = "-[NSArray(XPCObject) _cs_initWithXPCObject:]_block_invoke";
    __int16 v11 = "%s xpcObject value is NULL";
    goto LABEL_20;
  }
LABEL_28:

  return 1;
}

@end