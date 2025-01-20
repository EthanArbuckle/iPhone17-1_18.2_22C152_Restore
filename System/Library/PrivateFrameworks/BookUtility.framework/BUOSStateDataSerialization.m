@interface BUOSStateDataSerialization
+ (os_state_data_s)dataWithTitle:(id)a3 propertyList:(id)a4 error:(id *)a5;
@end

@implementation BUOSStateDataSerialization

+ (os_state_data_s)dataWithTitle:(id)a3 propertyList:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v9 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x263F08AC0], v8, (uint64_t)a4, 200, 0, a5);
  v12 = v9;
  if (v9)
  {
    size_t v13 = objc_msgSend_length(v9, v10, v11);
    v14 = (os_state_data_s *)malloc_type_calloc(1uLL, v13 + 200, 0x76E1724EuLL);
    if (v14)
    {
      id v15 = v7;
      objc_msgSend_UTF8String(v15, v16, v17);
      __strlcpy_chk();
      v14->var0 = 1;
      v14->var1.var1 = v13;
      id v18 = v12;
      v21 = (const void *)objc_msgSend_bytes(v18, v19, v20);
      memcpy(v14->var4, v21, v13);
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end