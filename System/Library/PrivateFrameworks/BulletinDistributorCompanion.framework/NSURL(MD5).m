@interface NSURL(MD5)
- (BOOL)MD5:()MD5;
@end

@implementation NSURL(MD5)

- (BOOL)MD5:()MD5
{
  id v16 = 0;
  v4 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:a1 error:&v16];
  id v5 = v16;
  if (v4)
  {
    memset(&c, 0, sizeof(c));
    uint64_t v6 = CC_MD5_Init(&c);
    id v7 = 0;
    while (1)
    {
      v8 = (void *)MEMORY[0x223CAC5D0](v6);
      id v14 = 0;
      v9 = [v4 readDataUpToLength:0x10000 error:&v14];
      id v10 = v14;

      BOOL v11 = v10 == 0;
      if (v10) {
        break;
      }
      id v7 = v9;
      CC_MD5_Update(&c, (const void *)[v7 bytes], objc_msgSend(v7, "length"));
      uint64_t v6 = [v7 length];
      if (!v6)
      {
        CC_MD5_Final(a3, &c);
        goto LABEL_10;
      }
    }
    v12 = blt_general_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      [(NSURL(MD5) *)(uint64_t)v4 MD5:v12];
    }

LABEL_10:
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)MD5:()MD5 .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_222F4C000, log, OS_LOG_TYPE_FAULT, "-[NSData MD5:] call to readDataUpToLength: %@ failed with: %@", (uint8_t *)&v3, 0x16u);
}

@end