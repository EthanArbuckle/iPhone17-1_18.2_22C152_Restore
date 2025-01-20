@interface NSData(BRCCryptographicAdditions)
+ (id)brc_generateBogusKey;
+ (id)brc_generateSaltingKey;
+ (void)brc_generateSaltingKey;
- (id)brc_truncatedSHA256;
- (uint64_t)brc_hexadecimalString;
@end

@implementation NSData(BRCCryptographicAdditions)

- (uint64_t)brc_hexadecimalString
{
  v1 = NSString;
  id v2 = a1;
  uint64_t v3 = [v2 bytes];
  uint64_t v4 = [v2 length];
  return objc_msgSend(v1, "brc_hexadecimalStringWithBytes:length:", v3, v4);
}

- (id)brc_truncatedSHA256
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = +[BRCUserDefaults defaultsForMangledID:0];
  unsigned int v3 = [v2 validationKeyTruncationLength];

  memset(v8, 0, sizeof(v8));
  id v4 = a1;
  CC_SHA256((const void *)objc_msgSend(v4, "bytes", 0, 0, 0, 0), objc_msgSend(v4, "length"), (unsigned __int8 *)v8);
  if (v3 >= 0x20) {
    uint64_t v5 = 32;
  }
  else {
    uint64_t v5 = v3;
  }
  v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v8 length:v5];
  return v6;
}

+ (id)brc_generateSaltingKey
{
  v0 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
  v1 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
  id v2 = v0;
  if (SecRandomCopyBytes(v1, 0x20uLL, (void *)[v2 mutableBytes]))
  {
    int v3 = *__error();
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      +[NSData(BRCCryptographicAdditions) brc_generateSaltingKey];
    }

    id v6 = 0;
    *__error() = v3;
  }
  else
  {
    id v6 = v2;
  }

  return v6;
}

+ (id)brc_generateBogusKey
{
  if (brc_generateBogusKey_onceToken != -1) {
    dispatch_once(&brc_generateBogusKey_onceToken, &__block_literal_global_40);
  }
  v0 = (void *)brc_generateBogusKey_key;
  return v0;
}

+ (void)brc_generateSaltingKey
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D353B000, log, (os_log_type_t)0x90u, "[ERROR] Can't generate salting key %{errno}d%@", (uint8_t *)v3, 0x12u);
}

@end