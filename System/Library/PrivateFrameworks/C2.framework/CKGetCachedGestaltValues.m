@interface CKGetCachedGestaltValues
@end

@implementation CKGetCachedGestaltValues

void ___CKGetCachedGestaltValues_block_invoke()
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  v1 = (void *)_CKCachedGestaltValues;
  _CKCachedGestaltValues = v0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(void *)&long long buf = @"UniqueDeviceID";
  *((void *)&buf + 1) = @"BuildVersion";
  v16 = @"ProductName";
  v17 = @"ProductType";
  v18 = @"ProductVersion";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:5];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        v8 = (void *)MGCopyAnswer();
        if (v8)
        {
          [(id)_CKCachedGestaltValues setObject:v8 forKeyedSubscript:v7];
        }
        else
        {
          if (C2_DEFAULT_LOG_BLOCK_2 != -1) {
            dispatch_once(&C2_DEFAULT_LOG_BLOCK_2, &__block_literal_global_44_0);
          }
          v9 = C2_DEFAULT_LOG_INTERNAL_2;
          if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v7;
            _os_log_impl(&dword_1DD523000, v9, OS_LOG_TYPE_ERROR, "Error getting %@ from MobileGestalt", (uint8_t *)&buf, 0xCu);
          }
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

uint64_t ___CKGetCachedGestaltValues_block_invoke_2()
{
  C2_DEFAULT_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

@end