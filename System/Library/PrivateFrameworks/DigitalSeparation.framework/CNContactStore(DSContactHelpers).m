@interface CNContactStore(DSContactHelpers)
+ (id)ds_meContactIdentifier;
+ (void)ds_meContactIdentifier;
@end

@implementation CNContactStore(DSContactHelpers)

+ (id)ds_meContactIdentifier
{
  v10[1] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc_init(MEMORY[0x263EFEA58]);
  v10[0] = *MEMORY[0x263EFDFE0];
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  id v9 = 0;
  v2 = objc_msgSend(v0, "_ios_meContactWithKeysToFetch:error:", v1, &v9);
  id v3 = v9;

  if (v3)
  {
    os_log_t v4 = os_log_create("com.apple.DigitalSeparation", "CNContactStore");
    v5 = (void *)DSLog_5;
    DSLog_5 = (uint64_t)v4;

    v6 = DSLog_5;
    if (os_log_type_enabled((os_log_t)DSLog_5, OS_LOG_TYPE_ERROR)) {
      +[CNContactStore(DSContactHelpers) ds_meContactIdentifier];
    }
    v7 = 0;
  }
  else
  {
    v7 = [v2 identifier];
  }

  return v7;
}

+ (void)ds_meContactIdentifier
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_236090000, a2, OS_LOG_TYPE_ERROR, "Error fetching me contact: %@", (uint8_t *)&v2, 0xCu);
}

@end